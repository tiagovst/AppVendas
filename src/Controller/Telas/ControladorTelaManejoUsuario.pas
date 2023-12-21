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
  Vcl.Controls;

type
  TControladorTelaManejoUsuario = class(TInterfacedObject, IControladorTelaManejoUsuario)
  private
    FManejoUsuario : TTelaManejoUsuario;
    uUsuario: TUsuario;
    uControladorUsuarioDAO: IControladorUsuario;
    CargoSelecionado: String;

    AcaoBtnCancelar, AcaoBtnSalvar, AcaoRbAdm, AcaoRbGestor, AcaoRbVendedor: TAction;

    procedure AcaoBtnCancelarClick(Sender: TObject);
    procedure AcaoBtnSalvarClick(Sender: TObject);
    procedure AcaoRbAdmClick(Sender: TObject);
    procedure AcaoRbGestorClick(Sender: TObject);
    procedure AcaoRbVendedorClick(Sender: TObject);

    procedure MostrarTela;
    procedure FecharTela;
    procedure PreecherUsuario;
    procedure ConfiguracaoEventos;
  public
    constructor Create(Parent: TWinControl);

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
  end
  else
  begin
    ShowMessage('Não foi possível cadastrar o usuário.' + sLineBreak +
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
    AcaoBtnSalvar.OnExecute := AcaoBtnSalvarClick;
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
    ID := uControladorUsuarioDAO.gerarID;
    Nome := lblNome.Text;
    CPF := lblCPF.Text;
    Email := lblEmail.Text;
    Senha := lblSenha.Text;
    Cargo := CargoSelecionado;
    Telefone := lblTelefone.Text;
    NomeUsuario := lblUsuario.Text;
  end;
end;

end.
