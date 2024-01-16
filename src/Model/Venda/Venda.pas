unit Venda;

interface

uses
  System.SysUtils;

type
  TVenda = class
  private
    FID: Integer; // ID da Venda
    FDataVenda: TDate;
    FTotalProdutos: Double; // Total de produtos vendidos
    FTotalPreco: Double;
    FVendedor: Integer; // ID do vendedor
    FDesconto: Double;
    FIDCliente: String;

  public

    property ID: Integer read FID write FID;
    property Desconto: Double read FDesconto write FDesconto;
    property dataVenda: TDate read FDataVenda write FDataVenda;
    property totalProdutos: Double read FTotalProdutos write FTotalProdutos;
    property totalPreco: Double read FTotalPreco write FTotalPreco;
    property vendedor: Integer read FVendedor write FVendedor;
    property IDCliente: String read FIDCliente write FIDCliente;
  end;

implementation

end.
