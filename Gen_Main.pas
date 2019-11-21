unit Gen_Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvSmoothButton, Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ComCtrls, Vcl.ExtCtrls,
  AdvGroupBox, ResizeKit, Vcl.Menus, ShellApi;

type
  TfGen_Main = class(TForm)
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    MANTENIMIENT1: TMenuItem;
    Banco1: TMenuItem;
    Pais1: TMenuItem;
    Provincias1: TMenuItem;
    Corregimientos1: TMenuItem;
    Distritos1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    AdvGroupBox1: TAdvGroupBox;
    Label2: TLabel;
    oBtn_Asoc: TAdvSmoothButton;
    AdvGroupBox2: TAdvGroupBox;
    Label3: TLabel;
    oBtn_Busca: TAdvSmoothButton;
    AdvGroupBox3: TAdvGroupBox;
    Label4: TLabel;
    oBtn_Anal: TAdvSmoothButton;
    AdvGroupBox4: TAdvGroupBox;
    Label5: TLabel;
    oBtn_Herra: TAdvSmoothButton;
    oBtn_Salir: TAdvSmoothButton;
    Label1: TLabel;
    ResizeKit1: TResizeKit;
    Usuario1: TMenuItem;
    Clientes21: TMenuItem;
    Clientes1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    FactoresdeRiezgo1: TMenuItem;
    N5: TMenuItem;
    Empresa1: TMenuItem;
    Buscadores1: TMenuItem;
    Informes1: TMenuItem;
    Herrameintas1: TMenuItem;
    oMenu_UNSC: TMenuItem;
    oMenu_ofac: TMenuItem;
    oMenu_OC: TMenuItem;
    oMenu_Osfi: TMenuItem;
    oMenu_UAF: TMenuItem;
    N6: TMenuItem;
    oMenu_UK: TMenuItem;
    oMenu_RP: TMenuItem;
    AsociacinPanameadeCrditoAPC1: TMenuItem;
    oMenu_ARiesgo: TMenuItem;
    oMenu_AERiesgo: TMenuItem;
    oMenu_EERiesgos: TMenuItem;
    oMenu_IR: TMenuItem;
    oMenu_MG: TMenuItem;
    oMenu_TI: TMenuItem;
    oMenu_VC: TMenuItem;
    oMenu_CA: TMenuItem;
    oMenu_BOnu: TMenuItem;
    oMenu_RN: TMenuItem;
    oMenu_FACTA: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ClientesCategoras1: TMenuItem;
    Debidadiligencia1: TMenuItem;
    N9: TMenuItem;
    ChekListSocios1: TMenuItem;
    N10: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure oBtn_SalirClick(Sender: TObject);
    procedure oBtn_AsocClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Banco1Click(Sender: TObject);
    procedure Provincias1Click(Sender: TObject);
    procedure Corregimientos1Click(Sender: TObject);
    procedure Pais1Click(Sender: TObject);
    procedure Distritos1Click(Sender: TObject);
    procedure oBtn_BuscaClick(Sender: TObject);
    procedure oBtn_HerraClick(Sender: TObject);
    procedure Usuario1Click(Sender: TObject);
    procedure Clientes21Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure FactoresdeRiezgo1Click(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
    procedure oMenu_UNSCClick(Sender: TObject);
    procedure oMenu_OsfiClick(Sender: TObject);
    procedure oMenu_UKClick(Sender: TObject);
    procedure oMenu_UAFClick(Sender: TObject);
    procedure oMenu_OCClick(Sender: TObject);
    procedure oMenu_ofacClick(Sender: TObject);
    procedure oMenu_RPClick(Sender: TObject);
    procedure AsociacinPanameadeCrditoAPC1Click(Sender: TObject);
    procedure oMenu_ARiesgoClick(Sender: TObject);
    procedure oMenu_AERiesgoClick(Sender: TObject);
    procedure oMenu_EERiesgosClick(Sender: TObject);
    procedure oMenu_MGClick(Sender: TObject);
    procedure oMenu_IRClick(Sender: TObject);
    procedure ClientesCategoras1Click(Sender: TObject);
    procedure Debidadiligencia1Click(Sender: TObject);
    procedure ChekListSocios1Click(Sender: TObject);
  private
    FGraphic: TGraphic;
    bSend_Kill: boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGen_Main: TfGen_Main;

implementation

uses
  acceso, About, UtilesV20, usuarios, Base64,
  gen_calendario, Gen_Scrn_Ctes, Mant_Gen_banc, Mant_Gen_Pais, Mant_Gen_Prov,
  Mant_Gen_Corr, Mant_Gen_Dist, Gen_Data_Mod, Gen_Scrn_Bus, Gen_Scrn_Herr,
  Gen_Mant_Cte, Gen_Mant_Cte2, Mant_Gen_fRiez, Mant_Gen_Empr, Gen_MantQ_Geo,
  Gen_MantQ_Emp, Gen_MantQ_Act, Rep_IndR, Gen_Scrn_Ind, Mant_Gen_Cte_Cat,
  Mant_Ded_Dil, Gen_MantC_ChL;

{$R *.dfm}

procedure TfGen_Main.oBtn_AsocClick(Sender: TObject);
begin

  self.oBtn_Asoc.Enabled := false;
  self.Visible := false;

  if (UtilesV20.bEsCooperatiba = true) then
  begin
    Application.CreateForm(TfGen_Scrn_Ctes, fGen_Scrn_Ctes);
    fGen_Scrn_Ctes.ShowModal;
    freeandnil(fGen_Scrn_Ctes);
  end
  else
  begin
    Application.CreateForm(TfGen_Mant_Cte2, fGen_Mant_Cte2);
    fGen_Mant_Cte2.ShowModal;
    freeandnil(fGen_Mant_Cte2);
  end;

  self.Visible := true;
  self.oBtn_Asoc.Enabled := true;
end;

procedure TfGen_Main.oBtn_BuscaClick(Sender: TObject);
begin
  self.oBtn_Busca.Enabled := false;
  self.Visible := false;
  Application.CreateForm(TfGen_Scrn_Bus, fGen_Scrn_Bus);
  fGen_Scrn_Bus.ShowModal;
  freeandnil(fGen_Scrn_Bus);
  self.Visible := true;
  self.oBtn_Busca.Enabled := true;
end;

procedure TfGen_Main.oBtn_HerraClick(Sender: TObject);
begin
  self.oBtn_Herra.Enabled := false;
  self.Visible := false;
  Application.CreateForm(TfGen_Scrn_Herr, fGen_Scrn_Herr);
  fGen_Scrn_Herr.ShowModal;
  freeandnil(fGen_Scrn_Herr);
  self.oBtn_Herra.Enabled := true;
  self.Visible := true;
end;

procedure TfGen_Main.oBtn_SalirClick(Sender: TObject);
begin
  halt;
end;

procedure TfGen_Main.oMenu_OCClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.opencorporates.com/', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Main.oMenu_ofacClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://sanctionssearch.ofac.treas.gov/', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Main.oMenu_OsfiClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.osfi-bsif.gc.ca/Eng/fi-if/amlc-clrpc/atf-fat/Pages/default.aspx', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Main.oMenu_RPClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.rp.gob.pa/', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Main.oMenu_UAFClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.uaf.gob.pa/Lista-Nacional', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Main.oMenu_UKClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://www.gov.uk/government/publications/current-list-of-designated-persons-terrorism-and-terrorist-financing', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Main.oMenu_UNSCClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://scsanctions.un.org/search/', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Main.AsociacinPanameadeCrditoAPC1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://online.apc.com.pa/Login/tabid/468/Default.aspx?returnurl=%2fdefault.aspx', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Main.Banco1Click(Sender: TObject);
begin
  Application.CreateForm(TfMant_Gen_banc, fMant_Gen_banc);
  fMant_Gen_banc.ShowModal;
  freeandnil(fMant_Gen_banc);
end;

procedure TfGen_Main.ChekListSocios1Click(Sender: TObject);
begin
  Application.CreateForm(TfGen_MantC_ChL, fGen_MantC_ChL);
  fGen_MantC_ChL.ShowModal;
  freeandnil(fGen_MantC_ChL);
end;

procedure TfGen_Main.Clientes1Click(Sender: TObject);
begin
  Application.CreateForm(TfGen_Mant_Cte, fGen_Mant_Cte);
  fGen_Mant_Cte.ShowModal;
  freeandnil(fGen_Mant_Cte);
end;

procedure TfGen_Main.Clientes21Click(Sender: TObject);
begin
  Application.CreateForm(TfGen_Mant_Cte2, fGen_Mant_Cte2);
  fGen_Mant_Cte2.ShowModal;
  freeandnil(fGen_Mant_Cte2);
end;

procedure TfGen_Main.ClientesCategoras1Click(Sender: TObject);
begin
  Application.CreateForm(TfMant_Gen_Cte_Cat, fMant_Gen_Cte_Cat);
  fMant_Gen_Cte_Cat.ShowModal;
  freeandnil(fMant_Gen_Cte_Cat);
end;

procedure TfGen_Main.Corregimientos1Click(Sender: TObject);
begin
  Application.CreateForm(TfMant_Gen_Corr, fMant_Gen_Corr);
  fMant_Gen_Corr.ShowModal;
  freeandnil(fMant_Gen_Corr);
end;

procedure TfGen_Main.Debidadiligencia1Click(Sender: TObject);
begin
  Application.CreateForm(TfMant_Ded_Dil, fMant_Ded_Dil);
  fMant_Ded_Dil.ShowModal;
  freeandnil(fMant_Ded_Dil);
end;

procedure TfGen_Main.Distritos1Click(Sender: TObject);
begin
  Application.CreateForm(TfMant_Gen_Dist, fMant_Gen_Dist);
  fMant_Gen_Dist.ShowModal;
  freeandnil(fMant_Gen_Dist);
end;

procedure TfGen_Main.Empresa1Click(Sender: TObject);
begin
  Application.CreateForm(TfMant_Gen_Empr, fMant_Gen_Empr);
  fMant_Gen_Empr.ShowModal;
  freeandnil(fMant_Gen_Empr);
end;

procedure TfGen_Main.FactoresdeRiezgo1Click(Sender: TObject);
begin
  Application.CreateForm(TfMant_Gen_fRiez, fMant_Gen_fRiez);
  fMant_Gen_fRiez.ShowModal;
  freeandnil(fMant_Gen_fRiez);
end;

procedure TfGen_Main.FormActivate(Sender: TObject);
begin
  if (self.bSend_Kill = true) then
  begin
    close;
    Application.Terminate;
    System.halt;
  end;
end;

procedure TfGen_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FGraphic.Free;
  fUtilesV20.close;
  fUtilesV20.Free;
end;

procedure TfGen_Main.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TdmGen_Data_Mod, dmGen_Data_Mod);
  dmGen_Data_Mod.Init_Conection();

  self.bSend_Kill := false;
  fUtilesV20.Visible := false;
  Application.CreateForm(Tfacceso, facceso);
  facceso.ShowModal;
  self.bSend_Kill := facceso.bExit;

  if (facceso.iPassOk = false) then
  begin
    facceso.Free;
  end
  else
  begin
    self.StatusBar1.Panels[0].Text := 'Usuario: ' + UtilesV20.sUserName;
    self.StatusBar1.Panels[1].Text := 'Fecha: ' + formatDateTime('dd/mm/yyyy', now());
    self.StatusBar1.Panels[2].Text := 'Servidor: ' + fUtilesV20.oPublicCnn.Params.Values['Server'] + '/' + UpperCase(fUtilesV20.oPublicCnn.Params.Values['Database']);
    self.StatusBar1.Panels[3].Text := 'Empresa: ' + UtilesV20.cDe_Empresa;
    facceso.Free;
  end;

  // FGraphic := TJPEGImage.Create;
  // FGraphic.LoadFromFile(ExtractFilePath(ParamStr(0)) + '/Img_Backg.jpg');
  fUtilesV20.Visible := false;
end;

procedure TfGen_Main.FormShow(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  FormatSettings.ThousandSeparator := ',';
  FormatSettings.CurrencyDecimals := 2;
  FormatSettings.DateSeparator := '/';
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  FormatSettings.LongDateFormat := 'dd/mm/yyyy';
  FormatSettings.TimeSeparator := ':';
  FormatSettings.TimeAMString := 'AM';
  FormatSettings.TimePMString := 'PM';
  FormatSettings.ShortTimeFormat := 'hh:nn';
  FormatSettings.LongTimeFormat := 'hh:nn:ss';
  FormatSettings.CurrencyString := '$';

  if (UtilesV20.Is_Super_User() = true) then
  begin
    // self.Usuarios1.Visible := true;
    // self.c1.Visible := true;
    // self.Configuracin1.Visible := true;
  end
  else
  begin
    /// self.Usuarios1.Visible := false;
    // self.c1.Visible := false;
    // self.Configuracin1.Visible := false;
  end;
end;

procedure TfGen_Main.oMenu_AERiesgoClick(Sender: TObject);
begin
  Application.CreateForm(TfGen_MantQ_Act, fGen_MantQ_Act);
  fGen_MantQ_Act.ShowModal;
  freeandnil(fGen_MantQ_Act);
end;

procedure TfGen_Main.oMenu_ARiesgoClick(Sender: TObject);
begin
  Application.CreateForm(TfGen_ManrQ_Geo, fGen_ManrQ_Geo);
  fGen_ManrQ_Geo.ShowModal;
  freeandnil(fGen_ManrQ_Geo);
end;

procedure TfGen_Main.oMenu_EERiesgosClick(Sender: TObject);
begin
  Application.CreateForm(TfGen_MantQ_Emp, fGen_MantQ_Emp);
  fGen_MantQ_Emp.ShowModal;
  freeandnil(fGen_MantQ_Emp);
end;

procedure TfGen_Main.oMenu_IRClick(Sender: TObject);
begin
  Application.CreateForm(TfGen_Scrn_Ind, fGen_Scrn_Ind);
  fRep_IndR.ShowModal;
  freeandnil(fRep_IndR);
end;

procedure TfGen_Main.oMenu_MGClick(Sender: TObject);
begin
  Application.CreateForm(TfRep_IndR, fRep_IndR);
  fRep_IndR.ShowModal;
  freeandnil(fRep_IndR);
end;

procedure TfGen_Main.Pais1Click(Sender: TObject);
begin
  Application.CreateForm(TfMant_Gen_Pais, fMant_Gen_Pais);
  fMant_Gen_Pais.ShowModal;
  freeandnil(fMant_Gen_Pais);
end;

procedure TfGen_Main.Provincias1Click(Sender: TObject);
begin
  Application.CreateForm(TfMant_Gen_Prov, fMant_Gen_Prov);
  fMant_Gen_Prov.ShowModal;
  freeandnil(fMant_Gen_Prov);
end;

procedure TfGen_Main.Usuario1Click(Sender: TObject);
begin
  Application.CreateForm(TFusuarios, Fusuarios);
  Fusuarios.ShowModal;
  freeandnil(Fusuarios);
end;

end.
