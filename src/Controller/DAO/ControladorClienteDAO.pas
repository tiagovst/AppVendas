unit ControladorClienteDAO;

interface

uses
  system.SysUtils,
  ControladorClienteDAOInterface,
  Cliente,
  ClienteDAO,
  ClienteDAOInterface,
  Data.DB;

type
  TControladorClienteDAO = class(TInterfacedObject, IControladorClienteDAO)
  private
    ClienteDAO : IClienteDAO;

    function Inserir(Cliente: TCliente; out erro: String): Boolean;
    function Alterar(Cliente: TCliente; out erro: String): Boolean;
    function Excluir(ID: String; out erro: String): Boolean;
    function CarregarCliente(IDCliente: String): TCliente;

    procedure PesquisarNome(Nome: String);
    procedure AtualizarListaClientes(DataSource: TDataSource);

  public
    constructor Create;
  end;

implementation

{ TControladorClienteDAO }

constructor TControladorClienteDAO.Create;
begin
  ClienteDAO := TClienteDAO.Create;
end;

function TControladorClienteDAO.Alterar(Cliente: TCliente;
  out erro: String): Boolean;
begin
  Result := ClienteDAO.Alterar(Cliente, erro);
end;

procedure TControladorClienteDAO.AtualizarListaClientes(
  DataSource: TDataSource);
begin
  ClienteDAO.AtualizarListaClientes(DataSource);
end;

function TControladorClienteDAO.CarregarCliente(IDCliente: String): TCliente;
begin
  Result := ClienteDAO.CarregarCliente(IDCliente);
end;

function TControladorClienteDAO.Excluir(ID: String; out erro: String): Boolean;
begin
  Result := ClienteDAO.Excluir(ID, erro);
end;

function TControladorClienteDAO.Inserir(Cliente: TCliente;
  out erro: String): Boolean;
begin
  Result := ClienteDAO.Inserir(Cliente, erro);
end;

procedure TControladorClienteDAO.PesquisarNome(Nome: String);
begin
  ClienteDAO.PesquisarNome(Nome);
end;

end.
