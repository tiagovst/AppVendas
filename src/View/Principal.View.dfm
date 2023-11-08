object TelaPrincipal: TTelaPrincipal
  Left = 0
  Top = 0
  Caption = 'TelaPrincipal'
  ClientHeight = 643
  ClientWidth = 1112
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlBarraLateral: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 643
    Align = alLeft
    TabOrder = 0
    object pnlLogo: TPanel
      Left = 1
      Top = 1
      Width = 183
      Height = 41
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 16
      ExplicitWidth = 185
    end
    object GroupBox1: TGroupBox
      Left = 7
      Top = 128
      Width = 172
      Height = 209
      Caption = 'P'#225'gina do Administrador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object btnInicio: TButton
        Left = 9
        Top = 32
        Width = 152
        Height = 25
        Caption = 'In'#237'cio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object btnProdutos: TButton
        Left = 9
        Top = 63
        Width = 152
        Height = 25
        Caption = 'Produtos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object btnClientes: TButton
        Left = 9
        Top = 94
        Width = 152
        Height = 25
        Caption = 'Clientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object btnUsuarios: TButton
        Left = 9
        Top = 156
        Width = 152
        Height = 25
        Caption = 'Usu'#225'rios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object btnEstoque: TButton
        Left = 9
        Top = 125
        Width = 152
        Height = 25
        Caption = 'Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
    end
    object pnlUsuarioLogado: TPanel
      Left = 1
      Top = 601
      Width = 183
      Height = 41
      Align = alBottom
      TabOrder = 2
      ExplicitLeft = 40
      ExplicitTop = 600
      ExplicitWidth = 185
    end
  end
  object pnlConteudo: TPanel
    Left = 185
    Top = 0
    Width = 927
    Height = 643
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 616
    ExplicitTop = 360
    ExplicitWidth = 185
    ExplicitHeight = 41
    DesignSize = (
      927
      643)
    object Label1: TLabel
      Left = 40
      Top = 117
      Width = 107
      Height = 37
      Caption = 'Produtos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object pnlPesquisa: TPanel
      Left = 1
      Top = 1
      Width = 925
      Height = 41
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 280
      ExplicitTop = 32
      ExplicitWidth = 185
      DesignSize = (
        925
        41)
      object SearchBox1: TSearchBox
        Left = 312
        Top = 10
        Width = 313
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        TextHint = 'Pesquisar produto'
      end
    end
    object DBGrid1: TDBGrid
      Left = 40
      Top = 160
      Width = 849
      Height = 483
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object btnFinalizarCompra: TButton
      Left = 776
      Top = 129
      Width = 115
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Finalizar Compra'
      TabOrder = 2
    end
  end
end
