unit ControladorProdutoInterface;

interface

uses
  Produto,
  Data.DB;

type
  IControladorProduto = interface
    ['{CEF49D2A-179A-4DBF-9E81-4502E55F6C11}']

    function gerarID: Integer;
    function Inserir(Produto: TProduto; out erro: String): Boolean;
    function Alterar(Produto: TProduto; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;

    procedure PesquisarCategoria(Categoria: String);
    procedure PesquisarNome(Nome: String);
    procedure Pesquisar(DataSource: TDataSource);
    procedure CarregarProduto(Produto: TProduto; ID: Integer);
  end;

implementation

end.
