unit ControladorTelaManejoCliente;

interface

uses
  Vcl.Dialogs,
  Vcl.ActnList,
  Vcl.Controls,
  System.SysUtils,
  ControladorTelaManejoClienteInterface,
  ManejoCliente.View,
  ControladorClienteDAO,
  ControladorClienteDAOInterface,
  Cliente;

type
  TControladorTelaManejoCliente = class(TInterfacedObject, IControladorTelaManejoCliente)
  private
    FTelaManejoCliente : TTelaManejoCliente;
    uCliente: TCliente;
    uControladorClienteDAO: IControladorClienteDAO;

    AcaoBtnSalvar, AcaoBtnCancelar, AcaoRbCPF, AcaoRbCNPJ: TAction;

    procedure PreencherCliente;
    procedure FecharTela;

    procedure AcaoBtnCancelarClick(Sender: TObject);
    procedure AcaoBtnSalvarClick(Sender: TObject);
    procedure AcaoRbCPFClick(Sender: TObject);
    procedure AcaoRbCNPJClick(Sender: TObject);
  public
    constructor Create(Parent: TWinControl) overload;
  end;


implementation

{ TControladorTelaManejoCliente }

constructor TControladorTelaManejoCliente.Create(Parent: TWinControl);
begin
  uControladorClienteDAO := TControladorClienteDAO.Create;

  FTelaManejoCliente := TTelaManejoCliente.Create(nil);
  FTelaManejoCliente.Parent := Parent;
  FTelaManejoCliente.Align := AlClient;

  AcaoBtnSalvar := TAction.Create(nil);
  AcaoBtnSalvar.Caption := 'Salvar';
  AcaoBtnSalvar.OnExecute := AcaoBtnSalvarClick;
  FTelaManejoCliente.btnSalvar.Action := AcaoBtnSalvar;

  AcaoBtnCancelar := TAction.Create(nil);
  AcaoBtnCancelar.Caption := 'Cancelar';
  AcaoBtnCancelar.OnExecute := AcaoBtnCancelarClick;
  FTelaManejoCliente.btnCancelar.Action := AcaoBtnCancelar;

  AcaoRbCPF := TAction.Create(nil);
  AcaoRbCPF.Caption := 'CPF';
  AcaoRbCPF.OnExecute := AcaoRbCPFClick;
  FTelaManejoCliente.rbCPF.Action := AcaoRbCPF;
  FTelaManejoCliente.rbCPF.Checked := True;

  AcaoRbCNPJ := TAction.Create(nil);
  AcaoRbCNPJ.Caption := 'CNPJ';
  AcaoRbCNPJ.OnExecute := AcaoRbCNPJClick;
  FTelaManejoCliente.rbCNPJ.Action := AcaoRbCNPJ;

  FTelaManejoCliente.Show;
end;

procedure TControladorTelaManejoCliente.FecharTela;
begin
  FTelaManejoCliente.Close;
end;

procedure TControladorTelaManejoCliente.PreencherCliente;
begin
  uCliente := TCliente.Create;
  with FTelaManejoCliente, uCliente do
  begin
    Identificador := txtIdentificador.Text;
    Nome := txtNome.Text;
    Endereco := txtEndereco.Text;
    Telefone := txtTelefone.Text;
  end;
end;

procedure TControladorTelaManejoCliente.AcaoBtnCancelarClick(Sender: TObject);
begin
  FecharTela;
end;

procedure TControladorTelaManejoCliente.AcaoBtnSalvarClick(Sender: TObject);
var
  erro: String;
begin
  PreencherCliente;
  if uControladorClienteDAO.Inserir(uCliente, erro) then
  begin
    ShowMessage('Cliente cadastrado com sucesso!');
  end
  else
  begin
    ShowMessage('Não foi possível cadastrar o cliente ' + erro);
  end;

end;

procedure TControladorTelaManejoCliente.AcaoRbCNPJClick(Sender: TObject);
begin
  FTelaManejoCliente.txtIdentificador.EditMask := '00.000.000/0000-00';
end;

procedure TControladorTelaManejoCliente.AcaoRbCPFClick(Sender: TObject);
begin
  FTelaManejoCliente.txtIdentificador.EditMask := '000.000.000-00';
end;

end.
