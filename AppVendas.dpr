program AppVendas;

uses
  Vcl.Forms,
  System.SysUtils,
  Venda in 'src\Model\Venda\Venda.pas',
  Usuario in 'src\Model\Usuario\Usuario.pas',
  Produto in 'src\Model\Produto\Produto.pas',
  Conexao in 'src\Model\ConexaoDAO\Conexao.pas' {dmConexao},
  VendaDAO in 'src\Model\Venda\VendaDAO.pas',
  ProdutoDAO in 'src\Model\Produto\ProdutoDAO.pas',
  UsuarioDAO in 'src\Model\Usuario\UsuarioDAO.pas' {dmGenericDAO: TDataModule},
  VendaDAOInterface in 'src\Interfaces\DAO\VendaDAOInterface.pas',
  ControladorUsuarioInterface in 'src\Interfaces\Controlador\ControladorUsuarioInterface.pas',
  UsuarioDAOInterface in 'src\Interfaces\DAO\UsuarioDAOInterface.pas',
  ProdutoDAOInterface in 'src\Interfaces\DAO\ProdutoDAOInterface.pas',
  ControladorProdutoInterface in 'src\Interfaces\Controlador\ControladorProdutoInterface.pas',
  ControladorVendaDAOInterface in 'src\Interfaces\Controlador\ControladorVendaDAOInterface.pas',
  CadastroProduto.View in 'src\View\CadastroProduto.View.pas' {TelaCadastroProduto},
  Principal.View in 'src\View\Principal.View.pas' {TelaPrincipal},
  ListagemUsuario.View in 'src\View\ListagemUsuario.View.pas' {TelaListagemUsuario},
  Estoque.View in 'src\View\Estoque.View.pas' {TelaEstoque},
  ManejoUsuario.View in 'src\View\ManejoUsuario.View.pas' {TelaManejoUsuario},
  CompraProduto.View in 'src\View\CompraProduto.View.pas' {TelaAdicionarProduto},
  ControladorCompraInterface in 'src\Interfaces\Controlador\ControladorCompraInterface.pas',
  Compra in 'src\Model\Compra\Compra.pas',
  Checkout.View in 'src\View\Checkout.View.pas' {TelaCheckout},
  ItemVenda in 'src\Model\ItemVenda\ItemVenda.pas',
  ItemVendaDAO in 'src\Model\ItemVenda\ItemVendaDAO.pas',
  ItemVendaDAOInterface in 'src\Interfaces\DAO\ItemVendaDAOInterface.pas',
  ControladorItemVendaInterface in 'src\Interfaces\Controlador\ControladorItemVendaInterface.pas',
  Vendas.View in 'src\View\Vendas.View.pas' {TelaVendas},
  Login.View in 'src\View\Login.View.pas' {TelaLogin},
  ConexaoIniciar in 'src\Model\ConexaoDAO\ConexaoIniciar.pas',
  SessaoUsuario in 'src\Model\Usuario\SessaoUsuario.pas',
  Cliente in 'src\Model\Cliente\Cliente.pas',
  ClienteDAO in 'src\Model\Cliente\ClienteDAO.pas',
  ClienteDAOInterface in 'src\Interfaces\DAO\ClienteDAOInterface.pas',
  ControladorClienteDAOInterface in 'src\Interfaces\Controlador\ControladorClienteDAOInterface.pas',
  ControladorTelaCadastroProduto in 'src\Controller\Telas\ControladorTelaCadastroProduto.pas',
  ControladorTelaCheckout in 'src\Controller\Telas\ControladorTelaCheckout.pas',
  ControladorTelaCompraProduto in 'src\Controller\Telas\ControladorTelaCompraProduto.pas',
  ControladorTelaEstoque in 'src\Controller\Telas\ControladorTelaEstoque.pas',
  ControladorTelaListagemUsuario in 'src\Controller\Telas\ControladorTelaListagemUsuario.pas',
  ControladorTelaManejoUsuario in 'src\Controller\Telas\ControladorTelaManejoUsuario.pas',
  ControladorTelaVendas in 'src\Controller\Telas\ControladorTelaVendas.pas',
  ControladorClienteDAO in 'src\Controller\DAO\ControladorClienteDAO.pas',
  ControladorCompra in 'src\Controller\DAO\ControladorCompra.pas',
  ControladorItemVenda in 'src\Controller\DAO\ControladorItemVenda.pas',
  ControladorProduto in 'src\Controller\DAO\ControladorProduto.pas',
  ControladorUsuario in 'src\Controller\DAO\ControladorUsuario.pas',
  ControladorVendaDAO in 'src\Controller\DAO\ControladorVendaDAO.pas',
  ControladorTelaManejoCliente in 'src\Controller\Telas\ControladorTelaManejoCliente.pas',
  ControladorTelaListagemClientes in 'src\Controller\Telas\ControladorTelaListagemClientes.pas',
  ControladorTelaCadastroProdutoInterface in 'src\Interfaces\Controlador\Telas\ControladorTelaCadastroProdutoInterface.pas',
  ControladorTelaCheckoutInterface in 'src\Interfaces\Controlador\Telas\ControladorTelaCheckoutInterface.pas',
  ControladorTelaCompraProdutoInterface in 'src\Interfaces\Controlador\Telas\ControladorTelaCompraProdutoInterface.pas',
  ControladorTelaEstoqueInterface in 'src\Interfaces\Controlador\Telas\ControladorTelaEstoqueInterface.pas',
  ControladorTelaListagemClientesInterface in 'src\Interfaces\Controlador\Telas\ControladorTelaListagemClientesInterface.pas',
  ControladorTelaListagemUsuarioInterface in 'src\Interfaces\Controlador\Telas\ControladorTelaListagemUsuarioInterface.pas',
  ControladorTelaManejoClienteInterface in 'src\Interfaces\Controlador\Telas\ControladorTelaManejoClienteInterface.pas',
  ControladorTelaManejoUsuarioInterface in 'src\Interfaces\Controlador\Telas\ControladorTelaManejoUsuarioInterface.pas',
  ControladorTelaVendasInterface in 'src\Interfaces\Controlador\Telas\ControladorTelaVendasInterface.pas',
  ListagemClientes.View in 'src\View\ListagemClientes.View.pas' {TelaListagemClientes},
  ManejoCliente.View in 'src\View\ManejoCliente.View.pas' {TelaManejoCliente};

{$R *.res}

var
  fLogin: TTelaLogin;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  fLogin := TTelaLogin.Create(nil);
  fLogin.ShowModal;
  try
    if fLogin.LoginSucesso then
    begin
      Application.CreateForm(TTelaPrincipal, TelaPrincipal);
  Application.CreateForm(TTelaListagemClientes, TelaListagemClientes);
  Application.CreateForm(TTelaListagemClientes, TelaListagemClientes);
  Application.CreateForm(TTelaManejoCliente, TelaManejoCliente);
  Application.Run;
    end;
  finally
    fLogin.Free;
  end;

end.

