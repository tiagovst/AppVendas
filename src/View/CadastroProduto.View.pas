unit CadastroProduto.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  System.ImageList,
  Vcl.ImgList,
  Vcl.Mask,
  ControladorProdutoInterface,
  ControladorProduto,
  Produto, Vcl.Imaging.pngimage;

type
  TTelaCadastroProduto = class(TForm)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    txtNomeProduto: TEdit;
    Label4: TLabel;
    txtDescricaoProduto: TMemo;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    txtReferencia: TEdit;
    Label6: TLabel;
    cbxCategoria: TComboBox;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    txtPreco: TEdit;
    Label8: TLabel;
    txtQuantidadeEstoque: TEdit;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    txtFornecedor: TEdit;
    btnSalvar: TButton;
    btnCancelar: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    txtValidade: TLabeledEdit;
    GroupBox5: TGroupBox;
    txtCodigoBarras: TLabeledEdit;
    txtID: TLabeledEdit;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Image: TImage;
    CheckBox1: TCheckBox;
    CheckBoxStatus: TCheckBox;
    GroupBox6: TGroupBox;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure LimparCampos;
    procedure txtQuantidadeEstoqueKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1Click(Sender: TObject);
    end;

var
  TelaCadastroProduto: TTelaCadastroProduto;

implementation

{$R *.dfm}

procedure TTelaCadastroProduto.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TTelaCadastroProduto.btnSalvarClick(Sender: TObject);
var
  Controlador: IControladorProduto;
  ProdutoCache : TProduto;
  erro: String;
  id : String;
begin
  ProdutoCache := TProduto.Create;
  Controlador := TControladorProduto.Create;

  id := txtID.Text;
  if id.IsEmpty then
  begin
    ProdutoCache.ID := Controlador.gerarID;
  end
  else
  begin
    ProdutoCache.ID := StrToInt(txtID.Text);
  end;

  if CheckBoxStatus.Checked then
  begin
    ProdutoCache.Ativo := -1;
  end
  else
  begin
    ProdutoCache.Ativo := 0;
  end;

  ProdutoCache.Nome := txtNomeProduto.Text;
  ProdutoCache.CodigoBarras := txtCodigoBarras.Text;
  ProdutoCache.Descricao := txtDescricaoProduto.Text;
  ProdutoCache.Referencia := txtReferencia.Text;
  ProdutoCache.Preco := StrToFloat(txtPreco.Text);
  ProdutoCache.Categoria := cbxCategoria.Text;

  if StrToFloat(txtQuantidadeEstoque.Text) > 0 then
  begin
    ProdutoCache.QuantidadeEstoque := StrToFloat(txtQuantidadeEstoque.Text);

    ProdutoCache.Fornecedor := txtFornecedor.Text;

    if not CheckBox1.Checked then
      ProdutoCache.DataValidade := StrToDate(txtValidade.Text);

    if Controlador.Inserir(ProdutoCache, erro) then
    begin
      ShowMessage('Produto inserido com sucesso');
      LimparCampos;
    end
    else
    begin
      ShowMessage(erro);
    end;
  end
  else
  begin
    ShowMessage('Informe uma quantidade válida do produto!');
  end;
end;

procedure TTelaCadastroProduto.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    txtValidade.Enabled := False;
    txtValidade.EditMask := '';
  end
  else
  begin
    txtValidade.EditMask := '!99/99/0000;1;_';
    txtValidade.Enabled := True;
  end;
end;

procedure TTelaCadastroProduto.FormCreate(Sender: TObject);
begin
  txtDescricaoProduto.Text := '';
end;

procedure TTelaCadastroProduto.LimparCampos;
begin
  cbxCategoria.Text := '';
  txtNomeProduto.Text := '';
  txtDescricaoProduto.Text := '';
  txtReferencia.Text := '';
  txtPreco.Text := '';
  txtQuantidadeEstoque.Text := '';
  txtFornecedor.Text := '';
  txtValidade.Text := '';
  txtCodigoBarras.Text := '';
end;

procedure TTelaCadastroProduto.txtQuantidadeEstoqueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not CharInSet(Key, ['0'..'9', '.', #8]) then
  begin
    key := #0;
  end;
end;

end.
