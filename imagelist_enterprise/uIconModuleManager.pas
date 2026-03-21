unit uIconModuleManager;

interface

uses
  System.SysUtils,
  System.Classes,
  System.IOUtils,
  System.JSON;

type
  /// <summary>
  /// Modulo comercial de gerenciamento de icones
  /// Painel central para ERP
  /// </summary>
  TIconModuleManager = class
  private
    class procedure Log(const AMsg: string);
  public
    class procedure ExportCatalog(const APath: string);
    class procedure ImportCatalog(const APath: string);
    class procedure AnalyzeUsage(AOwner: TComponent; AOutput: TStrings);
  end;

implementation

uses
  Winapi.Windows;

{ TIconModuleManager }

class procedure TIconModuleManager.Log(const AMsg: string);
begin
  OutputDebugString(PChar('[IconModule] ' + AMsg));
end;

class procedure TIconModuleManager.ExportCatalog(const APath: string);
var
  Files: TStringDynArray;
  JSON: TJSONArray;
  FileName: string;
begin
  JSON := TJSONArray.Create;
  try
    Files := TDirectory.GetFiles(APath, '*.svg');

    for FileName in Files do
      JSON.Add(TPath.GetFileName(FileName));

    TFile.WriteAllText(TPath.Combine(APath, 'catalog.json'), JSON.ToString);

    Log('Catalogo exportado');
  finally
    JSON.Free;
  end;
end;

class procedure TIconModuleManager.ImportCatalog(const APath: string);
begin
  Log('Importacao ainda pode ser expandida');
end;

class procedure TIconModuleManager.AnalyzeUsage(AOwner: TComponent; AOutput: TStrings);
var
  i: Integer;
begin
  for i := 0 to AOwner.ComponentCount - 1 do
    AOutput.Add(AOwner.Components[i].Name);

  Log('Analise concluida');
end;

end.
