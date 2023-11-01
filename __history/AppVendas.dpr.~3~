program AppVendas;

uses
  Vcl.Forms,
  MainForm in 'src\View\MainForm.pas' {MainView},
  Venda in 'src\Model\Venda\Venda.pas',
  Usuario in 'src\Model\Usuario\Usuario.pas',
  Produto in 'src\Model\Produto\Produto.pas',
  Conexao in 'src\Model\ConexaoDAO\Conexao.pas' {dmConexao},
  UsuarioDAO in 'src\Model\Usuario\UsuarioDAO.pas' {dmGenericDAO: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainView, MainView);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.Run;
end.
