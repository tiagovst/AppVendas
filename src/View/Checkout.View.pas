unit Checkout.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Grids,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Venda,
  ControladorVenda,
  ItemVenda,
  ControladorVendaInterface,
  ControladorItemVenda,
  ControladorItemVendaInterface,
  ControladorProdutoInterface,
  ControladorProduto,
  Produto,
  ControladorTelaCheckoutInterface, Vcl.Imaging.pngimage, Vcl.Mask;

type
  TTelaCheckout = class(TForm)
    pnlConteudo: TPanel;
    pnlBottom: TPanel;
    ProdutosGrid: TStringGrid;
    btnFinalizar: TButton;
    btnCancelar: TButton;
    Label1: TLabel;
    btnLimpar: TButton;
    btnDeletar: TButton;
    pnlTop: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Image: TImage;
    Label4: TLabel;
    lblSubtotal: TLabel;
    txtDesconto: TLabeledEdit;
    procedure btnCancelarClick(Sender: TObject);
   end;

var
  TelaCheckout: TTelaCheckout;

implementation

{$R *.dfm}

{ TTelaCheckout }

procedure TTelaCheckout.btnCancelarClick(Sender: TObject);
begin
  Close;
end;
end.
