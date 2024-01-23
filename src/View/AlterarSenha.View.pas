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
    SpeedButton1: TSpeedButton;
    ImageList: TImageList;
    procedure SpeedButton1Click(Sender: TObject);
  private
    //visivel: Boolean;
  end;

var
  TelaAlterarSenha: TTelaAlterarSenha;

implementation

{$R *.dfm}

procedure TTelaAlterarSenha.SpeedButton1Click(Sender: TObject);
begin
//  visivel := True;
//  if visivel then
//  begin
//    txtNovaSenha.PasswordChar := '#';
//  end
//  else
//  begin
//    txtNovaSenha.PasswordChar := '*';
//  end;

end;

end.
