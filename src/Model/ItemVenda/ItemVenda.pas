unit ItemVenda;

interface

uses
  Venda;

type
  TItemVenda = class
  private
    FIdProduto: Integer;
    FQuantidade: Integer;
    FPreco: Double;
    FDesconto: Integer;
    FIDVenda: Integer;
    FSubtotal: Double;
  public
    constructor Create(const VendaID: Integer; Desconto: Integer; IdProduto: Integer; Quantidade: Integer; Preco: Double; Subtotal: Double);

    property IdProduto: Integer read FIdProduto write FIdProduto;
    property Quantidade: Integer read FQuantidade write FQuantidade;
    property Preco: Double read FPreco write FPreco;
    property Desconto: Integer read FDesconto write FDesconto;
    property IdVenda: Integer read FIDVenda write FIDVenda;
    property Subtotal: Double read FSubtotal write FSubtotal;

  end;

implementation

{ TItemVenda }

constructor TItemVenda.Create(const VendaID: Integer; Desconto: Integer; IdProduto: Integer; Quantidade: Integer; Preco: Double; Subtotal: Double);
begin
  FIdProduto := IdProduto;
  FQuantidade := Quantidade;
  FPreco := Preco;
  FDesconto := Desconto;
  FIdVenda := VendaID;
  FSubtotal := Subtotal;
end;

end.
