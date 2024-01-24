unit ManejoUsuario.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, System.ImageList, Vcl.ImgList;

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
    lblUsuario: TLabeledEdit;
    lblTelefone: TLabeledEdit;
    lblCPF: TLabeledEdit;
    rbAdm: TRadioButton;
    rbVendedor: TRadioButton;
    rbGestor: TRadioButton;
    pnlTop: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Image: TImage;
    txtID: TLabeledEdit;
    lblSenha: TLabeledEdit;
    btnMostrarSenha: TSpeedButton;
    ImageList: TImageList;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnMostrarSenhaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaManejoUsuario: TTelaManejoUsuario;

implementation

{$R *.dfm}

procedure TTelaManejoUsuario.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TTelaManejoUsuario.btnMostrarSenhaClick(Sender: TObject);
begin
  if lblSenha.PasswordChar = '*' then
  begin
    lblSenha.PasswordChar := #0;
    btnMostrarSenha.ImageIndex := 1;
  end
  else
  begin
    lblSenha.PasswordChar := '*';
    btnMostrarSenha.ImageIndex := 0;
  end;
end;

end.
