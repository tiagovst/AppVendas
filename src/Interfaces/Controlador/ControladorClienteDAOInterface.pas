unit ControladorClienteDAOInterface;

interface

uses
  System.SysUtils,
  Cliente,
  Data.DB;

type
  IControladorClienteDAO = interface
  ['{3266BD17-D43F-4E46-B5BE-C86E87D62BAB}']
  function Inserir(Cliente: TCliente; out erro: String): Boolean;
  function Alterar(Cliente: TCliente; out erro: String): Boolean;
  function Excluir(ID: String; out erro: String): Boolean;
  function CarregarCliente(IDCliente: String): TCliente;
  function VerificarIdentificadorCliente(Identificador: String): Boolean;

  procedure PesquisarNome(Nome: String);
  procedure AtualizarListaClientes(DataSource: TDataSource);
  end;

implementation

end.
