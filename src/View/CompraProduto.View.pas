unit CompraProduto.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Imaging.pngimage;

type
  TTelaAdicionarProduto = class(TForm)
    pnlRodape: TPanel;
    pnlConteudo: TPanel;
    gboxInformacoes: TGroupBox;
    Label3: TLabel;
    txtNomeProduto: TEdit;
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
    pnlTopo: TPanel;
    Label1: TLabel;
    Label7: TLabel;
    Image: TImage;
    procedure txtQuantidadeCompraChange(Sender: TObject);
    procedure txtQuantidadeCompraKeyPress(Sender: TObject; var Key: Char);
  end;

var
  TelaAdicionarProduto: TTelaAdicionarProduto;

implementation

{$R *.dfm}

{ TTelaAdicionarProduto }

procedure TTelaAdicionarProduto.txtQuantidadeCompraChange(Sender: TObject);
var
  Quantidade : Double;
  PrecoProduto : Double;
  Resultado : Double;
begin
  if TryStrToFloat(txtQuantidadeCompra.Text, Quantidade) then
  begin
    Quantidade  := StrToFloat(txtQuantidadeCompra.Text);
    PrecoProduto := StrToFloat(txtPreco.Text);
    Resultado := Quantidade * PrecoProduto;

    lblSubtotal.Caption := FormatFloat('#0.00', Resultado);
  end
  else
  begin
    lblSubtotal.Caption := '00,00';
  end;

end;

procedure TTelaAdicionarProduto.txtQuantidadeCompraKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not CharInSet(Key, ['0'..'9', '.', #8]) then
  begin
    Key := #0;
  end;
end;

end.
