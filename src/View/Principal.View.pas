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
  ControladorTelaListagemClientes,
  ControladorTelaListagemClientesInterface,
  ControladorTelaManejoCliente,
  ControladorTelaManejoClienteInterface,
  Usuario,
  ControladorUsuarioInterface,
  Vcl.Imaging.pngimage,
  SessaoUsuario, System.ImageList, Vcl.ImgList,
  Login.View;

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
    ImageList: TImageList;
    btnLogout: TSpeedButton;
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
    procedure btnVerClientesClick(Sender: TObject);
    procedure btnCadastrarClienteClick(Sender: TObject);
    procedure SearchBoxInvokeSearch(Sender: TObject);
    procedure SearchBoxChange(Sender: TObject);
    procedure btnLogoutClick(Sender: TObject);
  private
    uControladorProduto: IControladorProduto;
    uControladorCompra: IControladorCompra;
    FCadastroProduto : TTelaCadastroProduto;
    uControladorTelaManejoUsuario: IControladorTelaManejoUsuario;
    uControladorTelaListagemUsuario: IControladorTelaListagemUsuario;
    uControladorTelaEstoque : IControladorTelaEstoque;
    uControladorTelaVendas : IControladorTelaVendas;
    uControladorTelaListagemClientes : IControladorTelaListagemClientes;
    uControladorTelaManejoCliente : IControladorTelaManejoCliente;
    Top: Boolean;

    procedure ManejoTop;
    procedure VerificacaoParent;
  public
  end;

var
  TelaPrincipal: TTelaPrincipal;

implementation

{$R *.dfm}

procedure TTelaPrincipal.btnCadastrarClienteClick(Sender: TObject);
begin
  VerificacaoParent;
  Top := True;
  ManejoTop;

  pnlSubmenuClientes.Visible := False;

  uControladorTelaManejoCliente := TControladorTelaManejoCliente.Create(pnlConteudo);
end;

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

procedure TTelaPrincipal.btnVerClientesClick(Sender: TObject);
begin
  VerificacaoParent;
  Top := True;
  ManejoTop;

  pnlSubmenuClientes.Visible := False;

  uControladorTelaListagemClientes := TControladorTelaListagemClientes.Create(pnlConteudo);
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
  uControladorProduto.AtualizarListaProdutos(DataSource);
  VerificacaoParent;
end;

procedure TTelaPrincipal.btnLogoutClick(Sender: TObject);
var
  FTelaLogin: TTelaLogin;
begin
  try
    Hide;
    FTelaLogin := TTelaLogin.Create(nil);
    FTelaLogin.ShowModal;

    if FTelaLogin.LoginSucesso then
    begin
      Show;
    end
    else
    begin
      Close;
    end;

  finally
    //
  end;
end;

procedure TTelaPrincipal.FormShow(Sender: TObject);
begin
  uControladorCompra := TControladorCompra.Create;
  uControladorProduto := TControladorProduto.Create;
  uControladorProduto.AtualizarListaProdutos(DataSource);

  lblNomeDeUsuario.Caption := SessaoUsuario.TSessaoUsuario.nomeUsuario;
  lblCargoUsuario.Caption := SessaoUsuario.TSessaoUsuario.cargo;

  if SessaoUsuario.TSessaoUsuario.cargo.Equals('Gestor de Estoque') then
  begin
    btnClientes.Enabled := False;
    btnVendas.Enabled := False;
    btnUsuarios.Enabled := False;
    btnFinalizarCompra.Enabled := False;
  end
  else if SessaoUsuario.TSessaoUsuario.cargo.Equals('Vendedor') then
  begin
    btnCadastrarProduto.Enabled := False;
    btnVendas.Enabled := False;
    btnUsuarios.Enabled := False;
  end;
end;

procedure TTelaPrincipal.gridProdutosDblClick(Sender: TObject);
var
  ProdutoSelecionado : TProduto;
  uControladorTelaCompraProduto: IControladorTelaCompraProduto;
begin
  ProdutoSelecionado := TProduto.Create;

  ProdutoSelecionado := uControladorProduto.CarregarProduto(
  gridProdutos.DataSource.DataSet.FieldByName('ID').AsInteger);

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

procedure TTelaPrincipal.SearchBoxChange(Sender: TObject);
var
  TextoPesquisa: String;
begin
  TextoPesquisa := SearchBox.Text;

  if TextoPesquisa.IsEmpty then
  begin
    uControladorProduto.AtualizarListaProdutos(DataSource);
  end;

end;

procedure TTelaPrincipal.SearchBoxInvokeSearch(Sender: TObject);
begin
  uControladorProduto.PesquisarNome(SearchBox.Text, DataSource);
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

    if Assigned(uControladorTelaListagemClientes) then
      uControladorTelaListagemClientes.FecharTela;

    if Assigned(uControladorTelaManejoCliente) then
      uControladorTelaManejoCliente.FecharTela;

    Top := False;
    ManejoTop;
  except on E: Exception do
  begin
    ShowMessage(E.Message);
  end;

  end;

end;

end.
