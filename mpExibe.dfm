object formExibe: TformExibe
  Left = 234
  Top = 107
  Width = 544
  Height = 375
  BorderIcons = [biSystemMenu]
  Caption = 'Mapavox'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  DesignSize = (
    536
    348)
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 24
    Width = 105
    Height = 105
    AutoSize = True
  end
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 536
    Height = 24
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    BiDiMode = bdLeftToRight
    Caption = '..............'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
  end
  object MediaPlayer1: TMediaPlayer
    Left = 256
    Top = 80
    Width = 253
    Height = 30
    Visible = False
    TabOrder = 0
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 8
    Top = 120
  end
end
