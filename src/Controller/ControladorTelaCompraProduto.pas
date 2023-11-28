unit ControladorTelaCompraProduto;

interface

uses
  CompraProduto.View,
  System.SysUtils,
  Vcl.Grids,
  Vcl.Dialogs,
  Produto,
  ControladorCompraInterface,
  ControladorTelaCompraProdutoInterface;

type
  TControladorTelaCompraProduto = class(TInterfacedObject, IControladorTelaCompraProduto)
  private
    FTelaAdicionarProduto: TTelaAdicionarProduto;
    uProduto: TProduto;

  public
    constructor Create(const Controlador: IControladorCompra; Produto: TProduto) overload;
    procedure PrencherProduto;
    procedure MostrarTelaCheckout;
  end;

implementation

{ TControladorTelaCompraProduto }

constructor TControladorTelaCompraProduto.Create(
  const Controlador: IControladorCompra; Produto: TProduto);
begin
  FTelaAdicionarProduto := TTelaAdicionarProduto.Create(nil);
  FTelaAdicionarProduto.Carregar(Controlador, Produto);
  uProduto := Produto;
end;

procedure TControladorTelaCompraProduto.MostrarTelaCheckout;
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
