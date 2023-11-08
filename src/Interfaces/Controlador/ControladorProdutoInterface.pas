unit ControladorProdutoInterface;

interface

uses
  Produto;

type
  IControladorProduto = interface
    ['{CEF49D2A-179A-4DBF-9E81-4502E55F6C11}']

    function gerarID: Integer;
    function Inserir(Usuario: TProduto; out erro: String): Boolean;
    function Alterar(Usuario: TProduto; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;

    procedure PesquisarCategoria(Categoria: String);
    procedure PesquisarNome(Nome: String);
    procedure Pesquisar();
    procedure CarregarProduto(Usuario: TProduto; ID: Integer);
  end;

implementation

end.
