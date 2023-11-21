object TelaCheckout: TTelaCheckout
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Checkout'
  ClientHeight = 544
  ClientWidth = 1097
  Color = clBtnFace
  DockSite = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  TextHeight = 15
  object pnlConteudo: TPanel
    Left = 0
    Top = 96
    Width = 1097
    Height = 407
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 1093
    ExplicitHeight = 406
    DesignSize = (
      1097
      407)
    object Label1: TLabel
      Left = 48
      Top = 76
      Width = 72
      Height = 23
      Caption = 'Produtos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ProdutosGrid: TStringGrid
      Left = 48
      Top = 112
      Width = 997
      Height = 289
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clBtnFace
      FixedCols = 0
      ScrollBars = ssVertical
      TabOrder = 0
      ExplicitWidth = 993
      ExplicitHeight = 288
    end
    object btnLimpar: TButton
      Left = 970
      Top = 74
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Limpar'
      TabOrder = 1
      ExplicitLeft = 966
    end
    object btnDeletar: TButton
      Left = 889
      Top = 74
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Deletar'
      TabOrder = 2
      ExplicitLeft = 885
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 503
    Width = 1097
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 502
    ExplicitWidth = 1093
    DesignSize = (
      1097
      41)
    object btnFinalizar: TButton
      Left = 1002
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Finalizar'
      TabOrder = 0
      OnClick = btnFinalizarClick
      ExplicitLeft = 998
    end
    object btnCancelar: TButton
      Left = 916
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
      ExplicitLeft = 912
    end
  end
  object pnpTop: TPanel
    Left = 0
    Top = 0
    Width = 1097
    Height = 96
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 1093
    object Label2: TLabel
      Left = 48
      Top = 40
      Width = 257
      Height = 30
      AutoSize = False
      Caption = 'Resumo da compra'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 48
      Top = 24
      Width = 209
      Height = 17
      AutoSize = False
      Caption = 'Revise os produtos da sua compra'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
end
