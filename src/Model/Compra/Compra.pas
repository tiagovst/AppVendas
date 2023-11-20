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

    {property Produto: TProduto read FProduto write FProduto;
    property Quantidade: Integer read FQuantidade write FQuantidade;
    property PrecoSubtotal: Double read FPrecoSubtotal write FPrecoSubtotal; }
  end;

implementation

end.
