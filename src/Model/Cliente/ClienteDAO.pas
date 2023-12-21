unit ClienteDAO;

interface

uses
  System.SysUtils,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.Stan.Factory,
  FireDAC.DApt,
  ConexaoIniciar,
  ProdutoDAOInterface,
  Data.DB, Vcl.Dialogs,
  Cliente,
  ClienteDAOInterface;

type
  TClienteDAO = class(TInterfacedObject, IClienteDAO)
  private
    SQLQuery: TFDQuery;

    function Inserir(Cliente: TCliente; out erro: String): Boolean;
    function Alterar(Cliente: TCliente; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;
    function CarregarCliente(IDCliente: Integer): TCliente;

    procedure PesquisarNome(Nome: String);
    procedure AtualizarListaClientes(DataSource: TDataSource);
  end;

implementation

{ TClienteDAO }

function TClienteDAO.Alterar(Cliente: TCliente; out erro: String): Boolean;
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery, Cliente do
  begin
    Connection := TConexaoIniciar.varConexao.FDConnection;

    SQL.Text := 'update cliente set nome = :nome, endereco = :endereco, telefone = :telefone' +
      'where (identificador = :identificador)';

    Params.ParamByName('identificador').AsString := Identificador;
    Params.ParamByName('nome').AsString := Nome;
    Params.ParamByName('endereco').AsString := Endereco;
    Params.ParamByName('telefone').AsString := Telefone;

    try
      ExecSQL();
      Result := True;

    except on E: Exception do
    begin
      erro := 'Ocorreu um erro ao tentar alterar os dados' + sLineBreak + E.Message;
      Result := False;
    end;
    end;
  end;

  FreeAndNil(SQLQuery);
end;

procedure TClienteDAO.AtualizarListaClientes(DataSource: TDataSource);
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery do
  begin
    Connection := TConexaoIniciar.varConexao.FDConnection;

    SQL.Text := 'SELECT * FROM CLIENTE;';
    Open();
  end;

  DataSource.DataSet := SQLQuery;
end;

function TClienteDAO.CarregarCliente(IDCliente: Integer): TCliente;
var
  NovoCliente : TCliente;
begin
  SQLQuery := TFDQuery.Create(nil);
  NovoCliente := TCliente.Create;

  with SQLQuery, NovoCliente do
  begin
    try
      Connection := TConexaoIniciar.varConexao.FDConnection;

      SQL.Text := 'select * from CLIENTE where (identificador = :identificador)';

      Params.ParamByName('identificador').AsInteger := IDCliente;
      Open();

      Identificador := FieldByName('identificador').AsString;
      Nome := FieldByName('NOME').AsString;
      Endereco := FieldByName('endereco').AsString;
      Telefone := FieldByName('telefone').AsString;

    finally
      Result := NovoCliente;
      FreeAndNil(SQLQuery);
    end;
  end;
end;

function TClienteDAO.Excluir(ID: Integer; out erro: String): Boolean;
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery do
  begin
    Connection := TConexaoIniciar.varConexao.FDConnection;

    SQL.Text := 'delete from cliente where (identificador = :identificador)';
    Params.ParamByName('identificador').AsInteger := ID;

    try
      ExecSQL();
      Result := True;

    except on E: Exception do
    begin
      erro := 'Ocorreu um erro ao tentar excluir o elemento: ' + sLineBreak + E.Message;
      Result := False;
    end;
    end;
  end;
end;

function TClienteDAO.Inserir(Cliente: TCliente; out erro: String): Boolean;
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery, Cliente do
  begin
    Connection := TConexaoIniciar.varConexao.FDConnection;

    SQL.Text := 'update or insert into cliente (identificador, nome, endereco, telefone)' +
    'values (:identificador, :nome, :endereco, :telefone) matching (identificador)';

    Params.ParamByName('identificador').AsString := Identificador;
    Params.ParamByName('nome').AsString := Nome;
    Params.ParamByName('endereco').AsString := Endereco;
    Params.ParamByName('telefone').AsString := Telefone;

    try
      ExecSQL;
      Result := True;

      except on E: Exception do
      begin
        erro := 'Ocorreu um erro ao tentar persistir' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
  end;
end;

procedure TClienteDAO.PesquisarNome(Nome: String);
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery do
  begin
    Connection := TConexaoIniciar.varConexao.FDConnection;

    SQL.Text := 'SELECT * FROM CLIENTE WHERE NOME LIKE :Nome;';
    Params.ParamByName('Nome').AsString := Nome + '%';

    Open();
    First;
  end;

  FreeAndNil(SQLQuery);
end;

end.
