unit ControladorVenda;

interface

uses
  System.SysUtils,
  Venda,
  ControladorVendaInterface,
  VendaDAO,
  VendaDAOInterface;

type
  TControladorVenda = class(TInterfacedObject, IControladorVenda)
  private
    IVenda: IVendaDAO;

    function gerarID: Integer;
    function Inserir(Venda: TVenda; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;

    procedure PesquisarData(Data : TDate);
    procedure Pesquisar();
    procedure PesquisarVendedor(ID : Integer);
    procedure CarregarVenda(Venda: TVenda; ID: Integer);

  public
    constructor Create;

  end;

implementation

{ TControladorVenda }

constructor TControladorVenda.Create;
begin
  IVenda := uVendaDAO.Create;
end;

procedure TControladorVenda.CarregarVenda(Venda: TVenda; ID: Integer);
begin
  IVenda.CarregarVenda(Venda, ID);
end;

function TControladorVenda.Excluir(ID: Integer; out erro: String): Boolean;
begin
  Result := IVenda.Excluir(ID, erro);
end;

function TControladorVenda.gerarID: Integer;
begin
  Result := IVenda.gerarID;
end;

function TControladorVenda.Inserir(Venda: TVenda; out erro: String): Boolean;
begin
  Result := IVenda.Inserir(Venda, erro);
end;

// Verificar o método de acordo com nosso contexto no futuro
procedure TControladorVenda.Pesquisar;
begin
  IVenda.Pesquisar;
end;

procedure TControladorVenda.PesquisarData(Data: TDate);
begin
  IVenda.PesquisarData(Data);
end;

procedure TControladorVenda.PesquisarVendedor(ID: Integer);
begin
  IVenda.PesquisarVendedor(ID);
end;

end.
