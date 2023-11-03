object DataModule1: TDataModule1
  Height = 349
  Width = 555
  PixelsPerInch = 120
  object FDConnection: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'ConnectionDef=DataBase')
    Left = 176
    Top = 128
  end
  object DriverLink: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files (x86)\Firebird\Firebird_2_5\bin\fbclient.dll'
    Left = 352
    Top = 128
  end
end
