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
    procedure LimparProdutos;

    function AdicionarProduto(Produto: TProduto; Quantidade: Double; PrecoSubtotal: Double): Boolean;
    function ObterProdutos: TArray<TProdutoQuantidade>;
  end;

implementation

{ TControladorCompra }

function TControladorCompra.AdicionarProduto(Produto: TProduto; Quantidade: Double; PrecoSubtotal: Double): Boolean;
var
  ProdutoQuantidade: TProdutoQuantidade;
  i: Integer;
begin
  ProdutoQuantidade := TProdutoQuantidade.Create;
  try
    SetLength(PilhaProdutos, Length(PilhaProdutos) + 1);

    ProdutoQuantidade.Produto := Produto;
    ProdutoQuantidade.Quantidade := Quantidade;
    ProdutoQuantidade.PrecoSubtotal := PrecoSubtotal;

    if Length(PilhaProdutos) > 1 then
    begin
      for i := 0 to High(PilhaProdutos) - 1 do
      begin
        if PilhaProdutos[i].Produto.ID = ProdutoQuantidade.Produto.ID then
        begin
          PilhaProdutos[i].Quantidade := PilhaProdutos[i].Quantidade + ProdutoQuantidade.Quantidade;
          PilhaProdutos[i].PrecoSubtotal := PilhaProdutos[i].PrecoSubtotal + ProdutoQuantidade.PrecoSubtotal;
          SetLength(PilhaProdutos, Length(PilhaProdutos) - 1);
          break;
        end
        else
        begin
          PilhaProdutos[High(PilhaProdutos)] := ProdutoQuantidade;
        end;
      end;
    end
    else
    begin
      PilhaProdutos[High(PilhaProdutos)] := ProdutoQuantidade;
    end;

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

procedure TControladorCompra.LimparProdutos;
begin
  PilhaProdutos := [];
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
