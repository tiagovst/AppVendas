unit Estoque.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TTelaEstoque = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnVoltar: TButton;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    lblTotalEstoque: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaEstoque: TTelaEstoque;

implementation

{$R *.dfm}

end.
