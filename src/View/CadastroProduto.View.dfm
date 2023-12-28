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
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 96
    Width = 870
    Height = 535
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 494
      Width = 868
      Height = 40
      Align = alBottom
      Color = 16579321
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        868
        40)
      object btnCancelar: TButton
        Left = 695
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Cancelar'
        TabOrder = 0
        OnClick = btnCancelarClick
      end
      object btnSalvar: TButton
        Left = 784
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Salvar'
        TabOrder = 1
        OnClick = btnSalvarClick
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 868
      Height = 493
      Align = alClient
      Color = 16579321
      ParentBackground = False
      TabOrder = 1
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
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuHighlight
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label4: TLabel
          Left = 10
          Top = 104
          Width = 128
          Height = 17
          Caption = 'Descri'#231#227'o do Produto'
          Color = clMenuHighlight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuHighlight
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
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
          Color = clMenuHighlight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuHighlight
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label6: TLabel
          Left = 14
          Top = 104
          Width = 57
          Height = 17
          Caption = 'Categoria'
          Color = clMenuHighlight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuHighlight
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
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
          Color = clMenuHighlight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuHighlight
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label8: TLabel
          Left = 200
          Top = 32
          Width = 141
          Height = 17
          Caption = 'Quantidade em Estoque'
          Color = clMenuHighlight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuHighlight
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
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
          Color = clMenuHighlight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuHighlight
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
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
          EditLabel.Color = clMenuHighlight
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clMenuHighlight
          EditLabel.Font.Height = -13
          EditLabel.Font.Name = 'Segoe UI'
          EditLabel.Font.Style = []
          EditLabel.ParentColor = False
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
          EditLabel.Font.Color = clMenuHighlight
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
          EditLabel.Font.Color = clBlue
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
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 870
    Height = 96
    Align = alTop
    Color = 16579321
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 93
      Top = 40
      Width = 252
      Height = 30
      AutoSize = False
      Caption = 'Cadastrar novo produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 93
      Top = 24
      Width = 146
      Height = 17
      AutoSize = False
      Caption = 'Gerencie seus produtos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Image: TImage
      Left = 41
      Top = 22
      Width = 45
      Height = 45
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D494844520000002D0000
        002D08060000003A1AE29A00000006624B474400FF00FF00FFA0BDA793000000
        0970485973000001D8000001D801FA5CA6720000000774494D4507E70C011221
        26FBE9ECFE000009AC4944415478DAED990B7054D519C7FFE73E7637D93C21EF
        84580A152A200CA92D8F29741C0288A04514B0828E2274A42D2F4542C1420532
        305044116D44443A2333751C2AB4A380521490478720A05885F00A01F226D9DD
        6477EFEBF43B77F334216C42A0CCB467E6EED97BEED9737EE77FBEF39DEFDC65
        A84BFCE0E3766E31198C21CCC461C809A8887E14BA9C025D4DA532A9451DD528
        81AA1721AE76279CFA8556EA5CAF75100B8369595007BFD750CEF8D119E09A87
        DA51608141E25C66120BAF55FA852E27B06A77B6A4B1641E74F6A626E416759C
        C10249D52FB1E8E041CB6514F270A039B7A12D6E1A26F1D865F2E0AD2168EDB3
        71501C51D497AA72CB18CAC146D3E8D2C293C2E2BA92A896C74C49D395948029
        7729A3262DD16EA3589CC96675826A5C8E8CF77D58E2D2CE07504FD136B410BA
        9C64DD4537FB39835F942B83B6520F479EA4A70A83A53D43559751796A782A87
        980C3911C55DE6405792DBA8C7A09AC548ACDA04A77616E19A475DAAA0EB8F96
        C4F31887261B24AB75788A78D08373BE83F27BDAD35A23F4DC3A687E9D7A521D
        F4DB1D8116A9908C7B1CB7AC937274049879E80951F8085DEFD0157B87420B93
        9BCA4DBE952912411FB4959E4AB6F306E5517730F44C79547E9EB1330BCC3830
        59144E26E83CCA63DAD31223485D4E4249C2F3049DD236B4518C846B7970050B
        686976087A9A6CB2770D996C5ADB3B561466599C6FA73CBD7DD0160C822D4B5D
        0C434D6B135AD1AFA04BE9ABE4FE4E53AD76437B98B06993EF632E320FFF27F7
        8BEE9D9669ACE0DC9A492411D7EDBB15014C471A2ABBE5529ED126B4ACD1E672
        652554FFBF11B67930BB498331E96DDA6372C0A56A49EF0E16DCFF2002BE4A48
        96196F5CD35E239F38054A98CCE44C4D573AAA7AAFA33CB36DE8402162CF2E81
        E2FD9A606E041DA28569EBF29114A34C67AAEB4AF49803F633B2E42C54A5D344
        7FEDA79D91BFC014ACC68D7D7FA3D2EE0C540C791D66D4F5A1850D2BDE8B883F
        FA12D4CA9368B96B5EAF79DABD0CAC8E7FA97B8E6F4709621F3EDA30243B55AD
        E82FB217E95A1526B1D811A11374F1E057A0DF00DA41D049F94BE1BC762A0CA5
        9BA802AC91C07362169D6C68BC01DAB3EA271D8026EFE14A44D180E5F0C7F5B1
        07D16A22655D9ED3C838B9040EDFC57643CB9695E35E78AC25B4EF4F43DA0F4D
        CA720AB44A3226E36AE654FAAE86229D66C0A11949BEB20D69E737D2166C34ED
        360C68BE86319EE39E77B825B4FFB5E11D80AE53DB118FE2A4B1A88C1B0A4D89
        6906A51A1EC47BF3917A751B1C5A39DA11F736409363CD71CF3AD8125ADB30A2
        63D0758A5BCC81A0A32B2CC9D90C5AB282144357D8793B146E80264DD6701339
        AED99FB68436F21EB809E84661BE8F15EAA9DD9B492334D81ACB54729C3377B4
        84B6363DD409D09D9EEC85489E39874DDBDE129ABFF3F01D0B4D570E7BE6FFD0
        FF53D0F50C22C0650DDF9A96DF41D0E475A1A298C7E32B9E8933561A1D02A3A8
        C4440AAA70AF74113DD85574659E3A68F6DF86E628E069F89B3108FFB0B27089
        27D00024F26BCC0691E8E41A010D7DA5424C92BF40B674DC8A635E820EE624F2
        F778F9B4C4DB0B2D4CE0A0D50BAB8DF1386AFE102E55428F3819FD121424454A
        D0C9235FF45838516AE06A0D878BD7629C9CCFA7C89FAF1B787EEDBC3E719771
        EA2E3AA34C64B70FFA9F563F2CD127E33C52313049C6537D5D18DE4D4594CAA0
        4A216BD64C4EC016B69D0EE2AFDF0651EAD391CC3C87CA58CC6498BCB04B9517
        6529494DA0378DBD65D002F477FA0C1CB7BA63E40F542C1CE4C68FE2E5BA1900
        AE052C3864660F4024121D1F9F0B62D5915A145499063DDA407BED22C6790D33
        F42601D3077345B6805A59D98118A1D524622383085EF10EC19F03C39195E2C0
        DAFBA36CB3A84F67AB4CBCB0D7877B1315CCFF596403B848DB0B8258BCCF4783
        E2954C628FC3347743511AE90A0ACA45B6884B8EE51D3878B69AC401E82CD9E9
        CB27349451BC943B2C0A13EE7636ABB3B750C373BBBDB8BB8B8CBC5131487537
        F6ADD1716BE13EAF6D2AD4D45FA8E859BAF406E8EFBE3C138266CAF20E1CF15B
        4D34ADD855EAC0EAD30A06A628C81B19832477F3B63FBF540FAD60E3A8682446
        367FFE190D6AC62E2F6A0DFE1DDD6693E55C6A8CF2B6D8AF7A3BD1A6295CA519
        5BA73D80B5DA183CD5C78195C3A3683D01E7C8248A6B4211E197253AD61FF323
        235AC2ECAC48748D90EC19EA49362FBCCAF96A13BF26E853E546A9C4D864FAF9
        DE5BE83D3882706099FE18B658233027CB85E7EF8BC465AF85797B6D081B5AA7
        EDA356E79049E048B2E77A9D7F758FCB5EB02534B8D97BBCD857A457C9129B4E
        8F3EB8A52E4F83825C7D02361AD99835D0850583A250566B21F7B00FA7CA0C7B
        A17A358E22AF0917D95246B40C550EB98109BD5C98DE3F12577D26667DEAC181
        22FD1A0DEC697ABAFD96FBE9F5FA682C0B8CC7C45E0EAC1B116B4FBD8F40AB82
        21F3F8E2B2863FD062EB4E1E65C5B01824BB43E69140A6E1A4817C5B61E0D98F
        AB844915D328C58BD2438DD09B6DE8D934AB6B7113478DE6C9C447461666D53E
        81CC8418BC490BB127C1D5BF75177F4DECB910C46F3FA9B617E29B2363914E6A
        8B3396F0D502FEC33301CCDBE321D789E3644323386315DF57FA41BA36D395D8
        39D034F556573C57FB248E593DF1E24F23307D40A4AD48E8FF14601F798FDFEC
        AE466F825E9F1D8BD428C90616CFAEF9853D7BEC3A34CA559C99B4C1C06CA2F4
        2F451647A7EBB7287FACB3CC43C06D0C0CC3B2DAB148897621973CC890744743
        005A5263E2F563B5F60E39A977049C4A28B608929BD974D28FF5F935C25F9FA5
        B249747ACEE7AAD9641B7F6B5C683E64F663BACDA556B32977770678A5E5C6FC
        9A09F87BA01F7A91A273EF73E3E7DD1CB6CD8ABF5682066CEFA14821EF514E0A
        6FFDC68F77BFF20BDBF791ABFBBD21F137643053A28A8DD0EF93B801DA82345D
        B490428A0FA339117F6744DC3CB6C57706FB3AE7781E1D566EB907A6D0621BD5
        DD419793FCB10297127AC7531DE4385AACDB71C7FE224D0C264080AF72894404
        F348928CD2F93D9B07197CCB785ADA3E7298917443BE47F64B301D61BE2D6C23
        3112C23258DFD297BB97F0E81CCBE20F91A85DE25D126D260C2217314A792D47
        05054FC2BB904D9F2343D94013B191A6C02B0ACA17F40E35D7AA1D6E1E439FD4
        115C74D3098E849938A165E2E9EA29B8A045898D7C34E7FC115277283D156FE3
        EB3BD188ED1BF22AFBE9FBFB6AD0FC97E9729A3CA0A17CD980C6E66E9E28CCB4
        F414521D34DF744A514C854E2C8158EA3E1D9C25936527108950A984942DE612
        BB4C76ACA9466821972CEDDF5C83DB065D97E257D6BD63D664FB3463BF0A6721
        DFCC6C5F475E5C22E19D29E4424A51B9B85F8B366E3B74D314B3F4B8ADA4C244
        684552BB7D883F97898BBF3842C7AA89D7FDDD7F00332F58BDD1F17B14000000
        2574455874646174653A63726561746500323032332D31322D30315431383A33
        333A33332B30303A303080E195F30000002574455874646174653A6D6F646966
        7900323032332D31322D30315431383A33333A33332B30303A3030F1BC2D4F00
        00002874455874646174653A74696D657374616D7000323032332D31322D3031
        5431383A33333A33382B30303A3030A4AE586A0000001974455874536F667477
        617265007777772E696E6B73636170652E6F72679BEE3C1A0000000049454E44
        AE426082}
    end
  end
end
