unit ControladorUsuarioInterface;

interface

uses
  Usuario,
  Data.DB;

type
  IControladorUsuario = interface
    ['{9494E2EE-8DB0-4653-AACB-60241AC01264}']

    function gerarID: Integer;
    function Inserir(Usuario: TUsuario; out erro: String): Boolean;
    function Alterar(Usuario: TUsuario; out erro: String): Boolean;
    function AlterarSenha(Usuario: TUsuario; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;

    procedure PesquisarNomeUsuario(Usuario: TUsuario; NomeDeUsuario: String);
    procedure Pesquisar(DataSource: TDataSource);
    function CarregarPessoa(IDUsuario: Integer): TUsuario;
  end;

implementation

end.
