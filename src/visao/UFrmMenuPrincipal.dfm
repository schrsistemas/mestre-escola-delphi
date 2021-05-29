object FrmMenuPrincipal: TFrmMenuPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 411
  ClientWidth = 706
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StbMenu: TStatusBar
    Left = 0
    Top = 392
    Width = 706
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object mmMenu: TMainMenu
    Left = 344
    Top = 208
    object mniControle: TMenuItem
      Caption = 'Controle'
      OnClick = mniControleClick
    end
    object mniCadastros: TMenuItem
      Caption = 'Cadastros'
      OnClick = mniCadastrosClick
    end
    object mniRelatorios: TMenuItem
      Caption = 'Relat'#243'rios'
      OnClick = mniRelatoriosClick
    end
    object mniConfig: TMenuItem
      Caption = 'Configura'#231#245'es'
      object mniConfiguraAcessoSGDB: TMenuItem
        Caption = 'Configura Acesso SGDB'
        OnClick = mniConfiguraAcessoSGDBClick
      end
      object mniExecutordeScript: TMenuItem
        Caption = 'Executor de Script'
        OnClick = mniExecutordeScriptClick
      end
    end
    object mniSobre: TMenuItem
      Caption = 'Sobre'
      OnClick = mniSobreClick
    end
  end
end
