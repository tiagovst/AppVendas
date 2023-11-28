unit ControladorTelaEstoque;

interface

uses
  Estoque.View,
  System.SysUtils,
  ControladorTelaEstoqueInterface,
  Vcl.Controls,
  Data.DB;

type
  TControladorTelaEstoque = class(TInterfacedObject, IControladorTelaEstoque)
    private
      FTelaEstoque : TTelaEstoque;
    public
      constructor Create(const datasource : TDataSource) overload;
      procedure MostrarTela(parent : TWinControl);
      procedure FecharTela;

      procedure CalcularQuantidadeProdutos;
      procedure PreencherCbxCategorias;
    end;

implementation

{ TControladorTelaEstoque }

procedure TControladorTelaEstoque.CalcularQuantidadeProdutos;
var
  QuantidadeProdutosTotal : Integer;
begin
  with FTelaEstoque.DBGridProdutos do
  begin
    if Assigned(DataSource) and Assigned(DataSource.DataSet) then
    begin
      QuantidadeProdutosTotal := DataSource.DataSet.RecordCount;
      FTelaEstoque.lblTotalEstoque.Caption := IntToStr(QuantidadeProdutosTotal);
    end;
  end;
end;

constructor TControladorTelaEstoque.Create(const datasource: TDataSource);
begin
  FTelaEstoque := TTelaEstoque.Create(nil);
  FTelaEstoque.DBGridProdutos.DataSource := datasource;
  CalcularQuantidadeProdutos;
  PreencherCbxCategorias;
end;

procedure TControladorTelaEstoque.FecharTela;
begin
  FTelaEstoque.Close;
end;


procedure TControladorTelaEstoque.MostrarTela(parent: TWinControl);
begin
  FTelaEstoque.Parent := parent;
  FTelaEstoque.Align := alClient;
  FTelaEstoque.Show;
end;

procedure TControladorTelaEstoque.PreencherCbxCategorias;
begin
  //pegar categorias dos produtos no banco e preencher o String Itens
end;

end.
