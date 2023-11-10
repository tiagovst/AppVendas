unit Principal.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.ButtonGroup,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.WinXCtrls;

type
  TTelaPrincipal = class(TForm)
    pnlBarraLateral: TPanel;
    pnlLogo: TPanel;
    pnlConteudo: TPanel;
    pnlPesquisa: TPanel;
    Label1: TLabel;
    SearchBox: TSearchBox;
    GridProdutos: TDBGrid;
    GroupBox: TGroupBox;
    btnInicio: TButton;
    btnProdutos: TButton;
    btnClientes: TButton;
    btnUsuarios: TButton;
    btnEstoque: TButton;
    btnFinalizarCompra: TButton;
    pnlUsuarioLogado: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaPrincipal: TTelaPrincipal;

implementation

{$R *.dfm}

end.
