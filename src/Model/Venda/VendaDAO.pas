unit VendaDAO;

interface

uses
  Venda,
  VendaDAOInterface,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  System.SysUtils,
  Data.DB,
  ConexaoIniciar;

type
  TVendaDAO = class(TInterfacedObject, IVendaDAO)
    //campo de atributos
    SQLQuery : TFDQuery;

    private
      //funcoes de persistencia
      function gerarID: Integer;
      function Inserir(Venda: TVenda; out erro: String): Boolean;
      function Excluir(ID: Integer; out erro: String): Boolean;
    
      procedure PesquisarData(Data : TDate);
      procedure Pesquisar();
      procedure PesquisarVendedor(ID : Integer);
      procedure CarregarVenda(Venda: TVenda; ID: Integer);
      procedure AtualizarListaVendas(DataSource : TDataSource);
  end;

var
  uVendaDao : TVendaDAO;

implementation

{ TVendaDAO }

procedure TVendaDAO.AtualizarListaVendas(DataSource: TDataSource);
begin
  SQLQuery := TFDQuery.Create(nil);

  with SQLQuery do
  begin
    Connection := TConexaoIniciar.varConexao.FDConnection;

    SQL.Text := 'SELECT * FROM VENDA;';
    Open();
  end;

  DataSource.DataSet := SQLQuery;
end;

procedure TVendaDAO.CarregarVenda(Venda: TVenda; ID: Integer);
begin
  SQLQuery := TFDQuery.Create(nil);
  with SQLQuery, Venda do
  begin
    try
      Connection := TConexaoIniciar.varConexao.FDConnection;
      SQL.Text := 'SELECT * FROM VENDA WHERE (ID = :ID)';
      Params.ParamByName('ID').AsInteger := ID;
      Open();

      ID := FieldByName('ID').AsInteger;
      totalProdutos := FieldByName('TOTAL_PRODUTOS').AsInteger;
      totalPreco := FieldByName('TOTAL_PRECO').AsInteger;
      vendedor := FieldByName('VENDEDOR').AsInteger;
      dataVenda := FieldByName('DATA_VENDA').AsInteger;
      Desconto := FieldByName('Desconto').AsInteger;

    finally
      FreeAndNil(SQLQuery);
    end;
  end;
end;

function TVendaDAO.Excluir(ID: Integer; out erro: String): Boolean;
begin
  SQLQuery := TFDQuery.Create(nil);
  with SQLQuery do
  begin
    try
      Connection := TConexaoIniciar.varConexao.FDConnection;
      SQL.Text := 'DELETE FROM VENDA WHERE (ID = :ID)';
      Params.ParamByName('ID').AsInteger := ID;
      ExecSQL;
      Result := True
    except on E: Exception do
      begin
        erro := 'Ocorreu um erro ao tentar excluir o elemento: ' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
    FreeAndNil(SQLQuery);
  end;
end;

function TVendaDAO.gerarID: Integer;
begin
  SQLQuery := TFDQuery.Create(nil);
  with SQLQuery do
  begin
    try
      Connection := TConexaoIniciar.varConexao.FDConnection;
      SQL.Text := 'SELECT COALESCE(max(id), 0) + 1 AS seq FROM VENDA';
      Open();
      Result := FieldByName('seq').AsInteger;
    finally
      FreeAndNil(SQLQuery);
    end;
  end;
end;

function TVendaDAO.Inserir(Venda: TVenda; out erro: String): Boolean;
begin
  SQLQuery := TFDQuery.Create(nil);
  with SQLQuery, Venda do
  begin
    try
      Connection := TConexaoIniciar.varConexao.FDConnection;
      SQL.Text := 'insert into venda (id, total_produtos, total_preco, vendedor, data_venda, desconto) ' +
      'values (:id, :total_produtos, :total_preco, :vendedor, :data_venda, :desconto)';

      Params.ParamByName('ID').AsInteger := ID;
      Params.ParamByName('TOTAL_PRODUTOS').AsInteger := totalProdutos;
      Params.ParamByName('TOTAL_PRECO').AsFloat := totalPreco;
      Params.ParamByName('VENDEDOR').AsInteger := vendedor;
      Params.ParamByName('DATA_VENDA').AsDate := dataVenda;
      Params.ParamByName('desconto').AsInteger := Desconto;
      
      ExecSQL;
      Result := True;

    except on E: Exception do
    begin
      Erro := 'Ocorreu um erro ao tentar persistir: ' + sLineBreak + E.Message;
      Result := False;
    end;
    end;
    FreeAndNil(SQLQuery);
    FreeAndNil(Venda);
  end;
end;

procedure TVendaDAO.Pesquisar;
begin
  SQLQuery := TFDQuery.Create(nil);
  with SQLQuery do
  begin
    try
      Connection := TConexaoIniciar.varConexao.FDConnection;
      SQL.Text := 'SELECT * FROM VENDA';
      Open();
      First;
    finally
      FreeAndNil(SQLQuery);
    end;
  end;
end;

procedure TVendaDAO.PesquisarData(Data: TDate);
begin

end;

//procedure TVendaDAO.PesquisarData(Data: TDate);
//begin
//  SQLQuery := TFDQuery.Create(nil);
//  with SQLQuery do
//  begin
//    try
//      Connection := dmConexao.FDConnection;
//      SQL.Text := 'SELECT * FROM VENDA WHERE DATA_VENDA LIKE :DATA_VENDA';
//      Params.ParamByName('DATA_VENDA').AsDate := Data;
//      Open();
//      First;
//    finally
//      FreeAndNil(SQLQuery);
//    end;
//  end;
//end;

procedure TVendaDAO.PesquisarVendedor(ID: Integer);
begin
  SQLQuery := TFDQuery.Create(nil);
  with SQLQuery do
  begin
    try
      Connection := TConexaoIniciar.varConexao.FDConnection;
      SQL.Text := 'SELECT * FROM VENDA WHERE VENDEDOR LIKE :ID';
      Params.ParamByName('ID').AsInteger := ID;
      Open();
      First;
    finally
      FreeAndNil(SQLQuery);
    end;
  end;
end;

end.
