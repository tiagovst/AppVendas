unit Estoque.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.DB,
  ControladorProduto,
  ControladorProdutoInterface,
  ControladorTelaCadastroProduto,
  ControladorTelaCadastroProdutoInterface,
  Produto,
  CadastroProduto.View,
  Vcl.WinXCtrls,
  Vcl.Imaging.pngimage;

type
  TTelaEstoque = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    DBGridProdutos: TDBGrid;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    lblTotalEstoque: TLabel;
    ComboBoxNivel: TComboBox;
    ComboBoxCategoria: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    SearchBoxNomeProduto: TSearchBox;
    Image: TImage;
    btnCadastrar: TButton;
    btnExluir: TButton;
    btnAtualizar: TButton;
    procedure DBGridProdutosDblClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    private
      ProdutoSelecionado : TProduto;
      uControladorProduto : IControladorProduto;
      uControladorTelaCadastroProduto : IControladorTelaCadastroProduto;
      procedure PreencherProduto;
  end;

var
  TelaEstoque: TTelaEstoque;

implementation

{$R *.dfm}

procedure TTelaEstoque.btnAtualizarClick(Sender: TObject);
begin
  DBGridProdutos.DataSource.DataSet.Refresh;
end;

procedure TTelaEstoque.btnCadastrarClick(Sender: TObject);
begin
  uControladorTelaCadastroProduto := TControladorTelaCadastroProduto.Create;
end;

procedure TTelaEstoque.DBGridProdutosDblClick(Sender: TObject);
begin
  PreencherProduto;
  uControladorTelaCadastroProduto := TControladorTelaCadastroProduto.CreateEditarProduto(ProdutoSelecionado);
end;

procedure TTelaEstoque.PreencherProduto;
var
  LinhaSelecionada : Integer;
begin
  LinhaSelecionada := DBGridProdutos.DataSource.DataSet.RecNo;
  uControladorProduto := TControladorProduto.Create;

  if DBGridProdutos.DataSource.DataSet.Locate('ID', LinhaSelecionada, []) then
  begin
    ProdutoSelecionado := uControladorProduto.CarregarProduto(
    DBGridProdutos.DataSource.DataSet.FieldByName('ID').AsInteger
    );
  end;
end;

end.
