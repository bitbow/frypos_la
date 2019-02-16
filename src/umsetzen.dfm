object frmUmsetzen: TfrmUmsetzen
  Left = 415
  Top = 284
  BorderStyle = bsDialog
  Caption = 'Umsetzen'
  ClientHeight = 362
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object panTOp: TPanel
    Left = 0
    Top = 0
    Width = 482
    Height = 49
    Align = alTop
    Color = clCream
    TabOrder = 0
    object lbInfo: TJvLabel
      Left = 1
      Top = 1
      Width = 480
      Height = 47
      Align = alClient
      Alignment = taCenter
      AutoSize = False
      Caption = 
        'Tisch ausw'#228'hlen der umgesetzt werden soll, dann den Tisch ausw'#228'h' +
        'len auf den umgesetzt werden soll.'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShadowColor = clActiveBorder
      ShadowPos = spLeftBottom
      Transparent = True
      WordWrap = True
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
    end
  end
  object pan: TPanel
    Left = 0
    Top = 49
    Width = 482
    Height = 313
    Align = alClient
    Color = clMedGray
    TabOrder = 1
  end
end
