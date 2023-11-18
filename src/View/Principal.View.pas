unit Principal.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.ButtonGroup,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Buttons,
  CadastroProduto.View,
  ListagemUsuario.View,
  ManejoUsuario.View,
  ControladorProdutoInterface,
  Produto,
  ControladorProduto;

type
  TTelaPrincipal = class(TForm)
    pnlBarraLateral: TPanel;
    pnlLogo: TPanel;
    pnlConteudo: TPanel;
    pnlPesquisa: TPanel;
    LabelProdutos: TLabel;
    SearchBox: TSearchBox;
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
    pnlSubmenuUsuarios: TPanel;
    btnVerUsuarios: TSpeedButton;
    btnCadastrarUsuario: TSpeedButton;
    btnEditarExcluirUsuario: TSpeedButton;
    DataSource: TDataSource;
    gridProdutos: TDBGrid;
    procedure onClick(Sender : TObject);
    procedure btnCadastrarProdutoClick(Sender: TObject);
    procedure btnEditarExcluirUsuarioClick(Sender: TObject);
    procedure btnCadastrarUsuarioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure ManejoTop;
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
  ManejoTop;

  pnlSubmenuProdutos.Visible := False;
  FCadastroProduto.Parent := TelaPrincipal.pnlConteudo;
  FCadastroProduto.Align := alClient;
  FCadastroProduto.Show;
end;

procedure TTelaPrincipal.btnCadastrarUsuarioClick(Sender: TObject);
var
  FManejoUsuario: TTelaManejoUsuario;
begin

    FManejoUsuario := TTelaManejoUsuario.Create(nil);

    ManejoTop;
    pnlSubmenuUsuarios.Visible := False;

    FManejoUsuario.Parent := TelaPrincipal.pnlConteudo;
    FManejoUsuario.Align := alClient;


    FManejoUsuario.Show;
end;

procedure TTelaPrincipal.btnEditarExcluirUsuarioClick(Sender: TObject);
var
  FListagemUsuario: TTelaListagemUsuario;
begin
  FListagemUsuario := TTelaListagemUsuario.Create(nil);
  ManejoTop;


  pnlSubmenuUsuarios.Visible := False;

  with FListagemUsuario do
  begin
    Parent := TelaPrincipal.pnlConteudo;
    Align := alClient;
    Show;
  end;

end;

procedure TTelaPrincipal.FormShow(Sender: TObject);
var
  ControladorProduto: IControladorProduto;
begin
  ControladorProduto := TControladorProduto.Create;
  ControladorProduto.Pesquisar(DataSource);
end;

procedure TTelaPrincipal.ManejoTop;
begin
  if pnlPesquisa.Visible then
  begin
    pnlPesquisa.Align := alNone;
    pnlPesquisa.Visible := False;
  end;

end;

procedure TTelaPrincipal.onClick(Sender: TObject);
begin
  if Sender = btnProdutos then
  begin
    with pnlSubmenuProdutos do
    begin
      pnlSubmenuUsuarios.Visible := False;
      pnlSubmenuClientes.Visible := False;
      BringToFront;
      Visible := not pnlSubmenuProdutos.Visible;
    end;

  end
  else if Sender = btnClientes then
  begin
    with pnlSubmenuClientes do
    begin
      pnlSubmenuUsuarios.Visible := False;
      pnlSubmenuProdutos.Visible := False;

      BringToFront;
      pnlSubmenuClientes.Visible := not Visible;
    end;
  end
  else if Sender = btnUsuarios then
  begin
    with pnlSubmenuUsuarios do
    begin

      pnlSubmenuProdutos.Visible := False;
      pnlSubmenuClientes.Visible := False;

      BringToFront;
      Visible := not Visible;
    end;
  end;
end;
end.
