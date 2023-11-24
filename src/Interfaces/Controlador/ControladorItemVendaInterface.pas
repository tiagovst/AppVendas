unit ControladorItemVendaInterface;

interface

uses
  ItemVenda;

type
  IControladorItemVenda = interface
  ['{0A945A70-767E-4E5D-A4A0-97DAE2D00247}']

  function Inserir(ItemVenda: TItemVenda; out erro: String): Boolean;
  function Excluir(ID: Integer; out erro: String): Boolean;

  procedure Pesquisar();
  procedure CarregarItemVenda(ItemVenda: TItemVenda; IDVenda: Integer);
  end;

implementation

end.
