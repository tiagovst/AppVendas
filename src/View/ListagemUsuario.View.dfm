object TelaListagemUsuario: TTelaListagemUsuario
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Listagem de Usuarios'
  ClientHeight = 643
  ClientWidth = 927
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnShow = FormShow
  TextHeight = 15
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 927
    Height = 643
    Align = alClient
    TabOrder = 0
    object Top: TPanel
      Left = 1
      Top = 1
      Width = 925
      Height = 56
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        925
        56)
      object scPesquisa: TSearchBox
        Left = 246
        Top = 16
        Width = 433
        Height = 25
        Anchors = [akTop, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'Pesquisar Usu'#225'rio'
      end
      object btnVoltar: TButton
        Left = 8
        Top = 5
        Width = 41
        Height = 41
        Caption = #8592
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -33
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnVoltarClick
      end
    end
    object client: TPanel
      Left = 1
      Top = 57
      Width = 925
      Height = 585
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        925
        585)
      object Label1: TLabel
        Left = 216
        Top = 34
        Width = 102
        Height = 37
        Caption = 'Usuarios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object gridProdutos: TDBGrid
        Left = 216
        Top = 77
        Width = 677
        Height = 506
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsUsuario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -27
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object gboxAcoes: TGroupBox
        Left = 0
        Top = 64
        Width = 176
        Height = 535
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'A'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Button2: TButton
          Left = 8
          Top = 32
          Width = 158
          Height = 25
          Caption = 'Modificar'
          TabOrder = 0
        end
        object Button3: TButton
          Left = 8
          Top = 70
          Width = 158
          Height = 25
          Caption = 'Excluir'
          TabOrder = 1
        end
      end
    end
  end
  object dsUsuario: TDataSource
    Left = 800
    Top = 152
  end
end
