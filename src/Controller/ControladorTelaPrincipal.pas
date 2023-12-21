unit ControladorTelaPrincipal;

interface

uses
  Vcl.Forms,
  Vcl.ActnList,
  System.SysUtils,
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
  ControladorTelaVendas,
  ControladorTelaCheckout,
  ControladorTelaCompraProduto,
  ControladorTelaCompraProdutoInterface,
  Produto,
  ConexaoIniciar;

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

    AcaoBtnProdutos, AcaoBtnClientes, AcaoBtnUsuarios, AcaoBtnCadastrarProduto,
    AcaoBtnCadastrarUsuario, AcaoBtnVerUsuario, AcaoBtnFinalizarCompra, AcaoBtnEstoque,
    AcaoBtnInicio, AcaoBtnVendas, AcaoBtnCadastrarCliente, AcaoBtnEditarExcluirCliente,
    AcaoBtnVerClientes: TAction;

    procedure btnEstoqueClick(Sender: TObject);
    procedure btnInicioClick(Sender: TObject);
    procedure btnVendasClick(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure btnClientesClick(Sender: TObject);
    procedure btnUsuariosClick(Sender: TObject);
    procedure btnCadastrarProdutoClick(Sender: TObject);
    procedure btnVerUsuarioClick(Sender: TObject);
    procedure btnCadastrarUsuarioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridProdutosDblClick(Sender: TObject);
    procedure btnFinalizarCompraClick(Sender: TObject);
    procedure btnCadastrarClienteClick(Sender: TObject);
    procedure btnEditarExcluirClienteClick(Sender: TObject);
    procedure btnVerClientesClick(Sender: TObject);

    procedure ConfigurarEventoBotoes;
    procedure ManejoTop;
    procedure VerificacaoParent;

  public
    constructor Create;
  end;

implementation

{ TControladorTelaPrincipal }

procedure TControladorTelaPrincipal.btnCadastrarClienteClick(Sender: TObject);
begin
  // Criar tela
end;

procedure TControladorTelaPrincipal.btnCadastrarProdutoClick(Sender: TObject);
begin
  VerificacaoParent;
  Top := True;
  ManejoTop;

  FTelaPrincipal.pnlSubmenuProdutos.Visible := False;

  FCadastroProduto := TTelaCadastroProduto.Create(nil);
  FCadastroProduto.Parent := FTelaPrincipal.pnlConteudo;
  FCadastroProduto.Align := AlClient;
  FCadastroProduto.Show;
end;

procedure TControladorTelaPrincipal.btnCadastrarUsuarioClick(Sender: TObject);
begin
  VerificacaoParent;
  Top := True;
  ManejoTop;

  FTelaPrincipal.pnlSubmenuUsuarios.Visible := False;

  uControladorTelaManejoUsuario := TControladorTelaManejoUsuario.Create(FTelaPrincipal.pnlConteudo);
end;

procedure TControladorTelaPrincipal.btnClientesClick(Sender: TObject);
begin
  with FTelaPrincipal, FTelaPrincipal.pnlSubmenuClientes do
    begin
      pnlSubmenuUsuarios.Visible := False;
      pnlSubmenuProdutos.Visible := False;

      BringToFront;
      pnlSubmenuClientes.Visible := not Visible;
    end;
end;

procedure TControladorTelaPrincipal.btnEditarExcluirClienteClick(
  Sender: TObject);
begin
  // Criar tela
end;

procedure TControladorTelaPrincipal.btnEstoqueClick(Sender: TObject);
begin
  VerificacaoParent;
  Top := True;
  ManejoTop;

  FTelaPrincipal.pnlSubmenuProdutos.Visible := False;

  uControladorTelaEstoque := TControladorTelaEstoque.Create(FTelaPrincipal.DataSource);
  uControladorTelaEstoque.MostrarTela(FTelaPrincipal.pnlConteudo);
end;

procedure TControladorTelaPrincipal.btnFinalizarCompraClick(Sender: TObject);
begin
  TControladorTelaCheckout.Create(uControladorCompra.ObterProdutos);
end;

procedure TControladorTelaPrincipal.btnInicioClick(Sender: TObject);
begin
  ControladorProduto.AtualizarListaProdutos(FTelaPrincipal.DataSource);
  VerificacaoParent;
end;

procedure TControladorTelaPrincipal.btnProdutosClick(Sender: TObject);
begin
  with FTelaPrincipal, FTelaPrincipal.pnlSubmenuProdutos do
    begin
      pnlSubmenuUsuarios.Visible := False;
      pnlSubmenuClientes.Visible := False;
      BringToFront;
      Visible := not pnlSubmenuProdutos.Visible;
    end;
end;

procedure TControladorTelaPrincipal.btnUsuariosClick(Sender: TObject);
begin
  with FTelaPrincipal, FTelaPrincipal.pnlSubmenuUsuarios do
    begin

      pnlSubmenuProdutos.Visible := False;
      pnlSubmenuClientes.Visible := False;

      BringToFront;
      Visible := not Visible;
    end;
end;

procedure TControladorTelaPrincipal.btnVendasClick(Sender: TObject);
begin
  VerificacaoParent;
  Top := True;
  ManejoTop;

  uControladorTelaVendas := TControladorTelaVendas.Create(FTelaPrincipal.pnlConteudo);
end;

procedure TControladorTelaPrincipal.btnVerClientesClick(Sender: TObject);
begin
  // Criar tela
end;

procedure TControladorTelaPrincipal.btnVerUsuarioClick(Sender: TObject);
begin
  VerificacaoParent;
  Top := True;
  ManejoTop;

  FTelaPrincipal.pnlSubmenuUsuarios.Visible := False;

  uControladorTelaListagemUsuario := TControladorTelaListagemUsuario.Create(FTelaPrincipal.pnlConteudo);
end;

constructor TControladorTelaPrincipal.Create;
begin
  TConexaoIniciar.CriarConexao;
  FTelaPrincipal := TTelaPrincipal.Create(Application);

  ConfigurarEventoBotoes;

  FTelaPrincipal.Show;
end;

procedure TControladorTelaPrincipal.ConfigurarEventoBotoes;
begin
  with FTelaPrincipal do
  begin
    OnShow := FormShow;
    gridProdutos.OnDblClick := gridProdutosDblClick;
    OnClose := FormClose;

    AcaoBtnInicio := TAction.Create(nil);
    AcaoBtnInicio.Caption := 'Início';
    AcaoBtnInicio.OnExecute := btnInicioClick;
    btnInicio.Action := AcaoBtnInicio;

    AcaoBtnProdutos := TAction.Create(nil);
    AcaoBtnProdutos.Caption := 'Produtos';
    AcaoBtnProdutos.OnExecute := btnProdutosClick;
    btnProdutos.Action := AcaoBtnProdutos;

    AcaoBtnClientes := TAction.Create(nil);
    AcaoBtnClientes.Caption := 'Clientes';
    AcaoBtnClientes.OnExecute := btnClientesClick;
    btnClientes.Action := AcaoBtnClientes;

    AcaoBtnUsuarios := TAction.Create(nil);
    AcaoBtnUsuarios.Caption := 'Usuarios';
    AcaoBtnUsuarios.OnExecute := btnUsuariosClick;
    btnUsuarios.Action := AcaoBtnUsuarios;

    AcaoBtnVendas := TAction.Create(nil);
    AcaoBtnVendas.Caption := 'Vendas';
    AcaoBtnVendas.OnExecute := btnVendasClick;
    btnVendas.Action := AcaoBtnVendas;

    AcaoBtnCadastrarProduto := TAction.Create(nil);
    AcaoBtnCadastrarProduto.Caption := 'Cadastrar novo produto';
    AcaoBtnCadastrarProduto.OnExecute := btnCadastrarProdutoClick;
    btnCadastrarProduto.Action := AcaoBtnCadastrarProduto;

    AcaoBtnCadastrarUsuario := TAction.Create(nil);
    AcaoBtnCadastrarUsuario.Caption := 'Cadastrar novo usuário';
    AcaoBtnCadastrarUsuario.OnExecute := btnCadastrarUsuarioClick;
    btnCadastrarUsuario.Action := AcaoBtnCadastrarUsuario;

    AcaoBtnVerUsuario := TAction.Create(nil);
    AcaoBtnVerUsuario.Caption := 'Ver usuários';
    AcaoBtnVerUsuario.OnExecute := btnVerUsuarioClick;
    btnVerUsuario.Action := AcaoBtnVerUsuario;

    AcaoBtnFinalizarCompra := TAction.Create(nil);
    AcaoBtnFinalizarCompra.Caption := 'Finalizar compra';
    AcaoBtnFinalizarCompra.OnExecute := btnFinalizarCompraClick;
    btnFinalizarCompra.Action := AcaoBtnFinalizarCompra;

    AcaoBtnEstoque := TAction.Create(nil);
    AcaoBtnEstoque.Caption := 'Estoque';
    AcaoBtnEstoque.OnExecute := btnEstoqueClick;
    btnEstoque.Action := AcaoBtnEstoque;

    AcaoBtnCadastrarCliente := TAction.Create(nil);
    AcaoBtnCadastrarCliente.Caption := 'Cadastrar novo cliente';
    AcaoBtnCadastrarCliente.OnExecute := btnCadastrarClienteClick;
    btnCadastrarCliente.Action := AcaoBtnCadastrarCliente;

    AcaoBtnEditarExcluirCliente := TAction.Create(nil);
    AcaoBtnEditarExcluirCliente.Caption := 'Editar/Excluir cliente';
    AcaoBtnEditarExcluirCliente.OnExecute := btnEditarExcluirClienteClick;
    btnEditarExcluirCliente.Action := AcaoBtnEditarExcluirCliente;

    AcaoBtnVerClientes := TAction.Create(nil);
    AcaoBtnVerClientes.Caption := 'Ver clientes';
    AcaoBtnVerClientes.OnExecute := btnVerClientesClick;
    btnVerClientes.Action := AcaoBtnVerClientes;
  end;
end;

procedure TControladorTelaPrincipal.FormShow(Sender: TObject);
begin
  uControladorCompra := TControladorCompra.Create; // Config --> Refatoração
  ControladorProduto := TControladorProduto.Create;
  ControladorProduto.AtualizarListaProdutos(FTelaPrincipal.DataSource);
end;

procedure TControladorTelaPrincipal.gridProdutosDblClick(Sender: TObject);
var
  LinhaSelecionada : Integer;
  ProdutoSelecionado : TProduto;
  uControladorTelaCompraProduto: IControladorTelaCompraProduto;
begin
  // Obtém a linha clicada
  LinhaSelecionada := FTelaPrincipal.gridProdutos.DataSource.DataSet.RecNo;
  ProdutoSelecionado := TProduto.Create;

  // Usa a linha para obter dados específicos
  if FTelaPrincipal.gridProdutos.DataSource.DataSet.Locate('ID', LinhaSelecionada, []) then
  begin
    with ProdutoSelecionado, FTelaPrincipal.gridProdutos.DataSource.DataSet do
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

procedure TControladorTelaPrincipal.ManejoTop;
begin
  if Top then
  begin
    FTelaPrincipal.pnlPesquisa.Align := AlNone;
  end
  else
  begin
    FTelaPrincipal.pnlPesquisa.Align := AlTop;
  end;
end;

procedure TControladorTelaPrincipal.VerificacaoParent;
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
