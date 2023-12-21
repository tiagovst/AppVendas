unit ConexaoIniciar;

interface

uses
  Conexao;

type
  TConexaoIniciar = class
  public
    class var
      varConexao: TdmConexao;
    class procedure CriarConexao;
  end;
implementation

{ TConexaoIniciar }

class procedure TConexaoIniciar.CriarConexao;
begin
  varConexao := TdmConexao.Create(nil);
end;

end.
