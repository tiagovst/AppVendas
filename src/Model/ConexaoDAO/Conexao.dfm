object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 198
  ClientWidth = 247
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=E:\Tiago\Programming\Embarcadero\AppVendas\DataBase\RAZ' +
        'ER.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3050'
      'CharacterSet=win1252'
      'DriverID=FB')
    LoginPrompt = False
    Left = 104
    Top = 72
  end
end
