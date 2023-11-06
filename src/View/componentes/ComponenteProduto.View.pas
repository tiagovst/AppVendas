unit ComponenteProduto.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts, FMX.Edit, FMX.Controls.Presentation;

type
  TFrameProduto = class(TFrame)
    rctContent: TRectangle;
    Rectangle2: TRectangle;
    Layout1: TLayout;
    lblProduto: TLabel;
    lblValorUnitario: TLabel;
    btnRemover: TSpeedButton;
    txtQuantidade: TEdit;
    btnAdicionar: TSpeedButton;
    ImagemProduto: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
