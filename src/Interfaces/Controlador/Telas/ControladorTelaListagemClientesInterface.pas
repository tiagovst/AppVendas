unit ControladorTelaListagemClientesInterface;

interface

uses
  System.SysUtils;
type
  IControladorTelaListagemClientes = interface
  ['{D39677B0-697B-414E-860E-829EA3189EED}']

  procedure FecharTela;
  procedure ConfigurarEventosBotoes;procedure AcaoBtnExcluirClick(Sender : TObject);
  procedure AcaoBtnEditarClick(Sender : TObject);
  procedure AcaoBtnNovoClienteClick(Sender : TObject);

  end;

implementation

end.
