unit fConfigCenter;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Controls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  uThemeManager;

type
  TfrmConfigCenter = class(TForm)
    PanelTop: TPanel;
    BtnThemeDark: TButton;
    BtnThemeLight: TButton;
    BtnIconManager: TButton;
    BtnApplyAll: TButton;

    PageControl1: TPageControl;
    TabGeneral: TTabSheet;
    TabIcons: TTabSheet;
    TabTheme: TTabSheet;

    MemoLog: TMemo;

    procedure FormCreate(Sender: TObject);
    procedure BtnThemeDarkClick(Sender: TObject);
    procedure BtnThemeLightClick(Sender: TObject);
    procedure BtnApplyAllClick(Sender: TObject);
  private
    procedure Log(const AMsg: string);
  public
  end;

implementation

uses
  uIconEngine;

{$R *.dfm}

procedure TfrmConfigCenter.FormCreate(Sender: TObject);
begin
  Caption := 'Central de Configuracoes';
  Log('Inicializado');
end;

procedure TfrmConfigCenter.Log(const AMsg: string);
begin
  MemoLog.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' + AMsg);
end;

procedure TfrmConfigCenter.BtnThemeDarkClick(Sender: TObject);
begin
  TThemeManager.ApplyTheme(Self, atDark);
  Log('Tema Dark aplicado');
end;

procedure TfrmConfigCenter.BtnThemeLightClick(Sender: TObject);
begin
  TThemeManager.ApplyTheme(Self, atLight);
  Log('Tema Light aplicado');
end;

procedure TfrmConfigCenter.BtnApplyAllClick(Sender: TObject);
begin
  Log('Aplicando configuracoes globais...');

  // refresh icones
  TIconEngine.RefreshAll;

  Log('Icones atualizados');
end;

end.
