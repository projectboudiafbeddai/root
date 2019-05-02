object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'combinations generator'
  ClientHeight = 425
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mem_result: TMemo
    Left = 0
    Top = 82
    Width = 387
    Height = 343
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 387
    Height = 82
    Align = alTop
    TabOrder = 1
    object Label2: TLabel
      Left = 154
      Top = 8
      Width = 109
      Height = 13
      Caption = 'how many in every set'
    end
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 124
      Height = 13
      Caption = 'how many possible values'
    end
    object Button1: TButton
      Left = 281
      Top = 19
      Width = 97
      Height = 36
      Caption = 'generate'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object sp_setNum: TSpinEdit
      Left = 154
      Top = 27
      Width = 121
      Height = 22
      MaxValue = 1000000
      MinValue = 1
      TabOrder = 1
      Value = 4
    end
    object sp_howMany: TSpinEdit
      Left = 8
      Top = 27
      Width = 121
      Height = 22
      MaxValue = 1000000
      MinValue = 1
      TabOrder = 2
      Value = 6
    end
  end
end
