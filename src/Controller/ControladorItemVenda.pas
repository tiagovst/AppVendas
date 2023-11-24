unit ControladorItemVenda;

interface

uses
  ItemVenda,
  ItemVendaDAO,
  ItemVendaDAOInterface,
  System.SysUtils,
  vcl.Dialogs,
  ControladorItemVendaInterface;

type
  TControladorItemVenda = class(TInterfacedObject, IControladorItemVenda)
  public //Mudar para private
    IItemVenda : IItemVendaDAO;

    function Inserir(ItemVenda: TItemVenda; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;


    constructor Create;
    procedure Pesquisar();
    procedure CarregarItemVenda(ItemVenda: TItemVenda; IDVenda: Integer);
  end;

implementation

{ TControladorItemVenda }

procedure TControladorItemVenda.CarregarItemVenda(ItemVenda: TItemVenda;
  IDVenda: Integer);
begin
  IItemVenda.CarregarItemVenda(ItemVenda, IDVenda);
end;

constructor TControladorItemVenda.Create;
begin
  IItemVenda := TItemVendaDAO.Create;
end;

function TControladorItemVenda.Excluir(ID: Integer; out erro: String): Boolean;
begin
  Result := IItemVenda.Excluir(ID, erro);
end;

function TControladorItemVenda.Inserir(ItemVenda: TItemVenda;
  out erro: String): Boolean;
begin
  Result := IItemVenda.Inserir(ItemVenda, erro);
end;

procedure TControladorItemVenda.Pesquisar;
begin
  IItemVenda.Pesquisar;
end;

end.
