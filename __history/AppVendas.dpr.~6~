program AppVendas;

uses
  Vcl.Forms,
  MainForm in 'src\View\MainForm.pas' {MainView},
  Venda in 'src\Model\Venda\Venda.pas',
  Usuario in 'src\Model\Usuario\Usuario.pas',
  Produto in 'src\Model\Produto\Produto.pas',
  Conexao in 'src\Model\ConexaoDAO\Conexao.pas' {dmConexao},
  UsuarioDAOInterface in 'src\Interfaces\UsuarioDAOInterface.pas',
  VendaDAOInterface in 'src\Interfaces\VendaDAOInterface.pas',
  VendaDAO in 'src\Model\Venda\VendaDAO.pas',
  ProdutoDAOInterface in 'src\Interfaces\ProdutoDAOInterface.pas',
  ProdutoDAO in 'src\Model\Produto\ProdutoDAO.pas',
  UsuarioDAO in 'src\Model\Usuario\UsuarioDAO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainView, MainView);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.Run;
end.
