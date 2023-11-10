object ListagemUsuario: TListagemUsuario
  Left = 0
  Top = 0
  Caption = 'Listagem de Usuarios'
  ClientHeight = 605
  ClientWidth = 915
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  TextHeight = 15
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 915
    Height = 605
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 911
    ExplicitHeight = 604
    object Top: TPanel
      Left = 1
      Top = 1
      Width = 913
      Height = 56
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 909
      DesignSize = (
        913
        56)
      object scPesquisa: TSearchBox
        Left = 240
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
    end
    object client: TPanel
      Left = 1
      Top = 57
      Width = 913
      Height = 547
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitWidth = 909
      ExplicitHeight = 546
      DesignSize = (
        913
        547)
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
      object gridUsuario: TDBGrid
        Left = 216
        Top = 77
        Width = 665
        Height = 468
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsUsuario
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
        Height = 497
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'A'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Button1: TButton
          Left = 7
          Top = 40
          Width = 158
          Height = 25
          Caption = 'Adicionar'
          TabOrder = 0
        end
        object Button2: TButton
          Left = 7
          Top = 80
          Width = 158
          Height = 25
          Caption = 'Modificar'
          TabOrder = 1
        end
        object Button3: TButton
          Left = 7
          Top = 118
          Width = 158
          Height = 25
          Caption = 'Excluir'
          TabOrder = 2
        end
      end
    end
  end
  object dsUsuario: TDataSource
    Left = 800
    Top = 152
  end
end
