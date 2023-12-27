unit ControladorItemVendaInterface;

interface

uses
  ItemVenda,
  System.Generics.Collections;

type
  IControladorItemVenda = interface
  ['{0A945A70-767E-4E5D-A4A0-97DAE2D00247}']

  function Inserir(ItemVenda: TItemVenda; out erro: String): Boolean;
  function Excluir(ID: Integer; out erro: String): Boolean;
  function CarregarItemVenda(IDVenda: Integer): TList<TItemVenda>;

  procedure Pesquisar();
  end;

implementation

end.
