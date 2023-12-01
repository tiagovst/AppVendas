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
  ControladorCompra,
  ControladorCompraInterface,
  Produto,
  Compra,
  Checkout.View,
  ControladorTelaCheckout,
  ControladorProduto,
  ControladorTelaCompraProduto,
  ControladorTelaCompraProdutoInterface,
  ControladorTelaEstoque,
  ControladorTelaEstoqueInterface,
  ControladorTelaCadastroProduto,
  ControladorTelaCadastroProdutoInterface,
  ControladorTelaManejoUsuario,
  ControladorTelaManejoUsuarioInterface,
  ControladorTelaListagemUsuarioInterface,
  ControladorTelaListagemUsuario;

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
    btnProdutos: TSpeedButton;
    btnClientes: TSpeedButton;
    btnUsuarios: TSpeedButton;
    pnlSubmenuProdutos: TPanel;
    btnVerProdutos: TSpeedButton;
    btnCadastrarProduto: TSpeedButton;
    pnlSubmenuClientes: TPanel;
    btnVerClientes: TSpeedButton;
    btnCadastrarCliente: TSpeedButton;
    btnEditarExcluirCliente: TSpeedButton;
    pnlBotoes: TPanel;
    pnlSubmenuUsuarios: TPanel;
    btnCadastrarUsuario: TSpeedButton;
    btnVerUsuario: TSpeedButton;
    DataSource: TDataSource;
    gridProdutos: TDBGrid;
    btnEditarExcluirProduto: TSpeedButton;
    btnInicio: TSpeedButton;
    btnEstoque: TSpeedButton;
    procedure onClick(Sender : TObject);
    procedure btnCadastrarProdutoClick(Sender: TObject);
    procedure btnVerUsuarioClick(Sender: TObject);
    procedure btnCadastrarUsuarioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridProdutosDblClick(Sender: TObject);
    procedure btnFinalizarCompraClick(Sender: TObject);
    procedure btnEstoqueClick(Sender: TObject);
  private
    uControladorCompra: IControladorCompra;
    procedure ManejoTop;
  end;

var
  TelaPrincipal: TTelaPrincipal;

implementation

{$R *.dfm}

procedure TTelaPrincipal.btnCadastrarProdutoClick(Sender: TObject);
var
  uControladorTelaCadastroProduto : IControladorTelaCadastroProduto;
  FCadastroProduto : TTelaCadastroProduto;
begin
  ManejoTop;
  pnlSubmenuProdutos.Visible := False;
  uControladorTelaCadastroProduto := TControladorTelaCadastroProduto.Create(TelaPrincipal.pnlConteudo);
end;

procedure TTelaPrincipal.btnCadastrarUsuarioClick(Sender: TObject);
var
  uControladorTelaManejoUsuario: IControladorTelaManejoUsuario;
begin
    ManejoTop;
    pnlSubmenuUsuarios.Visible := False;

    uControladorTelaManejoUsuario := TControladorTelaManejoUsuario.Create(TelaPrincipal.pnlConteudo);
end;

procedure TTelaPrincipal.btnVerUsuarioClick(Sender: TObject);
var
  uControladorTelaListagemUsuario: IControladorTelaListagemUsuario;
begin
  ManejoTop;
  pnlSubmenuUsuarios.Visible := False;

  uControladorTelaListagemUsuario := TControladorTelaListagemUsuario.Create(TelaPrincipal.pnlConteudo);
end;

procedure TTelaPrincipal.btnEstoqueClick(Sender: TObject);
var
  uControladorTelaEstoque : IControladorTelaEstoque;
begin
  uControladorTelaEstoque := TControladorTelaEstoque.Create(DataSource);
  uControladorTelaEstoque.MostrarTela(pnlConteudo);
  ManejoTop;
end;

procedure TTelaPrincipal.btnFinalizarCompraClick(Sender: TObject);
var
  uControladorCheckout : TControladorTelaCheckout;
begin
  uControladorCheckout := TControladorTelaCheckout.Create(uControladorCompra.ObterProdutos);
end;

procedure TTelaPrincipal.FormShow(Sender: TObject);
var
  ControladorProduto: IControladorProduto;
begin
  uControladorCompra := TControladorCompra.Create; // Config --> Refatora��o
  ControladorProduto := TControladorProduto.Create;
  ControladorProduto.Pesquisar(DataSource);
end;

procedure TTelaPrincipal.gridProdutosDblClick(Sender: TObject);
var
  LinhaSelecionada : Integer;
  ProdutoSelecionado : TProduto;
  uControladorTelaCompraProduto: IControladorTelaCompraProduto;
begin
  // Obt�m a linha clicada
  LinhaSelecionada := gridProdutos.DataSource.DataSet.RecNo;
  ProdutoSelecionado := TProduto.Create;
  // Usa a linha para obter dados espec�ficos
  if gridProdutos.DataSource.DataSet.Locate('ID', LinhaSelecionada, []) then
  begin
    with ProdutoSelecionado, gridProdutos.DataSource.DataSet do
      begin
      ID := FieldByName('ID').AsInteger;
      Nome := FieldByName('Nome').AsString;
      CodigoBarras := FieldByName('Codigo_barras').AsString;
      Descricao := FieldByName('Descricao').AsString;
      Referencia := FieldByName('Referencia').AsString;
      Preco := FieldByName('Preco').AsFloat;
      Categoria := FieldByName('Categoria').AsString;
      QuantidadeEstoque := FieldByName('Quantidade_estoque').AsInteger;
      Fornecedor := FieldByName('Fornecedor').AsString;
      DataValidade := FieldByName('Data_validade').AsDateTime;
    end;
  end;

  uControladorTelaCompraProduto := TControladorTelaCompraProduto.Create(uControladorCompra, ProdutoSelecionado);
  uControladorTelaCompraProduto.MostrarTelaCheckout;
end;

procedure TTelaPrincipal.ManejoTop;
begin
  if pnlPesquisa.Visible then
  begin
    pnlPesquisa.Align := alNone;
    //pnlPesquisa.Visible := False;
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
