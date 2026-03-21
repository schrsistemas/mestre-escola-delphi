unit fIconManager;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Controls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.Grids,
  Vcl.ValEdit,
  uIconModuleManager;

type
  TfrmIconManager = class(TForm)
    PageControl1: TPageControl;
    TabCatalog: TTabSheet;
    TabUsage: TTabSheet;
    TabAI: TTabSheet;
    TabConfig: TTabSheet;

    GridCatalog: TStringGrid;
    BtnReload: TButton;

    MemoUsage: TMemo;
    BtnAnalyze: TButton;

    BtnGenerateAI: TButton;
    MemoAI: TMemo;

    ValueConfig: TValueListEditor;
    BtnSaveConfig: TButton;

    procedure FormCreate(Sender: TObject);
    procedure BtnReloadClick(Sender: TObject);
    procedure BtnAnalyzeClick(Sender: TObject);
    procedure BtnGenerateAIClick(Sender: TObject);
    procedure BtnSaveConfigClick(Sender: TObject);
  private
    procedure LoadCatalog;
  public
  end;

implementation

uses
  System.IOUtils;

{$R *.dfm}

procedure TfrmIconManager.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePage := TabCatalog;
  LoadCatalog;
end;

procedure TfrmIconManager.LoadCatalog;
var
  Files: TStringDynArray;
  i: Integer;
begin
  GridCatalog.RowCount := 1;

  Files := TDirectory.GetFiles('icons', '*.svg');

  for i := 0 to High(Files) do
  begin
    GridCatalog.RowCount := GridCatalog.RowCount + 1;
    GridCatalog.Cells[0, i+1] := ExtractFileName(Files[i]);
  end;
end;

procedure TfrmIconManager.BtnReloadClick(Sender: TObject);
begin
  LoadCatalog;
end;

procedure TfrmIconManager.BtnAnalyzeClick(Sender: TObject);
var
  List: TStringList;
begin
  List := TStringList.Create;
  try
    TIconModuleManager.AnalyzeUsage(Application, List);
    MemoUsage.Lines.Assign(List);
  finally
    List.Free;
  end;
end;

procedure TfrmIconManager.BtnGenerateAIClick(Sender: TObject);
begin
  MemoAI.Lines.Add('Geracao IA disparada (integrar com engine)');
end;

procedure TfrmIconManager.BtnSaveConfigClick(Sender: TObject);
begin
  ShowMessage('Configuracoes salvas');
end;

end.
