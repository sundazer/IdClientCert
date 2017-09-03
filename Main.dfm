object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 251
  ClientWidth = 556
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 13
    Width = 202
    Height = 13
    Caption = 'Set the URL with client cert authentication'
  end
  object bStart: TButton
    Left = 16
    Top = 59
    Width = 75
    Height = 25
    Caption = 'Connect'
    TabOrder = 0
    OnClick = bStartClick
  end
  object mResult: TMemo
    Left = 224
    Top = 8
    Width = 329
    Height = 225
    TabOrder = 1
  end
  object edIP: TEdit
    Left = 16
    Top = 32
    Width = 153
    Height = 21
    TabOrder = 2
    Text = 'URL to connect to'
  end
end
