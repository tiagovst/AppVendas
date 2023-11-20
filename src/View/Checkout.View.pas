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
  ControladorVendaInterface;

type
  TTelaCheckout = class(TForm)
    pnlConteudo: TPanel;
    pnlBottom: TPanel;
    ProdutosGrid: TStringGrid;
    btnFinalizar: TButton;
    btnCancelar: TButton;
    Label1: TLabel;
    pnpTop: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    btnLimpar: TButton;
    btnDeletar: TButton;
    procedure btnCancelarClick(Sender: TObject);
  private

  public

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
