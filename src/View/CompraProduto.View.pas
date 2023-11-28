unit CompraProduto.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Produto,
  ControladorCompraInterface;

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
    procedure txtQuantidadeCompraChange(Sender: TObject);
    procedure btnAdicionarCompraClick(Sender: TObject);
  private
    ControladorCompra: IControladorCompra;
    uProduto: TProduto;
  public
    constructor Carregar(Controlador: IControladorCompra; Produto: TProduto);
  end;

var
  TelaAdicionarProduto: TTelaAdicionarProduto;

implementation

{$R *.dfm}

{ TTelaAdicionarProduto }

procedure TTelaAdicionarProduto.btnAdicionarCompraClick(Sender: TObject);
begin
  try
    if ControladorCompra.AdicionarProduto(uProduto, StrToInt(txtQuantidadeCompra.Text), StrToFloat(lblSubtotal.Caption)) then;
      ShowMessage('Produto adicionado ao Checkout!');
  except on E: Exception do
    ShowMessage('Insira uma quantidade válida.');
  end;
end;

constructor TTelaAdicionarProduto.Carregar(Controlador: IControladorCompra; Produto: TProduto);
begin
  ControladorCompra := Controlador;
  uProduto := Produto;
end;

procedure TTelaAdicionarProduto.txtQuantidadeCompraChange(Sender: TObject);
var
  Quantidade : Integer;
  PrecoProduto : Double;
  Resultado : Double;
begin
  if TryStrToInt(txtQuantidadeCompra.Text, Quantidade) then
  begin
    Quantidade  := StrToInt(txtQuantidadeCompra.Text);
    PrecoProduto := StrToFloat(txtPreco.Text);
    Resultado := Quantidade * PrecoProduto;

    lblSubtotal.Caption := FormatFloat('#0.00', Resultado);
  end
  else
  begin
    lblSubtotal.Caption := '00,00';
  end;
end;

end.
