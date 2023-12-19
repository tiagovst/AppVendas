unit Login.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Mask;

type
  TTelaLogin = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    ImageLogo: TImage;
    txtUsuario: TLabeledEdit;
    txtSenha: TLabeledEdit;
    Label1: TLabel;
    btnEntrar: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaLogin: TTelaLogin;

implementation

{$R *.dfm}

end.
