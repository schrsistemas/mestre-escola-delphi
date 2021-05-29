unit UFrmRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxDesgn, frxClass, Vcl.StdCtrls,
  Vcl.ExtCtrls, frxExportRTF, frxExportBaseDialog, frxExportPDF, frxDBSet;

type
  TFrmRelatorios = class(TForm)
    frxReport: TfrxReport;
    frxDesigner: TfrxDesigner;
    Panel1: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    frxDBDataset: TfrxDBDataset;
    frxPDFExport: TfrxPDFExport;
    frxRTFExport: TfrxRTFExport;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function ShowFrm: Boolean;
  end;

var
  FrmRelatorios: TFrmRelatorios;

implementation

{$R *.dfm}

{ TFrmRelatorios }

procedure TFrmRelatorios.btnOkClick(Sender: TObject);
begin
  frxReport.ShowReport;
end;

class function TFrmRelatorios.ShowFrm: Boolean;
begin
  FrmRelatorios := TFrmRelatorios.Create(Application);
  try
    with FrmRelatorios do
    begin
      ShowModal;
    end;
  finally
    FreeAndNil(FrmRelatorios);
  end;
end;

end.
