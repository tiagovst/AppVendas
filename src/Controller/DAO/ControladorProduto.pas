unit ControladorProduto;

interface

uses
  ControladorProdutoInterface,
  ProdutoDAO,
  ProdutoDAOInterface,
  Produto,
  System.SysUtils,
  Data.DB;

type
  TControladorProduto = class(TInterfacedObject, IControladorProduto)
  private
    IProduto: TProdutoDAO;

    function gerarID: Integer;
    function Inserir(Produto: TProduto; out erro: String): Boolean;
    function Alterar(Produto: TProduto; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;
    function CarregarProduto(IDProduto: Integer): TProduto;

    procedure PesquisarCategoria(Categoria: String; DataSource: TDataSource);
    procedure PesquisarNome(Nome: String; DataSource: TDataSource);
    procedure PesquisarPorFiltro(Filtro : String; DataSource: TDataSource);
    procedure CarregarProdutosResumidos(DataSource : TDataSource);
    procedure AtualizarListaProdutos(DataSource: TDataSource);
    procedure PesquisarPorNomePrincipal(Nome: String; DataSource: TDataSource);


  public
    constructor Create;
  end;
implementation

{ TControladorProduto }

constructor TControladorProduto.Create;
begin
  IProduto := TProdutoDAO.Create;
end;

function TControladorProduto.Alterar(Produto: TProduto;
  out erro: String): Boolean;
begin
  Result := IProduto.Alterar(Produto, erro);
end;

function TControladorProduto.CarregarProduto(IDProduto: Integer): TProduto;
begin
  Result := IProduto.CarregarProduto(IDProduto);
end;

procedure TControladorProduto.CarregarProdutosResumidos(
  DataSource: TDataSource);
begin
  IProduto.CarregarProdutosResumidos(DataSource);
end;

function TControladorProduto.Excluir(ID: Integer; out erro: String): Boolean;
begin
  Result := IProduto.Excluir(ID, erro);
end;

function TControladorProduto.gerarID: Integer;
begin
  Result := IProduto.gerarID;
end;

function TControladorProduto.Inserir(Produto: TProduto;
  out erro: String): Boolean;
begin
  Result := IProduto.Inserir(Produto, erro);
end;


procedure TControladorProduto.AtualizarListaProdutos(DataSource: TDataSource);
begin
  IProduto.AtualizarListaProdutos(DataSource);
end;

procedure TControladorProduto.PesquisarCategoria(Categoria: String; DataSource: TDataSource);
begin
  IProduto.PesquisarCategoria(Categoria, DataSource);
end;

procedure TControladorProduto.PesquisarNome(Nome: String; DataSource: TDataSource);
begin
  IProduto.PesquisarNome(Nome, DataSource);
end;

procedure TControladorProduto.PesquisarPorFiltro(Filtro: String;
  DataSource: TDataSource);
begin
  IProduto.PesquisarPorFiltro(Filtro, DataSource);
end;

procedure TControladorProduto.PesquisarPorNomePrincipal(Nome: String;
  DataSource: TDataSource);
begin
  IProduto.PesquisarPorNomePrincipal(Nome, DataSource);
end;

end.
