unit Login.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Mask,
  Usuario,
  ControladorUsuario,
  ControladorUsuarioInterface,
  ControladorTelaPrincipal,
  ControladorTelaPrincipalInterface;

type
  TTelaLogin = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    ImageLogo: TImage;
    txtUsuario: TLabeledEdit;
    txtSenha: TLabeledEdit;
    Label1: TLabel;
    btnEntrar: TButton;
    procedure btnEntrarClick(Sender: TObject);
  private
    uControladorTelaPrincipal: IControladorTelaPrincipal;
    NomeDeUsuario, Senha: String;
    uUsuario: TUsuario;

    uControladorUsuarioDAO: IControladorUsuario;
  public
    { Public declarations }
  end;

var
  TelaLogin: TTelaLogin;

implementation

{$R *.dfm}

procedure TTelaLogin.btnEntrarClick(Sender: TObject);
begin
  uUsuario := TUsuario.Create;
  uControladorUsuarioDAO := TControladorUsuario.Create;

  NomeDeUsuario := txtUsuario.Text;
  Senha := txtSenha.Text;

  try

    uControladorUsuarioDAO.PesquisarNomeUsuario(uUsuario, NomeDeUsuario);

    if uUsuario.Senha.Equals(Senha) then
    begin
      uControladorTelaPrincipal := TControladorTelaPrincipal.Create;
      //Close;
    end
    else
    begin
      ShowMessage('Credenciais inválidas!');
    end;
  except on E: Exception do
    begin
      ShowMessage(E.Message);
    end;

  end;
end;

end.
