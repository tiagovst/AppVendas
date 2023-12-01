unit ControladorTelaManejoUsuario;

interface

uses
  ManejoUsuario.View,
  System.SysUtils,
  ControladorTelaManejoUsuarioInterface,
  Vcl.Controls;

type
  TControladorTelaManejoUsuario = class(TInterfacedObject, IControladorTelaManejoUsuario)
  private
    FManejoUsuario : TTelaManejoUsuario;
    procedure MostrarTela;
    procedure FecharTela;
  public
    constructor Create(Parent: TWinControl);

  end;

implementation

{ TControladorTelaManejoUsuario }

constructor TControladorTelaManejoUsuario.Create(Parent: TWinControl);
begin
  FManejoUsuario := TTelaManejoUsuario.Create(nil);
  FManejoUsuario.Parent := Parent;
  FManejoUsuario.Align := AlClient;

  MostrarTela;
end;

procedure TControladorTelaManejoUsuario.FecharTela;
begin
  FManejoUsuario.Close;
end;

procedure TControladorTelaManejoUsuario.MostrarTela;
begin
  FManejoUsuario.Show;
end;

end.
