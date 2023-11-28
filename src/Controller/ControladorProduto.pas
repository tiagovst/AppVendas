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

    procedure PesquisarCategoria(Categoria: String);
    procedure PesquisarNome(Nome: String);
    procedure Pesquisar(DataSource: TDataSource);


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


procedure TControladorProduto.Pesquisar(DataSource: TDataSource);
begin
  IProduto.Pesquisar(DataSource);
end;

procedure TControladorProduto.PesquisarCategoria(Categoria: String);
begin
  IProduto.PesquisarCategoria(Categoria);
end;

procedure TControladorProduto.PesquisarNome(Nome: String);
begin
  IProduto.PesquisarNome(Nome);
end;

end.
