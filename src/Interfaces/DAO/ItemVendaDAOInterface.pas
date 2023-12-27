unit ItemVendaDAOInterface;

interface

uses
  ItemVenda,
  System.Generics.Collections;

type
  IItemVendaDAO = interface
  ['{4655199D-3FC0-4BE4-A93F-8832194E0C2C}']

    function Inserir(ItemVenda: TItemVenda; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;
    function CarregarItemVenda(IDVenda: Integer): TList<TItemVenda>;

    procedure Pesquisar();
  end;

implementation

end.
