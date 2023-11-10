object TelaPrincipal: TTelaPrincipal
  Left = 0
  Top = 0
  Caption = 'App Vendas'
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
    ExplicitHeight = 634
    object pnlLogo: TPanel
      Left = 1
      Top = 1
      Width = 183
      Height = 41
      Align = alTop
      TabOrder = 0
    end
    object GroupBox: TGroupBox
      Left = 7
      Top = 128
      Width = 172
      Height = 209
      Caption = 'P'#225'gina do Administrador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
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
        Font.Height = -13
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
        Font.Height = -13
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
        Font.Height = -13
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
        Font.Height = -13
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
        Font.Height = -13
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
      ExplicitTop = 592
    end
  end
  object pnlConteudo: TPanel
    Left = 185
    Top = 0
    Width = 927
    Height = 643
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 921
    ExplicitHeight = 634
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
      ExplicitWidth = 919
      DesignSize = (
        925
        41)
      object SearchBox: TSearchBox
        Left = 312
        Top = 10
        Width = 313
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        TextHint = 'Pesquisar produto'
        ExplicitWidth = 307
      end
    end
    object GridProdutos: TDBGrid
      Left = 40
      Top = 160
      Width = 843
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
      Left = 768
      Top = 129
      Width = 115
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Finalizar Compra'
      TabOrder = 2
    end
  end
end
