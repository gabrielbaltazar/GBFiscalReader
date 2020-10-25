object frmCTeReader: TfrmCTeReader
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'CTe Reader'
  ClientHeight = 309
  ClientWidth = 645
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
    Width = 645
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'CTe Reader'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = -17
    ExplicitWidth = 652
  end
  object lstFiles: TFileListBox
    Left = 0
    Top = 41
    Width = 645
    Height = 120
    Align = alTop
    ItemHeight = 13
    Mask = '*.xml'
    TabOrder = 1
    OnDblClick = lstFilesDblClick
    ExplicitLeft = -17
    ExplicitWidth = 652
  end
  object mmoNota: TMemo
    Left = 0
    Top = 161
    Width = 645
    Height = 148
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 2
    ExplicitLeft = -17
    ExplicitTop = 142
    ExplicitWidth = 652
    ExplicitHeight = 157
  end
end
