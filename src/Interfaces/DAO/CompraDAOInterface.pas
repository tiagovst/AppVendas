unit CompraDAOInterface;

interface

uses
  Produto;

type
  ICompraDAO = Interface
    ['{6C884B7C-5103-4CB8-B730-B0193E21EAD6}']

    function Inserir(Produto: TProduto; Quantidade: Double; PrecoSubtotal: Double;
    out erro: String): Boolean;
    function DeletarTudo(out erro: String): Boolean;
  end;

implementation

end.
