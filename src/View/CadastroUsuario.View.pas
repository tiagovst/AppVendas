unit CadastroUsuario.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, ListagemUsuario.View;

type
  TTelaCadastroUsuario = class(TForm)
    Panel1: TPanel;
    editNome: TLabeledEdit;
    editEmail: TLabeledEdit;
    editSenha: TLabeledEdit;
    editCPF: TLabeledEdit;
    editTelefone: TLabeledEdit;
    editUsuario: TLabeledEdit;
    radioEstoque: TRadioButton;
    radioAdm: TRadioButton;
    radioVendedor: TRadioButton;
    LabelCargo: TLabel;
    PanelTop: TPanel;
    Label2: TLabel;
    btnTelaPrincipal: TButton;
    Label3: TLabel;
    PanelBottom: TPanel;
    btnListar: TButton;
    btnSalvar: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
  end;

var
  TelaCadastroUsuario: TTelaCadastroUsuario;

implementation

{$R *.dfm}

procedure TTelaCadastroUsuario.btnListarClick(Sender: TObject);
var
  TelaListagemUsuario: TListagemUsuario;
begin
  TelaListagemUsuario := TListagemUsuario.Create(nil);
  try
    TelaCadastroUsuario.Free;
    TelaListagemUsuario.ShowModal;
  finally
    TelaCadastroUsuario.Close;
  end;

end;

procedure TTelaCadastroUsuario.btnSalvarClick(Sender: TObject);
var
  test: String;
begin
  test := editCPF.Text;
  ShowMessage(IntToStr(test.Length));
end;

end.
