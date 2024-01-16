unit ControladorItemVenda;

interface

uses
  ItemVenda,
  ItemVendaDAO,
  ItemVendaDAOInterface,
  System.SysUtils,
  vcl.Dialogs,
  ControladorItemVendaInterface,
  System.Generics.Collections;

type
  TControladorItemVenda = class(TInterfacedObject, IControladorItemVenda)
  public //Mudar para private
    IItemVenda : IItemVendaDAO;

    function Inserir(ItemVenda: TItemVenda; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;
    function CarregarItemVenda(IDVenda: Integer): TList<TItemVenda>;
    function GerarID: Integer;

    constructor Create;
    procedure Pesquisar();
  end;

implementation

{ TControladorItemVenda }

function TControladorItemVenda.CarregarItemVenda(IDVenda: Integer): TList<TItemVenda>;
begin
  Result := IItemVenda.CarregarItemVenda(IDVenda);
end;

constructor TControladorItemVenda.Create;
begin
  IItemVenda := TItemVendaDAO.Create;
end;

function TControladorItemVenda.Excluir(ID: Integer; out erro: String): Boolean;
begin
  Result := IItemVenda.Excluir(ID, erro);
end;

function TControladorItemVenda.GerarID: Integer;
begin
  Result := IItemVenda.GerarID;
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
