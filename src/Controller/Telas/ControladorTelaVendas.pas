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
  Data.DB;

type
  TControladorTelaVendas = class(TInterfacedObject, IControladorTelaVendas)
  private
    FTelaVendas : TTelaVendas;
    uControladorVendaDAO : IControladorVenda;

  public
    constructor Create(Parent : TWinControl);
    procedure FecharTela;
    procedure CalcularTotamEmVendas;
    procedure CalcularTotalItensVendidos;
  end;

implementation

{ TControladorTelaVendas }

procedure TControladorTelaVendas.CalcularTotalItensVendidos;
var
  TotalItensVendidos : Integer;
begin
  TotalItensVendidos := 0;

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
            TotalItensVendidos := TotalItensVendidos + FieldByName('TOTAL_PRODUTOS').AsInteger;
            Next;
          end;

          FTelaVendas.lblQuantidadeItensVendidos.Caption := IntToStr(TotalItensVendidos);
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

  uControladorVendaDAO := TControladorVenda.Create;
  uControladorVendaDAO.AtualizarListaVendas(FTelaVendas.DBGridVendas.DataSource);

  CalcularTotamEmVendas;
  CalcularTotalItensVendidos;
  FTelaVendas.Show;
end;

procedure TControladorTelaVendas.FecharTela;
begin
  FTelaVendas.Close;
end;

end.
