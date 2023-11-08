unit ProdutoDAO;

interface

uses
  System.SysUtils,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  Conexao,
  ProdutoDAOInterface,
  Produto;

type
  TProdutoDAO = class(TInterfacedObject, IProdutoDAO)
    SQLQuery: TFDQuery;

  private
    function gerarID: Integer;
    function Inserir(Produto: TProduto; out erro: String): Boolean;
    function Alterar(Produto: TProduto; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;

    procedure PesquisarNome(Nome: String);
    procedure PesquisarCategoria(Categoria: String);
    procedure Pesquisar;
    procedure CarregarProduto(Produto: TProduto; ID: Integer);

  end;

var
  uProdutoDAO: TProdutoDAO;

implementation

{ TProdutoDAO }

function TProdutoDAO.Alterar(Produto: TProduto; out erro: String): Boolean;
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery, Produto do
  begin
    Connection := dmConexao.FDConnection;

    SQL.Text := 'update PRODUTOS set NOME = :NOME, CODIGO_BARRAS = :CODIGO_BARRAS, ' +
    'DESCRICAO = :DESCRICAO, REFERENCIA = :REFERENCIA, PRECO = :PRECO, ' +
    'CATEGORIA = :CATEGORIA, QUANTIDADE_ESTOQUE = :QUANTIDADE_ESTOQUE, ' +
    'FORNECEDOR = :FORNECEDOR, DATA_VALIDADE = :DATA_VALIDADE where (ID = :ID)';

    Params.ParamByName('ID').AsInteger := ID;
    Params.ParamByName('NOME').AsString := Nome;
    Params.ParamByName('CODIGO_BARRAS').AsString := CodigoBarras;
    Params.ParamByName('DESCRICAO').AsString := Descricao;
    Params.ParamByName('REFERENCIA').AsString := Referencia;
    Params.ParamByName('PRECO').AsFloat := Preco;
    Params.ParamByName('CATEGORIA').AsString := Categoria;
    Params.ParamByName('QUANTIDADE_ESTOQUE').AsInteger := QuantidadeEstoque;
    Params.ParamByName('FORNECEDOR').AsString := Fornecedor;
    Params.ParamByName('DATA_VALIDADE').AsDateTime := DataValidade;

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

procedure TProdutoDAO.CarregarProduto(Produto: TProduto; ID: Integer);
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery, Produto do
  begin
    try
      Connection := dmConexao.FDConnection;

      SQL.Text := 'SELECT * FROM Produtos WHERE (ID = :ID)';

      Params.ParamByName('ID').AsInteger := ID;
      Open();

      ID := FieldByName('ID').AsInteger;
      Nome := FieldByName('NOME').AsString;
      CodigoBarras := FieldByName('CODIGO_BARRAS').AsString;
      Descricao := FieldByName('DESCRICAO').AsString;
      Referencia := FieldByName('REFERENCIA').AsString;
      Preco := FieldByName('Preco').AsFloat;
      Categoria := FieldByName('Categoria').AsString;
      QuantidadeEstoque := FieldByName('QuantidadeEstoque').AsInteger;
      Fornecedor := FieldByName('Fornecedor').AsString;
      DataValidade := FieldByName('DataValidade').AsDateTime;

    finally
      FreeAndNil(SQLQuery);
    end;
  end;
end;

function TProdutoDAO.Excluir(ID: Integer; out erro: String): Boolean;
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery do
  begin
    Connection := dmConexao.FDConnection;

    SQL.Text := 'DELETE FROM PRODUTOS WHERE (ID : :ID);';
    Params.ParamByName('ID').AsInteger := ID;

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

function TProdutoDAO.gerarID: Integer;
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery do
  begin
    try
      Connection := dmConexao.FDConnection;
      SQL.Text := 'SELECT COALESCE(MAX(ID), 0) + 1 AS NEXT_ID FROM PRODUTOS;';
      Open();

      Result := FieldByName('NEXT_ID').AsInteger;

    finally
      FreeAndNil(SQLQuery);
    end;
  end;
end;

function TProdutoDAO.Inserir(Produto: TProduto; out erro: String): Boolean;
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery, Produto do
  begin
    Connection := dmConexao.FDConnection;

    SQL.Text := 'insert into PRODUTOS (ID, NOME, CODIGO_BARRAS, DESCRICAO, REFERENCIA, '+
    'PRECO, CATEGORIA, QUANTIDADE_ESTOQUE, FORNECEDOR, DATA_VALIDADE) values (' +
    ':ID, :NOME, :CODIGO_BARRAS, :DESCRICAO, :REFERENCIA, :PRECO, :CATEGORIA, ' +
    ':QUANTIDADE_ESTOQUE, :FORNECEDOR, :DATA_VALIDADE)';

    Params.ParamByName('ID').AsInteger := ID;
    Params.ParamByName('NOME').AsString := Nome;
    Params.ParamByName('CODIGO_BARRAS').AsString := CodigoBarras;
    Params.ParamByName('DESCRICAO').AsString := Descricao;
    Params.ParamByName('REFERENCIA').AsString := Referencia;
    Params.ParamByName('PRECO').AsFloat := Preco;
    Params.ParamByName('CATEGORIA').AsString := Categoria;
    Params.ParamByName('QUANTIDADE_ESTOQUE').AsInteger := QuantidadeEstoque;
    Params.ParamByName('FORNECEDOR').AsString := Fornecedor;
    Params.ParamByName('DATA_VALIDADE').AsDateTime := DataValidade;

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

procedure TProdutoDAO.Pesquisar;
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery do
  begin
    Connection := dmConexao.FDConnection;

    SQL.Text := 'SELECT * FROM USUARIO;';
    Open();
  end;

  FreeAndNil(SQLQuery);
end;

procedure TProdutoDAO.PesquisarCategoria(Categoria: String);
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery do
  begin
    Connection := dmConexao.FDConnection;
    SQL.Text := 'SELECT * FROM PRODUTOS WHERE CATEGORIA LIKE :Categoria;';
    Params.ParamByName('Categoria').AsString := Categoria + '%';

    Open();
    First;
  end;

  FreeAndNil(SQLQuery);
end;

procedure TProdutoDAO.PesquisarNome(Nome: String);
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery do
  begin
    Connection := dmConexao.FDConnection;

    SQL.Text := 'SELECT * FROM PRODUTOS WHERE NOME LIKE :Nome;';
    Params.ParamByName('Nome').AsString := Nome + '%';

    Open();
    First;
  end;

  FreeAndNil(SQLQuery);
end;

end.
