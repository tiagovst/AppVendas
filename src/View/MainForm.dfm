object MainView: TMainView
  Left = 0
  Top = 0
  Align = alClient
  AutoSize = True
  Caption = 'App Vendas'
  ClientHeight = 520
  ClientWidth = 909
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDefault
  PrintScale = poNone
  Visible = True
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 200
    Height = 520
    Align = alLeft
    Color = 16381170
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = -6
    object Label1: TLabel
      Left = 0
      Top = 104
      Width = 132
      Height = 15
      Caption = 'P'#225'gina do Administrador'
    end
    object Panel3: TPanel
      Left = 0
      Top = 136
      Width = 200
      Height = 153
      TabOrder = 0
      object Button2: TButton
        Left = 0
        Top = 0
        Width = 200
        Height = 25
        Caption = 'Button2'
        TabOrder = 0
      end
      object Button3: TButton
        Left = 0
        Top = 31
        Width = 200
        Height = 25
        Caption = 'Button3'
        TabOrder = 1
      end
      object Button4: TButton
        Left = 0
        Top = 62
        Width = 200
        Height = 25
        Caption = 'Button4'
        TabOrder = 2
      end
      object Button5: TButton
        Left = 0
        Top = 93
        Width = 200
        Height = 25
        Caption = 'Button5'
        TabOrder = 3
      end
      object Button6: TButton
        Left = 0
        Top = 124
        Width = 200
        Height = 25
        Caption = 'Button6'
        TabOrder = 4
      end
    end
  end
  object Panel2: TPanel
    Left = 200
    Top = 0
    Width = 709
    Height = 520
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 280
    ExplicitWidth = 889
    ExplicitHeight = 785
    DesignSize = (
      709
      520)
    object Button1: TButton
      Left = 647
      Top = 464
      Width = 40
      Height = 40
      Anchors = [akRight, akBottom]
      Caption = 'Button1'
      TabOrder = 0
      ExplicitLeft = 624
    end
  end
end
