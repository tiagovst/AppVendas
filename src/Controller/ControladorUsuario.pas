unit ControladorUsuario;

interface

uses
  Usuario,
  System.SysUtils,
  UsuarioDAO,
  UsuarioDAOInterface,
  ControladorUsuarioInterface,
  FireDAC.Comp.Client;

type
  TControladorUsuario = class(TInterfacedObject, IControladorUsuario)
  private
    function gerarID: Integer;
    function Inserir(Usuario: TUsuario; out erro: String): Boolean;
    function Alterar(Usuario: TUsuario; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;

    procedure PesquisarNome(Nome: String);
    procedure Pesquisar();
    procedure CarregarPessoa(Usuario: TUsuario; ID: Integer);
  public

  end;
implementation

end.
