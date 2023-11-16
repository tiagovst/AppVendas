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
  WindowState = wsMaximized
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
    object pnlUsuarioLogado: TPanel
      Left = 1
      Top = 601
      Width = 183
      Height = 41
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 592
    end
    object pnlBotoes: TPanel
      Left = 0
      Top = 96
      Width = 185
      Height = 193
      BevelOuter = bvNone
      TabOrder = 2
      object btnClientes: TSpeedButton
        Left = 0
        Top = 74
        Width = 185
        Height = 37
        Align = alTop
        Caption = 'Clientes'
        Flat = True
        StyleName = 'Windows'
        OnClick = onClick
        ExplicitLeft = -3
        ExplicitTop = 65
        ExplicitWidth = 183
      end
      object btnEstoque: TSpeedButton
        Left = 0
        Top = 111
        Width = 185
        Height = 37
        Align = alTop
        Caption = 'Estoque'
        Flat = True
        StyleName = 'Windows'
        ExplicitLeft = 1
        ExplicitTop = 153
        ExplicitWidth = 183
      end
      object btnInicio: TSpeedButton
        Left = 0
        Top = 0
        Width = 185
        Height = 37
        Align = alTop
        Caption = 'In'#237'cio'
        Flat = True
        StyleName = 'Windows'
        ExplicitLeft = -3
        ExplicitTop = -5
        ExplicitWidth = 183
      end
      object btnProdutos: TSpeedButton
        Left = 0
        Top = 37
        Width = 185
        Height = 37
        Align = alTop
        Caption = 'Produtos'
        Flat = True
        StyleName = 'Windows'
        OnClick = onClick
        ExplicitLeft = 2
        ExplicitTop = 32
        ExplicitWidth = 183
      end
      object btnUsuarios: TSpeedButton
        Left = 0
        Top = 148
        Width = 185
        Height = 37
        Align = alTop
        Caption = 'Usu'#225'rios'
        Flat = True
        StyleName = 'Windows'
        ExplicitLeft = 1
        ExplicitTop = 190
        ExplicitWidth = 183
      end
    end
  end
  object pnlConteudo: TPanel
    Left = 185
    Top = 0
    Width = 927
    Height = 643
    Align = alClient
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 921
    ExplicitHeight = 634
    DesignSize = (
      927
      643)
    object Label1: TLabel
      Left = 40
      Top = 96
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
      Left = 0
      Top = 0
      Width = 927
      Height = 41
      Align = alTop
      TabOrder = 0
      DesignSize = (
        927
        41)
      object SearchBox: TSearchBox
        Left = 312
        Top = 10
        Width = 315
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        TextHint = 'Pesquisar produto'
        ExplicitWidth = 309
      end
    end
    object GridProdutos: TDBGrid
      Left = 40
      Top = 139
      Width = 837
      Height = 504
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object btnFinalizarCompra: TButton
      Left = 762
      Top = 96
      Width = 115
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Finalizar Compra'
      TabOrder = 2
    end
    object pnlSubmenuProdutos: TPanel
      Left = 0
      Top = 134
      Width = 183
      Height = 114
      BevelKind = bkFlat
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 3
      Visible = False
      object btnVerProdutos: TSpeedButton
        Left = 0
        Top = 0
        Width = 179
        Height = 37
        Align = alTop
        Caption = 'Ver meus produtos'
        Flat = True
        ExplicitLeft = 2
        ExplicitTop = 9
        ExplicitWidth = 181
      end
      object btnCadastrarProduto: TSpeedButton
        Left = 0
        Top = 37
        Width = 179
        Height = 37
        Align = alTop
        Caption = 'Cadastrar novo produto'
        Flat = True
        OnClick = btnCadastrarProdutoClick
        ExplicitLeft = 1
        ExplicitTop = 79
        ExplicitWidth = 183
      end
      object btnEditarExcluirProduto: TSpeedButton
        Left = 0
        Top = 74
        Width = 179
        Height = 37
        Align = alTop
        Caption = 'Editar/excluir produto'
        Flat = True
        ExplicitLeft = 1
        ExplicitTop = 79
        ExplicitWidth = 183
      end
    end
    object pnlSubmenuClientes: TPanel
      Left = 0
      Top = 171
      Width = 183
      Height = 114
      BevelKind = bkFlat
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 4
      Visible = False
      object btnVerClientes: TSpeedButton
        Left = 0
        Top = 0
        Width = 179
        Height = 37
        Align = alTop
        Caption = 'Ver meus clientes'
        Flat = True
        StyleName = 'Windows'
        ExplicitLeft = 2
        ExplicitTop = 9
        ExplicitWidth = 181
      end
      object btnCadastrarCliente: TSpeedButton
        Left = 0
        Top = 37
        Width = 179
        Height = 37
        Align = alTop
        Caption = 'Cadastrar novo cliente'
        Flat = True
        StyleName = 'Windows'
        ExplicitLeft = 1
        ExplicitTop = 116
        ExplicitWidth = 183
      end
      object btnEditarExcluirCliente: TSpeedButton
        Left = 0
        Top = 74
        Width = 179
        Height = 37
        Align = alTop
        Caption = 'Editar/excluir cliente'
        Flat = True
        StyleName = 'Windows'
        ExplicitLeft = 1
        ExplicitTop = 116
        ExplicitWidth = 183
      end
    end
  end
end
