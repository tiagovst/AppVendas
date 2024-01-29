unit CompraDAO;

interface

uses
  System.SysUtils, Produto,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.Stan.Factory,
  FireDAC.DApt, ConexaoIniciar, CompraDAOInterface;

type

  TCompraDAO = class(TInterfacedObject, ICompraDAO)
  private
    function gerarID: Integer;

  public
    SQLQuery: TFDQuery;
    function Inserir(Produto: TProduto; Quantidade: Double; PrecoSubtotal: Double;
    IdentificadorCliente: String; Desconto: Double; SubtotalDescontado: Double; out erro: String): Boolean;
    function DeletarTudo(out erro: String): Boolean;
  end;

implementation

{ TCompraDAO }

function TCompraDAO.DeletarTudo(out erro: String): Boolean;
var
  SQLQuery: TFDQuery;
begin
  SQLQuery := TFDQuery.Create(nil);

  SQLQuery.Connection := ConexaoIniciar.TConexaoIniciar.varConexao.FDConnection;

  try
    SQLQuery.SQL.Text := 'delete from compras';
    SQLQuery.ExecSQL;
    Result := True;
  except on E: Exception do
    begin
      Result := False;
      erro := 'não deu bom' + sLineBreak + E.Message;
    end
  end;

  SQLQuery.Free;
end;

function TCompraDAO.gerarID: Integer;
var
  SQLQuery: TFDQuery;
begin
  SQLQuery := TFDQuery.Create(nil);

  SQLQuery.Connection := ConexaoIniciar.TConexaoIniciar.varConexao.FDConnection;

  with SQLQuery do
  begin
    try
      Connection := TConexaoIniciar.varConexao.FDConnection;
      SQL.Text := 'SELECT COALESCE(MAX(ID_COMPRA), 0) + 1 AS NEXT_ID FROM COMPRAS;';
      Open();

      Result := FieldByName('NEXT_ID').AsInteger;

    finally
      FreeAndNil(SQLQuery);
    end;
  end;
end;

function TCompraDAO.Inserir(Produto: TProduto; Quantidade: Double; PrecoSubtotal: Double;
  IdentificadorCliente: String; Desconto: Double; SubtotalDescontado: Double; out erro: String): Boolean;
var
  SQLQuery: TFDQuery;
begin
  SQLQuery := TFDQuery.Create(nil);

  SQLQuery.Connection := ConexaoIniciar.TConexaoIniciar.varConexao.FDConnection;

  with SQLQuery do
  begin
    try
      SQL.Text := 'insert into COMPRAS (ID_COMPRA, NOME, QUANTIDADE, PRECO_UNITARIO, PRECO_SUBTOTAL, ' +
      'IDENTIFICADOR_CLIENTE, DESCONTO, SUBTOTAL_DESCONTADO) values (:ID_COMPRA, :NOME, :QUANTIDADE, ' +
      ':PRECO_UNITARIO, :PRECO_SUBTOTAL, :IDENTIFICADOR_CLIENTE, :DESCONTO, :SUBTOTAL_DESCONTADO)';

      Params.ParamByName('ID_COMPRA').AsInteger := gerarID;
      Params.ParamByName('NOME').AsString := Produto.Nome;
      Params.ParamByName('QUANTIDADE').AsFloat := Quantidade;
      Params.ParamByName('PRECO_UNITARIO').AsFloat := Produto.Preco;
      Params.ParamByName('PRECO_SUBTOTAL').AsFloat := PrecoSubtotal;
      Params.ParamByName('IDENTIFICADOR_CLIENTE').AsString := IdentificadorCliente;
      Params.ParamByName('DESCONTO').AsFloat := Desconto;
      Params.ParamByName('SUBTOTAL_DESCONTADO').AsFloat := SubtotalDescontado;

      ExecSQL;
      Result := True;
    except on E: Exception do
      begin
        Result := False;
        erro := E.Message;
      end;
    end;
  end;

  //SQLQuery.Free;
end;

end.
