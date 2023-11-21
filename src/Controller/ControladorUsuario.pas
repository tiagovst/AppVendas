unit ControladorUsuario;

interface

uses
  Usuario,
  System.SysUtils,
  UsuarioDAO,
  UsuarioDAOInterface,
  Data.DB,
  ControladorUsuarioInterface;

type
  TControladorUsuario = class(TInterfacedObject, IControladorUsuario)
  private
    IUsuario: IUsuarioDAO;

    function gerarID: Integer;
    function Inserir(Usuario: TUsuario; out erro: String): Boolean;
    function Alterar(Usuario: TUsuario; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;

    procedure PesquisarNome(Nome: String);
    procedure Pesquisar(DataSource: TDataSource);
    procedure CarregarPessoa(Usuario: TUsuario; ID: Integer);

  public
    constructor Create;

  end;
implementation

{ TControladorUsuario }

constructor TControladorUsuario.Create;
begin
  IUsuario := TUsuarioDAO.Create;
end;

function TControladorUsuario.Alterar(Usuario: TUsuario;
  out erro: String): Boolean;
begin
  Result := IUsuario.Alterar(Usuario, erro);
end;

procedure TControladorUsuario.CarregarPessoa(Usuario: TUsuario; ID: Integer);
begin
  IUsuario.CarregarPessoa(Usuario, ID);
end;

function TControladorUsuario.Excluir(ID: Integer; out erro: String): Boolean;
begin
  Result := IUsuario.Excluir(ID, erro);
end;

function TControladorUsuario.gerarID: Integer;
begin
  Result := IUsuario.gerarID;
end;

function TControladorUsuario.Inserir(Usuario: TUsuario;
  out erro: String): Boolean;
begin
  Result := IUsuario.Inserir(Usuario, erro);
end;

// Conferir lógica de acordo com nosso escopo
procedure TControladorUsuario.Pesquisar(DataSource: TDataSource);
begin
  IUsuario.Pesquisar(DataSource);
end;

// Conferir lógica de acordo com nosso escopo
procedure TControladorUsuario.PesquisarNome(Nome: String);
begin
  IUsuario.PesquisarNome(Nome);
end;

end.
