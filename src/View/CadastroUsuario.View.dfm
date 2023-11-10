object TelaCadastroUsuario: TTelaCadastroUsuario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Usu'#225'rio'
  ClientHeight = 428
  ClientWidth = 730
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 730
    Height = 386
    Align = alClient
    TabOrder = 0
    object PanelTop: TPanel
      Left = 1
      Top = 1
      Width = 728
      Height = 64
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 724
      DesignSize = (
        728
        64)
      object Label2: TLabel
        Left = 20
        Top = 18
        Width = 176
        Height = 25
        Caption = 'Manejo de Usuarios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 516
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
        ExplicitLeft = 488
      end
      object btnTelaPrincipal: TButton
        Left = 676
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
        ExplicitLeft = 672
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 65
      Width = 728
      Height = 320
      Align = alClient
      Caption = 'Informa'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitWidth = 724
      ExplicitHeight = 319
      DesignSize = (
        728
        320)
      object LabelCargo: TLabel
        Left = 20
        Top = 240
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
      object Label1: TLabel
        Left = 100
        Top = 380
        Width = 46
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Label1'
      end
      object radioAdm: TRadioButton
        Left = 20
        Top = 261
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
        TabOrder = 0
        TabStop = True
      end
      object radioEstoque: TRadioButton
        Left = 308
        Top = 261
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
        Top = 261
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
        Left = 410
        Top = 184
        Width = 299
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
        EditMask = '000.000.000-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 14
        ParentFont = False
        TabOrder = 3
        Text = '   .   .   -  '
        ExplicitLeft = 406
      end
      object editEmail: TLabeledEdit
        Left = 410
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
        ExplicitLeft = 406
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
        Width = 290
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
        EditMask = '!\(99\) 0 0000-0000;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 16
        ParentFont = False
        TabOrder = 7
        Text = '(  )       -    '
      end
      object editUsuario: TLabeledEdit
        Left = 410
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
        ExplicitLeft = 406
      end
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 386
    Width = 730
    Height = 42
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 385
    ExplicitWidth = 726
    DesignSize = (
      730
      42)
    object btnListar: TButton
      Left = 517
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Listar'
      TabOrder = 0
      OnClick = btnListarClick
      ExplicitLeft = 513
    end
    object btnSalvar: TButton
      Left = 610
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = btnSalvarClick
      ExplicitLeft = 606
    end
  end
end
