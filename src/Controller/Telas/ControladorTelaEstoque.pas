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
  Vcl.Controls,
  Data.DB,
  SessaoUsuario,
  System.Generics.Collections,
  System.UITypes;

type
  TControladorTelaEstoque = class(TInterfacedObject, IControladorTelaEstoque)
    private
      FTelaEstoque : TTelaEstoque;
      uControladorProduto : IControladorProduto;
      AcaoExcluir : TAction;
      procedure CalcularQuantidadeProdutos;
      procedure PreencherCbxCategorias;
      procedure MostrarTela(parent : TWinControl);
      procedure FecharTela;
      procedure AcaoComboBoxOnChange(Sender : TObject);

      procedure AcaoBtnExcluir(Sender: TObject);
    public
      constructor Create(const datasource : TDataSource) overload;
    end;

implementation

{ TControladorTelaEstoque }

procedure TControladorTelaEstoque.AcaoBtnExcluir(Sender: TObject);
var
  erro: String;
  idProduto : integer;
  ConfirmacaoDialogo: Integer;
begin
  ConfirmacaoDialogo := MessageDlg('Deseja realmente excluir o produto selecionado?',
  TMsgDlgType.mtConfirmation, mbYesNo, 0);

  if ConfirmacaoDialogo = mrYes then
  begin
    idProduto := FTelaEstoque.DBGridProdutos.DataSource.DataSet.FieldByName('ID').AsInteger;
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

procedure TControladorTelaEstoque.AcaoComboBoxOnChange(Sender: TObject);
begin
  uControladorProduto.PesquisarCategoria(FTelaEstoque.ComboBoxCategoria.Text,
    FTelaEstoque.DBGridProdutos.DataSource);

  FTelaEstoque.DBGridProdutos.DataSource.DataSet.Refresh;
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

constructor TControladorTelaEstoque.Create(const datasource: TDataSource);
begin
  FTelaEstoque := TTelaEstoque.Create(nil);
  uControladorProduto := TControladorProduto.Create;
  FTelaEstoque.DBGridProdutos.DataSource := datasource;
  FTelaEstoque.DBGridProdutos.DataSource.DataSet.Refresh;

  AcaoExcluir := TAction.Create(nil);
  AcaoExcluir.OnExecute := AcaoBtnExcluir;
  AcaoExcluir.Caption := 'Excluir';
  FTelaEstoque.btnExluir.Action := AcaoExcluir;

  if SessaoUsuario.TSessaoUsuario.cargo.Equals('Vendedor') then
  begin
    FTelaEstoque.btnExluir.Enabled := False;
    FTelaEstoque.btnCadastrar.Enabled := False;
  end;

  CalcularQuantidadeProdutos;
  PreencherCbxCategorias;

  FTelaEstoque.ComboBoxCategoria.OnChange := AcaoComboBoxOnChange;

  FTelaEstoque.ComboBoxCategoria.ItemIndex := 0;
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
