unit CompraProduto.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Produto;

type
  TTelaAdicionarProduto = class(TForm)
    pnlRodape: TPanel;
    pnlConteudo: TPanel;
    gboxInformacoes: TGroupBox;
    Label3: TLabel;
    txtNomeProduto: TEdit;
    pnlTopo: TPanel;
    Label1: TLabel;
    gboxQuantidade: TGroupBox;
    btnAdicionarCompra: TButton;
    txtQuantidadeCompra: TLabeledEdit;
    Label2: TLabel;
    txtQuantidadeEstoque: TEdit;
    txtPreco: TLabeledEdit;
    Label5: TLabel;
    Label4: TLabel;
    txtCategoria: TEdit;
    Label6: TLabel;
    lblSubtotal: TLabel;
  private
    { Private declarations }
  public
    procedure PreencherProduto(Produto : TProduto);
  end;

var
  TelaAdicionarProduto: TTelaAdicionarProduto;

implementation

{$R *.dfm}

{ TTelaAdicionarProduto }

procedure TTelaAdicionarProduto.PreencherProduto(Produto : TProduto);
begin
  with Produto do
  begin
    txtNomeProduto.Text := Nome;
    txtCategoria.Text := Categoria;
    txtPreco.Text := Preco.ToString;
    txtQuantidadeEstoque.Text := QuantidadeEstoque.ToString;
  end;
end;

end.
