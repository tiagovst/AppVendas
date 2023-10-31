object dmConexao: TdmConexao
  Left = 0
  Top = 0
  Caption = 'dmConexao'
  ClientHeight = 236
  ClientWidth = 289
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object FDConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=DataBase')
    LoginPrompt = False
    Left = 104
    Top = 72
  end
  object DriverLink: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files (x86)\Firebird\Firebird_2_5\bin\fbclient.dll'
    Left = 215
    Top = 88
  end
end
