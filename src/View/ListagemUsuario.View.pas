unit ListagemUsuario.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.WinXCtrls, ControladorUsuarioInterface, ControladorUsuario;

type
  TTelaListagemUsuario = class(TForm)
    Panel: TPanel;
    Top: TPanel;
    client: TPanel;
    scPesquisa: TSearchBox;
    Label1: TLabel;
    gridUsuario: TDBGrid;
    dsUsuario: TDataSource;
    gboxAcoes: TGroupBox;
    Button2: TButton;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
  public
  end;

var
  TelaListagemUsuario: TTelaListagemUsuario;

implementation

{$R *.dfm}

{ TListagemUsuario }

procedure TTelaListagemUsuario.FormShow(Sender: TObject);
var
  ControladorUsuario: IControladorUsuario;
begin
  ControladorUsuario := TControladorUsuario.Create;
  ControladorUsuario.Pesquisar(dsUsuario);
end;

end.
