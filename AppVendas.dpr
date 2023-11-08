program AppVendas;

uses
  Vcl.Forms,
  Venda in 'src\Model\Venda\Venda.pas',
  Usuario in 'src\Model\Usuario\Usuario.pas',
  Produto in 'src\Model\Produto\Produto.pas',
  Conexao in 'src\Model\ConexaoDAO\Conexao.pas' {dmConexao},
  VendaDAO in 'src\Model\Venda\VendaDAO.pas',
  ProdutoDAO in 'src\Model\Produto\ProdutoDAO.pas',
  UsuarioDAO in 'src\Model\Usuario\UsuarioDAO.pas',
  ControladorUsuario in 'src\Controller\ControladorUsuario.pas',
  VendaDAOInterface in 'src\Interfaces\DAO\VendaDAOInterface.pas',
  ControladorUsuarioInterface in 'src\Interfaces\Controlador\ControladorUsuarioInterface.pas',
  UsuarioDAOInterface in 'src\Interfaces\DAO\UsuarioDAOInterface.pas',
  ProdutoDAOInterface in 'src\Interfaces\DAO\ProdutoDAOInterface.pas',
  ControladorProduto in 'src\Controller\ControladorProduto.pas',
  ControladorVenda in 'src\Controller\ControladorVenda.pas',
  ControladorProdutoInterface in 'src\Interfaces\Controlador\ControladorProdutoInterface.pas',
  ControladorVendaInterface in 'src\Interfaces\Controlador\ControladorVendaInterface.pas',
  TelaCadastroUsuario.View in 'src\View\TelaCadastroUsuario.View.pas' {TelaCadastroUsuario};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTelaCadastroUsuario, TelaCadastroUsuario.View.TelaCadastroUsuario);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.Run;
end.
