unit ControladorTelaCheckout;

interface

uses
  System.SysUtils,
  Compra,
  Vcl.Grids,
  Checkout.View,
  Vcl.Dialogs;

type
TControladorTelaCheckout = class
  private
    FTelaCheckout : TTelaCheckout;

  public
    constructor Create(const Produtos: TArray<TProdutoQuantidade>) overload;
    procedure MostrarTelaCheckout;
    procedure FecharTelaCheckout;
end;

implementation


{ TControladorTelaCheckout }

constructor TControladorTelaCheckout.Create(const Produtos: TArray<TProdutoQuantidade>);
var
  RowIndex, ColIndex: Integer;
  StringGrid :TStringGrid;
begin
  FTelaCheckout := TTelaCheckout.Create(nil);

    StringGrid := FTelaCheckout.ProdutosGrid;

  // Adiciona colunas
  StringGrid.ColCount := 5;
  StringGrid.Cells[0, 0] := 'ID';
  StringGrid.Cells[1, 0] := 'Produto';
  StringGrid.Cells[2, 0] := 'Quantidade';
  StringGrid.Cells[3, 0] := 'Preço Unitário';
  StringGrid.Cells[4, 0] := 'Preço Subtotal';

  // Adiciona dados
  StringGrid.RowCount := Length(Produtos) + 1; // +1 para incluir a linha de cabeçalho

  for RowIndex := 0 to High(Produtos) do
  begin
    ColIndex := 0;
    StringGrid.Cells[ColIndex, RowIndex + 1] := IntToStr(Produtos[RowIndex].Produto.ID);
    Inc(ColIndex);
    StringGrid.Cells[ColIndex, RowIndex + 1] := Produtos[RowIndex].Produto.Nome;
    Inc(ColIndex);
    StringGrid.Cells[ColIndex, RowIndex + 1] := IntToStr(Produtos[RowIndex].Quantidade);
    Inc(ColIndex);
    StringGrid.Cells[ColIndex, RowIndex + 1] := FloatToStr(Produtos[RowIndex].Produto.Preco);
    Inc(ColIndex);
    StringGrid.Cells[ColIndex, RowIndex + 1] := FloatToStr(Produtos[RowIndex].PrecoSubtotal);
  end;

  with StringGrid do
  begin

    ColWidths[0] := 50;
    ColWidths[1] := Width div 3;
    ColWidths[2] := (Width - ColWidths[1]) div 3;
    ColWidths[3] := (Width - ColWidths[1]) div 3 - 30;
    ColWidths[4] := (Width - ColWidths[1]) div 3 - 30;
  end;
end;

procedure TControladorTelaCheckout.FecharTelaCheckout;
begin
  FTelaCheckout.Close;
end;

procedure TControladorTelaCheckout.MostrarTelaCheckout;
begin
  FTelaCheckout.Show;
end;

end.
