unit UFrmQuery;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UDmBase,
  Data.DB, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFrmQuery = class(TForm)
    dsRegistros: TDataSource;
    redtQuery: TRichEdit;
    Label1: TLabel;
    StbQuery: TStatusBar;
    pnlOpcoes: TPanel;
    btnExec: TButton;
    pgcQuery: TPageControl;
    tsGrid: TTabSheet;
    tsLog: TTabSheet;
    dbgrdRegistros: TDBGrid;
    redtLog: TRichEdit;
    procedure btnExecClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCommitClick(Sender: TObject);
    procedure btnRollbackClick(Sender: TObject);
  private
    { Private declarations }
    tmrInicio, tmrFim: TTime;
    procedure ExecutarScript;
  public
    { Public declarations }
    class function ShowFrm: Boolean;
  end;

var
  FrmQuery: TFrmQuery;

implementation

{$R *.dfm}

{ TFrmQuery }

procedure TFrmQuery.btnCommitClick(Sender: TObject);
begin
  DmBase.Conexao.Commit;
end;

procedure TFrmQuery.btnExecClick(Sender: TObject);
begin
  ExecutarScript;
end;

procedure TFrmQuery.btnRollbackClick(Sender: TObject);
begin
  DmBase.Conexao.Rollback;
end;

procedure TFrmQuery.ExecutarScript;
begin
  with DmBase do
  begin
    try
      tmrInicio := Now;

      FDScript.SQLScripts.Clear;
      FDScript.SQLScripts.Add;
      FDScript.SQLScripts[0].SQL.Clear;

      if Length(Trim(redtQuery.SelText)) = 0 then
      begin
        FDScript.SQLScripts[0].SQL := redtQuery.Lines;
      end
      else
      begin
        FDScript.SQLScripts[0].SQL.Text := redtQuery.SelText;
      end;

      FDScript.ExecuteAll;

      if not FDScript.IsEmpty then
      begin

        Query.Close;
        Query.SQL.Text := FDScript.SQLScripts[0].SQL.Text;
        try
          Query.Open;
        except
        end;
      end;

      if (Query.RecordCount > 0) or (Query.Fields.Count > 0) then
      begin
        pgcQuery.ActivePageIndex := 0;
      end
      else
      begin
        pgcQuery.ActivePageIndex := 1;
      end;
      tmrFim := Now;
      redtLog.Font.Color := clBlue;
      redtLog.Lines.Clear;
      redtLog.Lines.Add(FormatDateTime('dd/MM/yyyy - hh:mm:ss', Now) + ' - SQL: ');
      redtLog.Lines.Add(QuotedStr(FDScript.SQLScripts[0].SQL.Text));
      redtLog.Lines.Add('Rows Affected: ' + IntToStr(Query.RowsAffected));
      redtLog.Lines.Add('Total execution time: ' + FormatFloat(',0.0000', (tmrFim - tmrInicio) * 1000) + 's');
      redtLog.Lines.Add('Script execution finished.');

    except
      on E: Exception do
      begin
        redtLog.Font.Color := clRed;
        pgcQuery.ActivePageIndex := 1;
        redtLog.Text := E.Message;
      end;
    end;
  end;
end;

procedure TFrmQuery.FormCreate(Sender: TObject);
begin
  redtQuery.Clear;
  redtLog.Clear;
  dbgrdRegistros.DataSource := dsRegistros;
  dsRegistros.DataSet := DmBase.Query;

end;

procedure TFrmQuery.FormShow(Sender: TObject);
begin
  redtQuery.SetFocus;
end;

class function TFrmQuery.ShowFrm: Boolean;
begin
  FrmQuery := TFrmQuery.Create(Application);
  try
    with FrmQuery do
    begin
      ShowModal;
    end;
  finally
    FreeAndNil(FrmQuery);
  end;
end;

end.

