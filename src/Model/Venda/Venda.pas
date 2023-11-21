unit Venda;

interface

uses
  System.SysUtils;

type
  TVenda = class
  private
    FID: Integer; // ID da Venda
    FDataVenda: TDate;
    FTotalProdutos: Integer; // Total de produtos vendidos
    FIDProdutos: String; // Array com ID's de produtos
    FTotalPreco: Double;
    FVendedor: Integer; // ID do vendedor

  public
    property ID: Integer read FID write FID;
    property IDProdutos: String read FIDProdutos write FIDProdutos;
    property dataVenda: TDate read FDataVenda write FDataVenda;
    property totalProdutos: Integer read FTotalProdutos write FTotalProdutos;
    property totalPreco: Double read FTotalPreco write FTotalPreco;
    property vendedor: Integer read FVendedor write FVendedor;
  end;

implementation

end.
