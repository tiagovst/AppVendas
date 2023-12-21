unit ControladorTelaCompraProduto;

interface

uses
  CompraProduto.View,
  System.SysUtils,
  Vcl.Grids,
  Vcl.Dialogs,
  Vcl.ActnList,
  Produto,
  ControladorCompraInterface,
  ControladorTelaCompraProdutoInterface;

type
  TControladorTelaCompraProduto = class(TInterfacedObject, IControladorTelaCompraProduto)
  private
    FTelaAdicionarProduto: TTelaAdicionarProduto;
    uProduto: TProduto;
    ControladorCompra: IControladorCompra;

    AcaoAdicionar : TAction;

  public
    constructor Create(const Controlador: IControladorCompra; Produto: TProduto) overload;
    procedure PrencherProduto;
    procedure Mostrar;
    procedure AcaoBtnAdicionar(Sender: TObject);
  end;

implementation

{ TControladorTelaCompraProduto }

procedure TControladorTelaCompraProduto.AcaoBtnAdicionar(Sender: TObject);
begin
  try
    if (uProduto.QuantidadeEstoque >= StrToInt(FTelaAdicionarProduto.txtQuantidadeCompra.Text))
    and (uProduto.QuantidadeEstoque > 0) and (StrToInt(FTelaAdicionarProduto.txtQuantidadeCompra.Text) > 0) then
    begin
      if ControladorCompra.AdicionarProduto(uProduto,
      StrToInt(FTelaAdicionarProduto.txtQuantidadeCompra.Text),
      StrToFloat(FTelaAdicionarProduto.lblSubtotal.Caption)) then
      begin
        ShowMessage('Produto adicionado ao Checkout!');
      end
      else
      begin
        ShowMessage('Ocorreu um erro ao tentar adicionar o produto ao checkout.');
      end;
    end
    else
    begin
      ShowMessage('Insira uma quantidade válida!');
    end;
  except on E: Exception do
    ShowMessage('Insira uma quantidade válida!');
  end;
end;

constructor TControladorTelaCompraProduto.Create(const Controlador: IControladorCompra; Produto: TProduto);
begin
  FTelaAdicionarProduto := TTelaAdicionarProduto.Create(nil);
  ControladorCompra := Controlador;

  AcaoAdicionar := TAction.Create(nil);
  AcaoAdicionar.OnExecute := AcaoBtnAdicionar;
  AcaoAdicionar.Caption := 'Adicionar';

  FTelaAdicionarProduto.btnAdicionarCompra.Action := AcaoAdicionar;
  uProduto := Produto;
  PrencherProduto;

  Mostrar;
end;

procedure TControladorTelaCompraProduto.Mostrar;
begin
  FTelaAdicionarProduto.ShowModal;
end;

procedure TControladorTelaCompraProduto.PrencherProduto;
begin
  with uProduto, FTelaAdicionarProduto do
  begin
    txtNomeProduto.Text := Nome;
    txtCategoria.Text := Categoria;
    txtPreco.Text := Preco.ToString;
    txtQuantidadeEstoque.Text := QuantidadeEstoque.ToString;
  end;
end;

end.
