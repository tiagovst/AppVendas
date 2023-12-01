unit Compra;

interface

uses
  Produto,
  System.SysUtils;

type
  TProdutoQuantidade = class
  public
    Produto: TProduto;
    Quantidade: Integer;
    PrecoSubtotal: Double;
  end;

implementation

end.
