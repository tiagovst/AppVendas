unit ControladorCompraInterface;

interface

uses
  Produto,
  Compra;

type
  IControladorCompra = interface
    ['{7DAF8176-A69A-4386-9A27-A7694AF26C81}']
    procedure ExibirProdutos;

    function AdicionarProduto(Produto: TProduto; Quantidade: Double; PrecoSubtotal: Double): Boolean;
    function ObterProdutos: TArray<TProdutoQuantidade>;
  end;

implementation

end.
