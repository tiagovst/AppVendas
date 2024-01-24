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
    DataSourceProdutos: TDataSource;
    private
  end;

var
  TelaEstoque: TTelaEstoque;

implementation

{$R *.dfm}

end.
