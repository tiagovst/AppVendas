unit ControladorTelaListagemClientes;

interface

uses
  System.SysUtils,
  ListagemClientes.View,
  ControladorTelaListagemClientesInterface,
  ControladorClienteDAO,
  ControladorClienteDAOInterface,
  Vcl.Controls,
  Vcl.Dialogs,
  ActnList,
  Data.DB;

type
  TControladorTelaListagemClientes = class(TInterfacedObject, IControladorTelaListagemClientes)
  private
    FTelaListagemClientes : TTelaListagemClientes;
    uControladorClienteDAO : IControladorClienteDAO;
    AcaoBtnNovoCliente, AcaoBtnEditar, AcaoBtnExcluir : TAction;

    procedure FecharTela;

    procedure ConfigurarEventosBotoes;
    procedure AcaoBtnExcluirClick(Sender : TObject);
    procedure AcaoBtnEditarClick(Sender : TObject);
    procedure AcaoBtnNovoClienteClick(Sender : TObject);

  public
    constructor Create(Parent : TWinControl);
  end;

implementation

{ TControladorTelaListagemClientes }

procedure TControladorTelaListagemClientes.ConfigurarEventosBotoes;
begin
  AcaoBtnNovoCliente := TAction.Create(nil);
  AcaoBtnEditar := TAction.Create(nil);
  AcaoBtnExcluir := TAction.Create(nil);

  AcaoBtnEditar.OnExecute := AcaoBtnEditarClick;
  AcaoBtnExcluir.OnExecute := AcaoBtnExcluirClick;
  AcaoBtnNovoCliente.OnExecute := AcaoBtnNovoClienteClick;

  AcaoBtnNovoCliente.Caption := 'Novo Cliente';
  AcaoBtnEditar.Caption := 'Editar';
  AcaoBtnExcluir.Caption := 'Excluir';

  FTelaListagemClientes.btnNovo.Action := AcaoBtnNovoCliente;
  FTelaListagemClientes.btnEditar.Action := AcaoBtnEditar;
  FTelaListagemClientes.btnExcluir.Action := AcaoBtnExcluir;
end;

constructor TControladorTelaListagemClientes.Create(Parent : TWinControl);
begin
  FTelaListagemClientes := TTelaListagemClientes.Create(nil);
  uControladorClienteDAO := TControladorClienteDAO.Create;
  ConfigurarEventosBotoes;

  uControladorClienteDAO.AtualizarListaClientes(FTelaListagemClientes.DataSourceClientes);

  FTelaListagemClientes.Parent := Parent;
  FTelaListagemClientes.Align := alClient;
  FTelaListagemClientes.Show;
end;

procedure TControladorTelaListagemClientes.AcaoBtnEditarClick(Sender : TObject);
begin
  //adicionar logica
end;

procedure TControladorTelaListagemClientes.AcaoBtnExcluirClick(Sender : TObject);
var
  erro: String;
  idCliente : String;
begin
  idCliente := FTelaListagemClientes.DataSourceClientes.DataSet.FieldByName('IDENTIFICADOR').AsString;
  if uControladorClienteDAO.Excluir(idCliente, erro) then
  begin
    ShowMessage('Cliente excluído com sucesso!');
    FTelaListagemClientes.gridClientes.DataSource.DataSet.Refresh;
  end
  else
  begin
    ShowMessage('Ocorreu um erro ao tentar excluir o cliente selecionado!' + sLineBreak + erro);
  end;

end;

procedure TControladorTelaListagemClientes.AcaoBtnNovoClienteClick(Sender : TObject);
begin
  //adicionar logica
end;

procedure TControladorTelaListagemClientes.FecharTela;
begin
  FTelaListagemClientes.Close;
end;

end.
