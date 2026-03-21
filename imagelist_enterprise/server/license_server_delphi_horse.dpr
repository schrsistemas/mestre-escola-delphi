program LicenseServer;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  Horse,
  Horse.Jhonson,
  System.JSON;

procedure Validate(Req: THorseRequest; Res: THorseResponse);
var
  JSON: TJSONObject;
begin
  JSON := TJSONObject.Create;
  try
    JSON.AddPair('status', 'OK');
    JSON.AddPair('license', 'AI');
    JSON.AddPair('expires', '2026-12-31');

    Res.Send(JSON);
  finally
    JSON.Free;
  end;
end;

procedure Activate(Req: THorseRequest; Res: THorseResponse);
var
  JSON: TJSONObject;
begin
  JSON := TJSONObject.Create;
  try
    JSON.AddPair('status', 'ACTIVATED');
    Res.Send(JSON);
  finally
    JSON.Free;
  end;
end;

begin
  THorse.Use(Jhonson);

  THorse.Post('/validate', Validate);
  THorse.Post('/activate', Activate);

  THorse.Listen(9000,
    procedure
    begin
      Writeln('License Server running on port 9000');
    end);
end.
