unit uAIIconGenerator;

interface

uses
  System.SysUtils,
  System.Classes,
  System.IOUtils;

type
  /// <summary>
  /// Gerador automatico de icones (base estrutural para IA ou heuristica)
  /// </summary>
  TAIIconGenerator = class
  private
    class procedure Log(const AMsg: string);
    class function NormalizeName(const AText: string): string;
  public
    class procedure GenerateFromActions(APath: string; AList: TStrings);
  end;

implementation

uses
  Winapi.Windows;

{ TAIIconGenerator }

class procedure TAIIconGenerator.Log(const AMsg: string);
begin
  OutputDebugString(PChar('[AIIconGen] ' + AMsg));
end;

class function TAIIconGenerator.NormalizeName(const AText: string): string;
begin
  Result := LowerCase(AText);
  Result := StringReplace(Result, ' ', '_', [rfReplaceAll]);
  Result := StringReplace(Result, '-', '_', [rfReplaceAll]);
end;

class procedure TAIIconGenerator.GenerateFromActions(APath: string; AList: TStrings);
var
  Name: string;
  FileName: string;
  SVG: TStringList;
begin
  ForceDirectories(APath);

  for Name in AList do
  begin
    FileName := TPath.Combine(APath, NormalizeName(Name) + '.svg');

    if not FileExists(FileName) then
    begin
      SVG := TStringList.Create;
      try
        // SVG basico (placeholder inteligente)
        SVG.Text :=
          '<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">' +
          '<rect x="4" y="4" width="16" height="16" stroke="black" fill="none"/>' +
          '<text x="12" y="16" font-size="8" text-anchor="middle">' + Copy(Name,1,2) + '</text>' +
          '</svg>';

        SVG.SaveToFile(FileName);

        Log('Icone gerado: ' + FileName);
      finally
        SVG.Free;
      end;
    end
    else
      Log('Icone ja existe: ' + FileName);
  end;
end;

end.
