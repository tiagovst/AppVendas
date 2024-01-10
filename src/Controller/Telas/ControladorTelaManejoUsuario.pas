unit ControladorTelaManejoUsuario;

interface

uses
  Vcl.ActnList,
  Vcl.Dialogs,
  ManejoUsuario.View,
  System.SysUtils,
  ControladorTelaManejoUsuarioInterface,
  ControladorUsuario,
  ControladorUsuarioInterface,
  Usuario,
  Vcl.Controls,
  Vcl.Forms;

type
  TControladorTelaManejoUsuario = class(TInterfacedObject, IControladorTelaManejoUsuario)
  private
    FManejoUsuario : TTelaManejoUsuario;
    uUsuario: TUsuario;
    uControladorUsuarioDAO: IControladorUsuario;
    CargoSelecionado: String;
    criacaoEdicao: Integer;

    AcaoBtnCancelar, AcaoBtnSalvar, AcaoRbAdm, AcaoRbGestor, AcaoRbVendedor: TAction;

    procedure AcaoBtnCancelarClick(Sender: TObject);
    procedure AcaoBtnSalvarClick(Sender: TObject);
    procedure AcaoBtnSalvarEdicaoClick(Sender: TObject);
    procedure AcaoRbAdmClick(Sender: TObject);
    procedure AcaoRbGestorClick(Sender: TObject);
    procedure AcaoRbVendedorClick(Sender: TObject);

    procedure MostrarTela;
    procedure FecharTela;
    procedure PreecherUsuario;
    procedure ConfiguracaoEventos;
  public
    constructor Create(Parent: TWinControl) overload;
    constructor Create(Usuario: TUsuario) overload;
    constructor Create overload;

  end;

implementation

{ TControladorTelaManejoUsuario }

procedure TControladorTelaManejoUsuario.AcaoBtnCancelarClick(Sender: TObject);
begin
  FecharTela;
end;

procedure TControladorTelaManejoUsuario.AcaoBtnSalvarClick(Sender: TObject);
var
  erro: String;
begin
  PreecherUsuario;

  if uControladorUsuarioDAO.Inserir(uUsuario, erro) then
  begin
    ShowMessage('Usuário cadastrado com sucesso!');
    FecharTela;
  end
  else
  begin
    ShowMessage('Não foi possível cadastrar o usuário.' + sLineBreak +
    'Verifique todos os campos e tente novamente!');
  end;

end;

procedure TControladorTelaManejoUsuario.AcaoBtnSalvarEdicaoClick(
  Sender: TObject);
var
  erro: String;
begin
  PreecherUsuario;

  if uControladorUsuarioDAO.Alterar(uUsuario, erro) then
  begin
    ShowMessage('Usuário alterado com sucesso!');
    FecharTela;
  end
  else
  begin
    ShowMessage('Não foi possível alterar o usuário.' + sLineBreak +
    'Verifique todos os campos e tente novamente!');
  end;

end;

procedure TControladorTelaManejoUsuario.AcaoRbAdmClick(Sender: TObject);
begin
  CargoSelecionado := AcaoRbAdm.Caption;
end;

procedure TControladorTelaManejoUsuario.AcaoRbGestorClick(Sender: TObject);
begin
  CargoSelecionado := AcaoRbGestor.Caption;
end;

procedure TControladorTelaManejoUsuario.AcaoRbVendedorClick(Sender: TObject);
begin
  CargoSelecionado := AcaoRbVendedor.Caption;
end;

procedure TControladorTelaManejoUsuario.ConfiguracaoEventos;
begin
  with FManejoUsuario do
  begin
    AcaoBtnCancelar := TAction.Create(nil);
    AcaoBtnCancelar.Caption := 'Cancelar';
    AcaoBtnCancelar.OnExecute := AcaoBtnCancelarClick;
    BtnCancelar.Action := AcaoBtnCancelar;

    AcaoBtnSalvar := TAction.Create(nil);
    AcaoBtnSalvar.Caption := 'Salvar';
    if criacaoEdicao = 1 then
    begin
      AcaoBtnSalvar.OnExecute := AcaoBtnSalvarEdicaoClick;
    end
    else
    begin
      AcaoBtnSalvar.OnExecute := AcaoBtnSalvarClick;
    end;
    BtnSalvar.Action := AcaoBtnSalvar;

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

constructor TControladorTelaManejoUsuario.Create;
begin
  uControladorUsuarioDAO := TControladorUsuario.Create;

  FManejoUsuario := TTelaManejoUsuario.Create(nil);

  FManejoUsuario.BorderStyle := bsSingle;
  ConfiguracaoEventos;
  MostrarTela;
end;

constructor TControladorTelaManejoUsuario.Create(Usuario: TUsuario);
begin
  uControladorUsuarioDAO := TControladorUsuario.Create;
  criacaoEdicao := 1;

  FManejoUsuario := TTelaManejoUsuario.Create(nil);
  FManejoUsuario.BorderStyle := bsSingle;

  ConfiguracaoEventos;

  with FManejoUsuario, Usuario do
  begin
    lblNome.Text := Nome;
    lblEmail.Text := Email;
    lblSenha.Text := Senha;
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
  MostrarTela;
end;

constructor TControladorTelaManejoUsuario.Create(Parent: TWinControl);
begin
  uControladorUsuarioDAO := TControladorUsuario.Create;

  FManejoUsuario := TTelaManejoUsuario.Create(nil);
  FManejoUsuario.Parent := Parent;
  FManejoUsuario.Align := AlClient;

  ConfiguracaoEventos;

  MostrarTela;
end;

procedure TControladorTelaManejoUsuario.FecharTela;
begin
  FManejoUsuario.Close;
end;

procedure TControladorTelaManejoUsuario.MostrarTela;
begin
  FManejoUsuario.Show;
end;

procedure TControladorTelaManejoUsuario.PreecherUsuario;
begin
  uUsuario := TUsuario.Create;
  with FManejoUsuario, uUsuario do
  begin
    Nome := lblNome.Text;
    CPF := lblCPF.Text;
    Email := lblEmail.Text;
    Senha := lblSenha.Text;
    Cargo := CargoSelecionado;
    Telefone := lblTelefone.Text;
    NomeUsuario := lblUsuario.Text;

    if criacaoEdicao = 1 then
    begin
      ID := StrToInt(txtID.Text);
    end
    else
    begin
      ID := uControladorUsuarioDAO.gerarID;
    end;

  end;
end;

end.
