object formTeste: TformTeste
  Left = 193
  Top = 107
  Width = 562
  Height = 179
  BorderIcons = [biSystemMenu]
  Caption = 'Teste dos sensores'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CheckBox1: TCheckBox
    Left = 24
    Top = 16
    Width = 49
    Height = 17
    Caption = '1'
    TabOrder = 0
  end
  object CheckBox2: TCheckBox
    Left = 64
    Top = 16
    Width = 49
    Height = 17
    Caption = '2'
    TabOrder = 1
  end
  object CheckBox3: TCheckBox
    Left = 112
    Top = 16
    Width = 49
    Height = 17
    Caption = '3'
    TabOrder = 2
  end
  object CheckBox4: TCheckBox
    Left = 160
    Top = 16
    Width = 49
    Height = 17
    Caption = '4'
    TabOrder = 3
  end
  object CheckBox5: TCheckBox
    Left = 208
    Top = 16
    Width = 49
    Height = 17
    Caption = '5'
    TabOrder = 4
  end
  object CheckBox6: TCheckBox
    Left = 256
    Top = 16
    Width = 49
    Height = 17
    Caption = '6'
    TabOrder = 5
  end
  object CheckBox7: TCheckBox
    Left = 304
    Top = 16
    Width = 49
    Height = 17
    Caption = '7'
    TabOrder = 6
  end
  object CheckBox8: TCheckBox
    Left = 360
    Top = 16
    Width = 49
    Height = 17
    Caption = '8'
    TabOrder = 7
  end
  object CheckBox9: TCheckBox
    Left = 24
    Top = 48
    Width = 49
    Height = 17
    Caption = '9'
    TabOrder = 8
  end
  object CheckBox10: TCheckBox
    Left = 64
    Top = 48
    Width = 49
    Height = 17
    Caption = '10'
    TabOrder = 9
  end
  object CheckBox11: TCheckBox
    Left = 112
    Top = 48
    Width = 49
    Height = 17
    Caption = '11'
    TabOrder = 10
  end
  object CheckBox12: TCheckBox
    Left = 160
    Top = 48
    Width = 49
    Height = 17
    Caption = '12'
    TabOrder = 11
  end
  object CheckBox13: TCheckBox
    Left = 208
    Top = 48
    Width = 49
    Height = 17
    Caption = '13'
    TabOrder = 12
  end
  object CheckBox14: TCheckBox
    Left = 256
    Top = 48
    Width = 49
    Height = 17
    Caption = '14'
    TabOrder = 13
  end
  object CheckBox15: TCheckBox
    Left = 304
    Top = 48
    Width = 49
    Height = 17
    Caption = '15'
    TabOrder = 14
  end
  object CheckBox16: TCheckBox
    Left = 360
    Top = 48
    Width = 49
    Height = 17
    Caption = '16'
    TabOrder = 15
  end
  object CheckBox17: TCheckBox
    Left = 24
    Top = 80
    Width = 49
    Height = 17
    Caption = '17'
    TabOrder = 16
  end
  object CheckBox18: TCheckBox
    Left = 64
    Top = 80
    Width = 49
    Height = 17
    Caption = '18'
    TabOrder = 17
  end
  object CheckBox19: TCheckBox
    Left = 112
    Top = 80
    Width = 49
    Height = 17
    Caption = '19'
    TabOrder = 18
  end
  object CheckBox20: TCheckBox
    Left = 160
    Top = 80
    Width = 49
    Height = 17
    Caption = '20'
    TabOrder = 19
  end
  object CheckBox21: TCheckBox
    Left = 208
    Top = 80
    Width = 49
    Height = 17
    Caption = '21'
    TabOrder = 20
  end
  object CheckBox22: TCheckBox
    Left = 256
    Top = 80
    Width = 49
    Height = 17
    Caption = '22'
    TabOrder = 21
  end
  object CheckBox23: TCheckBox
    Left = 304
    Top = 80
    Width = 49
    Height = 17
    Caption = '23'
    TabOrder = 22
  end
  object CheckBox24: TCheckBox
    Left = 360
    Top = 80
    Width = 49
    Height = 17
    Caption = '24'
    TabOrder = 23
  end
  object CheckBox25: TCheckBox
    Left = 24
    Top = 112
    Width = 49
    Height = 17
    Caption = '25'
    TabOrder = 24
  end
  object CheckBox26: TCheckBox
    Left = 64
    Top = 112
    Width = 49
    Height = 17
    Caption = '26'
    TabOrder = 25
  end
  object CheckBox27: TCheckBox
    Left = 112
    Top = 112
    Width = 49
    Height = 17
    Caption = '27'
    TabOrder = 26
  end
  object CheckBox28: TCheckBox
    Left = 160
    Top = 112
    Width = 49
    Height = 17
    Caption = '28'
    TabOrder = 27
  end
  object CheckBox29: TCheckBox
    Left = 208
    Top = 112
    Width = 49
    Height = 17
    Caption = '29'
    TabOrder = 28
  end
  object CheckBox30: TCheckBox
    Left = 256
    Top = 112
    Width = 49
    Height = 17
    Caption = '30'
    TabOrder = 29
  end
  object CheckBox31: TCheckBox
    Left = 304
    Top = 112
    Width = 49
    Height = 17
    Caption = '31'
    TabOrder = 30
  end
  object CheckBox32: TCheckBox
    Left = 360
    Top = 112
    Width = 49
    Height = 17
    Caption = '32'
    TabOrder = 31
  end
  object r_porta_lpt: TRadioGroup
    Left = 432
    Top = 24
    Width = 105
    Height = 105
    Caption = 'Porta LPT #'
    ItemIndex = 0
    Items.Strings = (
      '1 - porta $378'
      '2 - porta $278'
      '3 - porta $3bc')
    TabOrder = 32
    OnClick = r_porta_lptClick
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 400
    Top = 8
  end
end
