unit Vendas.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TTelaVendas = class(TForm)
    pnlConteudo: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Image: TImage;
    pnlBarraTarefas: TPanel;
    Image1: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    Image2: TImage;
    Label3: TLabel;
    Label4: TLabel;
    lblTotalEmVendas: TLabel;
    Label6: TLabel;
    lblQuantidadeItensVendidos: TLabel;
    DBGridVendas: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DataSourceVendas: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaVendas: TTelaVendas;

implementation

{$R *.dfm}

end.
