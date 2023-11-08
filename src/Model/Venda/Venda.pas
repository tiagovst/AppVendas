unit Venda;

interface

uses
  System.SysUtils;

type
  TVenda = class
  private
    FID: Integer;
    FDataVenda: TDate;
    FTotalProdutos: Integer;
    FTotalPreco: Double;
    FVendedor: Integer;

  public
    property ID: Integer read FID write FID;
    property dataVenda: TDate read FDataVenda write FDataVenda;
    property totalProdutos: Integer read FTotalProdutos write FTotalProdutos;
    property totalPreco: Double read FTotalPreco write FTotalPreco;
    property vendedor: Integer read FVendedor write FVendedor;
  end;

implementation

end.
