object formSons: TformSons
  Left = 194
  Top = 182
  Width = 564
  Height = 289
  Caption = 'Dados deste Sensor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object label1: TLabel
    Left = 16
    Top = 16
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 24
    Top = 120
    Width = 7
    Height = 13
    Caption = 'X'
  end
  object Label3: TLabel
    Left = 128
    Top = 120
    Width = 7
    Height = 13
    Caption = 'Y'
  end
  object Label4: TLabel
    Left = 24
    Top = 88
    Width = 86
    Height = 13
    Caption = 'N'#250'mero do sensor'
  end
  object sb_up: TSpeedButton
    Left = 208
    Top = 88
    Width = 23
    Height = 22
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
      3333333333777F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
      3333333777737777F333333099999990333333373F3333373333333309999903
      333333337F33337F33333333099999033333333373F333733333333330999033
      3333333337F337F3333333333099903333333333373F37333333333333090333
      33333333337F7F33333333333309033333333333337373333333333333303333
      333333333337F333333333333330333333333333333733333333}
    NumGlyphs = 2
    OnClick = sb_upClick
  end
  object sb_down: TSpeedButton
    Left = 208
    Top = 120
    Width = 23
    Height = 22
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
      333333333337F33333333333333033333333333333373F333333333333090333
      33333333337F7F33333333333309033333333333337373F33333333330999033
      3333333337F337F33333333330999033333333333733373F3333333309999903
      333333337F33337F33333333099999033333333373333373F333333099999990
      33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333300033333333333337773333333}
    NumGlyphs = 2
    OnClick = sb_downClick
  end
  object Label5: TLabel
    Left = 16
    Top = 48
    Width = 37
    Height = 13
    Caption = 'Imagem'
  end
  object e_nome: TEdit
    Left = 64
    Top = 16
    Width = 473
    Height = 21
    TabOrder = 0
  end
  object e_x: TEdit
    Left = 48
    Top = 120
    Width = 41
    Height = 21
    TabOrder = 3
  end
  object e_y: TEdit
    Left = 152
    Top = 120
    Width = 41
    Height = 21
    TabOrder = 4
  end
  object ListBox1: TListBox
    Left = 240
    Top = 80
    Width = 297
    Height = 113
    ItemHeight = 13
    TabOrder = 2
  end
  object b_novoSom: TButton
    Left = 8
    Top = 160
    Width = 105
    Height = 25
    Caption = 'Novo Arq. Som'
    TabOrder = 5
    OnClick = b_novoSomClick
  end
  object b_removeTudo: TButton
    Left = 432
    Top = 208
    Width = 113
    Height = 41
    Caption = 'Remove o Sensor'
    TabOrder = 12
    OnClick = b_removeTudoClick
  end
  object b_novaVoz: TButton
    Left = 128
    Top = 160
    Width = 105
    Height = 25
    Caption = 'Nova Voz'
    TabOrder = 6
    OnClick = b_novaVozClick
  end
  object b_removeSom: TButton
    Left = 8
    Top = 192
    Width = 105
    Height = 25
    Caption = 'Remove Som/Voz'
    TabOrder = 7
    OnClick = b_removeSomClick
  end
  object b_ok: TButton
    Left = 256
    Top = 208
    Width = 97
    Height = 41
    Caption = 'OK'
    TabOrder = 10
    OnClick = b_okClick
  end
  object e_nSensor: TEdit
    Left = 152
    Top = 88
    Width = 41
    Height = 21
    TabOrder = 1
  end
  object b_executa: TButton
    Left = 128
    Top = 224
    Width = 105
    Height = 25
    Caption = 'Executa'
    TabOrder = 9
    OnClick = b_executaClick
  end
  object b_cancela: TButton
    Left = 368
    Top = 208
    Width = 49
    Height = 41
    Caption = 'Cancela'
    TabOrder = 11
    OnClick = b_cancelaClick
  end
  object b_edita: TButton
    Left = 8
    Top = 224
    Width = 105
    Height = 25
    Caption = 'Edita'
    TabOrder = 8
    OnClick = b_editaClick
  end
  object e_imagem: TEdit
    Left = 64
    Top = 48
    Width = 385
    Height = 21
    TabOrder = 13
  end
  object b_procurar: TButton
    Left = 472
    Top = 48
    Width = 65
    Height = 25
    Caption = 'Procurar'
    TabOrder = 14
    OnClick = b_procurarClick
  end
  object b_espera: TButton
    Left = 128
    Top = 192
    Width = 105
    Height = 25
    Caption = 'Espera (2 seg.)'
    TabOrder = 15
    OnClick = b_esperaClick
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.wav'
    Filter = '*.wav|*.wav|*.mp3|*.mp3|*.*|*.*'
    Left = 392
  end
  object OpenDialog2: TOpenDialog
    DefaultExt = '*.wav'
    Filter = '*.jpg|*.jpg|*.*|*.*'
    Left = 432
  end
end
