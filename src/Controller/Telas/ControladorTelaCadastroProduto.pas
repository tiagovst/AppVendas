unit ControladorTelaCadastroProduto;

interface

uses
  System.SysUtils,
  ControladorTelaCadastroProdutoInterface,
  CadastroProduto.View,
  Vcl.Forms,
  Vcl.ActnList,
  Vcl.Controls,
  Vcl.Dialogs,
  ControladorProdutoInterface,
  ControladorProduto,
  Produto;

type
  TControladorTelaCadastroProduto = class(TInterfacedObject, IControladorTelaCadastroProduto)
  private
    produtoSelecionado : TProduto;
    FTelaCadastroProduto : TTelaCadastroProduto;
    ActionBtnSalvar : TAction;
    uControladorProduto: IControladorProduto;

    procedure AcaoSalvar(Sender: TObject);
    procedure PreencherTelaEditarProduto;
    procedure MostrarTela;
    procedure FecharTela;
    procedure CadastrarNovoProduto;
    procedure PreencherProduto(ProdutoVazio: TProduto);

  public
    constructor CreateEditarProduto(const produto : TProduto) overload;
    constructor Create overload;
  end;

implementation

{ TControladorTelaCadastroProduto }

constructor TControladorTelaCadastroProduto.CreateEditarProduto(const produto: TProduto);
begin
  produtoSelecionado := produto;
  FTelaCadastroProduto := TTelaCadastroProduto.Create(nil);
  FTelaCadastroProduto.BorderStyle := bsDialog;
  FTelaCadastroProduto.Position := poDesktopCenter;
  FTelaCadastroProduto.Label1.Caption := 'Manejo de produto';
  FTelaCadastroProduto.txtID.Visible := True;
  PreencherTelaEditarProduto;

  ActionBtnSalvar := TAction.Create(nil);
  ActionBtnSalvar.OnExecute := AcaoSalvar;
  ActionBtnSalvar.Caption := 'Salvar';
  FTelaCadastroProduto.btnSalvar.Action := ActionBtnSalvar;

  MostrarTela;
end;

constructor TControladorTelaCadastroProduto.Create;
begin
  FTelaCadastroProduto := TTelaCadastroProduto.Create(nil);
  FTelaCadastroProduto.BorderStyle := bsDialog;
  FTelaCadastroProduto.Position := poDesktopCenter;

  ActionBtnSalvar := TAction.Create(nil);
  ActionBtnSalvar.OnExecute := AcaoSalvar;
  ActionBtnSalvar.Caption := 'Salvar';
  FTelaCadastroProduto.btnSalvar.Action := ActionBtnSalvar;

  MostrarTela;
end;

procedure TControladorTelaCadastroProduto.FecharTela;
begin
  FTelaCadastroProduto.Close;
end;

procedure TControladorTelaCadastroProduto.MostrarTela;
begin
  FTelaCadastroProduto.ShowModal;
end;


procedure TControladorTelaCadastroProduto.PreencherTelaEditarProduto;
begin
  with FTelaCadastroProduto, produtoSelecionado do
  begin
    txtNomeProduto.Text := Nome;
    txtID.Text := IntToStr(ID);
    txtDescricaoProduto.Text := Descricao;
    txtQuantidadeEstoque.Text := IntToStr(QuantidadeEstoque);
    txtPreco.Text := FloatToStr(Preco);
    txtReferencia.Text := Referencia;
    txtFornecedor.Text := Fornecedor;
    txtValidade.Text := DateToStr(DataValidade);
    txtCodigoBarras.Text := CodigoBarras;
  end;
end;

procedure TControladorTelaCadastroProduto.AcaoSalvar(Sender: TObject);
begin
  CadastrarNovoProduto;
end;

procedure TControladorTelaCadastroProduto.CadastrarNovoProduto;
var
  NovoProduto : TProduto;
  erro: String;
begin
  NovoProduto := TProduto.Create;
  PreencherProduto(NovoProduto);
  uControladorProduto := TControladorProduto.Create;

  if uControladorProduto.Inserir(NovoProduto, erro) then
  begin
    ShowMessage('Produto inserido com sucesso');
  end
  else
  begin
    ShowMessage('Ocorreu um erro ao cadastrar o produto. Verifique todos os campos e tente novamente');
  end;

end;

procedure TControladorTelaCadastroProduto.PreencherProduto(ProdutoVazio: TProduto);
var
  ProdutoId: String;
begin
  ProdutoId := FTelaCadastroProduto.txtID.Text;
  uControladorProduto := TControladorProduto.Create;

  with ProdutoVazio, FTelaCadastroProduto do
  begin
    if not ProdutoId.IsEmpty then
    begin
      ID := StrToInt(ProdutoId);
    end
    else
    begin
      ID := uControladorProduto.gerarID;
    end;

    Nome := txtNomeProduto.Text;
    CodigoBarras := txtCodigoBarras.Text;
    Descricao := txtDescricaoProduto.Text;
    Referencia := txtReferencia.Text;
    Preco := StrToFloat(txtPreco.Text);
    Categoria := cbxCategoria.Text;

    if StrToInt(txtQuantidadeEstoque.Text) > 0 then
    begin
      QuantidadeEstoque := StrToInt(txtQuantidadeEstoque.Text);
    end
    else
    begin
      ShowMessage('Informe uma quantidade válida do produto!');
    end;

    Fornecedor := txtFornecedor.Text;
    DataValidade := StrToDate(txtValidade.Text);
  end;

end;

end.
