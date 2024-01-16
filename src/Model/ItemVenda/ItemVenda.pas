unit ItemVenda;

interface

uses
  Venda;

type
  TItemVenda = class
  private
    FID: Integer;
    FIdProduto: Integer;
    FQuantidade: Double;
    FPreco: Double;
    FDesconto: Double;
    FIDVenda: Integer;
    FSubtotal: Double;
  public
    //constructor Create;
    constructor Create(const ID: Integer; VendaID: Integer; Desconto: Double;
    IdProduto: Integer; Quantidade: Double; Preco: Double; Subtotal: Double) overload;

    property ID: Integer read FID write FID;
    property IdProduto: Integer read FIdProduto write FIdProduto;
    property Quantidade: Double read FQuantidade write FQuantidade;
    property Preco: Double read FPreco write FPreco;
    property Desconto: Double read FDesconto write FDesconto;
    property IdVenda: Integer read FIDVenda write FIDVenda;
    property Subtotal: Double read FSubtotal write FSubtotal;

  end;

implementation

{ TItemVenda }

constructor TItemVenda.Create(const ID: Integer; VendaID: Integer; Desconto: Double; IdProduto: Integer; Quantidade: Double; Preco: Double; Subtotal: Double);
begin
  FID := ID;
  FIdProduto := IdProduto;
  FQuantidade := Quantidade;
  FPreco := Preco;
  FDesconto := Desconto;
  FIdVenda := VendaID;
  FSubtotal := Subtotal;
end;

{constructor TItemVenda.Create;
begin
  TItemVenda.Create;
end;}

end.
