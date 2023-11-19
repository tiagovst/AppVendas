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
  Produto;

type
  TTelaCadastroProduto = class(TForm)
    btnVoltar: TButton;
    Label1: TLabel;
    Label2: TLabel;
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
    Panel3: TPanel;
    Panel4: TPanel;
    txtValidade: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaCadastroProduto: TTelaCadastroProduto;

implementation

{$R *.dfm}

procedure TTelaCadastroProduto.btnSalvarClick(Sender: TObject);
var
  Controlador: IControladorProduto;
  ProdutoCache : TProduto;
  erro: String;
begin
  ProdutoCache := TProduto.Create;
  Controlador := TControladorProduto.Create;
  ProdutoCache.ID := Controlador.gerarID;
  ProdutoCache.Nome := txtNomeProduto.Text;
  //ProdutoCache.CodigoBarras := Controlador
  ProdutoCache.Descricao := txtDescricaoProduto.Text;
  ProdutoCache.Referencia := txtReferencia.Text;
  ProdutoCache.Preco := StrToFloat(txtPreco.Text);
  ProdutoCache.Categoria := cbxCategoria.Text;
  ProdutoCache.QuantidadeEstoque := StrToInt(txtQuantidadeEstoque.Text);
  ProdutoCache.Fornecedor := txtFornecedor.Text;
  ProdutoCache.DataValidade := StrToDate(txtValidade.Text);

  if Controlador.Inserir(ProdutoCache, erro) then
  begin
    ShowMessage('Produto inserido com sucesso');
  end
  else
  begin
    ShowMessage(erro);
  end;

end;

procedure TTelaCadastroProduto.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TTelaCadastroProduto.FormCreate(Sender: TObject);
begin
  txtDescricaoProduto.Text := '';
end;

end.
