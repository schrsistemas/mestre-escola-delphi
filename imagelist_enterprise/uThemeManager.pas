unit uThemeManager;

interface

uses
  Vcl.Forms, Vcl.Controls, Vcl.Graphics, System.Classes;

type
  TAppTheme = (atLight, atDark);

  TThemeManager = class
  private
    class var FTheme: TAppTheme;
    class procedure ApplyToControl(AControl: TControl);
  public
    class procedure ApplyTheme(AForm: TForm; ATheme: TAppTheme);
    class property CurrentTheme: TAppTheme read FTheme;
  end;

implementation

uses
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

{ TThemeManager }

class procedure TThemeManager.ApplyTheme(AForm: TForm; ATheme: TAppTheme);
begin
  FTheme := ATheme;

  if ATheme = atDark then
  begin
    AForm.Color := $002B2B2B;
    AForm.Font.Color := clWhite;
  end
  else
  begin
    AForm.Color := clBtnFace;
    AForm.Font.Color := clBlack;
  end;

  ApplyToControl(AForm);
end;

class procedure TThemeManager.ApplyToControl(AControl: TControl);
var
  i: Integer;
begin
  if AControl is TPanel then
  begin
    if FTheme = atDark then
      TPanel(AControl).Color := $00333333
    else
      TPanel(AControl).Color := clBtnFace;
  end;

  if AControl is TButton then
  begin
    if FTheme = atDark then
    begin
      TButton(AControl).Font.Color := clWhite;
    end;
  end;

  if AControl is TMemo then
  begin
    if FTheme = atDark then
    begin
      TMemo(AControl).Color := $00202020;
      TMemo(AControl).Font.Color := clWhite;
    end;
  end;

  if AControl is TStringGrid then
  begin
    if FTheme = atDark then
    begin
      TStringGrid(AControl).Color := $00202020;
      TStringGrid(AControl).Font.Color := clWhite;
    end;
  end;

  for i := 0 to AControl.ComponentCount - 1 do
  begin
    if AControl.Components[i] is TControl then
      ApplyToControl(TControl(AControl.Components[i]));
  end;
end;

end.
