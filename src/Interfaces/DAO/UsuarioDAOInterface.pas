unit UsuarioDAOInterface;

interface

uses
  Usuario,
  Data.DB;

type
  IUsuarioDAO = interface
    ['{7AE03825-4B40-4FAC-B9BE-1D943FEB281A}']

    function gerarID: Integer;
    function Inserir(Usuario: TUsuario; out erro: String): Boolean;
    function Alterar(Usuario: TUsuario; out erro: String): Boolean;
    function Excluir(ID: Integer; out erro: String): Boolean;

    procedure PesquisarNomeUsuario(Usuario: TUsuario; NomeDeUsuario: String);
    procedure Pesquisar(DataSource: TDataSource);
    function CarregarPessoa(IDUsuario: Integer): TUsuario;
  end;

implementation

end.
