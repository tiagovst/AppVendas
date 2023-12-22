unit ProdutoDAO;

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
  Produto;

type
  TProdutoDAO = class(TInterfacedObject, IProdutoDAO)
    SQLQuery: TFDQuery;

  public
    function gerarID: Integer;
    function Inserir(Produto: TProduto; out erro: String): Boolean;
    function Alterar(Produto: TProduto; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;
    function CarregarProduto(IDProduto: Integer): TProduto;

    procedure PesquisarNome(Nome: String; DataSource: TDataSource);
    procedure PesquisarCategoria(Categoria: String; DataSource: TDataSource);
    procedure AtualizarListaProdutos(DataSource: TDataSource);

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
    Connection := TConexaoIniciar.varConexao.FDConnection;

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

function TProdutoDAO.CarregarProduto(IDProduto: Integer): TProduto;
var
  NovoProduto : TProduto;
begin
  SQLQuery := TFDQuery.Create(nil);
  NovoProduto := TProduto.Create;

  with SQLQuery, NovoProduto do
  begin
    try
      Connection := TConexaoIniciar.varConexao.FDConnection;

      SQL.Text := 'SELECT * FROM Produtos WHERE (ID = :ID)';

      Params.ParamByName('ID').AsInteger := IDProduto;
      Open();

      ID := FieldByName('ID').AsInteger;
      Nome := FieldByName('NOME').AsString;
      CodigoBarras := FieldByName('CODIGO_BARRAS').AsString;
      Descricao := FieldByName('DESCRICAO').AsString;
      Referencia := FieldByName('REFERENCIA').AsString;
      Preco := FieldByName('PRECO').AsFloat;
      Categoria := FieldByName('CATEGORIA').AsString;
      QuantidadeEstoque := FieldByName('QUANTIDADE_ESTOQUE').AsInteger;
      Fornecedor := FieldByName('FORNECEDOR').AsString;
      DataValidade := FieldByName('DATA_VALIDADE').AsDateTime;

    finally
      Result := NovoProduto;
      FreeAndNil(SQLQuery);
    end;
  end;
end;

function TProdutoDAO.Excluir(ID: Integer; out erro: String): Boolean;
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery do
  begin
    Connection := TConexaoIniciar.varConexao.FDConnection;

    SQL.Text := 'DELETE FROM PRODUTOS WHERE (ID = :ID);';
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
      Connection := TConexaoIniciar.varConexao.FDConnection;
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
    Connection := TConexaoIniciar.varConexao.FDConnection;

    SQL.Text := 'update or insert into produtos (id, nome, codigo_barras, descricao, ' +
    'referencia, preco, categoria, quantidade_estoque, fornecedor, data_validade) ' +
    'values (:id, :nome, :codigo_barras, :descricao, :referencia, :preco, :categoria, ' +
    ':quantidade_estoque, :fornecedor, :data_validade) matching (id);';

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

procedure TProdutoDAO.AtualizarListaProdutos(DataSource: TDataSource);
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery do
  begin
    Connection := TConexaoIniciar.varConexao.FDConnection;

    SQL.Text := 'SELECT * FROM PRODUTOS;';
    Open();
  end;

  DataSource.DataSet := SQLQuery;

end;

procedure TProdutoDAO.PesquisarCategoria(Categoria: String; DataSource: TDataSource);
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery do
  begin
    Connection := TConexaoIniciar.varConexao.FDConnection;
    SQL.Text := 'SELECT * FROM PRODUTOS WHERE CATEGORIA LIKE :Categoria;';
    Params.ParamByName('Categoria').AsString := Categoria + '%';

    Open();
  end;

  DataSource.DataSet := SQLQuery;
end;

procedure TProdutoDAO.PesquisarNome(Nome: String; DataSource: TDataSource);
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery do
  begin
    Connection := TConexaoIniciar.varConexao.FDConnection;

    SQL.Text := 'SELECT * FROM PRODUTOS WHERE NOME LIKE :Nome;';
    Params.ParamByName('Nome').AsString := Nome + '%';

    Open();
    First;
  end;

  DataSource.Dataset := SQLQuery;
end;

end.
