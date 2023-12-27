unit ControladorTelaEstoque;

interface

uses
  Estoque.View,
  System.SysUtils,
  ControladorProdutoInterface,
  ControladorProduto,
  Vcl.Dialogs,
  Vcl.ActnList,
  ControladorTelaEstoqueInterface,
  ControladorTelaCadastroProduto,
  ControladorTelaCadastroProdutoInterface,
  Vcl.Controls,
  Data.DB,
  SessaoUsuario,
  Produto,
  System.Generics.Collections,
  System.UITypes;

type
  TControladorTelaEstoque = class(TInterfacedObject, IControladorTelaEstoque)
    private
      FTelaEstoque : TTelaEstoque;
      uControladorProduto : IControladorProduto;
      uControladorTelaCadastroProduto : IControladorTelaCadastroProduto;
      AcaoExcluir, AcaoAtualizar, AcaoCadastrarProduto : TAction;
      procedure CalcularQuantidadeProdutos;
      procedure PreencherCbxCategorias;
      procedure MostrarTela(parent : TWinControl);
      procedure FecharTela;
      procedure ConfiguracaoEventosBotoes;

      procedure AcaoDbGridProdutosOnDblClick(Sender : TObject);
      procedure AcaoComboBoxCategoriaOnChange(Sender : TObject);
      procedure AcaoComboBoxNivelOnChange(Sender : TObject);
      procedure AcaoSearchBoxNomeProdutoOnChange(Sender : TObject);
      procedure AcaoBtnExcluirClick(Sender: TObject);
      procedure AcaoBtnAtualizarClick(Sender: TObject);
      procedure AcaoBtnCadastrarProdutoClick(Sender: TObject);
    public
      constructor Create;
    end;

implementation

{ TControladorTelaEstoque }

constructor TControladorTelaEstoque.Create;
begin
  FTelaEstoque := TTelaEstoque.Create(nil);
  uControladorProduto := TControladorProduto.Create;
  uControladorProduto.AtualizarListaProdutos(FTelaEstoque.DataSourceProdutos);
  FTelaEstoque.DataSourceProdutos.DataSet.Refresh;

  ConfiguracaoEventosBotoes;

  if SessaoUsuario.TSessaoUsuario.cargo.Equals('Vendedor') then
  begin
    FTelaEstoque.btnExluir.Enabled := False;
    FTelaEstoque.btnCadastrar.Enabled := False;
  end;

  CalcularQuantidadeProdutos;
  PreencherCbxCategorias;
end;

procedure TControladorTelaEstoque.AcaoBtnAtualizarClick(Sender: TObject);
begin
  uControladorProduto.AtualizarListaProdutos(FTelaEstoque.DataSourceProdutos);
  FTelaEstoque.ComboBoxCategoria.ItemIndex := -1;
  FTelaEstoque.ComboBoxNivel.ItemIndex := -1;
  FTelaEstoque.DataSourceProdutos.DataSet.Refresh;
end;

procedure TControladorTelaEstoque.AcaoBtnCadastrarProdutoClick(Sender: TObject);
begin
  uControladorTelaCadastroProduto := TControladorTelaCadastroProduto.Create;
end;

procedure TControladorTelaEstoque.AcaoBtnExcluirClick(Sender: TObject);
var
  erro: String;
  idProduto : integer;
  ConfirmacaoDialogo: Integer;
begin
  ConfirmacaoDialogo := MessageDlg('Deseja realmente excluir o produto selecionado?',
  TMsgDlgType.mtConfirmation, mbYesNo, 0);

  if ConfirmacaoDialogo = mrYes then
  begin
    idProduto := FTelaEstoque.DBGridProdutos.DataSource.DataSet.FieldByName('ID_PRODUTO').AsInteger;
    if uControladorProduto.Excluir(idProduto, erro) then
    begin
      ShowMessage('Produto excluído com sucesso!');
      FTelaEstoque.DBGridProdutos.DataSource.DataSet.Refresh;
    end
    else
    begin
      ShowMessage('Ocorreu um erro ao tentar excluir o produto selecionado!' + sLineBreak + erro);
    end;
  end;
end;

procedure TControladorTelaEstoque.AcaoComboBoxCategoriaOnChange(Sender: TObject);
begin
  uControladorProduto.PesquisarCategoria(FTelaEstoque.ComboBoxCategoria.Text,
    FTelaEstoque.DBGridProdutos.DataSource);

  FTelaEstoque.DBGridProdutos.DataSource.DataSet.Refresh;
end;

procedure TControladorTelaEstoque.AcaoComboBoxNivelOnChange(Sender: TObject);
var
  filtro : String;
begin
  filtro := FTelaEstoque.ComboBoxNivel.Text;
  uControladorProduto.PesquisarPorFiltro(filtro ,FTelaEstoque.DataSourceProdutos);
end;

procedure TControladorTelaEstoque.AcaoDbGridProdutosOnDblClick(Sender: TObject);
var
  ProdutoSelecionado : TProduto;
begin
  if Assigned(FTelaEstoque.DBGridProdutos.DataSource.DataSet) then
  begin
    ProdutoSelecionado := uControladorProduto.CarregarProduto(
      FTelaEstoque.DBGridProdutos.DataSource.DataSet.FieldByName('ID_PRODUTO').AsInteger);
  end;

  uControladorTelaCadastroProduto :=
    TControladorTelaCadastroProduto.CreateEditarProduto(ProdutoSelecionado);
  FreeAndNil(ProdutoSelecionado);
end;

procedure TControladorTelaEstoque.AcaoSearchBoxNomeProdutoOnChange(
  Sender: TObject);
var
  Nome: String;
begin
  Nome := FTelaEstoque.SearchBoxNomeProduto.Text;
  uControladorProduto.PesquisarNome(Nome, FTelaEstoque.DataSourceProdutos);
end;

procedure TControladorTelaEstoque.CalcularQuantidadeProdutos;
var
  QuantidadeProdutosTotal : Integer;
begin
  with FTelaEstoque.DBGridProdutos do
  begin
    if Assigned(DataSource) and Assigned(DataSource.DataSet) then
    begin
      QuantidadeProdutosTotal := DataSource.DataSet.RecordCount;
      FTelaEstoque.lblTotalEstoque.Caption := IntToStr(QuantidadeProdutosTotal);
    end;
  end;
end;

procedure TControladorTelaEstoque.ConfiguracaoEventosBotoes;
begin
  AcaoExcluir := TAction.Create(nil);
  AcaoAtualizar := TAction.Create(nil);
  AcaoCadastrarProduto := TAction.Create(nil);

  AcaoExcluir.OnExecute := AcaoBtnExcluirClick;
  AcaoAtualizar.OnExecute := AcaoBtnAtualizarClick;
  AcaoCadastrarProduto.OnExecute := AcaoBtnCadastrarProdutoClick;

  AcaoExcluir.Caption := 'Excluir';
  AcaoAtualizar.Caption := 'Atualizar';
  AcaoCadastrarProduto.Caption := 'Cadastrar produto';

  with FTelaEstoque do
  begin
    btnExluir.Action := AcaoExcluir;
    btnAtualizar.Action := AcaoAtualizar;
    btnCadastrar.Action := AcaoCadastrarProduto;
    ComboBoxNivel.OnChange := AcaoComboBoxNivelOnChange;
    ComboBoxCategoria.OnChange := AcaoComboBoxCategoriaOnChange;
    DBGridProdutos.OnDblClick := AcaoDbGridProdutosOnDblClick;
    SearchBoxNomeProduto.OnChange := AcaoSearchBoxNomeProdutoOnChange;
  end;
end;

procedure TControladorTelaEstoque.FecharTela;
begin
  FTelaEstoque.Close;
end;


procedure TControladorTelaEstoque.MostrarTela(parent: TWinControl);
begin
  FTelaEstoque.Parent := parent;
  FTelaEstoque.Align := alClient;
  FTelaEstoque.Show;
end;

procedure TControladorTelaEstoque.PreencherCbxCategorias;
var
  ListaCategorias : TList<String>;
  categoria: String;
begin
  ListaCategorias := TList<String>.Create;

  with FTelaEstoque.DBGridProdutos.DataSource.DataSet do
  begin
    while not Eof do
    begin
      categoria := FieldByName('CATEGORIA').AsString;
      if not ListaCategorias.Contains(categoria) then
      begin
        ListaCategorias.Add(categoria);
        FTelaEstoque.ComboBoxCategoria.Items.Add(categoria);
      end;
      Next;
    end;
  end;
end;

end.
