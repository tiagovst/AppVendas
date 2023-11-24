unit ItemVendaDAO;

interface

uses
  ItemVendaDAOInterface,
  ItemVenda,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  System.SysUtils,
  Conexao;

type
  TItemVendaDAO = class(TInterfacedObject, IItemVendaDAO)
    //campo de atributos
    SQLQuery : TFDQuery;

    private
    //funcoes de persistencia
    function Inserir(ItemVenda: TItemVenda; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;

    procedure Pesquisar();
    procedure CarregarItemVenda(ItemVenda: TItemVenda; IDVenda: Integer);
  end;

implementation

{ TItemVendaDAO }

procedure TItemVendaDAO.CarregarItemVenda(ItemVenda: TItemVenda; IDVenda: Integer);
begin
  SQLQuery := TFDQuery.Create(nil);
  with SQLQuery, ItemVenda do
  begin
    try

      Connection := dmConexao.FDConnection;
      SQL.Text := 'SELECT * FROM ITEM_VENDA WHERE (ID_VENDA = :ID)';
      Params.ParamByName('ID_VENDA').AsInteger := IDVenda;
      Open();

      IdVenda := FieldByName('ID_VENDA').AsInteger;
      IdProduto := FieldByName('ID_PRODUTO').AsInteger;
      Preco := FieldByName('PRECO').AsFloat;
      Quantidade := FieldByName('QUANTIDADE').AsInteger;
      Desconto := FieldByName('DESCONTO').AsInteger;
      Subtotal := FieldByName('SUBTOTAL').AsFloat;

    finally
      FreeAndNil(SQLQuery);
    end;
  end;
end;

function TItemVendaDAO.Excluir(ID: Integer; out erro: String): Boolean;
begin
  SQLQuery := TFDQuery.Create(nil);
  with SQLQuery do
  begin
    try
      Connection := dmConexao.FDConnection;
      SQL.Text := 'DELETE FROM ITEM_VENDA WHERE (ID = :ID)';
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

function TItemVendaDAO.Inserir(ItemVenda: TItemVenda; out erro: String): Boolean;
begin
  SQLQuery := TFDQuery.Create(nil);
  with SQLQuery, ItemVenda do
  begin
    try
      Connection := dmConexao.FDConnection;
      SQL.Text := 'insert into item_venda (id_produto, id_venda, quantidade, preco, desconto, subtotal) ' +
      'values (:id_produto, :id_venda, :quantidade, :preco, :desconto, :subtotal)';

      Params.ParamByName('id_produto').AsInteger := IdProduto;
      Params.ParamByName('id_venda').AsInteger := IdVenda;
      Params.ParamByName('quantidade').AsInteger := Quantidade;
      Params.ParamByName('preco').AsFloat := Preco;
      Params.ParamByName('subtotal').AsFloat := Subtotal;
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
    FreeAndNil(ItemVenda);
  end;
end;

procedure TItemVendaDAO.Pesquisar;
begin
  SQLQuery := TFDQuery.Create(nil);
  with SQLQuery do
  begin
    try
      Connection := dmConexao.FDConnection;
      SQL.Text := 'SELECT * FROM ITEM_VENDA';
      Open();
      First;
    finally
      FreeAndNil(SQLQuery);
    end;
  end;
end;

end.
