object TelaEstoque: TTelaEstoque
  Left = 0
  Top = 0
  Caption = 'Meu Estoque'
  ClientHeight = 569
  ClientWidth = 1115
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 1115
    Height = 96
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 1109
    object Label1: TLabel
      Left = 88
      Top = 40
      Width = 89
      Height = 30
      AutoSize = False
      Caption = 'Estoque'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 88
      Top = 24
      Width = 146
      Height = 17
      AutoSize = False
      Caption = 'Retornar '#224' Tela Principal '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnVoltar: TButton
      Left = 41
      Top = 24
      Width = 41
      Height = 41
      Caption = #8592
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -33
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 96
    Width = 1115
    Height = 473
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 1109
    ExplicitHeight = 464
    DesignSize = (
      1115
      473)
    object Label3: TLabel
      Left = 41
      Top = 120
      Width = 98
      Height = 31
      Caption = 'Produtos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 41
      Top = 160
      Width = 1024
      Height = 313
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object GroupBox1: TGroupBox
      Left = 41
      Top = 24
      Width = 185
      Height = 73
      Caption = 'Total em estoque:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object lblTotalEstoque: TLabel
        Left = 72
        Top = 32
        Width = 40
        Height = 23
        Caption = '0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object GroupBox2: TGroupBox
      Left = 297
      Top = 24
      Width = 400
      Height = 73
      Caption = 'Filtrar por:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
end
