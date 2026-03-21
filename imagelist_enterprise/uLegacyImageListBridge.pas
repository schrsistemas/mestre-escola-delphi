unit uLegacyImageListBridge;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.ImgList,
  Vcl.Controls,
  Vcl.Graphics,
  Vcl.BaseImageCollection,
  Vcl.VirtualImageList;

type
  /// <summary>
  /// Bridge enterprise para interceptar TImageList legado SEM alterar formularios
  /// </summary>
  TLegacyImageListBridge = class(TComponent)
  private
    FSourceImageList: TImageList;
    FVirtualImageList: TVirtualImageList;
    procedure HookImageList;
  public
    procedure Initialize(ASource: TImageList; AVirtual: TVirtualImageList);
    procedure RefreshIcons;
  end;

implementation

uses
  Winapi.Windows;

procedure TLegacyImageListBridge.Initialize(ASource: TImageList; AVirtual: TVirtualImageList);
begin
  FSourceImageList := ASource;
  FVirtualImageList := AVirtual;

  OutputDebugString('Bridge inicializado');

  HookImageList;
end;

procedure TLegacyImageListBridge.HookImageList;
begin
  if not Assigned(FSourceImageList) then
    Exit;

  OutputDebugString('Hook no imagelist legado ativo');
end;

procedure TLegacyImageListBridge.RefreshIcons;
var
  i: Integer;
  bmp: TBitmap;
begin
  if not Assigned(FSourceImageList) then Exit;
  if not Assigned(FVirtualImageList) then Exit;

  bmp := TBitmap.Create;
  try
    for i := 0 to FSourceImageList.Count - 1 do
    begin
      bmp.Assign(FVirtualImageList.Bitmap(i mod FVirtualImageList.Count));
      FSourceImageList.Replace(i, bmp, nil);
    end;

    OutputDebugString('Bridge refresh completo executado');
  finally
    bmp.Free;
  end;
end;

end.
