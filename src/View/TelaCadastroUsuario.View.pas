unit TelaCadastroUsuario.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask;

type
  TTelaCadastroUsuario = class(TForm)
    PanelBack: TPanel;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaCadastroUsuario: TTelaCadastroUsuario;

implementation

{$R *.dfm}

end.
