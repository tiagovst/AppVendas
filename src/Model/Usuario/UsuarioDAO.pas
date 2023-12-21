unit UsuarioDAO;

interface

uses
  System.SysUtils,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  Usuario,
  ConexaoIniciar,
  Data.DB,
  UsuarioDAOInterface;

type
  TUsuarioDAO = class(TInterfacedObject, IUsuarioDAO)
    SQLQuery: TFDQuery;

  public
    function gerarID: Integer;
    function Inserir(Usuario: TUsuario; out erro: String): Boolean;
    function Alterar(Usuario: TUsuario; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;

    procedure PesquisarNomeUsuario(Usuario: TUsuario; NomeDeUsuario: String);
    procedure Pesquisar(DataSource: TDataSource);
    procedure CarregarPessoa(Usuario: TUsuario; ID: Integer);
  end;

var
  uUsuarioDAO: TUsuarioDAO;

implementation

{ TUsuarioDAO }

function TUsuarioDAO.Alterar(Usuario: TUsuario; out erro: String): Boolean;
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery, Usuario do
  begin
    Connection := TConexaoIniciar.varConexao.FDConnection;

    SQL.Text := 'update USUARIO set NOME = :NOME, EMAIL = :EMAIL, SENHA = :SENHA, ' +
    'TELEFONE = :TELEFONE, CPF = :CPF, CARGO = :CARGO, NOME_USUARIO = :NOME_USUARIO where (ID = :ID)';

    Params.ParamByName('ID').AsInteger := ID;
    Params.ParamByName('Nome').AsString := Nome;
    Params.ParamByName('email').AsString := Email;
    Params.ParamByName('senha').AsString := Senha;
    Params.ParamByName('cpf').AsString := CPF;
    Params.ParamByName('telefone').AsString := Telefone;
    Params.ParamByName('nome_usuario').AsString := NomeUsuario;
    Params.ParamByName('cargo').AsString := Cargo;

    try
      ExecSQL();
      Result := True;

    except on E: Exception do
      begin
        erro := 'Ocorreu um erro ao tentar persistir: ' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
  end;
end;

procedure TUsuarioDAO.CarregarPessoa(Usuario: TUsuario; ID: Integer);
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery, Usuario do
  begin
    try
      Connection := TConexaoIniciar.varConexao.FDConnection;

      SQL.Text := 'select * from usuario where (id = :id);';

      Params.ParamByName('ID').AsInteger := id;
      Open();

      ID := FieldByName('id').AsInteger;
      Nome := FieldByName('NOME').AsString;
      Email := FieldByName('EMAIL').AsString;
      Senha := FieldByName('SENHA').AsString;
      Telefone := FieldByName('TELEFONE').AsString;
      Cargo := FieldByName('CARGO').AsString;
      CPF := FieldByName('CPF').AsString;
      NomeUsuario := FieldByName('NOME_USUARIO').AsString;

    finally
      FreeAndNil(SQLQuery);
    end;
  end;
end;

function TUsuarioDAO.Excluir(ID: Integer; out erro: String): Boolean;
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery do
  begin
    Connection := TConexaoIniciar.varConexao.FDConnection;

    SQL.Text := 'delete from USUARIO where (ID = :ID)';
    Params.ParamByName('ID').AsInteger := id;

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

function TUsuarioDAO.gerarID: Integer;
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery do
  begin
    try
      Connection := TConexaoIniciar.varConexao.FDConnection;

      SQL.Text := 'select coalesce(max(id), 0) + 1 as seq from usuario';
      Open();

      Result := FieldByName('seq').AsInteger;
    finally
      FreeAndNil(SQLQuery);
    end;
  end;
end;

function TUsuarioDAO.Inserir(Usuario: TUsuario; out erro: String): Boolean;
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery, Usuario do
  begin
    Connection := TConexaoIniciar.varConexao.FDConnection;

    SQL.Text := 'insert into USUARIO (ID, NOME, EMAIL, SENHA, TELEFONE, CPF, CARGO, NOME_USUARIO) ' +
    'values (:ID, :NOME, :EMAIL, :SENHA, :TELEFONE, :CPF, :CARGO, :NOME_USUARIO)';

    Params.ParamByName('ID').AsInteger := ID;
    Params.ParamByName('NOME').AsString := Nome;
    Params.ParamByName('EMAIL').AsString := Email;
    Params.ParamByName('SENHA').AsString := Senha;
    Params.ParamByName('CPF').AsString := CPF;
    Params.ParamByName('TELEFONE').AsString := Telefone;
    Params.ParamByName('NOME_USUARIO').AsString := NomeUsuario;
    Params.ParamByName('CARGO').AsString := Cargo;

    try
      ExecSQL;
      Result := True;

      except on E: Exception do
      begin
        Erro := 'Ocorreu um erro ao tentar persistir: ' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
  end;
end;

procedure TUsuarioDAO.Pesquisar(DataSource: TDataSource);
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery do
  begin
    Connection := TConexaoIniciar.varConexao.FDConnection;

    if Active then
      Close;

    SQL.Text := 'SELECT * FROM USUARIO';
    Open();
  end;

  DataSource.DataSet := SQLQuery;

end;

procedure TUsuarioDAO.PesquisarNomeUsuario(Usuario: TUsuario; NomeDeUsuario: String);
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery, Usuario do
  begin
    Connection := TConexaoIniciar.varConexao.FDConnection;

    if Active then
      Close;

    SQL.Text := 'select * from USUARIO where NOME_USUARIO = :NomeDeUsuario;';
    Params.ParamByName('NomeDeUsuario').AsString := NomeDeUsuario;

    Open();
    ID := FieldByName('id').AsInteger;
    Nome := FieldByName('NOME').AsString;
    Email := FieldByName('EMAIL').AsString;
    Senha := FieldByName('SENHA').AsString;
    Telefone := FieldByName('TELEFONE').AsString;
    Cargo := FieldByName('CARGO').AsString;
    CPF := FieldByName('CPF').AsString;
    NomeUsuario := FieldByName('NOME_USUARIO').AsString;

    FreeAndNil(SQLQuery);

  end;
end;

end.
