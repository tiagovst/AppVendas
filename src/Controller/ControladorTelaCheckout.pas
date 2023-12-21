unit ControladorTelaCheckout;

interface

uses
  System.SysUtils, Vcl.Grids, Checkout.View, Vcl.Dialogs, Vcl.Controls,
  Compra,
  Venda,
  ControladorVendaDAO,
  ItemVenda,
  ControladorVendaDAOInterface,
  ControladorItemVenda,
  ControladorItemVendaInterface,
  ControladorProdutoInterface,
  ControladorProduto,
  Produto,
  ControladorTelaCheckoutInterface,
  Vcl.ActnList,
  SessaoUsuario;

type
TControladorTelaCheckout = class(TInterfacedObject, IControladorTelaCheckout)
  private
    FTelaCheckout : TTelaCheckout;
    Action: TAction;
    Desconto: String;
    PrecoTotal : Double;
    ArrayProdutos : TArray<TProdutoQuantidade>;

    procedure MostrarTela;
    procedure FecharTela;
    procedure PreencherStringGrid(Produtos: TArray<TProdutoQuantidade>);
    procedure RealizarVenda;
    procedure AcaoFinalizar(Sender: TObject);
    procedure AcaoOnChangeDesconto(Sender: TObject);
    procedure CalcularSubtotal;
    procedure FormatarLabelSubtotal;

  public
    constructor Create(const Produtos: TArray<TProdutoQuantidade>) overload;
end;

implementation

{ TControladorTelaCheckout }

procedure TControladorTelaCheckout.AcaoFinalizar(Sender: TObject);
begin
  if High(ArrayProdutos) = -1 then
  begin
    ShowMessage('Seu carrinho de compras está vazio');
  end
  else
  begin
    RealizarVenda;
  end;
end;

procedure TControladorTelaCheckout.AcaoOnChangeDesconto(Sender: TObject);
begin
  FormatarLabelSubtotal;
end;

procedure TControladorTelaCheckout.CalcularSubtotal;
var
  i : Integer;
begin
  PrecoTotal := 0.0;
  Desconto := FTelaCheckout.txtDesconto.Text;

  for i := 1 to (FTelaCheckout.ProdutosGrid.Cols[3].Count - 1) do
  begin
    PrecoTotal := PrecoTotal + StrToFloat(FTelaCheckout.ProdutosGrid.Cols[4].Strings[i]);
  end;

  if not Desconto.IsEmpty then
  begin
    PrecoTotal := PrecoTotal - (PrecoTotal * (StrToFloat(Desconto) / 100));
  end
  else
  begin
    Desconto := '0';
  end;

end;

constructor TControladorTelaCheckout.Create(const Produtos: TArray<TProdutoQuantidade>);
begin
  FTelaCheckout := TTelaCheckout.Create(nil);
  PreencherStringGrid(Produtos);

  ArrayProdutos := Produtos;

  Action := TAction.Create(nil);
  Action.OnExecute := AcaoFinalizar;
  Action.Caption := 'Finalizar';

  FormatarLabelSubtotal;
  FTelaCheckout.txtDesconto.OnChange := AcaoOnChangeDesconto;
  FTelaCheckout.btnFinalizar.Action := Action;
  MostrarTela;
end;

procedure TControladorTelaCheckout.FecharTela;
begin
  FTelaCheckout.Close;
end;

procedure TControladorTelaCheckout.FormatarLabelSubtotal;
begin
  CalcularSubtotal;
  FTelaCheckout.lblSubtotal.Caption := FormatFloat('#0.00', PrecoTotal);
end;

procedure TControladorTelaCheckout.MostrarTela;
begin
  FTelaCheckout.Show;
end;

procedure TControladorTelaCheckout.PreencherStringGrid(Produtos: TArray<TProdutoQuantidade>);
var
  RowIndex, ColIndex: Integer;
  StringGrid :TStringGrid;
begin
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

procedure TControladorTelaCheckout.RealizarVenda;
var
  i : Integer;
  erro: String;

  RegistroVenda : TVenda;
  uItemVenda: TItemVenda;
  uControladorVenda : IControladorVenda;
  uControladorItemVenda : IControladorItemVenda;

  uControladorProduto : IControladorProduto;
  produto : TProduto;
begin
  RegistroVenda := TVenda.Create;
  uControladorVenda := TControladorVenda.Create;
  uControladorItemVenda := TControladorItemVenda.Create;
  uControladorProduto := TControladorProduto.Create;
  produto := TProduto.Create;

  RegistroVenda.ID := uControladorVenda.gerarID;
  RegistroVenda.dataVenda := uControladorVenda.DataAtual;
  RegistroVenda.totalProdutos := FTelaCheckout.ProdutosGrid.RowCount - 1;
  RegistroVenda.vendedor := SessaoUsuario.TSessaoUsuario.id;
  RegistroVenda.Desconto := StrToInt(Desconto);

  CalcularSubtotal;
  RegistroVenda.totalPreco := StrToFloat(FormatFloat('#0.00', PrecoTotal));

  for i := 1 to (FTelaCheckout.ProdutosGrid.Cols[0].Count - 1) do
    begin
      produto := uControladorProduto.CarregarProduto(StrToInt(FTelaCheckout.ProdutosGrid.Cols[0].Strings[i]));
      produto.QuantidadeEstoque := produto.QuantidadeEstoque - StrToInt(FTelaCheckout.ProdutosGrid.Cols[2].Strings[i]);
      uControladorProduto.Alterar(produto, erro);

      with FTelaCheckout do
      begin
        uItemVenda := TItemVenda.Create(
        RegistroVenda.ID,
        RegistroVenda.Desconto,
        StrToInt(ProdutosGrid.Cols[0].Strings[i]),
        StrToInt(ProdutosGrid.Cols[2].Strings[i]),
        StrToFloat(ProdutosGrid.Cols[3].Strings[i]),
        StrToFloat(ProdutosGrid.Cols[4].Strings[i])
        );
      end;

      uControladorItemVenda.Inserir(uItemVenda, erro);
    end;

  if uControladorVenda.Inserir(RegistroVenda, erro) then
  begin
    ShowMessage('Venda Cadastrda com Sucesso!');
  end
  else
  begin
    ShowMessage('Erro ao registrar a venda');
  end;

end;

end.
