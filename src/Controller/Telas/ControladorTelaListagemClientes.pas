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
  Data.DB,
  SessaoUsuario,
  System.UITypes;

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
    procedure AcaoSearchBoxNome(Sender: TObject);
    procedure ControlePermissao;

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

  ControlePermissao;

  FTelaListagemClientes.Parent := Parent;
  FTelaListagemClientes.Align := alClient;
  FTelaListagemClientes.Show;
end;

procedure TControladorTelaListagemClientes.AcaoBtnEditarClick(Sender : TObject);
var
  Cliente: TCliente;
  IdentificadorClienteSelecionado: String;
begin
  try
    Cliente := TCliente.Create;
    IdentificadorClienteSelecionado := FTelaListagemClientes.DataSourceClientes.
    DataSet.FieldByName('IDENTIFICADOR').AsString;

    Cliente := uControladorClienteDAO.CarregarCliente(IdentificadorClienteSelecionado);

    Cliente.Identificador := FormatarIdentificador(Cliente.Identificador);
    uControladorTelaManejoCliente := TControladorTelaManejoCliente.Create(Cliente);


  finally
    FTelaListagemClientes.gridClientes.DataSource.DataSet.Refresh;
    FreeAndNil(Cliente);
  end;
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
      ShowMessage('Não foi possível excluir o cliente selecionado.' +sLineBreak +
      'O cliente possui compras registradas.');
    end;
  end;

end;

procedure TControladorTelaListagemClientes.AcaoBtnNovoClienteClick(Sender : TObject);
begin
  try
    uControladorTelaManejoCliente := TControladorTelaManejoCliente.Create;
  finally
    FTelaListagemClientes.gridClientes.DataSource.DataSet.Refresh;
  end;
end;

procedure TControladorTelaListagemClientes.AcaoSearchBoxNome(Sender: TObject);
var
  nome: String;
begin
  nome := FTelaListagemClientes.searchBoxCliente.Text;
  uControladorClienteDAO.PesquisarNome(nome, FTelaListagemClientes.DataSourceClientes);
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

  FTelaListagemClientes.searchBoxCliente.OnChange := AcaoSearchBoxNome;
  FTelaListagemClientes.btnNovo.Action := AcaoBtnNovoCliente;
  FTelaListagemClientes.btnEditar.Action := AcaoBtnEditar;
  FTelaListagemClientes.btnExcluir.Action := AcaoBtnExcluir;
end;

procedure TControladorTelaListagemClientes.ControlePermissao;
begin
  if SessaoUsuario.TSessaoUsuario.cargo.Equals('Vendedor') then
  begin
    FTelaListagemClientes.btnExcluir.Enabled := False;
  end;
end;

end.
