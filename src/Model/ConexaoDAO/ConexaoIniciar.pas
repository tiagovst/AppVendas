unit ConexaoIniciar;

interface

uses
  Conexao,
  System.SysUtils,
  Forms;

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
  varConexao.FDConnection.Params.Values['Database'] := ExtractFilePath(
  Application.ExeName) + '\DataBase\RAZER.FDB';
end;

end.
