unit VendaDAOInterface;

interface

uses
  Venda;

type
  IVendaDAO = interface
  ['{AC3C7EC3-8F9A-4812-B441-4350BA312C42}']
  function gerarID: Integer;
  function Inserir(Venda: TVenda; out erro: String): Boolean;
  function Excluir(ID: Integer; out erro: String): Boolean;

  procedure PesquisarData(Data : TDate);
  procedure Pesquisar();
  procedure PesquisarVendedor(ID : Integer);
  procedure CarregarVenda(Venda: TVenda; ID: Integer);
  end;

implementation

end.
