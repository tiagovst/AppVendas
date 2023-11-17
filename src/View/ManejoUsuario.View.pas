unit ManejoUsuario.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TTelaManejoUsuario = class(TForm)
    pnlTop: TPanel;
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
    LabelTitulo: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaManejoUsuario: TTelaManejoUsuario;

implementation

{$R *.dfm}

end.
