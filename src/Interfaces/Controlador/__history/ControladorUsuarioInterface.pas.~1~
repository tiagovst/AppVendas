unit ControladorUsuarioInterface;

interface

uses
  Usuario;

type
  IControladorUsuario = interface
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
