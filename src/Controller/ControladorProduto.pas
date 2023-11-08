unit ControladorProduto;

interface

uses
  ControladorProdutoInterface,
  ProdutoDAO,
  ProdutoDAOInterface,
  Produto,
  System.SysUtils;

type
  TControladorProduto = class(TInterfacedObject, IControladorProduto)
  private
    IProduto: IProdutoDAO;

    function gerarID: Integer;
    function Inserir(Produto: TProduto; out erro: String): Boolean;
    function Alterar(Produto: TProduto; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;

    procedure PesquisarCategoria(Categoria: String);
    procedure PesquisarNome(Nome: String);
    procedure Pesquisar();
    procedure CarregarProduto(Produto: TProduto; ID: Integer);

  public
    constructor Create;
  end;

implementation

{ TControladorProduto }

constructor TControladorProduto.Create;
begin
  IProduto := uProdutoDAO.Create;
end;

function TControladorProduto.Alterar(Produto: TProduto;
  out erro: String): Boolean;
begin
  Result := IProduto.Alterar(Produto, erro);
end;

procedure TControladorProduto.CarregarProduto(Produto: TProduto; ID: Integer);
begin
  IProduto.CarregarProduto(Produto, ID);
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

procedure TControladorProduto.Pesquisar;
begin
  IProduto.Pesquisar;
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
