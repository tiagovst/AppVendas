unit ControladorTelaListagemUsuario;

interface

uses
  ListagemUsuario.View,
  System.SysUtils,
  ControladorTelaListagemUsuarioInterface,
  Vcl.Controls;

type
  TControladorTelaListagemUsuario = class(TInterfacedObject, IControladorTelaListagemUsuario)
  private
    FListagemUsuario : TTelaListagemUsuario;
    procedure MostrarTela;
    procedure FecharTela;
  public
    constructor Create(Parent: TWinControl);
  end;

implementation

{ TControladorTelaManejoUsuario }

constructor TControladorTelaListagemUsuario.Create(Parent: TWinControl);
begin
  FListagemUsuario := TTelaListagemUsuario.Create(nil);
  FListagemUsuario.Parent := Parent;
  FListagemUsuario.Align := AlClient;

  MostrarTela;
end;

procedure TControladorTelaListagemUsuario.FecharTela;
begin
  FListagemUsuario.Close;
end;

procedure TControladorTelaListagemUsuario.MostrarTela;
begin
  FListagemUsuario.Show;
end;

end.
