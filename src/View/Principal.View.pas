unit Principal.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.ButtonGroup,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Buttons, CadastroProduto.View;

type
  TTelaPrincipal = class(TForm)
    pnlBarraLateral: TPanel;
    pnlLogo: TPanel;
    pnlConteudo: TPanel;
    pnlPesquisa: TPanel;
    Label1: TLabel;
    SearchBox: TSearchBox;
    GridProdutos: TDBGrid;
    btnFinalizarCompra: TButton;
    pnlUsuarioLogado: TPanel;
    btnInicio: TSpeedButton;
    btnProdutos: TSpeedButton;
    btnClientes: TSpeedButton;
    btnEstoque: TSpeedButton;
    btnUsuarios: TSpeedButton;
    pnlSubmenuProdutos: TPanel;
    btnVerProdutos: TSpeedButton;
    btnCadastrarProduto: TSpeedButton;
    btnEditarExcluirProduto: TSpeedButton;
    pnlSubmenuClientes: TPanel;
    btnVerClientes: TSpeedButton;
    btnCadastrarCliente: TSpeedButton;
    btnEditarExcluirCliente: TSpeedButton;
    pnlBotoes: TPanel;
    procedure onClick(Sender : TObject);
    procedure btnCadastrarProdutoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaPrincipal: TTelaPrincipal;

implementation

{$R *.dfm}

procedure TTelaPrincipal.btnCadastrarProdutoClick(Sender: TObject);
var
  FCadastroProduto : TTelaCadastroProduto;
begin
  FCadastroProduto := TTelaCadastroProduto.Create(nil);
  pnlPesquisa.Align := alNone;
  pnlPesquisa.Hide;
  pnlSubmenuProdutos.Visible := False;
  FCadastroProduto.Parent := TelaPrincipal.pnlConteudo;
  FCadastroProduto.Align := alClient;
  pnlLogo.Height := 120;
  FCadastroProduto.Show;
end;

procedure TTelaPrincipal.onClick(Sender: TObject);
begin
  if Sender = btnProdutos then
  begin
    pnlSubmenuProdutos.Visible := not pnlSubmenuProdutos.Visible;
  end
  else if Sender = btnClientes then
  begin
    pnlSubmenuClientes.Visible := not pnlSubmenuClientes.Visible;
  end;

end;

end.
