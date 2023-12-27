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
  ControladorClienteDAO,
  ControladorClienteDAOInterface,
  ControladorTelaManejoCliente,
  ControladorTelaManejoClienteInterface,
  Produto,
  ControladorTelaCheckoutInterface,
  Vcl.ActnList,
  System.UITypes,
  SessaoUsuario;

type
TControladorTelaCheckout = class(TInterfacedObject, IControladorTelaCheckout)
  private
    FTelaCheckout : TTelaCheckout;
    Action: TAction;
    Desconto: Integer;
    PrecoTotal : Double;
    ArrayProdutos : TArray<TProdutoQuantidade>;
    uControladorTelaCadastroCliente : IControladorTelaManejoCliente;
    uControladorVenda : IControladorVenda;

    procedure MostrarTela;
    procedure FecharTela;
    procedure PreencherStringGrid(Produtos: TArray<TProdutoQuantidade>);
    procedure RealizarVenda;
    procedure AcaoFinalizar(Sender: TObject);
    procedure AcaoOnChangeDesconto(Sender: TObject);
    procedure CalcularSubtotal;
    procedure FormatarLabelSubtotal;
    procedure RegistrarItemVenda(IDVendaBackUp: Integer);
    procedure RegistrarVenda(RegistroVenda: TVenda; Erro: String);
    function VerificarCadastroCliente(IdentificadorCliente: String): Boolean;

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
  ValorTxtDesconto: String;
  i : Integer;
begin
  PrecoTotal := 0.0;

  ValorTxtDesconto := FTelaCheckout.txtDesconto.Text;

  for i := 1 to (FTelaCheckout.ProdutosGrid.Cols[3].Count - 1) do
  begin
    PrecoTotal := PrecoTotal + StrToFloat(FTelaCheckout.ProdutosGrid.Cols[4].Strings[i]);
  end;

  if (not ValorTxtDesconto.IsEmpty) and (TryStrToInt(ValorTxtDesconto, Desconto)) then
  begin
    Desconto := StrToInt(ValorTxtDesconto);

    if (Desconto > 0) and (Desconto < 100) then
    begin
      PrecoTotal := PrecoTotal - (PrecoTotal * (StrToFloat(ValorTxtDesconto) / 100));
    end
    else
    begin
      ShowMessage('O valor do desconto informado é inválido');
    end;

  end
  else
  begin
    Desconto := 0;
  end;

end;

constructor TControladorTelaCheckout.Create(const Produtos: TArray<TProdutoQuantidade>);
begin
  FTelaCheckout := TTelaCheckout.Create(nil);
  uControladorVenda := TControladorVenda.Create;
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
  QuantidadeProdutos: Integer;
  i : Integer;
  IDVendaBackUp: Integer;
  RegistroVenda : TVenda;
  cliente : String;
  decisaoCadastrarCliente : Integer;
  Erro : String;
begin
  RegistroVenda := TVenda.Create;
  QuantidadeProdutos := 0;
  cliente := FTelaCheckout.txtIdentificadorCliente.Text;

  with RegistroVenda do
  begin
    ID := uControladorVenda.gerarID;
    dataVenda := uControladorVenda.DataAtual;
    vendedor := SessaoUsuario.TSessaoUsuario.id;
    Desconto := self.Desconto;

    if not cliente.IsEmpty then
    begin
      IDCliente := cliente;
    end
    else
    begin
      ShowMessage('O campo "Cliente" deve estar preenchido!');
    end;
  end;

  for i := 1 to (FTelaCheckout.ProdutosGrid.Cols[0].Count - 1) do
  begin
    QuantidadeProdutos := QuantidadeProdutos + StrToInt(FTelaCheckout.ProdutosGrid.Cols[2].Strings[i]);
  end;
  RegistroVenda.totalProdutos := QuantidadeProdutos;

  CalcularSubtotal;
  RegistroVenda.totalPreco := StrToFloat(FormatFloat('#0.00', PrecoTotal));

  IDVendaBackUp := RegistroVenda.ID;

  if VerificarCadastroCliente(RegistroVenda.IDCliente) then
  begin
    RegistrarVenda(RegistroVenda, Erro);
    RegistrarItemVenda(IDVendaBackUp);
  end
  else
  begin
    decisaoCadastrarCliente := MessageDlg('Parece que o cliente inserido não está cadastrado' +
    sLineBreak + 'Deseja cadastrá-lo agora?', mtConfirmation, mbYesNo, 0);

    if decisaoCadastrarCliente = mrYes then
    begin
      uControladorTelaCadastroCliente := TControladorTelaManejoCliente.Create;
    end
    else
    begin
      RegistrarVenda(RegistroVenda, Erro);
      RegistrarItemVenda(IDVendaBackUp);
    end;

  end;

end;

procedure TControladorTelaCheckout.RegistrarItemVenda(IDVendaBackUp: Integer);
var
  produto : TProduto;
  uControladorItemVenda : IControladorItemVenda;
  uControladorProduto : IControladorProduto;
  erro : String;
  uItemVenda : TItemVenda;
  i: Integer;
begin
  uControladorItemVenda := TControladorItemVenda.Create;
  uControladorProduto := TControladorProduto.Create;

  for i := 1 to (FTelaCheckout.ProdutosGrid.Cols[0].Count - 1) do
    begin
      produto := uControladorProduto.CarregarProduto(StrToInt(FTelaCheckout.ProdutosGrid.Cols[0].Strings[i]));
      produto.QuantidadeEstoque := produto.QuantidadeEstoque - StrToInt(FTelaCheckout.ProdutosGrid.Cols[2].Strings[i]);
      uControladorProduto.Alterar(produto, erro); // Atualiza o estoque

      with FTelaCheckout do
      begin
        uItemVenda := TItemVenda.Create;

        with uItemVenda do
        begin
          IdVenda := IDVendaBackUp;
          Desconto := self.Desconto;
          IdProduto := StrToInt(ProdutosGrid.Cols[0].Strings[i]);
          Quantidade := StrToInt(ProdutosGrid.Cols[2].Strings[i]);
          Preco := StrToFloat(ProdutosGrid.Cols[3].Strings[i]);

          if Desconto <> 0 then
          begin
            Subtotal := StrToFloat(ProdutosGrid.Cols[4].Strings[i]) - StrToFloat(ProdutosGrid.Cols[4].Strings[i])
             * (Desconto / 100);
          end
          else
          begin
            Subtotal := StrToFloat(ProdutosGrid.Cols[4].Strings[i]);
          end;
        end;

      end;

      uControladorItemVenda.Inserir(uItemVenda, erro);
      FecharTela;

    end;
end;

procedure TControladorTelaCheckout.RegistrarVenda(RegistroVenda: TVenda; Erro: String);
begin
  if uControladorVenda.Inserir(RegistroVenda, Erro) then
    begin
      ShowMessage('Venda Cadastrada com Sucesso!');
    end
    else
    begin
      ShowMessage('Erro ao registrar a venda');
    end;
end;

function TControladorTelaCheckout.VerificarCadastroCliente(IdentificadorCliente: String): Boolean;
var
  uControladorClienteDAO : IControladorClienteDAO;
begin
  uControladorClienteDAO := TControladorClienteDAO.Create;

  Result := uControladorClienteDAO.VerificarIdentificadorCliente(IdentificadorCliente);

end;

end.
