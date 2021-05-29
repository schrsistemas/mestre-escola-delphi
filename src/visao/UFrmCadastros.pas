unit UFrmCadastros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TFrmCadastros = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
    class function ShowFrm: Boolean;
  end;

var
  FrmCadastros: TFrmCadastros;

implementation

{$R *.dfm}

{ TFrmCadastros }

class function TFrmCadastros.ShowFrm: Boolean;
begin
  FrmCadastros := TFrmCadastros.Create(Application);
  try
    with FrmCadastros do
    begin
      ShowModal;
    end;
  finally
    FreeAndNil(FrmCadastros);
  end;
end;

end.
