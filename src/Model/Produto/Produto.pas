unit Produto;

interface

uses
  System.SysUtils;

type
  TProduto = class
  private
    FID: Integer;
    FNome: String;
    FCodigoBarras: String;
    FDescricao: String;
    FReferencia: String;
    FPreco: Double;
    FCategoria : String;
    FQuantidadeEstoque: Integer;
    FFornecedor: String;
    FDataValidade: TDate;

  public
//    constructor Create(const CID: Integer; CNome: String; CCodigoBarras: String;
//     CDescricao: String; CReferencia: String; CPreco: Double; CFornecedor: String;
//     CDataValidade: TDate; CCategoria: String; CQuantidadeEstoque: Integer) overload;

    property ID: Integer read FID write FID;
    property Nome: String read FNome write FNome;
    property CodigoBarras: String read FCodigoBarras write FCodigoBarras;
    property Descricao: String read FDescricao write FDescricao;
    property Referencia: String read FReferencia write FReferencia;
    property Preco: Double read FPreco write FPreco;
    property Categoria: String read FCategoria write FCategoria;
    property QuantidadeEstoque: Integer read FQuantidadeEstoque write FQuantidadeEstoque;
    property Fornecedor: String read FFornecedor write FFornecedor;
    property DataValidade: TDate read FDataValidade write FDataValidade;

  end;

implementation

{ TProduto }

end.
