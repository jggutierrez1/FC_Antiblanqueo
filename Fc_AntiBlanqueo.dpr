program Fc_AntiBlanqueo;

uses
  Vcl.Forms,
  About in 'About.pas' {fAbout},
  acceso in 'acceso.pas' {Facceso},
  acceso1 in 'acceso1.pas' {facceso1},
  AdjustGrid in 'AdjustGrid.pas',
  AdjustGridEh in 'AdjustGridEh.pas',
  Base64 in 'Base64.pas',
  BuscarGen in 'BuscarGen.pas' {FBuscarGen},
  BuscarGenM2 in 'BuscarGenM2.pas' {FBuscarGenM2},
  edita_reporte in 'edita_reporte.pas' {fedita_reporte},
  Gen_Calendario in 'Gen_Calendario.pas' {fGen_Calendario},
  Gen_Main in 'Gen_Main.pas' {fGen_Main},
  NetworkFunctions in 'NetworkFunctions.pas',
  Nwtools in 'Nwtools.pas',
  Reportes in 'Reportes.pas',
  sndkey32 in 'sndkey32.pas',
  SplashForm in 'SplashForm.pas' {TSplashForm},
  SplashForm2 in 'SplashForm2.pas' {TSplashForm2},
  SrvConf in 'SrvConf.pas' {fSrvCnf},
  TecladoGen1 in 'TecladoGen1.pas' {fTecladoGen1},
  TecladoGen2 in 'TecladoGen2.pas' {fTecladoGen2},
  usuarios in 'usuarios.pas' {Fusuarios},
  UTEval in 'UTEval.pas',
  UtilesV20 in 'UtilesV20.pas' {fUtilesV20},
  Gen_Scrn_Ctes in 'Gen_Scrn_Ctes.pas' {fGen_Scrn_Ctes},
  Gen_Mant_Cte in 'Gen_Mant_Cte.pas' {fGen_Mant_Cte},
  Gen_Add_Depend in 'Gen_Add_Depend.pas' {fGen_Add_Depend},
  Gen_Data_Mod in 'Gen_Data_Mod.pas' {dmGen_Data_Mod: TDataModule},
  Gen_Add_Activos in 'Gen_Add_Activos.pas' {fGen_Add_Activos},
  Gen_Add_PerF in 'Gen_Add_PerF.pas' {fGen_Add_PerF},
  Gen_Add_PerT in 'Gen_Add_PerT.pas' {fGen_Add_PerT},
  Gen_Add_RefB in 'Gen_Add_RefB.pas' {fGen_Add_RefB},
  Gen_Scrn_Prn in 'Gen_Scrn_Prn.pas' {fGen_Scrn_Prn},
  Mant_Gen_Banc in 'Mant_Gen_Banc.pas' {fMant_Gen_banc},
  Mant_Gen_Prov in 'Mant_Gen_Prov.pas' {fMant_Gen_Prov},
  Mant_Gen_Pais in 'Mant_Gen_Pais.pas' {fMant_Gen_Pais},
  Mant_Gen_Dist in 'Mant_Gen_Dist.pas' {fMant_Gen_Dist},
  BuscarGenM3 in 'BuscarGenM3.pas' {fBuscarGenM3},
  BuscarGenM4 in 'BuscarGenM4.pas' {fBuscarGenM4},
  BuscarGenM5 in 'BuscarGenM5.pas' {fBuscarGenM5},
  Mant_Gen_Corr in 'Mant_Gen_Corr.pas' {fMant_Gen_Corr},
  Gen_Scrn_Bus in 'Gen_Scrn_Bus.pas' {fGen_Scrn_Bus},
  Gen_MantQ_Geo in 'Gen_MantQ_Geo.pas' {fGen_ManrQ_Geo},
  Gen_Scrn_Herr in 'Gen_Scrn_Herr.pas' {fGen_Scrn_Herr},
  Gen_MantQ_Emp in 'Gen_MantQ_Emp.pas' {fGen_MantQ_Emp},
  Gen_Add_RefG in 'Gen_Add_RefG.pas' {fGen_Add_RefG},
  Gen_Add_Desc in 'Gen_Add_Desc.pas' {fGen_Add_Desc},
  Gen_Mant_Cte2 in 'Gen_Mant_Cte2.pas' {fGen_Mant_Cte2},
  Mant_Gen_fRiez in 'Mant_Gen_fRiez.pas' {fMant_Gen_fRiez},
  Gen_Pop_Pon in 'Gen_Pop_Pon.pas' {fGen_Pop_Pon},
  Mant_Gen_Empr in 'Mant_Gen_Empr.pas' {fMant_Gen_Empr},
  Rep_IndR in 'Rep_IndR.pas' {fRep_IndR},
  Gen_Scrn_Ind in 'Gen_Scrn_Ind.pas' {fGen_Scrn_Ind},
  Mant_Gen_Cte_Cat in 'Mant_Gen_Cte_Cat.pas' {fMant_Gen_Cte_Cat},
  Mant_Ded_Dil in 'Mant_Ded_Dil.pas' {fMant_Ded_Dil},
  Gen_MantQ_Act in 'Gen_MantQ_Act.pas' {fGen_MantQ_Act},
  Gen_MantC_ChL in 'Gen_MantC_ChL.pas' {fGen_MantC_ChL},
  Show_Matriz_Cte in 'Show_Matriz_Cte.pas' {fShow_Matriz_Cte},
  Gen_Mant_Cte2_Sel in 'Gen_Mant_Cte2_Sel.pas' {fGen_Mant_Cte2_Sel},
  BuscarGenM3_2 in 'BuscarGenM3_2.pas' {fBuscarGenM3_2},
  Gen_Scrn_Prn2 in 'Gen_Scrn_Prn2.pas' {fGen_Scrn_Prn2};

{$R *.res}

begin
 Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfUtilesV20, fUtilesV20);
  Application.CreateForm(TfGen_Main, fGen_Main);
  Application.Run;
end.
