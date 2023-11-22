unit ItemVenda;

interface

uses
  Venda;

type
  TItemVenda = class(TVenda)
  private
    FIdProduto: Integer;
    FQuantidade: Integer;
    FPreco: Double;
  public
    constructor Create(const IdVenda: Integer; precoTotal: Double;
  desconto: integer; IdProduto: Integer; quantidade: Integer; preco: Double);
    property IdProduto: Integer read FIdProduto write FIdProduto;
    property FQuantidade: Integer read FQuantidade write FQuantidade;
    property FPreco: Double read FPreco write FPreco;
  end;

implementation

{ TItemVenda }

constructor TItemVenda.Create(const IdVenda: Integer; precoTotal: Double;
  desconto: integer; IdProduto: Integer; quantidade: Integer; preco: Double);
begin
  inherited Create(Idvenda, precoTotal, desconto);
  FIdProduto := IdProduto;
  FQuantidade := quantidade;
  FPreco := preco;
end;

end.
