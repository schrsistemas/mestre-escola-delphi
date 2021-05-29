unit UFrmControle;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  UDmControle_ME, Data.DB;

type
  TFrmControle = class(TForm)
    dsRegistros: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function ShowFrm: Boolean;
  end;

var
  FrmControle: TFrmControle;

implementation

{$R *.dfm}

{ TFrmControle }

procedure TFrmControle.FormCreate(Sender: TObject);
begin
  TDmControle_ME.CreateDM;

end;

class function TFrmControle.ShowFrm: Boolean;
begin
  FrmControle := TFrmControle.Create(Application);
  try
    with FrmControle do
    begin
      ShowModal;
    end;
  finally
    FreeAndNil(FrmControle);
  end;
end;

end.

