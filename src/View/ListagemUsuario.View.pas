unit ListagemUsuario.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.WinXCtrls, ControladorUsuarioInterface, ControladorUsuario,
  Vcl.Imaging.pngimage;

type
  TTelaListagemUsuario = class(TForm)
    Panel: TPanel;
    client: TPanel;
    Label1: TLabel;
    gridProdutos: TDBGrid;
    dsUsuario: TDataSource;
    pnlTop: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Image: TImage;
    btnExcluir: TButton;
    btnEditar: TButton;
    btnNovo: TButton;
    GroupBox1: TGroupBox;
    btnAtualizar: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
  public
  end;

var
  TelaListagemUsuario: TTelaListagemUsuario;

implementation

{$R *.dfm}

{ TListagemUsuario }

procedure TTelaListagemUsuario.btnAtualizarClick(Sender: TObject);
begin
  gridProdutos.DataSource.DataSet.Refresh;
end;

procedure TTelaListagemUsuario.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TTelaListagemUsuario.FormShow(Sender: TObject);
var
  ControladorUsuario: IControladorUsuario;
begin
  ControladorUsuario := TControladorUsuario.Create;
  ControladorUsuario.Pesquisar(dsUsuario);
end;

end.
