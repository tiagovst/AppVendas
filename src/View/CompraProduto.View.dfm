object TelaAdicionarProduto: TTelaAdicionarProduto
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Adicionar produto'
  ClientHeight = 556
  ClientWidth = 905
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object pnlRodape: TPanel
    Left = 0
    Top = 515
    Width = 905
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 514
    ExplicitWidth = 901
    object btnAdicionarCompra: TButton
      Left = 820
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Adicionar'
      TabOrder = 0
      OnClick = btnAdicionarCompraClick
    end
  end
  object pnlConteudo: TPanel
    Left = 0
    Top = 41
    Width = 905
    Height = 474
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 901
    ExplicitHeight = 473
    object gboxInformacoes: TGroupBox
      AlignWithMargins = True
      Left = 25
      Top = 43
      Width = 384
      Height = 166
      BiDiMode = bdLeftToRight
      Caption = 'Informa'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      object Label3: TLabel
        Left = 10
        Top = 32
        Width = 107
        Height = 17
        Caption = 'Nome do Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 224
        Top = 32
        Width = 141
        Height = 17
        Caption = 'Quantidade em estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 10
        Top = 88
        Width = 57
        Height = 17
        Caption = 'Categoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object txtNomeProduto: TEdit
        Left = 10
        Top = 55
        Width = 167
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object txtQuantidadeEstoque: TEdit
        Left = 224
        Top = 55
        Width = 141
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object txtPreco: TLabeledEdit
        Left = 224
        Top = 110
        Width = 141
        Height = 25
        EditLabel.Width = 33
        EditLabel.Height = 17
        EditLabel.Caption = 'Pre'#231'o'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Text = ''
      end
      object txtCategoria: TEdit
        Left = 10
        Top = 111
        Width = 167
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    object gboxQuantidade: TGroupBox
      Left = 448
      Top = 43
      Width = 393
      Height = 166
      Caption = 'Selecionar quantidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label5: TLabel
        Left = 14
        Top = 97
        Width = 74
        Height = 23
        Caption = 'Subtotal:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 14
        Top = 126
        Width = 21
        Height = 23
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSubtotal: TLabel
        Left = 43
        Top = 126
        Width = 45
        Height = 23
        Caption = '00,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object txtQuantidadeCompra: TLabeledEdit
        Left = 11
        Top = 55
        Width = 198
        Height = 25
        EditLabel.Width = 172
        EditLabel.Height = 17
        EditLabel.Margins.Top = 10
        EditLabel.Margins.Bottom = 10
        EditLabel.Caption = 'Insira a quantidade desejada:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = ''
        OnChange = txtQuantidadeCompraChange
      end
    end
  end
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 905
    Height = 41
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 901
    object Label1: TLabel
      Left = 25
      Top = 5
      Width = 208
      Height = 30
      AutoSize = False
      Caption = 'Adicionar '#224' compra'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
