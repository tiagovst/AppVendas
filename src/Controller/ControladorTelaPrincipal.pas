unit ControladorTelaPrincipal;

interface

uses
  Principal.View,
  Vcl.Controls,
  Vcl.Dialogs,
  ControladorTelaPrincipalInterface,
  ControladorProdutoInterface,
  ControladorProduto,
  ControladorCompraInterface,
  ControladorCompra,
  CadastroProduto.View,
  ControladorTelaManejoUsuario,
  ControladorTelaManejoUsuarioInterface,
  ControladorTelaListagemUsuario,
  ControladorTelaListagemUsuarioInterface,
  ControladorTelaEstoque,
  ControladorTelaEstoqueInterface,
  ControladorTelaVendasInterface,
  ControladorTelaVendas;

type
  TControladorTelaPrincipal = class(TInterfacedObject, IControladorTelaPrincipal)
  private
    FTelaPrincipal: TTelaPrincipal;
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
    constructor Create;
  end;

implementation

{ TControladorTelaPrincipal }

constructor TControladorTelaPrincipal.Create;
begin
  FTelaPrincipal := TTelaPrincipal.Create(nil);

  FTelaPrincipal.Show;
end;

procedure btnCadastrarProdutoClick(Sender: TObject);
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

procedure btnCadastrarUsuarioClick(Sender: TObject);
begin
  VerificacaoParent;
  Top := True;
  ManejoTop;

  pnlSubmenuUsuarios.Visible := False;

  uControladorTelaManejoUsuario := TControladorTelaManejoUsuario.Create(TelaPrincipal.pnlConteudo);
end;

procedure btnVendasClick(Sender: TObject);
begin
  VerificacaoParent;
  Top := True;
  ManejoTop;

  uControladorTelaVendas := TControladorTelaVendas.Create(TelaPrincipal.pnlConteudo);
end;

procedure btnVerUsuarioClick(Sender: TObject);
begin
  VerificacaoParent;
  Top := True;
  ManejoTop;

  pnlSubmenuUsuarios.Visible := False;

  uControladorTelaListagemUsuario := TControladorTelaListagemUsuario.Create(TelaPrincipal.pnlConteudo);
end;

procedure btnEstoqueClick(Sender: TObject);
begin
  VerificacaoParent;
  Top := True;
  ManejoTop;

  pnlSubmenuProdutos.Visible := False;

  uControladorTelaEstoque := TControladorTelaEstoque.Create(DataSource);
  uControladorTelaEstoque.MostrarTela(pnlConteudo);
end;

procedure btnFinalizarCompraClick(Sender: TObject);
var
  uControladorCheckout : TControladorTelaCheckout;
begin
  uControladorCheckout := TControladorTelaCheckout.Create(uControladorCompra.ObterProdutos);
end;

procedure btnInicioClick(Sender: TObject);
begin
  ControladorProduto.AtualizarListaProdutos(DataSource);
  VerificacaoParent;
end;

procedure FormShow(Sender: TObject);
begin
  uControladorCompra := TControladorCompra.Create; // Config --> Refatoração
  ControladorProduto := TControladorProduto.Create;
  ControladorProduto.AtualizarListaProdutos(DataSource);
end;

procedure gridProdutosDblClick(Sender: TObject);
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

procedure ManejoTop;
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

procedure onClick(Sender: TObject);
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

procedure VerificacaoParent;
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
