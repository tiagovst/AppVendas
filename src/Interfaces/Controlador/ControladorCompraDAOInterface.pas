unit ControladorCompraDAOInterface;

interface

uses
  Produto;

type
  IControladorCompraDAO = interface
    ['{0D08A5B9-9B73-458E-9E24-A88FA813C5C3}']

    function Inserir(Produto: TProduto; Quantidade: Integer; PrecoSubtotal: Double;
    out erro: String): Boolean;
    function DeletarTudo(out erro: String): Boolean;
  end;

implementation

end.
