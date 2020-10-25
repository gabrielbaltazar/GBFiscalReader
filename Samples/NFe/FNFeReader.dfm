object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frmMain'
  ClientHeight = 318
  ClientWidth = 652
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 652
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'NFe Reader'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object lstFiles: TFileListBox
    Left = 0
    Top = 41
    Width = 652
    Height = 120
    Align = alTop
    ItemHeight = 13
    Mask = '*.xml'
    TabOrder = 1
    OnDblClick = lstFilesDblClick
  end
  object mmoNota: TMemo
    Left = 0
    Top = 161
    Width = 652
    Height = 157
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 2
  end
end
