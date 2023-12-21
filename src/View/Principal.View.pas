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
  ControladorTelaListagemUsuario,
  ControladorTelaVendas,
  ControladorTelaVendasInterface,
  Usuario,
  ControladorUsuarioInterface,
  Vcl.Imaging.pngimage,
  SessaoUsuario;

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
    btnInicio: TSpeedButton;
    btnEstoque: TSpeedButton;
    ImageLogo: TImage;
    Label1: TLabel;
    btnVendas: TSpeedButton;
    lblNomeDeUsuario: TLabel;
    lblCargoUsuario: TLabel;
    procedure onClick(Sender : TObject);
    procedure btnCadastrarProdutoClick(Sender: TObject);
    procedure btnVerUsuarioClick(Sender: TObject);
    procedure btnCadastrarUsuarioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridProdutosDblClick(Sender: TObject);
    procedure btnFinalizarCompraClick(Sender: TObject);
    procedure btnEstoqueClick(Sender: TObject);
    procedure btnInicioClick(Sender: TObject);
    procedure btnVendasClick(Sender: TObject);
  private
    ControladorProduto: IControladorProduto;
    uControladorCompra: IControladorCompra;
    FCadastroProduto : TTelaCadastroProduto;
    uControladorTelaManejoUsuario: IControladorTelaManejoUsuario;
    uControladorTelaListagemUsuario: IControladorTelaListagemUsuario;
    uControladorTelaEstoque : IControladorTelaEstoque;
    uControladorTelaVendas : IControladorTelaVendas;
    Top: Boolean;

    procedure ManejoTop;
    procedure VerificacaoParent;
  public
  end;

var
  TelaPrincipal: TTelaPrincipal;

implementation

{$R *.dfm}

procedure TTelaPrincipal.btnCadastrarProdutoClick(Sender: TObject);
begin
  VerificacaoParent;
  Top := True;
  ManejoTop;

  pnlSubmenuProdutos.Visible := False;

  FCadastroProduto := TTelaCadastroProduto.Create(nil);
  FCadastroProduto.Parent := TelaPrincipal.pnlConteudo;
  FCadastroProduto.Align := AlClient;
  FCadastroProduto.Show;
end;

procedure TTelaPrincipal.btnCadastrarUsuarioClick(Sender: TObject);
begin
  VerificacaoParent;
  Top := True;
  ManejoTop;

  pnlSubmenuUsuarios.Visible := False;

  uControladorTelaManejoUsuario := TControladorTelaManejoUsuario.Create(TelaPrincipal.pnlConteudo);
end;

procedure TTelaPrincipal.btnVendasClick(Sender: TObject);
begin
  VerificacaoParent;
  Top := True;
  ManejoTop;

  uControladorTelaVendas := TControladorTelaVendas.Create(TelaPrincipal.pnlConteudo);
end;

procedure TTelaPrincipal.btnVerUsuarioClick(Sender: TObject);
begin
  VerificacaoParent;
  Top := True;
  ManejoTop;

  pnlSubmenuUsuarios.Visible := False;

  uControladorTelaListagemUsuario := TControladorTelaListagemUsuario.Create(TelaPrincipal.pnlConteudo);
end;

procedure TTelaPrincipal.btnEstoqueClick(Sender: TObject);
begin
  VerificacaoParent;
  Top := True;
  ManejoTop;

  pnlSubmenuProdutos.Visible := False;

  uControladorTelaEstoque := TControladorTelaEstoque.Create(DataSource);
  uControladorTelaEstoque.MostrarTela(pnlConteudo);
end;

procedure TTelaPrincipal.btnFinalizarCompraClick(Sender: TObject);
var
  uControladorCheckout : TControladorTelaCheckout;
begin
  uControladorCheckout := TControladorTelaCheckout.Create(uControladorCompra.ObterProdutos);
end;

procedure TTelaPrincipal.btnInicioClick(Sender: TObject);
begin
  ControladorProduto.AtualizarListaProdutos(DataSource);
  VerificacaoParent;
end;

procedure TTelaPrincipal.FormShow(Sender: TObject);
begin
  uControladorCompra := TControladorCompra.Create; // Config --> Refatoração
  ControladorProduto := TControladorProduto.Create;
  ControladorProduto.AtualizarListaProdutos(DataSource);

  lblNomeDeUsuario.Caption := SessaoUsuario.TSessaoUsuario.nomeUsuario;
  lblCargoUsuario.Caption := SessaoUsuario.TSessaoUsuario.cargo;
end;

procedure TTelaPrincipal.gridProdutosDblClick(Sender: TObject);
var
  LinhaSelecionada : Integer;
  ProdutoSelecionado : TProduto;
  uControladorTelaCompraProduto: IControladorTelaCompraProduto;
begin
  // Obtém a linha clicada
  LinhaSelecionada := gridProdutos.DataSource.DataSet.RecNo;
  ProdutoSelecionado := TProduto.Create;
  // Usa a linha para obter dados específicos
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
end;

procedure TTelaPrincipal.ManejoTop;
begin
  if Top then
  begin
    pnlPesquisa.Align := AlNone;
  end
  else
  begin
    pnlPesquisa.Align := AlTop;
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
  end
end;

procedure TTelaPrincipal.VerificacaoParent;
begin
  try
    if Assigned(FCadastroProduto) then
    begin
      FCadastroProduto.Close;
    end;

    if Assigned(uControladorTelaEstoque) then
      uControladorTelaEstoque.FecharTela;

    if Assigned(uControladorTelaListagemUsuario) then
      uControladorTelaListagemUsuario.FecharTela;

    if Assigned(uControladorTelaManejoUsuario) then
        uControladorTelaManejoUsuario.FecharTela;

    if Assigned(uControladorTelaVendas) then
      uControladorTelaVendas.FecharTela;

    Top := False;
    ManejoTop;
  except on E: Exception do
  begin
    ShowMessage(E.Message);
  end;

  end;

end;

end.
