program Projeto_MestreEscola;

uses
  Vcl.Forms,
  UFrmCfgBD in 'src\visao\UFrmCfgBD.pas' {FrmCfgBD},
  UFrmControle in 'src\visao\UFrmControle.pas' {FrmControle},
  UFrmMenuPrincipal in 'src\visao\UFrmMenuPrincipal.pas' {FrmMenuPrincipal},
  UDmBase in 'src\DM\UDmBase.pas' {DmBase: TDataModule},
  UDmrel in 'src\DM\UDmrel.pas' {DmRel: TDataModule},
  UClasseCfgDB in 'src\negocio\UClasseCfgDB.pas',
  UConstantes in 'src\uteis\UConstantes.pas',
  UControle.ClasseCfgDB in 'src\controle\UControle.ClasseCfgDB.pas',
  UDAO.ClasseCfgDB in 'src\dao\UDAO.ClasseCfgDB.pas',
  UFrmQuery in 'src\uteis\UFrmQuery.pas' {FrmQuery},
  UDmControle_ME in 'src\DM\UDmControle_ME.pas' {DmControle_ME: TDataModule},
  UFrmCadastros in 'src\visao\UFrmCadastros.pas' {FrmCadastros},
  UFrmRelatorios in 'src\visao\UFrmRelatorios.pas' {FrmRelatorios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TFrmMenuPrincipal, FrmMenuPrincipal);
  Application.Run;
end.
