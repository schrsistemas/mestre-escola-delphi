unit uAIIconOpenAI;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Net.HttpClient,
  System.JSON;

type
  /// <summary>
  /// Integracao com IA para geracao real de SVG
  /// </summary>
  TAIIconOpenAI = class
  private
    class procedure Log(const AMsg: string);
    class function BuildPrompt(const AName: string): string;
  public
    class function GenerateSVG(const AName: string): string;
  end;

implementation

uses
  Winapi.Windows;

{ TAIIconOpenAI }

class procedure TAIIconOpenAI.Log(const AMsg: string);
begin
  OutputDebugString(PChar('[AI-OpenAI] ' + AMsg));
end;

class function TAIIconOpenAI.BuildPrompt(const AName: string): string;
begin
  Result := 'Generate a clean minimal SVG icon (24x24) for: ' + AName +
            '. Use outline style, no colors, transparent background.';
end;

class function TAIIconOpenAI.GenerateSVG(const AName: string): string;
var
  Client: THTTPClient;
  Response: IHTTPResponse;
  JSONReq, JSONResp: TJSONObject;
  Content: string;
begin
  Client := THTTPClient.Create;
  try
    JSONReq := TJSONObject.Create;
    try
      JSONReq.AddPair('model', 'gpt-image-1');
      JSONReq.AddPair('prompt', BuildPrompt(AName));

      Content := JSONReq.ToString;

      Response := Client.Post(
        'https://api.openai.com/v1/images/generations',
        TStringStream.Create(Content),
        nil,
        [TNameValuePair.Create('Authorization', 'Bearer YOUR_API_KEY'),
         TNameValuePair.Create('Content-Type', 'application/json')]
      );

      JSONResp := TJSONObject.ParseJSONValue(Response.ContentAsString) as TJSONObject;
      try
        Result := JSONResp.ToString; // simplificado (ajustar parsing real)
        Log('SVG gerado via IA: ' + AName);
      finally
        JSONResp.Free;
      end;

    finally
      JSONReq.Free;
    end;
  finally
    Client.Free;
  end;
end;

end.
