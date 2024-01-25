unit ControladorCompraDAO;

interface

uses
  CompraDAO, CompraDAOInterface, ControladorCompraDAOInterface, Produto, System.SysUtils;

type
  TControladorCompraDAO = class(TInterfacedObject, IControladorCompraDAO)
  private
    uCompraDAO : TCompraDAO;

    Constructor Create;

    function Inserir(Produto: TProduto; Quantidade: Double; PrecoSubtotal: Double;
    IdentificadorCliente: String; Desconto: Double; SubtotalDescontado: Double; out erro: String): Boolean;
    function DeletarTudo(out erro: String): Boolean;
  end;

implementation

{ TControladorCompraDAO }

constructor TControladorCompraDAO.Create;
begin
  uCompraDAO := TCompraDAO.Create;
end;

function TControladorCompraDAO.DeletarTudo(out erro: String): Boolean;
begin
  Result := uCompraDAO.DeletarTudo(erro);
end;

function TControladorCompraDAO.Inserir(Produto: TProduto; Quantidade: Double;
  PrecoSubtotal: Double; IdentificadorCliente: String; Desconto: Double; SubtotalDescontado: Double; out erro: String): Boolean;
begin
  Result := uCompraDAO.Inserir(Produto, Quantidade, PrecoSubtotal, IdentificadorCliente,
  Desconto, SubtotalDescontado, erro);
end;

end.
