unit ListagemClientes.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.WinXCtrls;

type
  TTelaListagemClientes = class(TForm)
    pnlTop: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Image: TImage;
    client: TPanel;
    Label1: TLabel;
    gridClientes: TDBGrid;
    GroupBox1: TGroupBox;
    btnExcluir: TButton;
    btnEditar: TButton;
    btnNovo: TButton;
    DataSourceClientes: TDataSource;
    searchBoxCliente: TSearchBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaListagemClientes: TTelaListagemClientes;

implementation

{$R *.dfm}

end.
