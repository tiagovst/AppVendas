unit ControladorUsuarioInterface;

interface

uses
  Usuario;

type
  IControladorUsuario = interface
    ['{9494E2EE-8DB0-4653-AACB-60241AC01264}']

    function gerarID: Integer;
    function Inserir(Usuario: TUsuario; out erro: String): Boolean;
    function Alterar(Usuario: TUsuario; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;

    procedure PesquisarNome(Nome: String);
    procedure Pesquisar();
    procedure CarregarPessoa(Usuario: TUsuario; ID: Integer);
  end;

implementation

end.
