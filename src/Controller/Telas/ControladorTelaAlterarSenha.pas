unit ControladorTelaAlterarSenha;

interface

uses
  SysUtils,
  AlterarSenha.View,
  ControladorUsuario,
  ControladorUsuarioInterface,
  ActnList,
  Usuario,
  Unixpass;

type
  TControladorTelaAlterarSenha = class
  private
    FTelaAlterarSenha: TTelaAlterarSenha;
    uControladorUsuario: IControladorUsuario;
    uUsuario: TUsuario;
    AcaoSalvar: TAction;

  public
    procedure MostrarTela;
    procedure FecharTela;
    procedure ConfiguracaoEventosBotoes;
    procedure AcaoBtnSalvar(Sender: TObject);
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
  uControladorUsuario.Alterar(uUsuario, erro);
end;

procedure TControladorTelaAlterarSenha.ConfiguracaoEventosBotoes;
begin
  AcaoSalvar := TAction.Create(nil);
  AcaoSalvar.OnExecute := AcaoBtnSalvar;
  AcaoSalvar.Caption := 'Salvar';
end;

constructor TControladorTelaAlterarSenha.Create(idUsuario: Integer);
begin
  uControladorUsuario := TControladorUsuario.Create;
  uUsuario := uControladorUsuario.CarregarPessoa(idUsuario);
  ConfiguracaoEventosBotoes;
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
