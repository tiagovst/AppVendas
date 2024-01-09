unit Vendas.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, frxSmartMemo, frxClass,
  frxDBSet, frCoreClasses, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Conexao;

type
  TTelaVendas = class(TForm)
    pnlConteudo: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Image: TImage;
    pnlBarraTarefas: TPanel;
    Image1: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    Image2: TImage;
    Label3: TLabel;
    Label4: TLabel;
    lblTotalEmVendas: TLabel;
    Label6: TLabel;
    lblQuantidadeItensVendidos: TLabel;
    DBGridVendas: TDBGrid;
    Button1: TButton;
    btnComprarNovamente: TButton;
    DataSourceVendas: TDataSource;
    frxReport: TfrxReport;
    frxDBDataset: TfrxDBDataset;
    FDQuery1: TFDQuery;
    FDQuery1ID: TIntegerField;
    FDQuery1TOTAL_PRODUTOS: TIntegerField;
    FDQuery1TOTAL_PRECO: TSingleField;
    FDQuery1VENDEDOR: TIntegerField;
    FDQuery1DATA_VENDA: TDateField;
    FDQuery1DESCONTO: TIntegerField;
    FDQuery1ID_CLIENTE: TStringField;
    btnImprimir: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaVendas: TTelaVendas;

implementation

{$R *.dfm}

procedure TTelaVendas.Button1Click(Sender: TObject);
begin
  close;
end;

end.
