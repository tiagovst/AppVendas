unit MainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, ComponenteProduto.View,
  FMX.Menus, FMX.ExtCtrls, FMX.ScrollBox, Data.Cloud.CloudAPI,
  Data.Cloud.AzureAPI, FMX.Edit, System.ImageList, FMX.ImgList;

type
  TMainFormView = class(TForm)
    btnAdd: TButton;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    btnInicio: TSpeedButton;
    btnProdutos: TSpeedButton;
    btnEstoque: TSpeedButton;
    btnClientes: TSpeedButton;
    btnUsuarios: TSpeedButton;
    lblCargo: TLabel;
    Rectangle4: TRectangle;
    VertScrollBox1: TVertScrollBox;
    gridProdutos: TGridPanelLayout;
    txtPesquisar: TEdit;
    StyleBook1: TStyleBook;
    lblProdutos: TLabel;
    ImageList1: TImageList;
    Button1: TButton;
    procedure btnAddClick(Sender: TObject);
    //procedure ScrollBar1Change(Sender: TObject);
    //function calcularAlturaItens() : Single;
    //function CalcularItensPorLinha(): Integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainFormView: TMainFormView;

implementation

{$R *.fmx}

procedure TMainFormView.btnAddClick(Sender: TObject);
var
  frame : TFrameProduto;
//  quantidadeItens : Integer;
//  quantidadeLinhas : Integer;
begin
//  quantidadeItens := gridProdutos.ControlsCount + 1;
//  quantidadeLinhas := 1;
//  if quantidadeItens > 1 then
//    begin
//      quantidadeLinhas := quantidadeItens % CalcularItensPorLinha;
//    end;
//  gridProdutos.Height := 369 * quantidadeLinhas;

//
//  btnAdd.Text := CalcularItensPorLinha.ToString;
  frame := TFrameProduto.Create(nil);
  gridProdutos.AddObject(frame);
  gridProdutos.Height := gridProdutos.RowCollection.Count * 389;

end;

//function TMainFormView.calcularAlturaItens: Single;
//var
//  i : Integer;
//  alturaTotal : Single;
//begin
//  alturaTotal := 0;
//  for i := 0 to gridProdutos.ControlsCount - 1 do
//    begin
//      alturaTotal := alturaTotal + gridProdutos.Controls[i].Height;
//    end;
//    Result := alturaTotal;
//end;

//function TMainFormView.CalcularItensPorLinha(): Integer;
//var
//  totalWidth, itemWidth, marginLeft, marginRight: Single;
//  i, itemsInRow: Integer;
//begin
//  totalWidth := gridProdutos.Width;
//  marginLeft := gridProdutos.Margins.Left;
//  marginRight := gridProdutos.Margins.Right;
//  itemWidth := 219 + gridProdutos.Padding.Left + gridProdutos.Padding.Right + gridProdutos.HorizontalGap;
//
//  itemsInRow := 0;
//
//  for i := 1 to gridProdutos.ControlsCount do
//  begin
//    totalWidth := totalWidth - itemWidth;
//
//    if totalWidth >= 0 then
//      Inc(itemsInRow)
//    else
//      Break;
//  end;
//
//  Result := itemsInRow;
//end;

//procedure TMainFormView.ScrollBarChange(Sender: TObject);
//var
//  Offset : Single;
//begin
//  Offset := ScrollBar.Value * (calcularAlturaItens - gridProdutos.Height)/100;
//  gridProdutos.Position.Y := -Offset;
//end;

end.
