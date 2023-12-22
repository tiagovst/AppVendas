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
  System.UITypes;

type
  TControladorTelaEstoque = class(TInterfacedObject, IControladorTelaEstoque)
    private
      FTelaEstoque : TTelaEstoque;
      uControladorProduto : IControladorProduto;
      AcaoExcluir : TAction;

      procedure AcaoBtnExcluir(Sender: TObject);
    public
      constructor Create(const datasource : TDataSource) overload;
      procedure MostrarTela(parent : TWinControl);
      procedure FecharTela;

      procedure CalcularQuantidadeProdutos;
      procedure PreencherCbxCategorias;
    end;

implementation

{ TControladorTelaEstoque }

procedure TControladorTelaEstoque.AcaoBtnExcluir(Sender: TObject);
var
  erro: String;
  idProduto : integer;
  ConfirmacaoDialogo: Integer;
begin
  uControladorProduto := TControladorProduto.Create;

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
begin
  //pegar categorias dos produtos no banco e preencher o String Itens
end;

end.
