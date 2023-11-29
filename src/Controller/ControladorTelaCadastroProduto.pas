unit ControladorTelaCadastroProduto;

interface

uses
  System.SysUtils,
  ControladorTelaCadastroProdutoInterface,
  CadastroProduto.View,
  Vcl.Forms,
  Produto;

type
  TControladorTelaCadastroProduto = class(TInterfacedObject, IControladorTelaCadastroProduto)
  private
    produtoSelecionado : TProduto;
    FTelaCadastroProduto : TTelaCadastroProduto;
    procedure PreencherTela;
    procedure MostrarTela;
    procedure FecharTela;

  public
    constructor Create(const produto : TProduto) overload;
    constructor Create overload;
  end;

implementation

{ TControladorTelaCadastroProduto }

constructor TControladorTelaCadastroProduto.Create(const produto: TProduto);
begin
  produtoSelecionado := produto;
  FTelaCadastroProduto := TTelaCadastroProduto.Create(nil);
  FTelaCadastroProduto.BorderStyle := bsDialog;
  FTelaCadastroProduto.Position := poDesktopCenter;
  FTelaCadastroProduto.Label1.Caption := 'Manejo de produto';
  PreencherTela;
  MostrarTela;
end;

constructor TControladorTelaCadastroProduto.Create;
begin
  FTelaCadastroProduto := TTelaCadastroProduto.Create(nil);
  FTelaCadastroProduto.BorderStyle := bsDialog;
  FTelaCadastroProduto.Position := poDesktopCenter;
  MostrarTela;
end;

procedure TControladorTelaCadastroProduto.FecharTela;
begin
  FTelaCadastroProduto.Close;
end;

procedure TControladorTelaCadastroProduto.MostrarTela;
begin
  FTelaCadastroProduto.ShowModal;
end;

procedure TControladorTelaCadastroProduto.PreencherTela;
begin
  with FTelaCadastroProduto, produtoSelecionado do
  begin
    txtNomeProduto.Text := Nome;
    txtDescricaoProduto.Text := Descricao;
    txtQuantidadeEstoque.Text := IntToStr(QuantidadeEstoque);
    txtPreco.Text := FloatToStr(Preco);
    txtReferencia.Text := Referencia;
    txtFornecedor.Text := Fornecedor;
    txtValidade.Text := DateToStr(DataValidade);
    txtCodigoBarras.Text := CodigoBarras;
  end;

end;

end.
