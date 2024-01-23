unit ControladorTelaVendas;

interface

uses
  Vendas.View,
  System.SysUtils,
  ControladorVendaDAO,
  ControladorVendaDAOInterface,
  ControladorTelaVendasInterface,
  ActnList,
  Vcl.Dialogs,
  Vcl.Controls,
  Data.DB,
  ItemVenda,
  ControladorItemVenda,
  ControladorItemVendaInterface,
  System.Generics.Collections,
  ControladorCompra,
  ControladorCompraInterface,
  ControladorProduto,
  ControladorProdutoInterface,
  ControladorTelaCheckout,
  ControladorTelaCheckoutInterface,
  SessaoUsuario;

type
  TControladorTelaVendas = class(TInterfacedObject, IControladorTelaVendas)
  private
    FTelaVendas : TTelaVendas;
    uControladorTelaCheckout: IControladorTelaCheckout;
    uControladorVendaDAO : IControladorVenda;

    AcaoBtnComprarNovamente, AcaoBtnImprimirRelatorio: TAction;

    procedure FecharTela;
    procedure AcaoBtnComprarNovamenteClick(Sender: TObject);
    procedure AcaoBtnImprimirRelatorioClick(Sender: TObject);
    procedure CalcularTotamEmVendas;
    procedure CalcularTotalItensVendidos;

  public
    constructor Create(Parent : TWinControl);
  end;

implementation

{ TControladorTelaVendas }

procedure TControladorTelaVendas.AcaoBtnComprarNovamenteClick(Sender: TObject);
var
  item: TItemVenda;
  IDVendaSelecionada: Integer;
  uControladorItemVendaDAO: IControladorItemVenda;
  uArrayItemVenda: TList<TItemVenda>;
  uControladorCompra: IControladorCompra;
  uControladorProduto: IControladorProduto;
begin
  uArrayItemVenda := TList<TItemVenda>.Create;
  uControladorItemVendaDAO := TControladorItemVenda.Create;
  uControladorCompra := TControladorCompra.Create;
  uControladorProduto := TControladorProduto.Create;

  IDVendaSelecionada := FTelaVendas.DBGridVendas.DataSource.DataSet.FieldByName('ID').AsInteger;

  uArrayItemVenda := uControladorItemVendaDAO.CarregarItemVenda(IDVendaSelecionada);

  for item in uArrayItemVenda do
  begin
    uControladorCompra.AdicionarProduto(uControladorProduto.
    CarregarProduto(item.IdProduto), item.Quantidade, item.Subtotal);
  end;

  uControladorTelaCheckout := TControladorTelaCheckout.Create(uControladorCompra);

end;

procedure TControladorTelaVendas.AcaoBtnImprimirRelatorioClick(Sender: TObject);
begin
  FTelaVendas.frxReport.ShowReport();
end;

procedure TControladorTelaVendas.CalcularTotalItensVendidos;
var
  TotalItensVendidos : Double;
begin
  TotalItensVendidos := 0.0;

  if Assigned(FTelaVendas.DBGridVendas.DataSource) and
    Assigned(FTelaVendas.DBGridVendas.DataSource.DataSet) then
  begin
    with FTelaVendas.DBGridVendas.DataSource.DataSet do
    begin
      DisableControls;
        try
          First;

          while not Eof do
          begin
            TotalItensVendidos := TotalItensVendidos + FieldByName('TOTAL_PRODUTOS').AsFloat;
            Next;
          end;

          FTelaVendas.lblQuantidadeItensVendidos.Caption := FloatToStr(TotalItensVendidos);
        finally
          EnableControls;
        end;
    end;
  end

end;

procedure TControladorTelaVendas.CalcularTotamEmVendas;
var
  TotalVendas : Double;
begin
  TotalVendas := 0;

  if Assigned(FTelaVendas.DBGridVendas.DataSource) and
    Assigned(FTelaVendas.DBGridVendas.DataSource.DataSet) then
  begin
    with FTelaVendas.DBGridVendas.DataSource.DataSet do
    begin
      DisableControls;
        try
          First;

          while not Eof do
          begin
            TotalVendas := TotalVendas + FieldByName('TOTAL_PRECO').AsFloat;
            Next;
          end;

          FTelaVendas.lblTotalEmVendas.Caption := FormatFloat('#0.00', TotalVendas);
        finally
          EnableControls;
        end;
    end;
  end
end;

constructor TControladorTelaVendas.Create(Parent : TWinControl);
begin
  FTelaVendas := TTelaVendas.Create(nil);
  FTelaVendas.Parent := Parent;
  FTelaVendas.Align := alClient;

  AcaoBtnComprarNovamente := TAction.Create(nil);
  AcaoBtnComprarNovamente.Caption := 'Vender novamente';
  AcaoBtnComprarNovamente.OnExecute := AcaoBtnComprarNovamenteClick;
  FTelaVendas.btnComprarNovamente.Action := AcaoBtnComprarNovamente;

  AcaoBtnImprimirRelatorio := TAction.Create(nil);
  AcaoBtnImprimirRelatorio.Caption := 'Imprimir relatório';
  AcaoBtnImprimirRelatorio.OnExecute := AcaoBtnImprimirRelatorioClick;
  FTelaVendas.btnImprimir.Action := AcaoBtnImprimirRelatorio;

  uControladorVendaDAO := TControladorVenda.Create;

  if TSessaoUsuario.cargo.Equals('Administrador') then
  begin
    uControladorVendaDAO.AtualizarListaVendas(FTelaVendas.DBGridVendas.DataSource,
    'adm');
  end
  else
  begin
    uControladorVendaDAO.AtualizarListaVendas(FTelaVendas.DBGridVendas.DataSource,
    'outro');
  end;
  FTelaVendas.frxDBDataset.DataSet := FTelaVendas.DBGridVendas.DataSource.DataSet;

  CalcularTotamEmVendas;
  CalcularTotalItensVendidos;
  FTelaVendas.Show;
end;

procedure TControladorTelaVendas.FecharTela;
begin
  FTelaVendas.Close;
end;

end.
