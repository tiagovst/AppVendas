unit ControladorTelaEditarUsuario;

interface

uses
  System.SysUtils,
  EditarUsuario.View,
  Dialogs,
  VCL.Controls,
  VCL.Forms,
  VCL.ActnList,
  ControladorUsuario,
  ControladorUsuarioInterface,
  ControladorTelaEditarUsuarioInterface,
  Usuario,
  ControladorTelaAlterarSenhaInterface,
  ControladorTelaAlterarSenha;

type
  TControladorTelaEditarUsuario = class(TInterfacedObject, IControladorTelaEditarUsuario)
  private
    FTelaEditarUsuario : TTelaEditarUsuario;
    uControladorUsuarioDAO : IControladorUsuario;
    uUsuario : TUsuario;
    CargoSelecionado : String;

    AcaoBtnCancelar, AcaoBtnSalvar, AcaoBtnAlterarSenha, AcaoRbAdm,
    AcaoRbVendedor, AcaoRbGestor: TAction;

    procedure AcaoBtnCancelarClick(Sender: TObject);
    procedure AcaoBtnSalvarClick(Sender: TObject);
    procedure AcaoBtnAlterarSenhaClick(Sender: TObject);
    procedure AcaoRbAdmClick(Sender: TObject);
    procedure AcaoRbGestorClick(Sender: TObject);
    procedure AcaoRbVendedorClick(Sender: TObject);
    procedure ConfigurarEventos;
    procedure PreencherUsuario;

  public
    constructor Create(Usuario: TUsuario);

  end;

implementation

{ TControladorTelaEditarUsuario }

procedure TControladorTelaEditarUsuario.AcaoBtnAlterarSenhaClick(
  Sender: TObject);
var
  uControladorTelaAlterarSenha: IControladorTelaAlterarSenha;
begin
  try
    FTelaEditarUsuario.Hide;
    uControladorTelaAlterarSenha := TControladorTelaAlterarSenha.Create(uUsuario.ID);
  finally
    FTelaEditarUsuario.Show;
  end;
end;

procedure TControladorTelaEditarUsuario.AcaoRbAdmClick(Sender: TObject);
begin
  CargoSelecionado := AcaoRbAdm.Caption;
end;

procedure TControladorTelaEditarUsuario.AcaoRbGestorClick(Sender: TObject);
begin
  CargoSelecionado := AcaoRbGestor.Caption;
end;

procedure TControladorTelaEditarUsuario.AcaoRbVendedorClick(Sender: TObject);
begin
  CargoSelecionado := AcaoRbVendedor.Caption;
end;

procedure TControladorTelaEditarUsuario.AcaoBtnCancelarClick(Sender: TObject);
begin
  FTelaEditarUsuario.Close;
end;

procedure TControladorTelaEditarUsuario.AcaoBtnSalvarClick(Sender: TObject);
var
  erro: String;
begin
  PreencherUsuario;

  if uControladorUsuarioDAO.Alterar(uUsuario, erro) then
  begin
    ShowMessage('Usuário alterado com sucesso!');
    FTelaEditarUsuario.Close;
  end
  else
  begin
    ShowMessage('Não foi possível alterar o usuário.' + sLineBreak +
    'Verifique todos os campos e tente novamente!');
  end;
end;

procedure TControladorTelaEditarUsuario.ConfigurarEventos;
begin
  with FTelaEditarUsuario do
  begin
    AcaoBtnCancelar := TAction.Create(nil);
    AcaoBtnCancelar.Caption := 'Cancelar';
    AcaoBtnCancelar.OnExecute := AcaoBtnCancelarClick;
    FTelaEditarUsuario.btnCancelar.Action := AcaoBtnCancelar;

    AcaoBtnSalvar := TAction.Create(nil);
    AcaoBtnSalvar.Caption := 'Salvar';
    AcaoBtnSalvar.OnExecute := AcaoBtnSalvarClick;
    FTelaEditarUsuario.btnSalvar.Action := AcaoBtnSalvar;

    AcaoBtnAlterarSenha := TAction.Create(nil);
    AcaoBtnAlterarSenha.Caption := 'Alterar senha';
    AcaoBtnAlterarSenha.OnExecute := AcaoBtnAlterarSenhaClick;
    FTelaEditarUsuario.btnAlterarSenha.Action := AcaoBtnAlterarSenha;

    AcaoRbAdm := TAction.Create(nil);
    AcaoRbAdm.Caption := 'Administrador';
    AcaoRbAdm.OnExecute := AcaoRbAdmClick;
    rbAdm.Action := AcaoRbAdm;

    AcaoRbGestor := TAction.Create(nil);
    AcaoRbGestor.Caption := 'Gestor de Estoque';
    AcaoRbGestor.OnExecute := AcaoRbGestorClick;
    rbGestor.Action := AcaoRbGestor;

    AcaoRbVendedor := TAction.Create(nil);
    AcaoRbVendedor.Caption := 'Vendedor';
    AcaoRbVendedor.OnExecute := AcaoRbVendedorClick;
    rbVendedor.Action := AcaoRbVendedor;
    rbVendedor.Checked := True;
  end;
end;

constructor TControladorTelaEditarUsuario.Create(Usuario: TUsuario);
begin
  uUsuario := Usuario;
  uControladorUsuarioDAO := TControladorUsuario.Create;

  FTelaEditarUsuario := TTelaEditarUsuario.Create(nil);
  FTelaEditarUsuario.BorderStyle := bsSingle;

  ConfigurarEventos;

  with FTelaEditarUsuario, Usuario do
  begin
    lblNome.Text := Nome;
    lblEmail.Text := Email;
    lblUsuario.Text := NomeUsuario;
    lblTelefone.Text := Telefone;
    lblCPF.Text := CPF;
    txtID.Text := ID.ToString;

    if Cargo.Equals('Administrador') then
    begin
      rbAdm.Checked := True;
    end
    else if Cargo.Equals('Vendedor') then
    begin
      rbVendedor.Checked := True;
    end
    else if Cargo.Equals('Gestor de Estoque') then
    begin
      rbGestor.Checked := True;
    end;
  end;
  FTelaEditarUsuario.ShowModal;
end;

procedure TControladorTelaEditarUsuario.PreencherUsuario;
begin
  with FTelaEditarUsuario, uUsuario do
  begin
    Nome := lblNome.Text;
    CPF := lblCPF.Text;
    Email := lblEmail.Text;
    Cargo := CargoSelecionado;
    Telefone := lblTelefone.Text;
    NomeUsuario := lblUsuario.Text;
    ID := StrToInt(txtID.Text);
  end;
end;

end.
