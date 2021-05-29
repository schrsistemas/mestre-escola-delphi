object FrmQuery: TFrmQuery
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Executor de Script'
  ClientHeight = 484
  ClientWidth = 850
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 850
    Height = 13
    Align = alTop
    Caption = 'Query'
    ExplicitWidth = 30
  end
  object redtQuery: TRichEdit
    Left = 0
    Top = 13
    Width = 850
    Height = 204
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'redtQuery')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    Zoom = 100
    ExplicitTop = 11
    ExplicitWidth = 735
  end
  object StbQuery: TStatusBar
    Left = 0
    Top = 465
    Width = 850
    Height = 19
    Panels = <>
    ExplicitLeft = 368
    ExplicitTop = 216
    ExplicitWidth = 0
  end
  object pnlOpcoes: TPanel
    Left = 0
    Top = 217
    Width = 850
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitTop = 223
    ExplicitWidth = 735
    object btnExec: TButton
      AlignWithMargins = True
      Left = 771
      Top = 4
      Width = 75
      Height = 33
      Align = alRight
      Caption = 'Executar'
      TabOrder = 0
      OnClick = btnExecClick
      ExplicitLeft = 328
      ExplicitTop = 8
      ExplicitHeight = 25
    end
  end
  object pgcQuery: TPageControl
    Left = 0
    Top = 258
    Width = 850
    Height = 207
    ActivePage = tsLog
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 735
    ExplicitHeight = 139
    object tsGrid: TTabSheet
      Caption = 'Registros'
      ExplicitTop = 22
      ExplicitWidth = 727
      ExplicitHeight = 111
      object dbgrdRegistros: TDBGrid
        Left = 0
        Top = 0
        Width = 842
        Height = 179
        Align = alClient
        DataSource = dsRegistros
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object tsLog: TTabSheet
      Caption = 'Log'
      ImageIndex = 1
      ExplicitWidth = 727
      ExplicitHeight = 111
      object redtLog: TRichEdit
        Left = 0
        Top = 0
        Width = 842
        Height = 204
        Align = alTop
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          'redtQuery')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
        Zoom = 100
        ExplicitWidth = 727
      end
    end
  end
  object dsRegistros: TDataSource
    DataSet = DmBase.Query
    Left = 424
    Top = 216
  end
end
