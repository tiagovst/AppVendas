unit Cliente;

interface

uses
  System.SysUtils;
type
  TCliente = class
  private
    FIdentificador, FTelefone, FEndereco, FNome : String;

  public
    property Identificador: String read FIdentificador write FIdentificador;
    property Telefone: String read FTelefone write FTelefone;
    property Endereco: String read FEndereco write FEndereco;
    property Nome: String read FNome write FNome;

  end;

implementation

end.
