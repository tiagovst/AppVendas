object TelaCadastroUsuario: TTelaCadastroUsuario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Usu'#225'rio'
  ClientHeight = 432
  ClientWidth = 708
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  Scaled = False
  TextHeight = 15
  object PanelBack: TPanel
    Left = 0
    Top = 0
    Width = 708
    Height = 390
    Align = alClient
    TabOrder = 0
    ExplicitTop = 3
    ExplicitWidth = 710
    ExplicitHeight = 429
    object PanelTop: TPanel
      Left = 1
      Top = 1
      Width = 706
      Height = 64
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 651
      DesignSize = (
        706
        64)
      object Label2: TLabel
        Left = 20
        Top = 18
        Width = 211
        Height = 25
        Caption = 'Adicionar novo Usuario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 488
        Top = 23
        Width = 142
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Retornar '#224' Tela Principal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object btnTelaPrincipal: TButton
        Left = 648
        Top = 12
        Width = 42
        Height = 41
        Anchors = [akTop, akRight]
        Caption = #8592
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 65
      Width = 706
      Height = 324
      Align = alClient
      Caption = 'Informa'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 21
      ExplicitTop = 71
      ExplicitWidth = 185
      ExplicitHeight = 105
      DesignSize = (
        706
        324)
      object LabelCargo: TLabel
        Left = 20
        Top = 224
        Width = 36
        Height = 17
        Caption = 'Cargo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object radioAdm: TRadioButton
        Left = 20
        Top = 245
        Width = 113
        Height = 17
        Caption = 'Administrador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object radioEstoque: TRadioButton
        Left = 308
        Top = 245
        Width = 140
        Height = 17
        Caption = 'Gestor de Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object radioVendedor: TRadioButton
        Left = 180
        Top = 245
        Width = 113
        Height = 17
        Caption = 'Vendedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object editCPF: TLabeledEdit
        Left = 388
        Top = 184
        Width = 300
        Height = 25
        Anchors = [akTop, akRight]
        EditLabel.Width = 20
        EditLabel.Height = 15
        EditLabel.Caption = 'CPF'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -12
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = [fsBold]
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
      object editEmail: TLabeledEdit
        Left = 388
        Top = 72
        Width = 300
        Height = 25
        Anchors = [akTop, akRight]
        EditLabel.Width = 29
        EditLabel.Height = 15
        EditLabel.Caption = 'Email'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -12
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Text = ''
      end
      object editNome: TLabeledEdit
        Left = 20
        Top = 72
        Width = 300
        Height = 25
        EditLabel.Width = 91
        EditLabel.Height = 15
        EditLabel.Caption = 'Nome Completo'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -12
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Text = ''
      end
      object editSenha: TLabeledEdit
        Left = 20
        Top = 128
        Width = 300
        Height = 25
        EditLabel.Width = 34
        EditLabel.Height = 15
        EditLabel.Caption = 'Senha'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -12
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        Text = ''
      end
      object editTelefone: TLabeledEdit
        Left = 20
        Top = 184
        Width = 300
        Height = 25
        EditLabel.Width = 115
        EditLabel.Height = 15
        EditLabel.Caption = 'N'#250'mero de Telefone'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -12
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        Text = ''
      end
      object editUsuario: TLabeledEdit
        Left = 388
        Top = 128
        Width = 300
        Height = 25
        Anchors = [akTop, akRight]
        EditLabel.Width = 96
        EditLabel.Height = 15
        EditLabel.Caption = 'Nome de Usuario'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -12
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        Text = ''
      end
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 390
    Width = 708
    Height = 42
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 424
    ExplicitWidth = 710
    DesignSize = (
      708
      42)
    object btnListar: TButton
      Left = 519
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Listar'
      TabOrder = 0
      ExplicitLeft = 521
    end
    object btnSalvar: TButton
      Left = 614
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Salvar'
      TabOrder = 1
      ExplicitLeft = 616
    end
  end
end
