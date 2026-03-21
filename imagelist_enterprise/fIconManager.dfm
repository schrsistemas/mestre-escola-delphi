object frmIconManager: TfrmIconManager
  Left = 0
  Top = 0
  Caption = 'Icon Manager'
  ClientHeight = 600
  ClientWidth = 900
  Position = poScreenCenter
  object PageControl1: TPageControl
    Align = alClient
    TabOrder = 0
    object TabCatalog: TTabSheet
      Caption = 'Catalogo'
      object GridCatalog: TStringGrid
        Align = alLeft
        Width = 400
        ColCount = 1
        FixedCols = 0
        RowCount = 2
        TabOrder = 0
      end
      object PanelRight: TPanel
        Align = alClient
        TabOrder = 1
        object ImagePreview: TImage
          Align = alTop
          Height = 150
        end
        object BtnReload: TButton
          Top = 160
          Left = 10
          Width = 150
          Caption = 'Recarregar'
          TabOrder = 0
        end
      end
    end
    object TabUsage: TTabSheet
      Caption = 'Uso'
      object MemoUsage: TMemo
        Align = alClient
        TabOrder = 0
      end
      object BtnAnalyze: TButton
        Align = alBottom
        Height = 40
        Caption = 'Analisar Sistema'
        TabOrder = 1
      end
    end
    object TabAI: TTabSheet
      Caption = 'IA'
      object MemoAI: TMemo
        Align = alClient
        TabOrder = 0
      end
      object BtnGenerateAI: TButton
        Align = alBottom
        Height = 40
        Caption = 'Gerar Icones com IA'
        TabOrder = 1
      end
    end
    object TabConfig: TTabSheet
      Caption = 'Configuracoes'
      object ValueConfig: TValueListEditor
        Align = alClient
        TabOrder = 0
      end
      object BtnSaveConfig: TButton
        Align = alBottom
        Height = 40
        Caption = 'Salvar'
        TabOrder = 1
      end
    end
  end
end
