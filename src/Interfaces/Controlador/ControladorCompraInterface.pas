unit ControladorCompraInterface;

interface

uses
  Produto;

type
  IControladorCompra = interface
    ['{7DAF8176-A69A-4386-9A27-A7694AF26C81}']

    procedure AdicionarProduto(Produto: TProduto; Quantidade: integer; PrecoSubtotal: Double);
    procedure ExibirProdutos;
  end;

implementation

end.
