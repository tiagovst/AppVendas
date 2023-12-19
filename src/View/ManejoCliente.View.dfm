object TelaCadastroCliente: TTelaCadastroCliente
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Manejo Cliente'
  ClientHeight = 558
  ClientWidth = 747
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlBottom: TPanel
    Left = 0
    Top = 517
    Width = 747
    Height = 41
    Align = alBottom
    Color = 16579321
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = 600
    ExplicitWidth = 962
    DesignSize = (
      747
      41)
    object btnCancelar: TButton
      Left = 581
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancelar'
      TabOrder = 0
      ExplicitLeft = 796
    end
    object btnSalvar: TButton
      Left = 664
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Salvar'
      TabOrder = 1
      ExplicitLeft = 879
    end
  end
  object pnlCenter: TPanel
    Left = 0
    Top = 96
    Width = 747
    Height = 421
    Align = alClient
    Color = 16579321
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 966
    ExplicitHeight = 505
    object GroupBox1: TGroupBox
      Left = 41
      Top = 25
      Width = 672
      Height = 368
      BiDiMode = bdLeftToRight
      Caption = 'Dados Cadastrais'
      Constraints.MaxWidth = 672
      DefaultHeaderFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -17
      HeaderFont.Name = 'Segoe UI'
      HeaderFont.Style = []
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      object Label2: TLabel
        Left = 391
        Top = 123
        Width = 73
        Height = 17
        Caption = 'Identificador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblNome: TLabeledEdit
        Left = 39
        Top = 60
        Width = 220
        Height = 25
        EditLabel.Width = 97
        EditLabel.Height = 17
        EditLabel.Caption = 'Nome Completo'
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
        ParentFont = False
        TabOrder = 0
        Text = ''
      end
      object txtEndereco: TLabeledEdit
        Left = 391
        Top = 60
        Width = 220
        Height = 25
        EditLabel.Width = 55
        EditLabel.Height = 17
        EditLabel.Caption = 'Endere'#231'o'
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
        ParentFont = False
        TabOrder = 1
        Text = ''
      end
      object txtCNPJ: TLabeledEdit
        Left = 391
        Top = 224
        Width = 219
        Height = 25
        EditLabel.Width = 29
        EditLabel.Height = 17
        EditLabel.Caption = 'CNPJ'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clMenuHighlight
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        EditMask = '00.000.000/0000-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 18
        NumbersOnly = True
        ParentFont = False
        TabOrder = 2
        Text = '  .   .   /    -  '
      end
      object lblTelefone: TLabeledEdit
        Left = 39
        Top = 144
        Width = 220
        Height = 25
        EditLabel.Width = 49
        EditLabel.Height = 17
        EditLabel.Caption = 'Telefone'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clMenuHighlight
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        EditMask = '!\(99\)00000-0000;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 14
        NumbersOnly = True
        ParentFont = False
        TabOrder = 3
        Text = '(  )     -    '
      end
      object rbCPF: TRadioButton
        Left = 391
        Top = 152
        Width = 113
        Height = 17
        Caption = 'CPF'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        TabStop = True
      end
      object rbCNPJ: TRadioButton
        Left = 528
        Top = 152
        Width = 113
        Height = 17
        Caption = 'CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object txtCPF: TLabeledEdit
        Left = 39
        Top = 224
        Width = 219
        Height = 25
        EditLabel.Width = 12
        EditLabel.Height = 17
        EditLabel.Caption = 'ID'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clMenuHighlight
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 6
        Text = ''
      end
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 747
    Height = 96
    Align = alTop
    Color = 16579321
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 962
    object Label1: TLabel
      Left = 93
      Top = 40
      Width = 100
      Height = 30
      AutoSize = False
      Caption = 'Clientes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 93
      Top = 24
      Width = 180
      Height = 17
      AutoSize = False
      Caption = 'Gerencie os seus clientes'
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
        0970485973000001D8000001D801FA5CA6720000000774494D4507E70C011608
        051AC1AABB0000097F4944415478DAD5990B7054D519C7BF73EFDE7D6437EF44
        41120C0282A080A133250122A4B5540A43298F56B08F21563A808F8A952AE383
        0EE89041EB542DF601ADF248859182A3626DC7113050041AC4846742124848B2
        811036BB9BBD7B1FA7FFB39B104493DC0D2C9D5EE6E43B39F7DCEFFBDDEF7EE7
        3BDF218CFE0F2F763D94943C5344EEA454F2B55EA08B175BE8427333058241B2
        3B5C949C9A4E6969696473D8499188E6FFE6CFFF5BE82D5BE690FE591249099C
        2AFE7380722714DEDC78AEBE7F7353A3C3EF0F30872B81A76564AA595959E776
        EFDAE3CD1D3386348551CAA900CDDDBAF5C643BFBB6A21853595AA8F9EA6AC61
        8307791B1B660483C1FB74C3CC854C52C39A24C93653B13B7D44D241BBC3BE73
        E080AC1D15D5D5B543B2B2C9E1B45351F19B370E7ADBAA9F93C3E1A021838729
        7B3EF9D7B4960B2D4F070281BB43AA2A1B2627C32432D10C8E868E6132926D8A
        EE72B9CAD2D3D356DE5B58B0F374D5694D0DA9F4D3E2B7E20FBDF1A939E44E4C
        A5C4D4346775457951B3B7F1D95048BD091E8E4046603BC0A3D01D7D480E738A
        DDD1DCBF5FE6F3056347AFAB6B6A569B2FFA68E91FFF1E5FE8AD2B7E461FBCF5
        579AF0BDE973CF3735BED61E6ACF8C420948DE0D34C679C71C3487C3EECDBEA5
        DF92D59B3EDAFA87E50FD203AB625B9C31411BCF3F475BC32748B62B43EAAB4F
        BFDBE6F3DDD1E5C9ABA079A7772592241BB5ABEAE57926E6A52425550C1A9835
        231CD6AAD23D1E7AE8F5BFC507BAE98D97E8958FD7D1E0CC9C95E7BD0D4F6B9A
        CE04E8D5D0BA11F5AE4DB1D39851A328273B9BF6EC3F4095B56749D7A35E9765
        990FB83973A53F187CB630F71B34F385B5F181DEBEF241019253595EB639E06F
        CB8BC4F0E5CFCE23B03AA402D87EFDFAD3D8DC5CBA6BF870723B1DD4E8F552E9
        81323A70E428355F68A5B06E5092C7BDF79B778E9817D6B4DA456F584F813141
        EF5DBF829824DDDB74B6667363DD998CB6361F8542A10834521BB93D49949E91
        49393939346CC8504A74BB8971DC4463E22BE83A9D3DD7405F9CA882D7EB29A8
        AAAD9929C9F7235C3E7C2486C5181374EBA19D78824D43AE2A09B65DF2A8ED41
        D2B5702465D8641BB99C4E4A447C3AB1FB71C320266285CCA804B4780146D114
        D3E6F7A305838669CCC3A41DB7FD78797CA0DBCAFE21C45C1094C0B824454078
        C4939160E646549AE65780A3DEEEF03AC6A488713CC0B980DE227D67619CA00F
        7E20C4F7F15409009C9D009D5EEC0C83DE8059D7587B07F476F9BEC571823EF4
        BE10F7C0E86618BDE51A81C5FD7A1685DE2D4D5D121F68FFC1F7444466C3E026
        004CBC46608CF1DD68F34151C7A63D1C1FE8E0E10FC976EBED4C3F79E405CEF9
        3218677D0716C9925E6487AB96D3A841C4A63F1A274FEFDF4612178FB0115843
        DB0031AC8FC098CF8F334E3F40E798F87C6CFA23F181867729F41958931318B5
        F87F0198620078FA00EC87E5652C31632D0FB472E9BB8B62C188BD60F2979592
        1C6810206E46C652749E0048624CC0446B60780D46027A4226D927FF28BED0ED
        FB4A08C70FE22C2C803C12A705807B02FD6C0BC06760F1652CBEF5906DA25465
        206053AD87469FA03BAFE0EE8DC224FE493233B45CC68D05802C005C7F0027A1
        2F03586C1E3E8CE1D3D02E40AF67925E46860DBB1090A7595F7CD7053A376F0A
        F9822ACDC91B4E19894E7ABCF8B78C4A37DC6686B5D19C031CB10EE8000CD493
        C23EA7490BAB8B972CE05E5F80DEFCF428A5B81D54597EE8C6408FCB9F421233
        49336D24239384B9E1169E0D9BA6F32E32E527256E2AFE76AE0655AEA374BD64
        9AEC558F4B3AEA540C99CC105EC8C735296032832E5D4AC08140A7FA9ABDF181
        1E37713AB29C8841935CD4CCFC66DA70649389687968771ADC1C70ABCC3C8FBB
        6C52168A25550D93A16A54A5E9F47B2699B5886178FE1CE696037C1F427C4FD5
        F1FC63836EDF4326F44A8898EA139F5F3FE8FCFC99988918940D71501D80B5F5
        13189F6B727324A4225221EFD8647EE8946906B4224C2804F0EDA85BDFC16A33
        3AE644E7720DCF5640BE8DB10D5CD2EA655DC1F38C2A2BCBAE0D7AECD8E9F87C
        3610E034ED77332DF9D278685E619A66012CDBCC2E8808903846E5A07C7BCA2E
        51323CDC08F0D53818D488DDE3CBD06446B38A0E5DBBF0DC73038329A55EA79F
        0C7C495DBF483535357D839E3879160A779394149DC2ADD214187B0926479A1D
        1BC9D7410F95897EA5489404682FA0D700FA54F7D0247461A41CFDA52D52F8A3
        74C341483974A6F248DFA0F30B666386A891691C7EAC83B111E2A8DA1DB40881
        19F0F2FD00C7790A27933095203CDE4378B09EA1C558057E294295BEDF3475AA
        AB3A1A3BF4C449B3A3753DD14D88C8BF40ED54DE61A03B686C39B4D8A5D004BC
        65088BD004F42E9C05FFC4240A5174B3E9163A2ADFC77811DEB149C28FDA5315
        B142CFA086F3F9D42F7DFFA330B21A0A1D3D41237B10B207FDD265A3EC48F6D0
        903DC25429B28724D11961AC77681521F664FF61E37E77F68B8FA9F16CB575E8
        7BE065A108D72028D914496B5D8ABB85CEB7CBF418A019625953450B2344345A
        0BE87F4B486BBD438B7B7BF1CB7CD8AE11A7FB86DAE3D6A027011A1F976462B3
        A06423C09DBD4163E3A07909769A894518066C27B48EB60366DEB1C99117B300
        DD8E52FB01C5266D0B615D345A852E98344B9CBA45FE2D467B2C62A807689135
        1291C79F4976D250F4AF863E86C5F88A5DA1B6CB59A447688CF19731FE6BC698
        76AEE69845E8C9B385F0C0C47628FB9615E8A1F0F08A2407B9B0F0AE8416B255
        43EA03743542C41AB4F94FDCC40181F9EBAB63834E45DB0B05C3AD4017229617
        B9ED24699DF1DC051D448CAF4778EC5364ABD022DF8D476B8D153A0DED301464
        5B81CE75C8B42CD14176648B2F8787463EBCC86B8A8DCA65C92AB4483677A3B5
        C40A9DDE019DD51BB46828F5E8218F9DC6834B144AE10E6091FA3EC5FC0D800E
        12B7B210C5581D6C8FEE0B740A5A29148CB0022DFA99E20F41A855C6892D3DAC
        452ABD52C4F8DBD828BC42A3B5EC21FA15584F1300D75A170B3456AE130A5E87
        D20556A03B6B8F0C689C8F1A6B340E2D0790B24A906B9B7AAF3DAEF6F47AC8C5
        600859F674E1B767621BB691CD66E641F73A18B8C30A74E7269308998A79E731
        CFC7AFDCBE2D411FC3BC22CEA57DB264D0992AAB797AF25CD211A3BA4D921455
        9F048D0F437D3E37792AD4B29EA0CD2B64F4847EE5BC6EA171CBBC0889DD90BF
        AA3B039F30D5611A3AA3C61A8BD0E2CA2B9C43610375B14BA75040CFC0D0001E
        DD197B85FE4A86B004CD43E2FFF654DD386F77AB288965AA3B79F26BD97A2C4D
        478E9C43763B27974717AB883A633B0ED0F898D1AFE25438D9644E151515DD72
        5D973F33DFE8EBBFAB9CC6B50FA669A90000002574455874646174653A637265
        61746500323032332D31322D30315432323A30383A30312B30303A3030BECD5D
        320000002574455874646174653A6D6F6469667900323032332D31322D303154
        32323A30383A30312B30303A3030CF90E58E0000002874455874646174653A74
        696D657374616D7000323032332D31322D30315432323A30383A30352B30303A
        30306CCAE0420000001974455874536F667477617265007777772E696E6B7363
        6170652E6F72679BEE3C1A0000000049454E44AE426082}
    end
  end
end
