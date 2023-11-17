object TelaManejoUsuario: TTelaManejoUsuario
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Manejo de Usuarios'
  ClientHeight = 558
  ClientWidth = 747
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 747
    Height = 65
    Align = alTop
    TabOrder = 0
    object LabelTitulo: TLabel
      Left = 40
      Top = 16
      Width = 212
      Height = 31
      Caption = 'Manejo de Usu'#225'rios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlCenter: TPanel
    Left = 0
    Top = 65
    Width = 747
    Height = 453
    Align = alClient
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 745
      Height = 451
      Align = alClient
      Caption = 'Dados Cadastrais'
      DefaultHeaderFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -17
      HeaderFont.Name = 'Segoe UI'
      HeaderFont.Style = []
      ParentFont = False
      TabOrder = 0
      object Label2: TLabel
        Left = 39
        Top = 264
        Width = 46
        Height = 23
        Caption = 'Cargo'
      end
      object lblNome: TLabeledEdit
        Left = 39
        Top = 60
        Width = 220
        Height = 25
        EditLabel.Width = 97
        EditLabel.Height = 17
        EditLabel.Caption = 'Nome Completo'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = ''
      end
      object lblEmail: TLabeledEdit
        Left = 391
        Top = 60
        Width = 220
        Height = 25
        EditLabel.Width = 31
        EditLabel.Height = 17
        EditLabel.Caption = 'Email'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = ''
      end
      object lblSenha: TLabeledEdit
        Left = 39
        Top = 120
        Width = 220
        Height = 25
        EditLabel.Width = 35
        EditLabel.Height = 17
        EditLabel.Caption = 'Senha'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Text = ''
      end
      object lblUsuario: TLabeledEdit
        Left = 392
        Top = 120
        Width = 220
        Height = 25
        EditLabel.Width = 104
        EditLabel.Height = 17
        EditLabel.Caption = 'Nome de Usuario'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Text = ''
      end
      object lblTelefone: TLabeledEdit
        Left = 39
        Top = 184
        Width = 220
        Height = 25
        EditLabel.Width = 49
        EditLabel.Height = 17
        EditLabel.Caption = 'Telefone'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        EditMask = '!\(99\)00000-0000;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 14
        NumbersOnly = True
        ParentFont = False
        TabOrder = 4
        Text = '(  )     -    '
      end
      object lblCPF: TLabeledEdit
        Left = 392
        Top = 184
        Width = 219
        Height = 25
        EditLabel.Width = 21
        EditLabel.Height = 17
        EditLabel.Caption = 'CPF'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        EditMask = '000.000.000-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 14
        NumbersOnly = True
        ParentFont = False
        TabOrder = 5
        Text = '   .   .   -  '
      end
      object rbAdm: TRadioButton
        Left = 39
        Top = 311
        Width = 113
        Height = 17
        Caption = 'Administrador'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        TabStop = True
      end
      object rbVendedor: TRadioButton
        Left = 176
        Top = 311
        Width = 113
        Height = 17
        Caption = 'Vendedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object rbGestor: TRadioButton
        Left = 295
        Top = 312
        Width = 146
        Height = 17
        Caption = 'Gestor de Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 518
    Width = 747
    Height = 40
    Align = alBottom
    TabOrder = 2
    object btnCancelar: TButton
      Left = 552
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 0
    end
    object btnSalvar: TButton
      Left = 653
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 1
    end
  end
end
