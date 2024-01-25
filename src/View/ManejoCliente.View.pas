unit ManejoCliente.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask;

type
  TTelaManejoCliente = class(TForm)
    pnlBottom: TPanel;
    btnCancelar: TButton;
    btnSalvar: TButton;
    pnlCenter: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    txtNome: TLabeledEdit;
    txtEndereco: TLabeledEdit;
    txtTelefone: TLabeledEdit;
    rbCPF: TRadioButton;
    rbCNPJ: TRadioButton;
    pnlTop: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Image: TImage;
    txtIdentificador: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaManejoCliente: TTelaManejoCliente;

implementation

{$R *.dfm}

end.
