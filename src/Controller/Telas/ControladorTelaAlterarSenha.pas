unit ControladorTelaAlterarSenha;

interface

uses
  SysUtils,
  AlterarSenha.View,
  ControladorUsuario,
  ControladorUsuarioInterface,
  ActnList,
  Usuario,
  Dialogs,
  ControladorTelaAlterarSenhaInterface,
  Unixpass;

type
  TControladorTelaAlterarSenha = class(TInterfacedObject, IControladorTelaAlterarSenha)
  private
    FTelaAlterarSenha: TTelaAlterarSenha;
    uControladorUsuario: IControladorUsuario;
    uUsuario: TUsuario;
    AcaoSalvar: TAction;

    procedure MostrarTela;
    procedure FecharTela;
    procedure ConfiguracaoEventosBotoes;
    procedure AcaoBtnSalvar(Sender: TObject);

  public
    constructor Create(idUsuario: Integer) overload;
  end;


implementation

{ TControladorTelaAlterarSenha }

procedure TControladorTelaAlterarSenha.AcaoBtnSalvar(Sender: TObject);
var
  senhaCriptografada, erro: String;
begin
  senhaCriptografada := CreateInterbasePassword(FTelaAlterarSenha.txtNovaSenha.Text);
  uUsuario.Senha := senhaCriptografada;
  if uControladorUsuario.Alterar(uUsuario, erro) then
  begin
    ShowMessage('Senha modificada com sucesso!');
    FecharTela;
  end
  else
  begin
    ShowMessage('Não foi possível modificar a senha do usuário desejado.');
  end;
end;

procedure TControladorTelaAlterarSenha.ConfiguracaoEventosBotoes;
begin
  AcaoSalvar := TAction.Create(nil);
  AcaoSalvar.OnExecute := AcaoBtnSalvar;
  AcaoSalvar.Caption := 'Salvar';
  FTelaAlterarSenha.btnSalvar.Action := AcaoSalvar;
end;

constructor TControladorTelaAlterarSenha.Create(idUsuario: Integer);
begin
  FTelaAlterarSenha := TTelaAlterarSenha.Create(nil);
  uControladorUsuario := TControladorUsuario.Create;
  uUsuario := uControladorUsuario.CarregarPessoa(idUsuario);
  ConfiguracaoEventosBotoes;
  MostrarTela;
end;

procedure TControladorTelaAlterarSenha.FecharTela;
begin
  FTelaAlterarSenha.Close;
end;

procedure TControladorTelaAlterarSenha.MostrarTela;
begin
  FTelaAlterarSenha.ShowModal;
end;

end.
