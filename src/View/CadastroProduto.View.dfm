object TelaCadastroProduto: TTelaCadastroProduto
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Cadastro de Produto'
  ClientHeight = 631
  ClientWidth = 870
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 870
    Height = 631
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 590
      Width = 868
      Height = 40
      Align = alBottom
      TabOrder = 0
      DesignSize = (
        868
        40)
      object btnCancelar: TButton
        Left = 666
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Cancelar'
        TabOrder = 0
        OnClick = btnCancelarClick
      end
      object btnSalvar: TButton
        Left = 760
        Top = 7
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Salvar'
        TabOrder = 1
        OnClick = btnSalvarClick
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 868
      Height = 96
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 88
        Top = 40
        Width = 257
        Height = 30
        AutoSize = False
        Caption = 'Adicionar novo produto'
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
        Top = 25
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
    object Panel4: TPanel
      Left = 1
      Top = 97
      Width = 868
      Height = 493
      Align = alClient
      TabOrder = 2
      object GroupBox1: TGroupBox
        AlignWithMargins = True
        Left = 41
        Top = 35
        Width = 239
        Height = 289
        BiDiMode = bdLeftToRight
        Caption = 'Descri'#231#227'o'
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
        object Label4: TLabel
          Left = 10
          Top = 104
          Width = 128
          Height = 17
          Caption = 'Descri'#231#227'o do Produto'
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
          Width = 215
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object txtDescricaoProduto: TMemo
          Left = 10
          Top = 127
          Width = 215
          Height = 146
          Hint = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          Lines.Strings = (
            'txtDescricaoProduto')
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 328
        Top = 159
        Width = 239
        Height = 165
        BiDiMode = bdLeftToRight
        Caption = 'Categoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 1
        object Label5: TLabel
          Left = 14
          Top = 32
          Width = 61
          Height = 17
          Caption = 'Refer'#234'ncia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 14
          Top = 104
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
        object txtReferencia: TEdit
          Left = 14
          Top = 55
          Width = 215
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object cbxCategoria: TComboBox
          Left = 14
          Top = 127
          Width = 211
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = 328
        Top = 35
        Width = 481
        Height = 105
        BiDiMode = bdLeftToRight
        Caption = 'Pre'#231'o e Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 2
        object Label7: TLabel
          Left = 14
          Top = 32
          Width = 83
          Height = 17
          Caption = 'Pre'#231'o Unit'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 200
          Top = 32
          Width = 141
          Height = 17
          Caption = 'Quantidade em Estoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object txtPreco: TEdit
          Left = 14
          Top = 55
          Width = 121
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object txtQuantidadeEstoque: TEdit
          Left = 200
          Top = 55
          Width = 113
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          TabOrder = 1
        end
      end
      object GroupBox4: TGroupBox
        Left = 584
        Top = 159
        Width = 225
        Height = 165
        BiDiMode = bdLeftToRight
        Caption = 'Informa'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 3
        object Label9: TLabel
          Left = 14
          Top = 32
          Width = 67
          Height = 17
          Caption = 'Fornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object txtFornecedor: TEdit
          Left = 14
          Top = 55
          Width = 195
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object txtValidade: TLabeledEdit
          Left = 14
          Top = 127
          Width = 194
          Height = 25
          EditLabel.Width = 100
          EditLabel.Height = 17
          EditLabel.Caption = 'Data de Validade'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -13
          EditLabel.Font.Name = 'Segoe UI'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditMask = '!99/99/0000;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ImeName = 'Portuguese (Brazilian ABNT)'
          MaxLength = 10
          NumbersOnly = True
          ParentFont = False
          TabOrder = 1
          Text = '  /  /    '
        end
      end
      object GroupBox5: TGroupBox
        Left = 41
        Top = 344
        Width = 768
        Height = 105
        Caption = 'Dados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object txtCodigoBarras: TLabeledEdit
          Left = 10
          Top = 56
          Width = 502
          Height = 25
          EditLabel.Width = 103
          EditLabel.Height = 17
          EditLabel.Caption = 'C'#243'digo de Barras'
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
          ImeName = 'Portuguese (Brazilian ABNT)'
          NumbersOnly = True
          ParentFont = False
          TabOrder = 0
          Text = ''
        end
        object txtID: TLabeledEdit
          Left = 557
          Top = 56
          Width = 71
          Height = 25
          EditLabel.Width = 12
          EditLabel.Height = 17
          EditLabel.Caption = 'ID'
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
          ImeName = 'Portuguese (Brazilian ABNT)'
          NumbersOnly = True
          ParentFont = False
          TabOrder = 1
          Text = ''
          Visible = False
        end
      end
    end
  end
end
