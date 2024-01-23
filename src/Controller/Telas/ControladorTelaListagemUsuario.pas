unit ControladorTelaListagemUsuario;

interface

uses
  ListagemUsuario.View,
  System.SysUtils,
  ControladorTelaListagemUsuarioInterface,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.ActnList,
  System.UITypes,
  Usuario,
  ControladorTelaManejoUsuario,
  ControladorTelaManejoUsuarioInterface,
  ControladorUsuario,
  ControladorUsuarioInterface,
  ControladorTelaEditarUsuarioInterface,
  ControladorTelaEditarUsuario;

type
  TControladorTelaListagemUsuario = class(TInterfacedObject, IControladorTelaListagemUsuario)
  private
    FListagemUsuario : TTelaListagemUsuario;
    uControladorTelaManejoUsuario: IControladorTelaManejoUsuario;
    uControladorUsuarioDAO: IControladorUsuario;

    AcaoBtnExcluir, AcaoBtnEditar, AcaoBtnNovoUsuario: TAction;

    procedure AcaoBtnExcluirClick(Sender: TObject);
    procedure AcaoBtnEditarClick(Sender: TObject);
    procedure AcaoBtnNovoUsuarioClick(Sender: TObject);

    procedure ConfigurarEventosBotoes;
    procedure MostrarTela;
    procedure FecharTela;
  public
    constructor Create(Parent: TWinControl);
  end;

implementation

{ TControladorTelaManejoUsuario }

procedure TControladorTelaListagemUsuario.AcaoBtnEditarClick(Sender: TObject);
var
  uControladorTelaEditarUsuario: IControladorTelaEditarUsuario;
  uUsuario: TUsuario;
  IDUsuarioSelecionado : Integer;
begin
  uUsuario := TUsuario.Create;

  with FListagemUsuario do
  begin
    IDUsuarioSelecionado := FListagemUsuario.gridProdutos.DataSource.DataSet.FieldByName('ID').AsInteger;

    uUsuario := uControladorUsuarioDAO.CarregarPessoa(IDUsuarioSelecionado);
  end;

  uControladorTelaEditarUsuario := TControladorTelaEditarUsuario.Create(uUsuario);
end;

procedure TControladorTelaListagemUsuario.AcaoBtnExcluirClick(Sender: TObject);
var
  IDUsuarioSelecionado, ConfirmarExclusao: Integer;
  erro: String;
begin
  IDUsuarioSelecionado := FListagemUsuario.gridProdutos.DataSource.DataSet.FieldByName('ID').AsInteger;

  ConfirmarExclusao := MessageDlg('Deseja realmente excluir este usuário?', mtConfirmation, mbYesNo, 0);

  if ConfirmarExclusao = mrYes then
  begin
    if uControladorUsuarioDAO.Excluir(IDUsuarioSelecionado, erro) then
    begin
      ShowMessage('Usuário excluído com sucesso!');
    end
    else
    begin
      ShowMessage('Ocorreu um erro ao tentar excluir o usuário selecionado' + erro);
    end;
  end;

  FListagemUsuario.dsUsuario.DataSet.Refresh;
end;

procedure TControladorTelaListagemUsuario.AcaoBtnNovoUsuarioClick(
  Sender: TObject);
begin
  uControladorTelaManejoUsuario := TControladorTelaManejoUsuario.Create;
end;

procedure TControladorTelaListagemUsuario.ConfigurarEventosBotoes;
begin
  with FListagemUsuario do
  begin
    AcaoBtnExcluir := TAction.Create(nil);
    AcaoBtnExcluir.Caption := 'Excluir';
    AcaoBtnExcluir.OnExecute := AcaoBtnExcluirClick;
    btnExcluir.Action := AcaoBtnExcluir;

    AcaoBtnEditar := TAction.Create(nil);
    AcaoBtnEditar.Caption := 'Editar';
    AcaoBtnEditar.OnExecute := AcaoBtnEditarClick;
    btnEditar.Action := AcaoBtnEditar;

    AcaoBtnNovoUsuario := TAction.Create(nil);
    AcaoBtnNovoUsuario.Caption := 'Novo usuário';
    AcaoBtnNovoUsuario.OnExecute := AcaoBtnNovoUsuarioClick;
    btnNovo.Action := AcaoBtnNovoUsuario;
  end;

end;

constructor TControladorTelaListagemUsuario.Create(Parent: TWinControl);
begin
  uControladorUsuarioDAO := TControladorUsuario.Create;

  FListagemUsuario := TTelaListagemUsuario.Create(nil);
  FListagemUsuario.Parent := Parent;
  FListagemUsuario.Align := AlClient;

  ConfigurarEventosBotoes;
  MostrarTela;
end;

procedure TControladorTelaListagemUsuario.FecharTela;
begin
  FListagemUsuario.Close;
end;

procedure TControladorTelaListagemUsuario.MostrarTela;
begin
  FListagemUsuario.Show;
end;

end.
