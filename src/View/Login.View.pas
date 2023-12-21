unit Login.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Mask,
  ConexaoIniciar,
  SessaoUsuario,
  Usuario,
  ControladorUsuario,
  ControladorUsuarioInterface;

type
  TTelaLogin = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    ImageLogo: TImage;
    Label1: TLabel;
    btnEntrar: TButton;
    txtUsuario: TEdit;
    txtSenha: TEdit;
    procedure btnEntrarClick(Sender: TObject);
  private
    bLoginSucesso: Boolean;
    NomeDeUsuario, Senha: String;
    uUsuario: TUsuario;

    uControladorUsuarioDAO: IControladorUsuario;
  public
    property LoginSucesso: Boolean read bLoginSucesso;
  end;

var
  TelaLogin: TTelaLogin;

implementation

{$R *.dfm}

procedure TTelaLogin.btnEntrarClick(Sender: TObject);
begin
  TConexaoIniciar.CriarConexao;
  uUsuario := TUsuario.Create;
  uControladorUsuarioDAO := TControladorUsuario.Create;

  NomeDeUsuario := txtUsuario.Text;
  Senha := txtSenha.Text;

  try
    uControladorUsuarioDAO.PesquisarNomeUsuario(uUsuario, NomeDeUsuario);

    if uUsuario.Senha.Equals(Senha) then
    begin
      SessaoUsuario.TSessaoUsuario.id := uUsuario.ID;
      SessaoUsuario.TSessaoUsuario.cargo := uUsuario.Cargo;
      SessaoUsuario.TSessaoUsuario.nomeUsuario := uUsuario.NomeUsuario;
      bLoginSucesso := True;
      Close;
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
