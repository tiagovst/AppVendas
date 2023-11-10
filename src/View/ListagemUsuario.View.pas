unit ListagemUsuario.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.WinXCtrls;

type
  TListagemUsuario = class(TForm)
    Panel: TPanel;
    Top: TPanel;
    client: TPanel;
    scPesquisa: TSearchBox;
    Label1: TLabel;
    gridUsuario: TDBGrid;
    dsUsuario: TDataSource;
    gboxAcoes: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
  public
  end;

var
  ListagemUsuario: TListagemUsuario;

implementation

{$R *.dfm}

{ TListagemUsuario }

end.
