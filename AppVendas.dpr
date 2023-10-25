program AppVendas;

uses
  Vcl.Forms,
  MainForm in 'src\View\MainForm.pas' {MainView},
  Usuario in 'src\Model\Usuario.pas',
  Produto in 'src\Model\Produto.pas',
  Venda in 'src\Model\Venda.pas',
  Conexao in 'src\Model\Conexao.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainView, MainView);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
