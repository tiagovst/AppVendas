unit ProdutoDAOInterface;

interface

uses
  Produto,
  Data.DB;

type
  IProdutoDAO = interface
    ['{8A648D77-C7A6-4FB3-85E7-BD1EFFDEE504}']

    function gerarID: Integer;
    function Inserir(Usuario: TProduto; out erro: String): Boolean;
    function Alterar(Usuario: TProduto; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;
    function CarregarProduto(IDProduto: Integer): TProduto;

    procedure PesquisarCategoria(Categoria: String);
    procedure PesquisarNome(Nome: String; DataSource: TDataSource);
    procedure AtualizarListaProdutos(DataSource: TDataSource);
  end;

implementation

end.
