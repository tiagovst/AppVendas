unit ControladorCompra;

interface

uses
  System.SysUtils,
  Produto,
  ControladorCompraInterface,
{  Venda,
  ControladorVenda,
  ControladorVendaInterface,}
  Vcl.Dialogs;

type
TProdutoQuantidade = record
  public
    Produto: TProduto;
    Quantidade: Integer;
    PrecoSubtotal: Double;
  end;

TControladorCompra = class(TInterfacedObject, IControladorCompra)
  private
    PilhaProdutos: array of TProdutoQuantidade;

  public
    procedure AdicionarProduto(Produto: TProduto; Quantidade: integer; PrecoSubtotal: Double);
    procedure ExibirProdutos;
  end;

implementation

{ TControladorCompra }

procedure TControladorCompra.AdicionarProduto(Produto: TProduto; Quantidade: integer; PrecoSubtotal: Double);
begin
  SetLength(PilhaProdutos, Length(PilhaProdutos) + 1);
  PilhaProdutos[High(PilhaProdutos)].Produto := Produto;
  PilhaProdutos[High(PilhaProdutos)].Quantidade := Quantidade;
  PilhaProdutos[High(PilhaProdutos)].PrecoSubtotal := PrecoSubtotal;
end;

procedure TControladorCompra.ExibirProdutos;
var
  i: Integer;
begin
  for i := 0 to High(PilhaProdutos) do
  begin
    ShowMessage('Produto: ' + PilhaProdutos[i].Produto.Nome +
                ', Quantidade: ' + IntToStr(PilhaProdutos[i].Quantidade) +
                ', Preço Subtotal: R$' + FloatToStr(PilhaProdutos[i].PrecoSubtotal) +
                ', Preço Unitário: R$' + FloatToStr(PilhaProdutos[i].Produto.Preco));
  end;
end;
end.
