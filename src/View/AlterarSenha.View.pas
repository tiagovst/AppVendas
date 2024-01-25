unit AlterarSenha.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Buttons;

type
  TTelaAlterarSenha = class(TForm)
    Label1: TLabel;
    txtNovaSenha: TLabeledEdit;
    btnCancelar: TButton;
    btnSalvar: TButton;
    Panel1: TPanel;
    btnMostrarSenha: TSpeedButton;
    ImageList: TImageList;
    procedure btnMostrarSenhaClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
  end;

var
  TelaAlterarSenha: TTelaAlterarSenha;

implementation

{$R *.dfm}

procedure TTelaAlterarSenha.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TTelaAlterarSenha.btnMostrarSenhaClick(Sender: TObject);
begin
  if txtNovaSenha.PasswordChar = '*' then
  begin
    txtNovaSenha.PasswordChar := #0;
    btnMostrarSenha.ImageIndex := 1;
  end
  else
  begin
    txtNovaSenha.PasswordChar := '*';
    btnMostrarSenha.ImageIndex := 0;
  end;
end;

end.
