unit ManejoUsuario.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TTelaManejoUsuario = class(TForm)
    pnlBottom: TPanel;
    pnlCenter: TPanel;
    btnCancelar: TButton;
    btnSalvar: TButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    lblNome: TLabeledEdit;
    lblEmail: TLabeledEdit;
    lblSenha: TLabeledEdit;
    lblUsuario: TLabeledEdit;
    lblTelefone: TLabeledEdit;
    lblCPF: TLabeledEdit;
    rbAdm: TRadioButton;
    rbVendedor: TRadioButton;
    rbGestor: TRadioButton;
    pnlTop: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    btnVoltar: TButton;
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaManejoUsuario: TTelaManejoUsuario;

implementation

{$R *.dfm}

procedure TTelaManejoUsuario.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

end.
