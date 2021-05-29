unit UFrmMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, UDmBase, Vcl.Menus, UFrmCfgBD, UFrmQuery, UFrmControle,
  UFrmCadastros, UFrmRelatorios;

type
  TFrmMenuPrincipal = class(TForm)
    StbMenu: TStatusBar;
    mmMenu: TMainMenu;
    mniConfig: TMenuItem;
    mniCadastros: TMenuItem;
    mniRelatorios: TMenuItem;
    mniControle: TMenuItem;
    mniSobre: TMenuItem;
    mniConfiguraAcessoSGDB: TMenuItem;
    mniExecutordeScript: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure mniSobreClick(Sender: TObject);
    procedure mniConfiguraAcessoSGDBClick(Sender: TObject);
    procedure mniExecutordeScriptClick(Sender: TObject);
    procedure mniControleClick(Sender: TObject);
    procedure mniCadastrosClick(Sender: TObject);
    procedure mniRelatoriosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenuPrincipal: TFrmMenuPrincipal;

implementation

{$R *.dfm}

procedure TFrmMenuPrincipal.FormCreate(Sender: TObject);
begin

  if TDmBase.CreateDm then
    StbMenu.Panels[0].Text := 'Sistema Online'
  else
    StbMenu.Panels[0].Text := 'Sistema Offline';

end;

procedure TFrmMenuPrincipal.mniCadastrosClick(Sender: TObject);
begin
  TFrmCadastros.ShowFrm;
end;

procedure TFrmMenuPrincipal.mniConfiguraAcessoSGDBClick(Sender: TObject);
begin
  TFrmCfgBD.ShowFrm;
end;

procedure TFrmMenuPrincipal.mniControleClick(Sender: TObject);
begin
  TFrmControle.ShowFrm;
end;

procedure TFrmMenuPrincipal.mniExecutordeScriptClick(Sender: TObject);
begin
  TFrmQuery.ShowFrm;
end;

procedure TFrmMenuPrincipal.mniRelatoriosClick(Sender: TObject);
begin
  TFrmRelatorios.ShowFrm;
end;

procedure TFrmMenuPrincipal.mniSobreClick(Sender: TObject);
begin
  ShowMessage('Teste Sistema - Controle Mestre Escola!');

end;

end.

