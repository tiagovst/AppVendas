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
    FTotalPreco: Double;
    FVendedor: Integer; // ID do vendedor
    FDesconto: Integer;

  public
    constructor Create(const ID: Integer; TotalPreco: Double; Desconto: Integer;
    DataVenda: TDate; TotalPrdutos: Integer; Vendedor: Integer);

    constructor Create(const IdVenda: Integer; precoTotal: Double; Desconto: Integer);

    property ID: Integer read FID write FID;
    property Desconto: Integer read FDesconto write FDesconto;
    property dataVenda: TDate read FDataVenda write FDataVenda;
    property totalProdutos: Integer read FTotalProdutos write FTotalProdutos;
    property totalPreco: Double read FTotalPreco write FTotalPreco;
    property vendedor: Integer read FVendedor write FVendedor;
  end;

implementation

{ TVenda }

constructor TVenda.Create(const IdVenda: Integer; precoTotal: Double; Desconto: Integer);
begin
  FID := ID;
  FTotalPreco := TotalPreco;
  FDesconto := Desconto;
end;

{ TVenda }

constructor TVenda.Create(const ID: Integer; TotalPreco: Double;
  Desconto: Integer; DataVenda: TDate; TotalPrdutos, Vendedor: Integer);
begin
  FID := ID;
  FDataVenda := DataVenda;
  FTotalProdutos := TotalPrdutos;
  FTotalPreco := TotalPreco;
  FVendedor := Vendedor;
  FDesconto := Desconto;
end;

end.
