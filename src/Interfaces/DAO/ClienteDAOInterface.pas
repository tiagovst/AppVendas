unit ClienteDAOInterface;

interface

uses
  Cliente,
  Data.DB;

type
  IClienteDAO = interface
  ['{55A7F3FD-BA4F-421C-8FB2-EC757AC46E3C}']
  function Inserir(Cliente: TCliente; out erro: String): Boolean;
  function Alterar(Cliente: TCliente; out erro: String): Boolean;
  function Excluir(ID: String; out erro: String): Boolean;
  function CarregarCliente(IDCliente: String): TCliente;

  procedure PesquisarNome(Nome: String);
  procedure AtualizarListaClientes(DataSource: TDataSource);
  end;

implementation

end.
