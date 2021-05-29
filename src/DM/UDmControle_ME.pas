unit UDmControle_ME;

interface

uses
  System.SysUtils, System.Classes, Forms, UDmBase;

type
  TDmControle_ME = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    class function CreateDM: Boolean;
  end;

var
  DmControle_ME: TDmControle_ME;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmControle_ME }

class function TDmControle_ME.CreateDM: Boolean;
begin
  if not Assigned(DmControle_ME) then
  begin
    DmControle_ME := TDmControle_ME.Create(Application);
    DmBase.ConfigDm(DmControle_ME);
  end;
end;

end.

