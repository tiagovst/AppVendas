unit EditarUsuario.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask;

type
  TTelaEditarUsuario = class(TForm)
    pnlCenter: TPanel;
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
    txtID: TLabeledEdit;
    pnlBottom: TPanel;
    btnCancelar: TButton;
    btnSalvar: TButton;
    pnlTop: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Image: TImage;
    Label4: TLabel;
    btnAlterarSenha: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaEditarUsuario: TTelaEditarUsuario;

implementation

{$R *.dfm}

end.
