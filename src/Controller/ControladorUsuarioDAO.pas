unit ControladorUsuarioDAO;

interface

uses
  Usuario,
  System.SysUtils,
  UsuarioDAO,
  UsuarioDAOInterface,
  Data.DB,
  ControladorUsuarioDAOInterface;

type
  TControladorUsuarioDAO = class(TInterfacedObject, IControladorUsuarioDAO)
  private
    IUsuario: IUsuarioDAO;

    function gerarID: Integer;
    function Inserir(Usuario: TUsuario; out erro: String): Boolean;
    function Alterar(Usuario: TUsuario; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;

    procedure PesquisarNomeUsuario(Usuario: TUsuario; NomeDeUsuario: String);
    procedure Pesquisar(DataSource: TDataSource);
    procedure CarregarPessoa(Usuario: TUsuario; ID: Integer);

  public
    constructor Create;

  end;
implementation

{ TControladorUsuario }

constructor TControladorUsuarioDAO.Create;
begin
  IUsuario := TUsuarioDAO.Create;
end;

function TControladorUsuarioDAO.Alterar(Usuario: TUsuario;
  out erro: String): Boolean;
begin
  Result := IUsuario.Alterar(Usuario, erro);
end;

procedure TControladorUsuarioDAO.CarregarPessoa(Usuario: TUsuario; ID: Integer);
begin
  IUsuario.CarregarPessoa(Usuario, ID);
end;

function TControladorUsuarioDAO.Excluir(ID: Integer; out erro: String): Boolean;
begin
  Result := IUsuario.Excluir(ID, erro);
end;

function TControladorUsuarioDAO.gerarID: Integer;
begin
  Result := IUsuario.gerarID;
end;

function TControladorUsuarioDAO.Inserir(Usuario: TUsuario;
  out erro: String): Boolean;
begin
  Result := IUsuario.Inserir(Usuario, erro);
end;

// Conferir lógica de acordo com nosso escopo
procedure TControladorUsuarioDAO.Pesquisar(DataSource: TDataSource);
begin
  IUsuario.Pesquisar(DataSource);
end;

procedure TControladorUsuarioDAO.PesquisarNomeUsuario(Usuario: TUsuario; NomeDeUsuario: String);
begin
  IUsuario.PesquisarNomeUsuario(Usuario, NomeDeUsuario);
end;

end.
