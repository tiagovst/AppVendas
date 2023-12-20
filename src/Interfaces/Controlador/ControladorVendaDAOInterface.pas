unit ControladorVendaDAOInterface;

interface

uses
  Venda,
  Data.DB;

type
  IControladorVenda = interface
    ['{BE5158CF-47C4-494A-83D0-4187A67050DD}']

    function DataAtual: TDate;

    function gerarID: Integer;
    function Inserir(Venda: TVenda; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;

    procedure PesquisarData(Data : TDate);
    procedure Pesquisar();
    procedure PesquisarVendedor(ID : Integer);
    procedure CarregarVenda(Venda: TVenda; ID: Integer);
    procedure AtualizarListaVendas(DataSource : TDataSource);

  end;

implementation

end.
