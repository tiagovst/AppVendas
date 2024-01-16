unit ControladorCompra;

interface

uses
  System.SysUtils,
  Produto,
  Compra,
  ControladorCompraInterface,
  Vcl.Dialogs;

type

TControladorCompra = class(TInterfacedObject, IControladorCompra)
  private
    PilhaProdutos: array of TProdutoQuantidade;
  public
    procedure ExibirProdutos;

    function AdicionarProduto(Produto: TProduto; Quantidade: Double; PrecoSubtotal: Double): Boolean;
    function ObterProdutos: TArray<TProdutoQuantidade>;
  end;

implementation

{ TControladorCompra }

function TControladorCompra.AdicionarProduto(Produto: TProduto; Quantidade: Double; PrecoSubtotal: Double): Boolean;
var
  ProdutoQuantidade: TProdutoQuantidade;
begin
  ProdutoQuantidade := TProdutoQuantidade.Create;
  try
    SetLength(PilhaProdutos, Length(PilhaProdutos) + 1);

    ProdutoQuantidade.Produto := Produto;
    ProdutoQuantidade.Quantidade := Quantidade;
    ProdutoQuantidade.PrecoSubtotal := PrecoSubtotal;

    PilhaProdutos[High(PilhaProdutos)] := ProdutoQuantidade;
    Result := True;
  except on E: Exception do
    Result := False;
  end;

end;

procedure TControladorCompra.ExibirProdutos;
var
  i: Integer;
begin
  for i := 0 to High(PilhaProdutos) do
  begin
    ShowMessage('Produto: ' + PilhaProdutos[i].Produto.Nome +
                ', Quantidade: ' + FloatToStr(PilhaProdutos[i].Quantidade) +
                ', Preço Subtotal: R$' + FloatToStr(PilhaProdutos[i].PrecoSubtotal) +
                ', Preço Unitário: R$' + FloatToStr(PilhaProdutos[i].Produto.Preco));
  end;
end;

function TControladorCompra.ObterProdutos: TArray<TProdutoQuantidade>;
var
  i: Integer;
begin
  SetLength(Result, Length(PilhaProdutos));
  for i := 0 to High(PilhaProdutos) do
    begin
      Result[i] := PilhaProdutos[i];
    end;
end;

end.
