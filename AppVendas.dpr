program AppVendas;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainForm in 'src\View\MainForm.pas' {MainFormView},
  Venda in 'src\Model\Venda\Venda.pas',
  VendaDAO in 'src\Model\Venda\VendaDAO.pas',
  UsuarioDAO in 'src\Model\Usuario\UsuarioDAO.pas',
  Usuario in 'src\Model\Usuario\Usuario.pas',
  ProdutoDAO in 'src\Model\Produto\ProdutoDAO.pas',
  Produto in 'src\Model\Produto\Produto.pas',
  ProdutoDAOInterface in 'src\Interfaces\DAO\ProdutoDAOInterface.pas',
  UsuarioDAOInterface in 'src\Interfaces\DAO\UsuarioDAOInterface.pas',
  VendaDAOInterface in 'src\Interfaces\DAO\VendaDAOInterface.pas',
  ControladorProdutoInterface in 'src\Interfaces\Controlador\ControladorProdutoInterface.pas',
  ControladorUsuarioInterface in 'src\Interfaces\Controlador\ControladorUsuarioInterface.pas',
  ControladorVendaInterface in 'src\Interfaces\Controlador\ControladorVendaInterface.pas',
  ControladorProduto in 'src\Controller\ControladorProduto.pas',
  ControladorUsuario in 'src\Controller\ControladorUsuario.pas',
  ControladorVenda in 'src\Controller\ControladorVenda.pas',
  Conexao in 'src\Model\ConexaoDAO\Conexao.pas' {DataModule1: TDataModule},
  ComponenteProduto.View in 'src\View\componentes\ComponenteProduto.View.pas' {FrameProduto: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainFormView, MainFormView);
  Application.Run;
end.
