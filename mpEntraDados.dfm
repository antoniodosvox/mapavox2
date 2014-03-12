object formDados: TformDados
  Left = 287
  Top = 173
  Width = 358
  Height = 209
  Caption = 'Informa'#231#245'es sobre a exibi'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 72
    Height = 13
    Caption = 'Nome do mapa'
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 90
    Height = 13
    Caption = 'Arquivo de imagem'
  end
  object Label3: TLabel
    Left = 16
    Top = 88
    Width = 96
    Height = 13
    Caption = 'N'#250'mero da voz Sapi'
  end
  object Label4: TLabel
    Left = 16
    Top = 120
    Width = 80
    Height = 13
    Caption = 'Velocidade SAPI'
  end
  object Label5: TLabel
    Left = 16
    Top = 152
    Width = 80
    Height = 13
    Caption = 'Tonalidade SAPI'
  end
  object e_nomeMapa: TEdit
    Left = 120
    Top = 16
    Width = 225
    Height = 21
    TabOrder = 0
  end
  object e_nomeImagem: TEdit
    Left = 120
    Top = 48
    Width = 161
    Height = 21
    TabOrder = 1
  end
  object e_voz: TEdit
    Left = 120
    Top = 80
    Width = 41
    Height = 21
    TabOrder = 2
  end
  object e_veloc: TEdit
    Left = 120
    Top = 112
    Width = 41
    Height = 21
    TabOrder = 3
  end
  object e_tom: TEdit
    Left = 120
    Top = 144
    Width = 41
    Height = 21
    TabOrder = 4
  end
  object b_ok: TButton
    Left = 272
    Top = 144
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 5
    OnClick = b_okClick
  end
  object b_procurar: TButton
    Left = 288
    Top = 48
    Width = 59
    Height = 25
    Caption = 'Procurar'
    TabOrder = 6
    OnClick = b_procurarClick
  end
  object Button1: TButton
    Left = 272
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Testar voz'
    TabOrder = 7
    OnClick = Button1Click
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.jpg'
    Filter = '*.jpg; *.bmp|*.jpg; *.bmp|*.*'
    Left = 296
    Top = 88
  end
end
