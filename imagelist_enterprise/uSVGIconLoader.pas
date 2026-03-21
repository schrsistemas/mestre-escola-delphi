unit uSVGIconLoader;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.BaseImageCollection,
  Vcl.Graphics;

type
  /// <summary>
  /// Loader enterprise de SVG com fallback PNG
  /// Preparado para Skia4Delphi
  /// </summary>
  TSVGIconLoader = class
  private
    class procedure Log(const AMsg: string);
  public
    class procedure LoadFromFolder(ACollection: TImageCollection; const APath: string);
  end;

implementation

uses
  Winapi.Windows,
  System.IOUtils
  {$IFDEF SKIA}
  , Skia, Skia.Vcl
  {$ENDIF}
  ;

{ TSVGIconLoader }

class procedure TSVGIconLoader.Log(const AMsg: string);
begin
  OutputDebugString(PChar('[SVGLoader] ' + AMsg));
end;

class procedure TSVGIconLoader.LoadFromFolder(ACollection: TImageCollection; const APath: string);
var
  Files: TStringDynArray;
  FileName: string;
  Item: TImageCollectionItem;
  Bmp: TBitmap;
begin
  if not Assigned(ACollection) then
    Exit;

  Log('Carregando icones de: ' + APath);

  Files := TDirectory.GetFiles(APath);

  for FileName in Files do
  begin
    try
      Item := ACollection.Items.Add;
      Item.Name := TPath.GetFileNameWithoutExtension(FileName);

      {$IFDEF SKIA}
      if SameText(TPath.GetExtension(FileName), '.svg') then
      begin
        Bmp := TBitmap.Create;
        try
          Bmp.SetSize(32, 32);
          Bmp.SkiaDraw(
            procedure(Canvas: ISkCanvas)
            var
              Svg: ISkSVGDOM;
            begin
              Svg := TSkSVGDOM.MakeFromFile(FileName);
              Canvas.DrawSVG(Svg);
            end);

          Item.Bitmap := Bmp;
          Log('SVG carregado: ' + Item.Name);
        finally
          Bmp.Free;
        end;
      end
      else
      {$ENDIF}
      begin
        Item.Bitmap.LoadFromFile(FileName);
        Log('PNG carregado: ' + Item.Name);
      end;

    except
      on E: Exception do
        Log('Erro ao carregar ' + FileName + ' -> ' + E.Message);
    end;
  end;

  Log('Carga finalizada. Total: ' + ACollection.Count.ToString);
end;

end.
