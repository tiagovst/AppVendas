unit Usuario;

interface

uses
  System.SysUtils;

type
  TUsuario = class
 private
    FID: Integer;
    FNome: String;
    FEmail: String;
    FSenha: String;
    FCargo: String;
    FTelefone: String;
    FCPF: String;
    FNomeUsuario: String;
  public
    property ID: Integer read FID write FID;
    property Nome: String read FNome write FNome;
    property Email: String read FEmail write FEmail;
    property Senha: String read FSenha write FSenha;
    property Cargo: String read FCargo write FCargo;
    property Telefone: String read FTelefone write FTelefone;
    property CPF: String read FCPF write FCPF;
    property NomeUsuario: String read FNomeUsuario write FNomeUsuario;

  end;

implementation

{ TUsuario }

end.
