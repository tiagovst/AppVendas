unit ControladorTelaListagemClientes;

interface

uses
  System.SysUtils,
  ListagemClientes.View,
  ControladorTelaListagemClientesInterface,
  ControladorClienteDAO,
  ControladorClienteDAOInterface,
  StdVCL,
  Vcl.Controls,
  Vcl.Dialogs,
  ActnList,
  ControladorTelaManejoCliente,
  ControladorTelaManejoClienteInterface,
  Cliente,
  Data.DB;

type
  TControladorTelaListagemClientes = class(TInterfacedObject, IControladorTelaListagemClientes)
  private
    FTelaListagemClientes : TTelaListagemClientes;
    uControladorClienteDAO : IControladorClienteDAO;
    uControladorTelaManejoCliente : IControladorTelaManejoCliente;
    AcaoBtnNovoCliente, AcaoBtnEditar, AcaoBtnExcluir : TAction;

    procedure FecharTela;

    procedure ConfigurarEventosBotoes;
    procedure AcaoBtnExcluirClick(Sender : TObject);
    procedure AcaoBtnEditarClick(Sender : TObject);
    procedure AcaoBtnNovoClienteClick(Sender : TObject);

    function FormatarIdentificador(cpf: string): string;

  public
    constructor Create(Parent : TWinControl);
  end;

implementation

{ TControladorTelaListagemClientes }

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
var
  Cliente: TCliente;
begin
  Cliente := TCliente.Create;
  with FTelaListagemClientes.DataSourceClientes.DataSet, Cliente do
  begin
    Nome := FieldByName('NOME').AsString;
    Endereco := FieldByName('ENDERECO').AsString;
    Telefone := FieldByName('TELEFONE').AsString;
    Identificador := FormatarIdentificador(FieldByName('IDENTIFICADOR').AsString);
  end;

  uControladorTelaManejoCliente := TControladorTelaManejoCliente.Create(Cliente);

  FreeAndNil(Cliente);
end;

procedure TControladorTelaListagemClientes.AcaoBtnExcluirClick(Sender : TObject);
var
  erro: String;
  idCliente : String;
  confirmacaoExclusao: Integer;
begin

  confirmacaoExclusao := MessageDlg('Deseja realmente excluir o cliente?', mtConfirmation, mbYesNo, 0);

  if confirmacaoExclusao = mrYes then
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

end;

procedure TControladorTelaListagemClientes.AcaoBtnNovoClienteClick(Sender : TObject);
begin
  uControladorTelaManejoCliente := TControladorTelaManejoCliente.Create;
end;

procedure TControladorTelaListagemClientes.FecharTela;
begin
  FTelaListagemClientes.Close;
end;

function TControladorTelaListagemClientes.FormatarIdentificador(cpf: string): string;
begin
  Result := StringReplace(cpf, '.', '', [rfReplaceAll]);
  Result := StringReplace(Result, '/', '', [rfReplaceAll]);
  Result := StringReplace(Result, '-', '', [rfReplaceAll]);
end;

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

end.
