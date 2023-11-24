unit ItemVendaDAOInterface;

interface

uses
  ItemVenda;

type
  IItemVendaDAO = interface
  ['{4655199D-3FC0-4BE4-A93F-8832194E0C2C}']

    function Inserir(ItemVenda: TItemVenda; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;

    procedure Pesquisar();
    procedure CarregarItemVenda(ItemVenda: TItemVenda; IDVenda: Integer);
  end;

implementation

end.
