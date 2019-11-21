unit Gen_Mant_Cte2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ResizeKit, AdvSmoothTabPager,
  Vcl.ExtCtrls, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, Vcl.Buttons, PngBitBtn,
  AdvGroupBox, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, DBGridEh, Vcl.DBCtrls, DBCtrlsEh,
  Vcl.Mask, DBLookupEh, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,
  FireDAC.Phys.ODBC, FireDAC.Phys.ODBCDef,
  AdvSmoothButton, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxTextEdit,
  cxMaskEdit, cxDBEdit, inifiles, StrUtils, ShellApi, Vcl.Menus, System.RegularExpressions, Vcl.ComCtrls;

type
  TfGen_Mant_Cte2 = class(TForm)
    ResizeKit1: TResizeKit;
    GridPanel1: TGridPanel;
    AdvSmoothTabPager1: TAdvSmoothTabPager;
    oTab_Gen_Nat: TAdvSmoothTabPage;
    oTitulo: TLabel;
    oTab_Ref: TAdvSmoothTabPage;
    AdvGroupBox1: TAdvGroupBox;
    oFnd_Cte: TEdit;
    olFnd_Cte: TLabel;
    oBtnNew: TAdvSmoothButton;
    oBtnEdit: TAdvSmoothButton;
    oBtnDelete: TAdvSmoothButton;
    oBtnFind: TAdvSmoothButton;
    oBtnPrint: TAdvSmoothButton;
    oBtnSave: TAdvSmoothButton;
    oBtnAbort: TAdvSmoothButton;
    oBtnExit: TAdvSmoothButton;
    oDBNavigator: TDBNavigator;
    oGrid_Ref: TDBGridEh;
    oBtn_Add_RefG: TPngBitBtn;
    oBtn_Edit_RefG: TPngBitBtn;
    oBtn_Del_RefG: TPngBitBtn;
    DBGridEh2: TDBGridEh;
    oBtn_Add_RefB: TPngBitBtn;
    oBtn_Edit_RefB: TPngBitBtn;
    oBtn_Del_RefB: TPngBitBtn;
    Label70: TLabel;
    Label71: TLabel;
    oTab_Eva: TAdvSmoothTabPage;
    oGrid_Rzg_Lst: TDBGridEh;
    Label72: TLabel;
    oGrid_Rzg_Cte: TDBGridEh;
    Label73: TLabel;
    oBtn_Rzg_Add: TPngBitBtn;
    oBtn_Rzg_Del: TPngBitBtn;
    Label74: TLabel;
    Label75: TLabel;
    oGrp_Info_Nat: TAdvGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    oid_cliente_n: TDBEdit;
    onombre_primero: TDBEdit;
    oapellido_paterno: TDBEdit;
    oapellido_casada: TDBEdit;
    ogenero: TDBComboBoxEh;
    onip: TcxDBMaskEdit;
    oestado_civil: TDBComboBoxEh;
    onacionalidad: TDBEdit;
    ofecha_nacimiento: TDBDateTimeEditEh;
    opais_nacimiento: TDBLookupComboboxEh;
    otelefono_movil: TDBEdit;
    ocorreo_electronico: TDBEdit;
    oapartado_postal: TDBEdit;
    oPop_Buscadores: TPopupMenu;
    ONU1: TMenuItem;
    OFAC1: TMenuItem;
    OC1: TMenuItem;
    BUSCADORUK1: TMenuItem;
    BUSCADORUAF1: TMenuItem;
    BUSCADORMP1: TMenuItem;
    BUSCADORAPC1: TMenuItem;
    N1: TMenuItem;
    OSFI1: TMenuItem;
    StatusBar1: TStatusBar;
    Label6: TLabel;
    Label32: TLabel;
    Label13: TLabel;
    oapellido_materno: TDBEdit;
    AdvSmoothTabPager2: TAdvSmoothTabPager;
    oTab_Cte_Res: TAdvSmoothTabPage;
    oTab_Cte_Lab: TAdvSmoothTabPage;
    Label20: TLabel;
    opais_recidencia: TDBLookupComboboxEh;
    Label21: TLabel;
    otelefono: TDBEdit;
    odireccion: TDBMemo;
    Label2: TLabel;
    otelefono_trabajo: TDBEdit;
    odireccion_trabajo: TDBMemo;
    oocupacion: TDBEdit;
    onombre_empresa: TDBEdit;
    onombre_segundo: TDBEdit;
    oNivel_Impacto: TLabel;
    oTab_Gen_Jur: TAdvSmoothTabPage;
    oGrp_Info_Jur: TAdvGroupBox;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    onombre_legal: TDBEdit;
    onombre_comercial: TDBEdit;
    otipo_empresa: TDBEdit;
    onip2: TDBEdit;
    onumero_aviso_operacion: TDBEdit;
    odatos_inscripcion: TDBEdit;
    oid_pais_constitucion: TDBLookupComboboxEh;
    ofecha_constitucion: TDBDateTimeEditEh;
    oid_actividad_economica_e: TDBLookupComboboxEh;
    ofax: TDBEdit;
    otelefono2: TDBEdit;
    ocorreo_electronico_e: TDBEdit;
    oapartado_postal2: TDBEdit;
    oLst_tipo_persona_j: TDBComboBoxEh;
    oid_cliente_j: TDBEdit;
    AdvSmoothTabPager3: TAdvSmoothTabPager;
    oTab_Repre: TAdvSmoothTabPage;
    Label92: TLabel;
    Label91: TLabel;
    Label90: TLabel;
    Label89: TLabel;
    Label88: TLabel;
    orepresentante_legal_email: TDBEdit;
    orepresentante_legal_telefono: TDBEdit;
    orepresentante_legal_direccion: TDBEdit;
    orepresentante_legal_nip: TDBEdit;
    orepresentante_legal_nombre: TDBEdit;
    oTab_Benefic: TAdvSmoothTabPage;
    Label93: TLabel;
    Label96: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Label97: TLabel;
    obeneficiario_final_nombre: TDBEdit;
    obeneficiario_final_nip: TDBEdit;
    obeneficiario_final_direccion: TDBEdit;
    obeneficiario_final_telefono: TDBEdit;
    obeneficiario_final_email: TDBEdit;
    odClientes_v2: TDataSource;
    Label17: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label15: TLabel;
    otClientes_v2: TFDTable;
    odireccion2: TDBMemo;
    Label33: TLabel;
    oprov_residencia: TDBLookupComboboxEh;
    Label34: TLabel;
    odist_residencia: TDBLookupComboboxEh;
    odoble_nacionalidad: TDBCheckBox;
    oConn: TFDConnection;
    oLst_tipo_persona_n: TDBComboBoxEh;
    Label5: TLabel;
    oTab_Cte_Pep: TAdvSmoothTabPage;
    ock_pep_sujeto: TDBCheckBox;
    Label1: TLabel;
    opep_cargo_act: TDBEdit;
    Label22: TLabel;
    opep_cargo_act_ffin: TDBDateTimeEditEh;
    Label27: TLabel;
    opep_cargo_ant: TDBEdit;
    Label29: TLabel;
    opep_cargo_ant_ffin: TDBDateTimeEditEh;
    ock_pep_relacion: TDBCheckBox;
    Label28: TLabel;
    Label26: TLabel;
    opep_relacion_tipo: TDBComboBoxEh;
    opep_relacion_cargo: TDBEdit;
    Label30: TLabel;
    oProcedencia_efectigo: TDBEdit;
    Label31: TLabel;
    onombre_comercial_pn: TDBEdit;
    Label35: TLabel;
    oLst_id_clasificasionN: TDBLookupComboboxEh;
    Label36: TLabel;
    oLst_id_clasificasionJ: TDBLookupComboboxEh;
    Label37: TLabel;
    oBtn_ChekList: TPngBitBtn;
    Label38: TLabel;
    oBtn_MatrizR: TPngBitBtn;
    oFnd_Qry_Gen: TFDQuery;
    procedure oBtnExitClick(Sender: TObject);
    procedure oBtnFindClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AssgnTabs;
    procedure Enabled_Screen(bFlag: boolean);
    procedure EnterAsTab(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure oBtnNewClick(Sender: TObject);
    procedure Action_Control(pOption: integer);
    procedure oBtnEditClick(Sender: TObject);
    procedure oBtnDeleteClick(Sender: TObject);
    procedure oBtnAbortClick(Sender: TObject);
    procedure oBtnSaveClick(Sender: TObject);
    procedure oFnd_CteKeyPress(Sender: TObject; var Key: Char);
    procedure Show_Data_Refresh(bShow_Tible: boolean = true; bFirstTab: boolean = true);
    procedure Fnd_Cte_Depen();
    procedure Fnd_Cte_Resid();
    procedure Fnd_Cte_InfoL();
    procedure Fnd_Cte_Trans();
    procedure Fnd_Cte_Finan();
    procedure Fnd_Cte_OrigF();
    procedure Fnd_Cte_RefeB();
    procedure Fnd_Cte_Refe1();
    procedure Fnd_Cte_FacRi();
    procedure Fnd_Cte_Descu();
    procedure oDBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
    procedure Asingar_Cod_Cte();
    procedure oBtn_Del_RefGClick(Sender: TObject);
    procedure oBtn_Del_RefBClick(Sender: TObject);
    procedure oBtn_Add_RefBClick(Sender: TObject);
    procedure oBtn_Edit_RefBClick(Sender: TObject);
    procedure oBtnPrintClick(Sender: TObject);
    procedure Cte_Borra_Tmp_Asig(cCod_Cte: string);
    procedure Cte_Limpia_Tmp_Asig(cCod_Cte: string);
    procedure oBtn_Rzg_DelClick(Sender: TObject);
    procedure oBtn_Rzg_AddClick(Sender: TObject);
    procedure oBtn_Add_RefGClick(Sender: TObject);
    procedure oBtn_Edit_RefGClick(Sender: TObject);
    procedure Sw_Interfaces_n;
    procedure Sw_Interfaces_j;
    procedure Borra_Inf_Cliente(cCod_Cte: string);
    procedure NewCte_CodUpdate(cCod_Tmp: string; cCod_Fin: string);
    procedure Actualiza_Riezgo_Fijo(cCod_Cte: string);
    procedure oid_cliente_nExit(Sender: TObject);
    procedure ONU1Click(Sender: TObject);
    procedure OFAC1Click(Sender: TObject);
    procedure OC1Click(Sender: TObject);
    procedure OSFI1Click(Sender: TObject);
    procedure BUSCADORUK1Click(Sender: TObject);
    procedure BUSCADORUAF1Click(Sender: TObject);
    procedure BUSCADORMP1Click(Sender: TObject);
    procedure BUSCADORAPC1Click(Sender: TObject);
    procedure onipExit(Sender: TObject);
    procedure Muestra_Cte_Impacto(bRecall: boolean = false);
    function Valida_Info_Nat(): boolean;
    function Valida_Info_Jur(): boolean;
    procedure oid_cliente_jExit(Sender: TObject);
    procedure Buscar_Sec_Cte(bSave: boolean = false);
    procedure onip2Exit(Sender: TObject);
    procedure Sw_Interfaces_from_data;
    procedure oBtn_ChekListClick(Sender: TObject);
    procedure oBtn_MatrizRClick(Sender: TObject);
    procedure ock_pep_sujetoClick(Sender: TObject);
    procedure ock_pep_relacionClick(Sender: TObject);
    procedure Add_Automatic_Riesgo(pCod_Cte: string; pCod_Riesgo: string; bDelete: boolean = false; pProd: string = '0'; pImpa: string = '0');
  private
    { Private declarations }
    oINI: TINIFile;
    cIni_File, cIni_Path: string;
    iTipoSecCte: integer;
    cId_Empresa: string;
    iOption: integer;
    iTipPer: integer;
    cTmp_Sec: String;
    cCte_Sel: String;
    cCte_Fnd: String;
    oSel_Pag: TAdvSmoothTabPage;
    bCte_Depen, bCte_Resid, bCte_InfoL, bCte_Trans, bCte_Finan, bCte_OrigF, bCte_FacRi, bCte_Descu: boolean;
  public
    { Public declarations }
  end;

var
  fGen_Mant_Cte2: TfGen_Mant_Cte2;

implementation

uses UtilesV20, Gen_Data_Mod, Gen_Add_Depend, Gen_Add_Activos,
  Gen_Add_PerF, Gen_Add_PerT, Gen_Add_RefB, Gen_Scrn_Prn2, Gen_Add_RefG,
  Gen_Add_Desc, Gen_Mant_Cte2_Sel, BuscarGenM3_2, Gen_MantC_ChL,
  Show_Matriz_Cte;
{$R *.dfm}

procedure TfGen_Mant_Cte2.onipExit(Sender: TObject);
VAR
  cSql_Ln, cResult, cValue: STRING;
  iResult: integer;
  oQry_Fnd_Ced: TFDQuery;
begin

  if ((self.iOption = 1) or (self.iOption = 2)) then
    self.onip.Text := trim(self.onip.Text);

  if (self.iOption = 1) then
  begin
    oQry_Fnd_Ced := TFDQuery.Create(self);
    oQry_Fnd_Ced.Connection := fUtilesV20.oPublicCnn;

    cSql_Ln := 'SELECT id_cliente, COUNT(id_cliente) AS cnt_regs FROM clientes_v2 WHERE nip="' + trim(self.onip.Text) + '" AND (tipo_persona=1) LIMIT 1';
    UtilesV20.Execute_SQL_Query(oQry_Fnd_Ced, cSql_Ln);

    if (oQry_Fnd_Ced.RecordCount <= 0) then
    begin
      freeandnil(oQry_Fnd_Ced);
      exit;
    end;

    if not(oQry_Fnd_Ced.FieldByName('id_cliente').IsNull or (oQry_Fnd_Ced.FieldByName('cnt_regs').AsInteger = 0)) then
    begin
      iResult := MessageDlg('EL NUMERO DE IDENTIFICASION REGISTRADA, YA EXISTE!!!' + #13 + 'DESEA MOSTRAR LA INFORMACION CORRESPONDIENTE?', mtConfirmation, [mbYes, mbNo], 0);
      if (iResult = mrYes) then
      begin
        cValue := trim(oQry_Fnd_Ced.FieldByName('id_cliente').AsString);
        self.otClientes_v2.cancel;

        if (bCte_Resid = true) then
        begin
          if (dmGen_Data_Mod.oQry_Cte_Resid.State in [dsInsert, dsEdit]) then
            dmGen_Data_Mod.oQry_Cte_Resid.cancel;
        end;

        if (bCte_InfoL = true) then
        begin
          if (dmGen_Data_Mod.oQry_Cte_InfL.State in [dsInsert, dsEdit]) then
            dmGen_Data_Mod.oQry_Cte_InfL.cancel;
        end;

        self.cCte_Fnd := cValue;
        self.oBtnAbortClick(self);
      end;
    end;
    freeandnil(oQry_Fnd_Ced);
  end;
end;

procedure TfGen_Mant_Cte2.oid_cliente_jExit(Sender: TObject);
var
  cSql_Ln, cResult, cValue: string;
  iResult: integer;
begin
  if (self.iOption = 1) then
  begin
    cSql_Ln := 'SELECT COUNT(id_cliente) AS cnt_regs FROM clientes_v2 WHERE id_cliente="' + trim(self.oid_cliente_j.Text) + '" AND (tipo_persona=2) LIMIT 1';
    cResult := UtilesV20.Execute_SQL_Result(cSql_Ln);
    if (trim(cResult) = '') then
      cResult := '0';
    if (StrToInt(cResult) > 0) then
    begin
      iResult := MessageDlg('LA SECUENCIA DIGITADA, YA EXISTE.' + #13 + 'DESEA MOSTRAR LA INFORMACION CORRESPONDIENTE?', mtConfirmation, [mbYes, mbNo], 0);
      if (iResult = mrYes) then
      begin
        cValue := trim(self.oid_cliente_j.Text);
        self.otClientes_v2.cancel;

        if (bCte_Resid = true) then
        begin
          if (dmGen_Data_Mod.oQry_Cte_Resid.State in [dsInsert, dsEdit]) then
            dmGen_Data_Mod.oQry_Cte_Resid.cancel;
        end;

        if (bCte_InfoL = true) then
        begin
          if (dmGen_Data_Mod.oQry_Cte_InfL.State in [dsInsert, dsEdit]) then
            dmGen_Data_Mod.oQry_Cte_InfL.cancel;
        end;

        self.cCte_Fnd := cValue;
        self.cCte_Sel := self.cCte_Fnd;
        self.oBtnAbortClick(self);
      end
      else
      begin
        self.Buscar_Sec_Cte(true);
        self.Buscar_Sec_Cte();
        self.oid_cliente_j.SetFocus;
        self.cCte_Sel := trim(self.oid_cliente_j.Text);
        exit;
      end;

      self.cCte_Sel := trim(self.oid_cliente_j.Text);
    end;

  end;
end;

procedure TfGen_Mant_Cte2.oid_cliente_nExit(Sender: TObject);
var
  cSql_Ln, cResult, cValue: string;
  iResult: integer;
begin
  if (self.iOption = 1) then
  begin
    cSql_Ln := 'SELECT COUNT(id_cliente) AS cnt_regs FROM clientes WHERE id_cliente="' + trim(self.oid_cliente_n.Text) + '" LIMIT 1';
    cResult := UtilesV20.Execute_SQL_Result(cSql_Ln);
    if (trim(cResult) = '') then
      cResult := '0';
    if (StrToInt(cResult) > 0) then
    begin
      iResult := MessageDlg('LA SECUENCIA DIGITADA, YA EXISTE.' + #13 + 'DESEA MOSTRAR LA INFORMACION CORRESPONDIENTE?', mtConfirmation, [mbYes, mbNo], 0);
      if (iResult = mrYes) then
      begin
        cValue := trim(self.oid_cliente_n.Text);
        self.otClientes_v2.cancel;

        if (bCte_Resid = true) then
        begin
          if (dmGen_Data_Mod.oQry_Cte_Resid.State in [dsInsert, dsEdit]) then
            dmGen_Data_Mod.oQry_Cte_Resid.cancel;
        end;

        if (bCte_InfoL = true) then
        begin
          if (dmGen_Data_Mod.oQry_Cte_InfL.State in [dsInsert, dsEdit]) then
            dmGen_Data_Mod.oQry_Cte_InfL.cancel;
        end;

        self.cCte_Fnd := cValue;
        self.cCte_Sel := self.cCte_Fnd;
        self.oBtnAbortClick(self);
      end
      else
      begin
        self.Buscar_Sec_Cte(true);
        self.Buscar_Sec_Cte();
        self.oid_cliente_n.SetFocus;
        self.cCte_Sel := trim(self.oid_cliente_n.Text);
        exit;
      end;

      self.cCte_Sel := trim(self.oid_cliente_n.Text);
    end;

  end;
end;

procedure TfGen_Mant_Cte2.ONU1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://scsanctions.un.org/search/', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Mant_Cte2.onip2Exit(Sender: TObject);
VAR
  cSql_Ln, cResult, cValue: STRING;
  iResult: integer;
  oQry_Fnd_Ced: TFDQuery;
begin

  if (self.otClientes_v2.State in [dsInsert, dsInsert]) then
    self.onip2.Text := trim(self.onip2.Text);

  if (self.otClientes_v2.State in [dsInsert]) then
  begin
    oQry_Fnd_Ced := TFDQuery.Create(self);
    oQry_Fnd_Ced.Connection := fUtilesV20.oPublicCnn;

    cSql_Ln := 'SELECT id_cliente, COUNT(id_cliente) AS cnt_regs FROM clientes WHERE (identificacion="' + trim(self.onip2.Text) + '") LIMIT 1';
    UtilesV20.Execute_SQL_Query(oQry_Fnd_Ced, cSql_Ln);

    if (oQry_Fnd_Ced.RecordCount <= 0) then
    begin
      self.oid_cliente_j.SetFocus;
    end;

    if (oQry_Fnd_Ced.FieldByName('id_cliente').IsNull or (oQry_Fnd_Ced.FieldByName('cnt_regs').AsInteger = 0)) then
    begin
      self.oid_cliente_j.SetFocus;
    end
    else
    begin
      iResult := MessageDlg('EL NUMERO DE IDENTIFICASION REGISTRADA, YA EXISTE!!!' + #13 + 'DESEA MOSTRAR LA INFORMACION CORRESPONDIENTE?', mtConfirmation, [mbYes, mbNo], 0);
      if (iResult = mrYes) then
      begin
        cValue := trim(oQry_Fnd_Ced.FieldByName('id_cliente').AsString);
        self.otClientes_v2.cancel;

        if (bCte_Resid = true) then
        begin
          if (dmGen_Data_Mod.oQry_Cte_Resid.State in [dsInsert, dsEdit]) then
            dmGen_Data_Mod.oQry_Cte_Resid.cancel;
        end;

        if (bCte_InfoL = true) then
        begin
          if (dmGen_Data_Mod.oQry_Cte_InfL.State in [dsInsert, dsEdit]) then
            dmGen_Data_Mod.oQry_Cte_InfL.cancel;
        end;

        self.cCte_Fnd := cValue;
        self.cCte_Sel := trim(self.cCte_Fnd);

        self.oBtnAbortClick(self);
      end
      else
      begin
        self.oid_cliente_j.SetFocus;
      end;
    end;
    freeandnil(oQry_Fnd_Ced);
  end;
end;

procedure TfGen_Mant_Cte2.OSFI1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.osfi-bsif.gc.ca/Eng/fi-if/amlc-clrpc/atf-fat/Pages/default.aspx', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Mant_Cte2.oBtn_Rzg_AddClick(Sender: TObject);
var
  cSql_Ln: string;
  cCod_Cte: string;
  // cDbm_Cte: string;
  cCod_Rzg: string;
  bDuplica: boolean;
  cProb_Pon, cImpa_Pon: string;
begin
  bDuplica := false;
  // cDbm_Cte := trim(dmGen_Data_Mod.otClientes.FieldByName('id_cliente').AsString);
  cCod_Rzg := trim(oGrid_Rzg_Lst.DataSource.DataSet.FieldByName('codigo').AsString);
  cProb_Pon := trim(oGrid_Rzg_Lst.DataSource.DataSet.FieldByName('prob_ponderacion').AsString);
  cImpa_Pon := trim(oGrid_Rzg_Lst.DataSource.DataSet.FieldByName('impa_ponderacion').AsString);

  if (dmGen_Data_Mod.otClientes.State in [dsInsert]) then
  begin
    cCod_Cte := trim(self.cTmp_Sec);

    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'SELECT ';
    cSql_Ln := cSql_Ln + '  codigo_factores_riesgo ';
    cSql_Ln := cSql_Ln + 'FROM cliente_factores_riesgo ';
    cSql_Ln := cSql_Ln + 'WHERE ((id_cliente="' + trim(self.cCte_Sel) + '") or (id_cliente="' + self.cTmp_Sec + '")) ';
    cSql_Ln := cSql_Ln + 'AND   (codigo_factores_riesgo="' + cCod_Rzg + '")';

    if (UtilesV20.Execute_SQL_Result(cSql_Ln) <> '') then
      bDuplica := true
    else
      bDuplica := false;
  end
  else
    cCod_Cte := trim(self.cCte_Sel);

  if (bDuplica = false) then
  begin
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'INSERT INTO cliente_factores_riesgo ';
    cSql_Ln := cSql_Ln +
      '  (id_cliente	,codigo_factores_riesgo,prob_ponderacion,impa_ponderacion, ultima_fecha_actualizacion	,ultimo_usuario_que_actualizo	, factor_check,flag_tmp) VALUES ';
    cSql_Ln := cSql_Ln + '  ("' + cCod_Cte + '","' + cCod_Rzg + '","' + cProb_Pon + '","' + cImpa_Pon + '",NOW(),"' + trim(IntToStr(UtilesV20.iUserID)) + '",0,1) ';
    cSql_Ln := cSql_Ln + 'ON DUPLICATE KEY UPDATE ';
    cSql_Ln := cSql_Ln + '  prob_ponderacion=VALUES(prob_ponderacion), ';
    cSql_Ln := cSql_Ln + '  impa_ponderacion=VALUES(impa_ponderacion), ';
    cSql_Ln := cSql_Ln + '  ultimo_usuario_que_actualizo="' + trim(IntToStr(UtilesV20.iUserID)) + '", ';
    cSql_Ln := cSql_Ln + '  ultima_fecha_actualizacion  =NOW() ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
    self.Fnd_Cte_FacRi();
  end;

  self.oGrid_Rzg_Cte.DataSource.DataSet.Locate('codigo_factores_riesgo', cCod_Rzg, []);
  // MessageDlg('Este riezgo ya esta en la lista?', mtConfirmation, [mbOk], 0);
end;

procedure TfGen_Mant_Cte2.oBtn_Rzg_DelClick(Sender: TObject);
var
  cSql_Ln: string;
  cTmp_Cte: string;
  cCod_Rzg: string;
begin
  cCod_Rzg := trim(oGrid_Rzg_Cte.DataSource.DataSet.FieldByName('codigo_factores_riesgo').AsString);
  cTmp_Cte := trim(dmGen_Data_Mod.oQry_Cte_RefB.FieldByName('id_cliente').AsString);

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE ';
  cSql_Ln := cSql_Ln + 'FROM cliente_factores_riesgo ';
  cSql_Ln := cSql_Ln + 'WHERE ((id_cliente="' + cTmp_Cte + '") or (id_cliente="' + self.cTmp_Sec + '")) ';
  cSql_Ln := cSql_Ln + 'AND   (codigo_factores_riesgo="' + cCod_Rzg + '")';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  self.Fnd_Cte_FacRi();
end;

procedure TfGen_Mant_Cte2.OC1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.opencorporates.com/', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Mant_Cte2.oBtn_Del_RefBClick(Sender: TObject);
var
  nResp: integer;
  cSql_Ln: string;
begin
  if (self.cCte_Sel <> '') then
  begin
    nResp := MessageDlg('Seguro que desea eliminar el activo seleccionado?', mtConfirmation, [mbYes, mbNo], 0);
    If (nResp = mrYes) Then
    begin
      cSql_Ln := '';
      cSql_Ln := cSql_Ln + 'DELETE FROM cliente_referencias_bancarias ';
      cSql_Ln := cSql_Ln + 'WHERE ((id_cliente="' + trim(self.cCte_Sel) + '") or (id_cliente="' + self.cTmp_Sec + '")) ';
      cSql_Ln := cSql_Ln + 'AND   (id_cliente_referencias_bancarias ="' + trim(dmGen_Data_Mod.oQry_Cte_RefB.FieldByName('id_cliente_referencias_bancarias').AsString) + '") ';
      UtilesV20.Execute_SQL_Command(cSql_Ln);

      if (self.iOption = 1) then
        self.Fnd_Cte_RefeB()
      ELSE
        dmGen_Data_Mod.oQry_Cte_RefB.Refresh;
    end;
  end;
end;

procedure TfGen_Mant_Cte2.oBtn_Add_RefBClick(Sender: TObject);
begin
  if (trim(self.cCte_Sel) = '') then
  begin
    MessageDlg('Debe ingresar el codigo de cliente para poder crear los activos?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  Application.CreateForm(TfGen_Add_RefB, fGen_Add_RefB);
  fGen_Add_RefB.iOption := 1;
  fGen_Add_RefB.cCte_Id := trim(self.cCte_Sel);
  fGen_Add_RefB.cTmp_Id := trim(self.cTmp_Sec);
  fGen_Add_RefB.cReg_Id := 'ABC-123';
  fGen_Add_RefB.ShowModal;
  freeandnil(fGen_Add_RefB);

  if ((self.iOption = 1) or (self.iOption = 2)) then
    self.Fnd_Cte_RefeB()
  ELSE
    dmGen_Data_Mod.oQry_Cte_RefB.Refresh;
end;

procedure TfGen_Mant_Cte2.oBtn_Add_RefGClick(Sender: TObject);
begin
  if (trim(self.cCte_Sel) = '') then
  begin
    MessageDlg('Debe ingresar el codigo de cliente para poder crear las referencias?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  Application.CreateForm(TfGen_Add_RefG, fGen_Add_RefG);
  fGen_Add_RefG.iOption := 1;
  fGen_Add_RefG.cCte_Id := trim(self.cCte_Sel);
  fGen_Add_RefG.cTmp_Id := trim(self.cTmp_Sec);
  fGen_Add_RefG.cReg_Id := 'ABC-123';
  fGen_Add_RefG.ShowModal;
  freeandnil(fGen_Add_RefG);

  if ((self.iOption = 1) or (self.iOption = 2)) then
    self.Fnd_Cte_Refe1()
  ELSE
    dmGen_Data_Mod.oQry_Cte_Ref1.Refresh;
end;

procedure TfGen_Mant_Cte2.oBtn_ChekListClick(Sender: TObject);
begin

  Application.CreateForm(TfGen_MantC_ChL, fGen_MantC_ChL);
  if (dmGen_Data_Mod.otClientes.State in [dsInsert]) then
    fGen_MantC_ChL.cCod_Cte := trim(self.cTmp_Sec)
  else
    fGen_MantC_ChL.cCod_Cte := trim(self.cCte_Sel);
  fGen_MantC_ChL.ShowModal;
  freeandnil(fGen_MantC_ChL);
end;

procedure TfGen_Mant_Cte2.FormCreate(Sender: TObject);
var
  cDriverID, cDataSource: string;
begin
  freeandnil(oConn);
  self.otClientes_v2.Connection := fUtilesV20.oPublicCnn;

  self.bCte_Resid := true;
  self.bCte_InfoL := false;
  self.bCte_Trans := true;
  self.bCte_Finan := true;
  self.bCte_OrigF := false;
  self.bCte_Depen := false;
  self.bCte_FacRi := true;
  self.bCte_Descu := false;

  self.cCte_Fnd := '';
  self.iOption := 0;

  // Arancamos con persona juridica//
  self.iTipPer := 1;
  self.otClientes_v2.Open();

  self.cTmp_Sec := fUtilesV20.RandomPassword(10);

  dmGen_Data_Mod.Open_All_DataGen();
  dmGen_Data_Mod.Open_All_DataQryRef();

  dmGen_Data_Mod.oQry_Ultimos.Close;
  dmGen_Data_Mod.otClientes.Close;

  self.cIni_Path := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  self.cIni_File := self.cIni_Path + 'Data\Config.ini';

  self.oINI := TINIFile.Create(self.cIni_File);
  cDriverID := oINI.ReadString('ODBC_DBF', 'DRIVER_ID', 'ODBC');
  cDataSource := oINI.ReadString('ODBC_DBF', 'ODBC_NAME', 'COMPUCAS_DBF');
  self.iTipoSecCte := oINI.ReadInteger('GENERAL', 'SECUENCIA_DBF', 1);
  self.oINI.Free;
end;

procedure TfGen_Mant_Cte2.FormShow(Sender: TObject);
begin
  self.StatusBar1.Panels[0].Text := 'Usuario: ' + UtilesV20.sUserName;
  self.StatusBar1.Panels[1].Text := 'Fecha: ' + formatDateTime('dd/mm/yyyy', now());
  self.StatusBar1.Panels[2].Text := 'Servidor: ' + fUtilesV20.oPublicCnn.Params.Values['Server'] + '/' + uppercase(fUtilesV20.oPublicCnn.Params.Values['Database']);
  self.StatusBar1.Panels[3].Text := 'Empresa: ' + UtilesV20.cDe_Empresa;

  self.AssgnTabs();

  self.cCte_Sel := trim(self.oDBNavigator.DataSource.DataSet.FieldByName('id_cliente').AsString);
  self.Sw_Interfaces_from_data;
  self.Show_Data_Refresh();
  self.Muestra_Cte_Impacto();

  self.oFnd_Cte.Text := '';
  self.Enabled_Screen(false);

  self.AdvSmoothTabPager1.Refresh;

  self.AdvSmoothTabPager1.ActivePageIndex := 0;

  self.oFnd_Cte.Text := '';
  self.oFnd_Cte.SetFocus;
end;

procedure TfGen_Mant_Cte2.oBtnAbortClick(Sender: TObject);
var
  ctCod_Cte: string;
begin
  if ((self.iOption = 1) or (self.iOption = 2)) then
  begin
    if (bCte_Resid = true) then
    begin
      if (dmGen_Data_Mod.oQry_Cte_Resid.State in [dsInsert, dsEdit]) then
        dmGen_Data_Mod.oQry_Cte_Resid.cancel;
    end;

    if (bCte_InfoL = true) then
    begin
      if (dmGen_Data_Mod.oQry_Cte_InfL.State in [dsInsert, dsEdit]) then
        dmGen_Data_Mod.oQry_Cte_InfL.cancel;
    end;
  end;
  ctCod_Cte := self.cCte_Sel;
  self.Cte_Borra_Tmp_Asig(ctCod_Cte);

  if ((self.iOption = 1) or (self.iOption = 2)) then
    self.otClientes_v2.cancel;

  self.cCte_Sel := trim(self.otClientes_v2.FieldByName('id_cliente').AsString);

  self.Action_Control(7);
  self.Enabled_Screen(false);
  self.AdvSmoothTabPager1.ActivePageIndex := 0;
  // self.Show_calc_fields();
  self.iOption := 0;

  if (trim(self.cCte_Fnd) <> '') then
  begin
    if (self.otClientes_v2.RecordCount <= 0) then
      exit;

    self.otClientes_v2.Locate('id_cliente', self.cCte_Fnd, []);
    self.otClientes_v2.Refresh;

    self.cCte_Sel := trim(self.otClientes_v2.FieldByName('id_cliente').AsString);

    self.cCte_Fnd := '';
  end;

  self.Show_Data_Refresh(true, false);
  self.Sw_Interfaces_from_data;
  // self.oidentificacion.Properties.EditMask := '';

  self.olFnd_Cte.Visible := true;
  self.oFnd_Cte.Visible := true;

  self.oFnd_Cte.Text := '';
  self.oFnd_Cte.SetFocus;

  self.oDBNavigator.Visible := true;
end;

procedure TfGen_Mant_Cte2.oBtnDeleteClick(Sender: TObject);
var
  nResp: integer;
  cSql_Ln: string;
begin
  if self.otClientes_v2.isEmpty then
  begin
    self.Action_Control(6);
    exit;
  end;
  self.iOption := 3;
  self.cId_Empresa := IntToStr(UtilesV20.iId_Empresa);
  self.Action_Control(3);
  nResp := MessageDlg('Seguro que desea borrar eliminar el cliente alctual?.' + #13 + 'SE BORRARAN TODOS LOS DATOS DEL CLIENTE, INFORMACION ADICIONAL.' + #13 +
    '¿ESTA ESTA SEGUTO QUE DESEA CONTINUAR?', mtConfirmation, [mbYes, mbNo], 0);
  If (nResp = mrYes) Then
  begin
    self.Borra_Inf_Cliente(self.cCte_Sel);
    self.otClientes_v2.Refresh;
  end;
  self.iOption := 0;

end;

procedure TfGen_Mant_Cte2.oBtnEditClick(Sender: TObject);
begin
  if self.otClientes_v2.isEmpty then
  begin
    self.Action_Control(6);
    exit;
  end;

  self.iOption := 2;
  self.cId_Empresa := IntToStr(UtilesV20.iId_Empresa);

  self.Sw_Interfaces_from_data;
  self.otClientes_v2.Edit;

  if (bCte_Resid = true) then
  begin
    if (dmGen_Data_Mod.oQry_Cte_Resid.RecordCount > 0) then
    begin
      dmGen_Data_Mod.oQry_Cte_Resid.Edit;
    end
    else
    begin
      dmGen_Data_Mod.oQry_Cte_Resid.Insert;
      dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('id_cliente').AsString := self.cCte_Sel;
      dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('id_provincia').AsString := '0';
      dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('id_distrito').AsString := '0';
      dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('id_corregimiento').AsString := '0';
    end;
  end;

  if (bCte_InfoL = true) then
  begin
    if (dmGen_Data_Mod.oQry_Cte_InfL.RecordCount > 0) then
    begin
      dmGen_Data_Mod.oQry_Cte_InfL.Edit;
    end
    else
    begin
      dmGen_Data_Mod.oQry_Cte_InfL.Insert;
      dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('id_cliente').AsString := self.cCte_Sel;
      dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('id_tipo_empleado').AsString := '0';
      dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('id_actividad_economica').AsString := '0';
      dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('tipo_empresa_laboral').AsString := '0';
      dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('empresa_actividad_economica').AsString := '0';
      dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('id_estado_laboral').AsInteger := 0;
      dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('id_tipo_planilla').AsInteger := 0;
    end;
  end;

  self.Action_Control(2);
  self.Enabled_Screen(true);

  self.ock_pep_relacionClick(self);
  self.ock_pep_sujetoClick(self);

  // self.oidentificacion.Properties.EditMask := 'AA-AA-9999-99999';
  self.olFnd_Cte.Visible := false;
  self.oFnd_Cte.Visible := false;

  self.oDBNavigator.Visible := false;
end;

procedure TfGen_Mant_Cte2.oBtnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfGen_Mant_Cte2.oBtnFindClick(Sender: TObject);
var
  cSql_Cmd: string;
begin
  self.cId_Empresa := IntToStr(UtilesV20.iId_Empresa);

  Application.CreateForm(TfBuscarGenM3_2, fBuscarGenM3_2);

  fBuscarGenM3_2.Caption := 'BUSCADOR DE CLIENTES:..';
  fBuscarGenM3_2.Hide;
  fBuscarGenM3_2.Color := self.oTab_Eva.PageAppearance.Color;
  fBuscarGenM3_2.oLst_campos.Clear;

  BuscarGenM3_2.oListData[1].Texto := 'Código';
  BuscarGenM3_2.oListData[1].Campo := 'codigo';
  BuscarGenM3_2.oListData[1].LLave := true;

  BuscarGenM3_2.oListData[2].Texto := 'Nombre';
  BuscarGenM3_2.oListData[2].Campo := 'nombre';
  BuscarGenM3_2.oListData[2].LLave := false;

  BuscarGenM3_2.oListData[3].Texto := 'N.I.P';
  BuscarGenM3_2.oListData[3].Campo := 'nip';
  BuscarGenM3_2.oListData[3].LLave := false;

  BuscarGenM3_2.oListData[4].Texto := 'Tipo';
  BuscarGenM3_2.oListData[4].Campo := 'tipo';
  BuscarGenM3_2.oListData[4].LLave := false;

  BuscarGenM3_2.oListData[5].Texto := 'Inactivo';
  BuscarGenM3_2.oListData[5].Campo := 'Inactivo';
  BuscarGenM3_2.oListData[5].LLave := false;

  fBuscarGenM3_2.oSql1.Clear;

  cSql_Cmd := '';
  cSql_Cmd := cSql_Cmd + 'SELECT ';
  cSql_Cmd := cSql_Cmd + '	c.id_cliente AS codigo, ';
  cSql_Cmd := cSql_Cmd +
    '	IF( ((c.nombre_legal IS NULL) OR (trim(c.nombre_legal)="")),CONCAT(ucase(c.nombre_primero),"/",ucase(c.apellido_paterno)),ucase(c.nombre_comercial)) AS nombre, ';
  cSql_Cmd := cSql_Cmd + '	c.nip, ';
  cSql_Cmd := cSql_Cmd + '	IF(c.tipo_persona=1,"NAT","JUR") AS tipo, ';
  cSql_Cmd := cSql_Cmd + '	IF(inactivo=1      ,"SI","NO") AS Inactivo ';
  cSql_Cmd := cSql_Cmd + 'FROM clientes_v2 AS c ';

  fBuscarGenM3_2.oSql1.Lines.Add(cSql_Cmd);

  // ****************************************************************************/
  fBuscarGenM3_2.oLabel_List.Caption := 'Tipo de Persona/Organización:';

  fBuscarGenM3_2.oLst_DefList.Clear;
  fBuscarGenM3_2.oLst_DefList.Items.Add('*TODOS*');
  fBuscarGenM3_2.oLst_DefList.Items.Add('Persona Natural');
  fBuscarGenM3_2.oLst_DefList.Items.Add('Persona Jurídica');
  fBuscarGenM3_2.oLst_DefList.KeyItems.Add('*');
  fBuscarGenM3_2.oLst_DefList.KeyItems.Add('1');
  fBuscarGenM3_2.oLst_DefList.KeyItems.Add('2');

  fBuscarGenM3_2.cLst_Val_Def := '*';
  fBuscarGenM3_2.cLst_Where_Fld := 'tipo_persona';
  // ****************************************************************************/

  fBuscarGenM3_2.ShowModal;
  if BuscarGenM3_2.vFindResult <> '' then
  begin
    self.cCte_Sel := BuscarGenM3_2.vFindResult;
    self.otClientes_v2.Locate('id_cliente', BuscarGenM3_2.vFindResult, []);
    self.Show_Data_Refresh(true, false);
    self.Sw_Interfaces_from_data;
  end;
  freeandnil(fBuscarGenM3_2);
  self.iOption := 0;
end;

procedure TfGen_Mant_Cte2.oBtnNewClick(Sender: TObject);
var
  cNext: string;
begin
  self.iOption := 1;
  self.cId_Empresa := IntToStr(UtilesV20.iId_Empresa);
  self.AdvSmoothTabPager1.ActivePageIndex := 1;

  self.otClientes_v2.Insert;

  self.iTipoSecCte := 1;
  self.cCte_Sel := self.cTmp_Sec;
  self.Buscar_Sec_Cte();

  if (bCte_Resid = true) then
  begin
    dmGen_Data_Mod.oQry_Cte_Resid.Insert;
    dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('id_cliente').AsString := self.cCte_Sel;
    dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('id_provincia').AsString := '0';
    dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('id_distrito').AsString := '0';
    dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('id_corregimiento').AsString := '0';
    dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('Residencia').AsString := ' ';
    dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('id_tipo_vivienda').AsInteger := 0;
  end;

  if (bCte_InfoL = true) then
  begin
    dmGen_Data_Mod.oQry_Cte_InfL.Insert;
    dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('id_cliente').AsString := self.cCte_Sel;
    dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('id_tipo_empleado').AsString := '0';
    dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('id_actividad_economica').AsString := '0';
    dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('tipo_empresa_laboral').AsString := '0';
    dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('empresa_actividad_economica').AsString := '0';
    dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('id_estado_laboral').AsInteger := 0;
    dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('id_tipo_planilla').AsInteger := 0;
    dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('salario_bruto').AsFloat := 0.00;
    dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('salario_neto').AsFloat := 0.00;
  end;

  self.Action_Control(1);
  self.Enabled_Screen(true);
  self.Show_Data_Refresh(false, true);

  self.olFnd_Cte.Visible := false;
  self.oFnd_Cte.Visible := false;

  self.oDBNavigator.Visible := false;

  Application.CreateForm(TfGen_Mant_Cte2_Sel, fGen_Mant_Cte2_Sel);
  fGen_Mant_Cte2_Sel.ShowModal;
  if (fGen_Mant_Cte2_Sel.oLst_tipo_persona.Value = 1) then
  begin
    iTipPer := 1;
    self.Sw_Interfaces_n();
    self.oSel_Pag := self.oTab_Gen_Nat;
    self.onombre_primero.SetFocus;
  end
  else
  begin
    iTipPer := 2;
    self.Sw_Interfaces_j();
    self.oSel_Pag := self.oTab_Gen_Nat;
    self.onombre_legal.SetFocus;
  end;
  self.otClientes_v2.FieldByName('tipo_persona').AsInteger := iTipPer;
  self.oLst_tipo_persona_n.Value := iTipPer;
  self.oLst_tipo_persona_j.Value := iTipPer;
  self.oLst_tipo_persona_n.Refresh;
  self.oLst_tipo_persona_j.Refresh;
  freeandnil(fGen_Mant_Cte2_Sel);

  self.ock_pep_relacionClick(self);
  self.ock_pep_sujetoClick(self);
end;

procedure TfGen_Mant_Cte2.oBtnPrintClick(Sender: TObject);
begin
  self.oBtnPrint.enabled := false;

  Application.CreateForm(TfGen_Scrn_Prn2, fGen_Scrn_Prn2);
  fGen_Scrn_Prn2.iTip_Per := self.otClientes_v2.FieldByName('tipo_persona').AsInteger;
  fGen_Scrn_Prn2.cCod_Cte := self.otClientes_v2.FieldByName('id_cliente').AsString;
  fGen_Scrn_Prn2.ShowModal;
  freeandnil(fGen_Scrn_Prn2);
  self.oBtnPrint.enabled := true;
end;

procedure TfGen_Mant_Cte2.oBtnSaveClick(Sender: TObject);
var
  cNext: string;
  ctCod_Cte: string;
  cSql_Ln: string;
  cConv: string;
  iConv: integer;
  fConv: extended;
  bResp: boolean;
begin
  if ((self.iOption = 1) or (self.iOption = 2)) then
  begin

    if (self.iTipPer = 1) then
      bResp := self.Valida_Info_Nat()
    else
      bResp := self.Valida_Info_Jur();

    if (bResp = false) then
      exit;
  end;
  self.Buscar_Sec_Cte();

  self.Asingar_Cod_Cte();

  if ((self.iOption = 1) or (self.iOption = 2)) then
  begin
    if (bCte_Resid = true) then
    begin
      if (dmGen_Data_Mod.oQry_Cte_Resid.State in [dsInsert, dsEdit]) then
        dmGen_Data_Mod.oQry_Cte_Resid.Post;
    end;

    if (bCte_InfoL = true) then
    begin
      if (dmGen_Data_Mod.oQry_Cte_InfL.State in [dsInsert, dsEdit]) then
        dmGen_Data_Mod.oQry_Cte_InfL.Post;
    end;

    if (self.otClientes_v2.State in [dsInsert, dsEdit]) then
      self.otClientes_v2.Post
  end;

  self.cCte_Sel := trim(self.otClientes_v2.FieldByName('id_cliente').AsString);

  ctCod_Cte := self.cCte_Sel;

  if ((self.iOption = 1) OR (self.iOption = 2)) then
    self.NewCte_CodUpdate(self.cTmp_Sec, ctCod_Cte);

  self.Actualiza_Riezgo_Fijo(ctCod_Cte);

  self.Cte_Limpia_Tmp_Asig(ctCod_Cte);

  self.Action_Control(6);
  self.Enabled_Screen(false);

  self.AdvSmoothTabPager1.ActivePageIndex := 0;
  self.iOption := 0;

  self.Muestra_Cte_Impacto(true);

  self.cCte_Sel := trim(self.oDBNavigator.DataSource.DataSet.FieldByName('id_cliente').AsString);
  self.Show_Data_Refresh(true, false);
  self.Sw_Interfaces_from_data;
  // self.oidentificacion.Properties.EditMask := '';

  self.olFnd_Cte.Visible := true;
  self.oFnd_Cte.Visible := true;

  self.oDBNavigator.Visible := true;

  self.oFnd_Cte.Text := '';
  self.oFnd_Cte.SetFocus;
end;

procedure TfGen_Mant_Cte2.oBtn_Del_RefGClick(Sender: TObject);
var
  nResp: integer;
  cSql_Ln: string;
begin
  if (self.cCte_Sel <> '') then
  begin
    nResp := MessageDlg('Seguro que desea eliminar el activo seleccionado?', mtConfirmation, [mbYes, mbNo], 0);
    If (nResp = mrYes) Then
    begin
      cSql_Ln := '';
      cSql_Ln := cSql_Ln + 'DELETE FROM cliente_referencias ';
      cSql_Ln := cSql_Ln + 'WHERE ((id_cliente="' + self.cCte_Sel + '") or (id_cliente="' + self.cTmp_Sec + '")) ';
      cSql_Ln := cSql_Ln + 'AND   (id_cliente_referencias ="' + trim(dmGen_Data_Mod.oQry_Cte_Ref1.FieldByName('id_cliente_referencias').AsString) + '") ';
      UtilesV20.Execute_SQL_Command(cSql_Ln);

      if (self.iOption = 1) then
        self.Fnd_Cte_Refe1()
      ELSE
        dmGen_Data_Mod.oQry_Cte_Ref1.Refresh;
    end;
  end;
end;

procedure TfGen_Mant_Cte2.oBtn_Edit_RefBClick(Sender: TObject);
begin
  if (trim(self.cCte_Sel) = '') then
  begin
    MessageDlg('Debe ingresar el codigo de cliente para poder crear los activos?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  Application.CreateForm(TfGen_Add_RefB, fGen_Add_RefB);
  fGen_Add_RefB.iOption := 2;
  fGen_Add_RefB.cCte_Id := trim(dmGen_Data_Mod.oQry_Cte_RefB.FieldByName('id_cliente').AsString);
  fGen_Add_RefB.cTmp_Id := trim(dmGen_Data_Mod.oQry_Cte_RefB.FieldByName('id_cliente').AsString);
  fGen_Add_RefB.cReg_Id := dmGen_Data_Mod.oQry_Cte_RefB.FieldByName('id_cliente_referencias_bancarias').AsString;
  fGen_Add_RefB.ShowModal;
  freeandnil(fGen_Add_RefB);

  if ((self.iOption = 1) or (self.iOption = 2)) then
    self.Fnd_Cte_RefeB()
  ELSE
    dmGen_Data_Mod.oQry_Cte_RefB.Refresh;
end;

procedure TfGen_Mant_Cte2.oBtn_Edit_RefGClick(Sender: TObject);
begin
  if (trim(self.cCte_Sel) = '') then
  begin
    MessageDlg('Debe ingresar el codigo de cliente para poder crear las referencias?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  Application.CreateForm(TfGen_Add_RefG, fGen_Add_RefG);
  fGen_Add_RefG.iOption := 2;
  fGen_Add_RefG.cCte_Id := trim(dmGen_Data_Mod.oQry_Cte_Ref1.FieldByName('id_cliente').AsString);
  fGen_Add_RefG.cTmp_Id := trim(dmGen_Data_Mod.oQry_Cte_Ref1.FieldByName('id_cliente').AsString);
  fGen_Add_RefG.cReg_Id := dmGen_Data_Mod.oQry_Cte_Ref1.FieldByName('id_cliente_referencias').AsString;
  fGen_Add_RefG.ShowModal;
  freeandnil(fGen_Add_RefG);

  if ((self.iOption = 1) or (self.iOption = 2)) then
    self.Fnd_Cte_Refe1()
  ELSE
    dmGen_Data_Mod.oQry_Cte_Ref1.Refresh;
end;

procedure TfGen_Mant_Cte2.oBtn_MatrizRClick(Sender: TObject);
begin
  Application.CreateForm(TfShow_Matriz_Cte, fShow_Matriz_Cte);
  if (dmGen_Data_Mod.otClientes.State in [dsInsert]) then
    fShow_Matriz_Cte.cCte_Sel := trim(self.cTmp_Sec)
  else
    fShow_Matriz_Cte.cCte_Sel := trim(self.cCte_Sel);
  fShow_Matriz_Cte.ShowModal;
  freeandnil(fShow_Matriz_Cte);
end;

procedure TfGen_Mant_Cte2.ock_pep_relacionClick(Sender: TObject);
begin
  if (self.ock_pep_relacion.Checked = true) then
  begin
    self.opep_relacion_tipo.enabled := true;
    self.opep_relacion_cargo.enabled := true;
  end
  else
  begin
    self.opep_relacion_tipo.enabled := false;
    self.opep_relacion_cargo.enabled := false;
    self.opep_relacion_tipo.Value := '';
    self.opep_relacion_cargo.Text := '';
  end;
end;

procedure TfGen_Mant_Cte2.ock_pep_sujetoClick(Sender: TObject);
begin
  if (self.ock_pep_sujeto.Checked = true) then
  begin
    self.opep_cargo_act.enabled := true;
    self.opep_cargo_act_ffin.enabled := true;
    self.opep_cargo_ant.enabled := true;
    self.opep_cargo_ant_ffin.enabled := true;
  end
  else
  begin
    self.opep_cargo_ant.enabled := false;
    self.opep_cargo_ant_ffin.enabled := false;
    self.opep_cargo_act.enabled := false;
    self.opep_cargo_act_ffin.enabled := false;
    self.opep_cargo_ant.Text := '';
    self.opep_cargo_ant_ffin.Value := null;
    self.opep_cargo_act.Text := '';
    self.opep_cargo_act_ffin.Value := null;

  end;
end;

procedure TfGen_Mant_Cte2.oDBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
begin
  self.cCte_Sel := trim(self.oDBNavigator.DataSource.DataSet.FieldByName('id_cliente').AsString);
  self.Show_Data_Refresh(true, false);
  self.Sw_Interfaces_from_data();
  self.Muestra_Cte_Impacto();
end;

procedure TfGen_Mant_Cte2.OFAC1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://sanctionssearch.ofac.treas.gov/', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Mant_Cte2.oFnd_CteKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_RETURN then
  begin
    if (trim(self.oFnd_Cte.Text) = '') then
      exit;

    if (self.otClientes_v2.RecordCount <= 0) then
      exit;

    if (self.otClientes_v2.FieldByName('id_cliente').IsNull) then
      exit;

    self.cCte_Sel := trim(self.oFnd_Cte.Text);
    self.otClientes_v2.Locate('id_cliente', trim(self.oFnd_Cte.Text), []);

    self.Show_Data_Refresh(true, false);
    self.Muestra_Cte_Impacto();
    self.oFnd_Cte.Text := '';
    Key := #0; // prevent beeping
  end;
end;

procedure TfGen_Mant_Cte2.Enabled_Screen(bFlag: boolean);
var
  j: integer;
  oComponents: TControl;
begin
  for j := 0 to ComponentCount - 1 do
  begin
    if (Components[j] is TCheckBox) then
    begin
      oComponents := TCheckBox(self.Components[j]);
      case oComponents.Tag of
        0:
          oComponents.enabled := bFlag;
        1:
          oComponents.enabled := not bFlag;
        2:
          oComponents.enabled := false;
        3:
          oComponents.enabled := true;
      end;
    end;
    if (Components[j] is TDBCheckBox) then
    begin
      oComponents := TDBCheckBox(self.Components[j]);
      case oComponents.Tag of
        0:
          oComponents.enabled := bFlag;
        1:
          oComponents.enabled := not bFlag;
        2:
          oComponents.enabled := false;
        3:
          oComponents.enabled := true;
      end;
    end;
    if (Components[j] is TDBMemo) then
    begin
      oComponents := TDBMemo(self.Components[j]);
      case oComponents.Tag of
        0:
          oComponents.enabled := bFlag;
        1:
          oComponents.enabled := not bFlag;
        2:
          oComponents.enabled := false;
        3:
          oComponents.enabled := true;
      end;
    end;
    if (Components[j] is TDBEdit) then
    begin
      oComponents := TDBEdit(self.Components[j]);
      case oComponents.Tag of
        0:
          oComponents.enabled := bFlag;
        1:
          oComponents.enabled := not bFlag;
        2:
          oComponents.enabled := false;
        3:
          oComponents.enabled := true;
      end;
    end;
    if (Components[j] is TDBDateTimeEditEh) then
    begin
      oComponents := TDBDateTimeEditEh(self.Components[j]);
      case oComponents.Tag of
        0:
          oComponents.enabled := bFlag;
        1:
          oComponents.enabled := not bFlag;
        2:
          oComponents.enabled := false;
        3:
          oComponents.enabled := true;
      end;
    end;
    if (Components[j] is TDBNumberEditEh) then
    begin
      oComponents := TDBNumberEditEh(self.Components[j]);
      case oComponents.Tag of
        0:
          oComponents.enabled := bFlag;
        1:
          oComponents.enabled := not bFlag;
        2:
          oComponents.enabled := false;
        3:
          oComponents.enabled := true;
      end;
    end;
    if (Components[j] is TDBLookupComboboxEh) then
    begin
      oComponents := TDBLookupComboboxEh(self.Components[j]);
      case oComponents.Tag of
        0:
          oComponents.enabled := bFlag;
        1:
          oComponents.enabled := not bFlag;
        2:
          oComponents.enabled := false;
        3:
          oComponents.enabled := true;
      end;
    end;

    if (Components[j] is TDBComboBoxEh) then
    begin
      oComponents := TDBComboBoxEh(self.Components[j]);
      case oComponents.Tag of
        0:
          oComponents.enabled := bFlag;
        1:
          oComponents.enabled := not bFlag;
        2:
          oComponents.enabled := false;
        3:
          oComponents.enabled := true;
      end;
    end;

    if (Components[j] is TPngBitBtn) then
    begin
      oComponents := TPngBitBtn(self.Components[j]);
      case oComponents.Tag of
        0:
          oComponents.enabled := bFlag;
        1:
          oComponents.enabled := not bFlag;
        2:
          oComponents.enabled := false;
        3:
          oComponents.enabled := true;
      end;
    end;

    if (Components[j] is TDBNavigator) then
    begin
      oComponents := TDBNavigator(self.Components[j]);
      case oComponents.Tag of
        0:
          oComponents.enabled := bFlag;
        1:
          oComponents.enabled := not bFlag;
        2:
          oComponents.enabled := false;
        3:
          oComponents.enabled := true;
      end;
    end;

    if (Components[j] is TEdit) then
    begin
      oComponents := TEdit(self.Components[j]);
      case oComponents.Tag of
        0:
          oComponents.enabled := bFlag;
        1:
          oComponents.enabled := not bFlag;
        2:
          oComponents.enabled := false;
        3:
          oComponents.enabled := true;
      end;
    end;

    if (Components[j] is TcxDBMaskEdit) then
    begin
      oComponents := TcxDBMaskEdit(self.Components[j]);
      case oComponents.Tag of
        0:
          oComponents.enabled := bFlag;
        1:
          oComponents.enabled := not bFlag;
        2:
          oComponents.enabled := false;
        3:
          oComponents.enabled := true;
      end;
    end;

  end;
end;

procedure TfGen_Mant_Cte2.AssgnTabs;
var
  j: integer;
  oComponents: TControl;
begin
  for j := 0 to ComponentCount - 1 do
  begin
    {
      if (Components[j] is TCheckBox) then
      TCheckBox(self.Components[j]).OnKeyPress := self.EnterAsTab;

      if (Components[j] is TDBCheckBox) then
      TDBCheckBox(self.Components[j]).OnKeyPress := self.EnterAsTab;
    }
    if (Components[j] is TDBMemo) then
      TDBMemo(self.Components[j]).OnKeyPress := self.EnterAsTab;

    if (Components[j] is TDBEdit) then
      TDBEdit(self.Components[j]).OnKeyPress := self.EnterAsTab;

    if (Components[j] is TDBDateTimeEditEh) then
      TDBDateTimeEditEh(self.Components[j]).OnKeyPress := self.EnterAsTab;

    if (Components[j] is TDBNumberEditEh) then
      TDBNumberEditEh(self.Components[j]).OnKeyPress := self.EnterAsTab;

    if (Components[j] is TDBLookupComboboxEh) then
      TDBLookupComboboxEh(self.Components[j]).OnKeyPress := self.EnterAsTab;

    if (Components[j] is TDBComboBoxEh) then
      TDBComboBoxEh(self.Components[j]).OnKeyPress := self.EnterAsTab;

    if (Components[j] is TEdit) then
    begin
      if TEdit(self.Components[j]).Name <> 'oFnd_Cte' then
        TEdit(self.Components[j]).OnKeyPress := self.EnterAsTab;
    end;

    if (Components[j] is TcxDBMaskEdit) then
      TcxDBMaskEdit(self.Components[j]).OnKeyPress := self.EnterAsTab;

  end;
end;

procedure TfGen_Mant_Cte2.EnterAsTab(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    If HiWord(GetKeyState(VK_SHIFT)) <> 0 then
      SelectNext(Sender as TWinControl, false, true)
    else
      SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TfGen_Mant_Cte2.Action_Control(pOption: integer);
begin
  if ((pOption = 1) or (pOption = 2)) then
  begin
    // oDBNav.Visible := false;
    oBtnNew.Visible := false;
    oBtnEdit.Visible := false;
    oBtnDelete.Visible := false;
    oBtnFind.Visible := false;
    oBtnPrint.Visible := false;
    oBtnExit.enabled := false;

    oBtnSave.Top := oBtnNew.Top;
    oBtnSave.Left := oBtnNew.Left;

    oBtnAbort.Top := oBtnEdit.Top;
    oBtnAbort.Left := oBtnEdit.Left;

    oBtnAbort.Visible := true;
    oBtnSave.Visible := true;
    oBtnExit.Visible := false;
  end;

  if ((pOption = 6) or (pOption = 7)) then
  begin
    // oDBNav.Visible := true;
    oBtnNew.Visible := true;
    oBtnEdit.Visible := true;
    oBtnDelete.Visible := true;
    oBtnFind.Visible := true;
    oBtnPrint.Visible := true;
    oBtnExit.enabled := true;
    oBtnSave.Top := oBtnNew.Top;
    oBtnSave.Left := oBtnNew.Left;

    oBtnAbort.Top := oBtnEdit.Top;
    oBtnAbort.Left := oBtnEdit.Left;

    oBtnAbort.Visible := false;
    oBtnSave.Visible := false;
    oBtnExit.Visible := true;
  end;

end;

procedure TfGen_Mant_Cte2.Show_Data_Refresh(bShow_Tible: boolean = true; bFirstTab: boolean = true);
begin
  if (bShow_Tible = true) then
  begin
    self.iTipPer := self.otClientes_v2.FieldByName('tipo_persona').AsInteger;
    if (self.iTipPer = 1) then
      self.oTitulo.Caption := 'CLIENTE: ' + uppercase(self.otClientes_v2.FieldByName('nombre_primero').AsString) + '/ ' +
        uppercase(self.otClientes_v2.FieldByName('apellido_paterno').AsString)
    else
      self.oTitulo.Caption := 'EMPRESA: ' + uppercase(self.otClientes_v2.FieldByName('nombre_comercial').AsString);
    self.otClientes_v2.RefreshRecord();
  end
  else
    self.oTitulo.Caption := '';

  if (bFirstTab = true) then
  begin
    self.AdvSmoothTabPager1.ActivePageIndex := 1;
  end;

  if (bCte_Depen = true) then
    self.Fnd_Cte_Depen();

  if (bCte_Resid = true) then
    self.Fnd_Cte_Resid();

  if (bCte_InfoL = true) then
    self.Fnd_Cte_InfoL();

  if (bCte_Trans = true) then
    self.Fnd_Cte_Trans();

  if (bCte_Finan = true) then
    self.Fnd_Cte_Finan();

  if (bCte_OrigF = true) then
    self.Fnd_Cte_OrigF();

  self.Fnd_Cte_RefeB();
  self.Fnd_Cte_Refe1();

  if (bCte_FacRi = true) then
    self.Fnd_Cte_FacRi();

  if (bCte_Descu = true) then
    self.Fnd_Cte_Descu();

  // self.Sw_Interfaces_n();
end;

procedure TfGen_Mant_Cte2.Fnd_Cte_Descu();
VAR
  cSql_Str: string;
  cwhereCte: string;
begin
  if (self.iOption = 1) then
    cwhereCte := 'WHERE (id_cliente = "' + trim(self.cTmp_Sec) + '") '
  else
  begin
    // self.cCte_Sel := trim(self.otCliente_Nat.FieldByName('id_cliente').AsString);
    if (trim(self.cCte_Sel) = '') then
      self.cCte_Sel := 'ABC-123';
    cwhereCte := '';
    cwhereCte := cwhereCte + 'WHERE (id_cliente = "' + self.cCte_Sel + '") ';
    if ((self.iOption = 1) or (self.iOption = 2)) then
      cwhereCte := cwhereCte + 'OR   (id_cliente = "' + trim(self.cTmp_Sec) + '") ';
  end;

  cSql_Str := '';
  cSql_Str := cSql_Str + 'SELECT ';
  cSql_Str := cSql_Str + '	cd.*, ';
  cSql_Str := cSql_Str + '	td.desc_nombre AS Nom_Tipo_Desc, ';
  cSql_Str := cSql_Str + '	fp.fpnombre		AS Nom_Freq_Desc ';
  cSql_Str := cSql_Str + 'FROM cliente_descuentos cd ';
  cSql_Str := cSql_Str + 'LEFT JOIN mant_frec_pagos 		fp ON cd.freq_descuento= fp.fpcodigo ';
  cSql_Str := cSql_Str + 'LEFT JOIN mant_tipo_descuento td ON cd.tipo_descuento= td.desc_codigo ';
  cSql_Str := cSql_Str + ' ' + cwhereCte + ' ';
  cSql_Str := cSql_Str + 'ORDER BY cd.autoin ';

  dmGen_Data_Mod.oQry_Cte_De.Close;
  dmGen_Data_Mod.oQry_Cte_De.SQL.Clear;
  dmGen_Data_Mod.oQry_Cte_De.SQL.Text := cSql_Str;
  dmGen_Data_Mod.oQry_Cte_De.Open();
  dmGen_Data_Mod.oD_Cte_De.DataSet := dmGen_Data_Mod.oQry_Cte_De;
end;

procedure TfGen_Mant_Cte2.Fnd_Cte_Depen();
VAR
  cSql_Str: string;
  cwhereCte: string;
begin
  if (self.iOption = 1) then
    cwhereCte := 'WHERE (id_cliente = "' + trim(self.cTmp_Sec) + '") '
  else
  begin
    // self.cCte_Sel := trim(dmGen_Data_Mod.otCliente_Nat.FieldByName('id_cliente').AsString);
    if (trim(self.cCte_Sel) = '') then
      self.cCte_Sel := 'ABC-123';
    cwhereCte := '';
    cwhereCte := cwhereCte + 'WHERE (id_cliente = "' + self.cCte_Sel + '") ';
    if ((self.iOption = 1) or (self.iOption = 2)) then
      cwhereCte := cwhereCte + 'OR   (id_cliente = "' + trim(self.cTmp_Sec) + '") ';
  end;

  cSql_Str := 'SELECT * FROM cliente_dependientes ' + cwhereCte + ' ORDER BY id_cliente_dependientes';

  dmGen_Data_Mod.oQry_Cte_Depe.Close;
  dmGen_Data_Mod.oQry_Cte_Depe.SQL.Clear;
  dmGen_Data_Mod.oQry_Cte_Depe.SQL.Text := cSql_Str;
  dmGen_Data_Mod.oQry_Cte_Depe.Open();
  dmGen_Data_Mod.odCte_Depe.DataSet := dmGen_Data_Mod.oQry_Cte_Depe;
end;

procedure TfGen_Mant_Cte2.Fnd_Cte_Resid();
VAR
  cSql_Str: string;
  cwhereCte: string;
begin
  if (self.iOption = 1) then
    cwhereCte := 'WHERE (id_cliente = "' + trim(self.cTmp_Sec) + '") '
  else
  begin
    // self.cCte_Sel := trim(self.otCliente_Nat.FieldByName('id_cliente').AsString);
    if (trim(self.cCte_Sel) = '') then
      self.cCte_Sel := 'ABC-123';
    cwhereCte := '';
    cwhereCte := cwhereCte + 'WHERE (id_cliente = "' + self.cCte_Sel + '") ';
    if ((self.iOption = 1) or (self.iOption = 2)) then
      cwhereCte := cwhereCte + 'OR   (id_cliente = "' + trim(self.cTmp_Sec) + '") ';
  end;

  cSql_Str := 'SELECT * FROM cliente_residencia ' + cwhereCte + ' ORDER BY id_cliente_residencia';

  dmGen_Data_Mod.oQry_Cte_Resid.Close;
  dmGen_Data_Mod.oQry_Cte_Resid.SQL.Clear;
  dmGen_Data_Mod.oQry_Cte_Resid.SQL.Text := cSql_Str;
  dmGen_Data_Mod.oQry_Cte_Resid.Open();
  dmGen_Data_Mod.odCte_Resid.DataSet := dmGen_Data_Mod.oQry_Cte_Resid;
end;

procedure TfGen_Mant_Cte2.Fnd_Cte_InfoL();
VAR
  cSql_Str: string;
  cwhereCte: string;
begin
  if (self.iOption = 1) then
    cwhereCte := 'WHERE (id_cliente = "' + trim(self.cTmp_Sec) + '") '
  else
  begin
    // self.cCte_Sel := trim(dmGen_Data_Mod.otCliente_Nat.FieldByName('id_cliente').AsString);
    if (trim(self.cCte_Sel) = '') then
      self.cCte_Sel := 'ABC-123';
    cwhereCte := '';
    cwhereCte := cwhereCte + 'WHERE (id_cliente = "' + self.cCte_Sel + '") ';
    if ((self.iOption = 1) or (self.iOption = 2)) then
      cwhereCte := cwhereCte + 'OR   (id_cliente = "' + trim(self.cTmp_Sec) + '") ';
  end;

  cSql_Str := 'SELECT * FROM cliente_info_laboral ' + cwhereCte + ' ORDER BY id_cliente_info_laboral';

  dmGen_Data_Mod.oQry_Cte_InfL.Close;
  dmGen_Data_Mod.oQry_Cte_InfL.SQL.Clear;
  dmGen_Data_Mod.oQry_Cte_InfL.SQL.Text := cSql_Str;
  dmGen_Data_Mod.oQry_Cte_InfL.Open();
  dmGen_Data_Mod.odCte_InfL.DataSet := dmGen_Data_Mod.oQry_Cte_InfL;
end;

procedure TfGen_Mant_Cte2.Fnd_Cte_Trans();
VAR
  cSql_Str: string;
  cwhereCte: string;
begin
  if (self.iOption = 1) then
    cwhereCte := 'WHERE (cliente_transacciones.id_cliente = "' + trim(self.cTmp_Sec) + '") '
  else
  begin
    // self.cCte_Sel := trim(self.otCliente_Nat.FieldByName('id_cliente').AsString);
    if (trim(self.cCte_Sel) = '') then
      self.cCte_Sel := 'ABC-123';
    cwhereCte := '';
    cwhereCte := cwhereCte + 'WHERE (cliente_transacciones.id_cliente = "' + self.cCte_Sel + '") ';
    if ((self.iOption = 1) or (self.iOption = 2)) then
      cwhereCte := cwhereCte + 'OR   (cliente_transacciones.id_cliente = "' + trim(self.cTmp_Sec) + '") ';
  end;

  // cSql_Str := 'SELECT * FROM cliente_transacciones WHERE id_cliente="' + cCte_Id + '" ORDER BY id_cliente, tipo_transaccion, ultima_fecha_actualizacion';

  cSql_Str := '';
  cSql_Str := cSql_Str + 'SELECT ';
  cSql_Str := cSql_Str + '	cliente_transacciones.`id_cliente_transacciones`, ';
  cSql_Str := cSql_Str + '	cliente_transacciones.`id_cliente`, ';
  cSql_Str := cSql_Str + '	cliente_transacciones.`monto_transaccion`, ';
  cSql_Str := cSql_Str + '	cliente_transacciones.`monto_transaccion_retiro`, ';
  cSql_Str := cSql_Str + '	cliente_transacciones.`numero_transaccion`, ';
  cSql_Str := cSql_Str + '	cliente_transacciones.`cod_tipo_tran`, ';
  cSql_Str := cSql_Str + '	mant_tipo_trans.`ttnombre` AS Des_tipo_tran, ';
  cSql_Str := cSql_Str + '	cliente_transacciones.`cod_forma`, ';
  cSql_Str := cSql_Str + '	mant_forma_pag.`fpag_nombre`  AS Des_forma, ';
  cSql_Str := cSql_Str + '	cliente_transacciones.`monto_retiro`, ';
  cSql_Str := cSql_Str + '	cliente_transacciones.`clasificacion_patrimonio`, ';
  cSql_Str := cSql_Str + '	cliente_transacciones.`ultima_fecha_actualizacion`, ';
  cSql_Str := cSql_Str + '	cliente_transacciones.`ultimo_usuario_que_actualizo`, ';
  cSql_Str := cSql_Str + '	cliente_transacciones.`cod_freq`, ';
  cSql_Str := cSql_Str + '	mant_frec_pagos.`fpnombre` AS Des_freq, ';
  cSql_Str := cSql_Str + '	cliente_transacciones.`flag_tmp`, ';
  cSql_Str := cSql_Str + '	cliente_transacciones.`flag_tmp_chg` ';
  cSql_Str := cSql_Str + 'FROM cliente_transacciones ';
  cSql_Str := cSql_Str + 'LEFT JOIN mant_forma_pag   ON (cliente_transacciones.`cod_forma`     = mant_forma_pag.`fpag_codigo`) ';
  cSql_Str := cSql_Str + 'LEFT JOIN mant_frec_pagos  ON (cliente_transacciones.`cod_freq`      = mant_frec_pagos.`fpcodigo`) ';
  cSql_Str := cSql_Str + 'LEFT JOIN mant_tipo_trans  ON (cliente_transacciones.`cod_tipo_tran` = mant_tipo_trans.`ttcodigo`) ';
  cSql_Str := cSql_Str + ' ' + cwhereCte + ' ';
  cSql_Str := cSql_Str + 'ORDER BY cliente_transacciones.`id_cliente_transacciones`';

  dmGen_Data_Mod.oQry_Cte_Tran.Close;
  dmGen_Data_Mod.oQry_Cte_Tran.SQL.Clear;
  dmGen_Data_Mod.oQry_Cte_Tran.SQL.Text := cSql_Str;
  dmGen_Data_Mod.oQry_Cte_Tran.Open();
  dmGen_Data_Mod.odCte_Tran.DataSet := dmGen_Data_Mod.oQry_Cte_Tran;
end;

procedure TfGen_Mant_Cte2.Fnd_Cte_Finan();
VAR
  cSql_Str: string;
  cwhereCte: string;
begin
  if (self.iOption = 1) then
    cwhereCte := 'WHERE (cliente_origen_ingresos.id_cliente = "' + trim(self.cTmp_Sec) + '") '
  else
  begin
    // self.cCte_Sel := trim(self.otCliente_Nat.FieldByName('id_cliente').AsString);
    if (trim(self.cCte_Sel) = '') then
      self.cCte_Sel := 'ABC-123';
    cwhereCte := '';
    cwhereCte := cwhereCte + 'WHERE (cliente_origen_ingresos.id_cliente = "' + self.cCte_Sel + '") ';
    if ((self.iOption = 1) or (self.iOption = 2)) then
      cwhereCte := cwhereCte + 'OR   (cliente_origen_ingresos.id_cliente = "' + trim(self.cTmp_Sec) + '") ';
  end;

  // cSql_Str := 'SELECT * FROM cliente_origen_ingresos WHERE id_cliente="' + cCte_Id + '" ORDER BY id_cliente, concepto, ultima_fecha_actualizacion';
  cSql_Str := '';
  cSql_Str := cSql_Str + 'SELECT ';
  cSql_Str := cSql_Str + '  cliente_origen_ingresos.`id_origen_ingresos`, ';
  cSql_Str := cSql_Str + '  cliente_origen_ingresos.`id_cliente`, ';
  cSql_Str := cSql_Str + '  cliente_origen_ingresos.`concepto` 			    AS Conc_Cod   , ';
  cSql_Str := cSql_Str + '  mant_conceptos_ingresos.`conci_descripcion`	AS Conc_Des   , ';
  cSql_Str := cSql_Str + '  cliente_origen_ingresos.`cod_forma` 		    AS Formap_Cod , ';
  cSql_Str := cSql_Str + '  mant_forma_pag.`fpag_nombre`					      AS Formap_Des , ';
  cSql_Str := cSql_Str + '  cliente_origen_ingresos.`cod_freq`			    AS Freqpa_Cod , ';
  cSql_Str := cSql_Str + '  mant_frec_pagos.`fpnombre` 					        AS Freqpa_Des , ';
  cSql_Str := cSql_Str + '  cliente_origen_ingresos.`monto_fijo`, ';
  cSql_Str := cSql_Str + '  cliente_origen_ingresos.`monto_variable`, ';
  cSql_Str := cSql_Str + '  cliente_origen_ingresos.`origen_fondo` ';
  cSql_Str := cSql_Str + 'FROM cliente_origen_ingresos ';
  cSql_Str := cSql_Str + 'LEFT JOIN mant_forma_pag          ON (cliente_origen_ingresos.`cod_forma` = mant_forma_pag.`fpag_codigo`) ';
  cSql_Str := cSql_Str + 'LEFT JOIN mant_frec_pagos         ON (cliente_origen_ingresos.`cod_freq`  = mant_frec_pagos.`fpcodigo`) ';
  cSql_Str := cSql_Str + 'LEFT JOIN mant_conceptos_ingresos ON (cliente_origen_ingresos.`concepto`  = mant_conceptos_ingresos.`conci_id`) ';
  cSql_Str := cSql_Str + ' ' + cwhereCte + ' ';
  cSql_Str := cSql_Str + 'ORDER BY cliente_origen_ingresos.`id_origen_ingresos`';

  dmGen_Data_Mod.oQry_Cte_OIng.Close;
  dmGen_Data_Mod.oQry_Cte_OIng.SQL.Clear;
  dmGen_Data_Mod.oQry_Cte_OIng.SQL.Text := cSql_Str;
  dmGen_Data_Mod.oQry_Cte_OIng.Open();
  dmGen_Data_Mod.odCte_OIng.DataSet := dmGen_Data_Mod.oQry_Cte_OIng;
end;

procedure TfGen_Mant_Cte2.Fnd_Cte_OrigF();
VAR
  cSql_Str: string;
  cwhereCte: string;
begin
  if (self.iOption = 1) then
    cwhereCte := 'WHERE (ofon_id_cliente = "' + trim(self.cTmp_Sec) + '") '
  else
  begin
    // self.cCte_Sel := trim(self.otCliente_Nat.FieldByName('id_cliente').AsString);
    if (trim(self.cCte_Sel) = '') then
      self.cCte_Sel := 'ABC-123';
    cwhereCte := '';
    cwhereCte := cwhereCte + 'WHERE (ofon_id_cliente = "' + self.cCte_Sel + '") ';
    if ((self.iOption = 1) or (self.iOption = 2)) then
      cwhereCte := cwhereCte + 'OR   (ofon_id_cliente = "' + trim(self.cTmp_Sec) + '") ';
  end;

  cSql_Str := 'SELECT * FROM cliente_origen_fondos ' + cwhereCte + ' ORDER BY ofon_id';

  dmGen_Data_Mod.oQry_Cte_OFon.Close;
  dmGen_Data_Mod.oQry_Cte_OFon.SQL.Clear;
  dmGen_Data_Mod.oQry_Cte_OFon.SQL.Text := cSql_Str;
  dmGen_Data_Mod.oQry_Cte_OFon.Open();
  dmGen_Data_Mod.odCte_OFon.DataSet := dmGen_Data_Mod.oQry_Cte_OFon;
end;

procedure TfGen_Mant_Cte2.Fnd_Cte_Refe1();
VAR
  cSql_Str: string;
  cwhereCte: string;
begin
  if (self.iOption = 1) then
    cwhereCte := 'WHERE (cliente_referencias.id_cliente = "' + trim(self.cTmp_Sec) + '") '
  else
  begin
    // self.cCte_Sel := trim(self.otCliente_Nat.FieldByName('id_cliente').AsString);
    if (trim(self.cCte_Sel) = '') then
      self.cCte_Sel := 'ABC-123';
    cwhereCte := '';
    cwhereCte := cwhereCte + 'WHERE (cliente_referencias.id_cliente = "' + self.cCte_Sel + '") ';
    if ((self.iOption = 1) or (self.iOption = 2)) then
      cwhereCte := cwhereCte + 'OR   (cliente_referencias.id_cliente = "' + trim(self.cTmp_Sec) + '") ';
  end;

  // cSql_Str := 'SELECT * FROM cliente_referencias WHERE Id_cliente="' + cCte_Id + '" ORDER BY id_cliente,tipo ';
  cSql_Str := '';
  cSql_Str := cSql_Str + 'SELECT ';
  cSql_Str := cSql_Str + '  cliente_referencias.*, ';
  cSql_Str := cSql_Str + '  mant_actividad_econ.activ_descripcion AS activ_des ';
  cSql_Str := cSql_Str + 'FROM cliente_referencias ';
  cSql_Str := cSql_Str + 'LEFT JOIN mant_actividad_econ  ON (cliente_referencias.actividad_comercial = mant_actividad_econ.activ_id) ';
  cSql_Str := cSql_Str + ' ' + cwhereCte + ' ';
  cSql_Str := cSql_Str + 'ORDER BY cliente_referencias.id_cliente_referencias ';

  dmGen_Data_Mod.oQry_Cte_Ref1.Close;
  dmGen_Data_Mod.oQry_Cte_Ref1.SQL.Clear;
  dmGen_Data_Mod.oQry_Cte_Ref1.SQL.Text := cSql_Str;
  dmGen_Data_Mod.oQry_Cte_Ref1.Open();
  dmGen_Data_Mod.oD_Cte_Ref1.DataSet := dmGen_Data_Mod.oQry_Cte_Ref1;
end;

procedure TfGen_Mant_Cte2.Fnd_Cte_RefeB();
VAR
  cSql_Str: string;
  cwhereCte: string;
begin
  if (self.iOption = 1) then
    cwhereCte := 'WHERE (cliente_referencias_bancarias.id_cliente = "' + trim(self.cTmp_Sec) + '") '
  else
  begin
    // self.cCte_Sel := trim(self.otCliente_Nat.FieldByName('id_cliente').AsString);
    if (trim(self.cCte_Sel) = '') then
      self.cCte_Sel := 'ABC-123';
    cwhereCte := '';
    cwhereCte := cwhereCte + 'WHERE (cliente_referencias_bancarias.id_cliente = "' + self.cCte_Sel + '") ';
    if ((self.iOption = 1) or (self.iOption = 2)) then
      cwhereCte := cwhereCte + 'OR   (cliente_referencias_bancarias.id_cliente = "' + trim(self.cTmp_Sec) + '") ';
  end;

  // cSql_Str := 'SELECT * FROM cliente_referencias_bancarias WHERE id_cliente="' + cCte_Id + '" ORDER BY id_cliente,id_banco ';
  cSql_Str := '';
  cSql_Str := cSql_Str + 'SELECT ';
  cSql_Str := cSql_Str + '  cliente_referencias_bancarias.*, ';
  cSql_Str := cSql_Str + '  mant_bancos.banc_descripcion AS Des_banco ';
  cSql_Str := cSql_Str + 'FROM cliente_referencias_bancarias ';
  cSql_Str := cSql_Str + 'LEFT JOIN mant_bancos ON (cliente_referencias_bancarias.`id_banco` = mant_bancos.`banc_id`) ';
  cSql_Str := cSql_Str + ' ' + cwhereCte + ' ';
  cSql_Str := cSql_Str + 'ORDER BY cliente_referencias_bancarias.id_cliente_referencias_bancarias ';

  dmGen_Data_Mod.oQry_Cte_RefB.Close;
  dmGen_Data_Mod.oQry_Cte_RefB.SQL.Clear;
  dmGen_Data_Mod.oQry_Cte_RefB.SQL.Text := cSql_Str;
  dmGen_Data_Mod.oQry_Cte_RefB.Open();
  dmGen_Data_Mod.od_Cte_RefB.DataSet := dmGen_Data_Mod.oQry_Cte_RefB;
end;

procedure TfGen_Mant_Cte2.Fnd_Cte_FacRi();
VAR
  cSql_Str: string;
  cwhereCte: string;
begin
  if (dmGen_Data_Mod.otClientes.State in [dsInsert]) then
    cwhereCte := 'WHERE (mant_factores_riesgos_v2.selecion_automatica=0) AND (cliente_factores_riesgo.id_cliente = "' + trim(self.cTmp_Sec) + '") '
  else
  begin
    // self.cCte_Sel := trim(dmGen_Data_Mod.otClientes.FieldByName('id_cliente').AsString);
    if (trim(self.cCte_Sel) = '') then
      self.cCte_Sel := 'ABC-123';
    cwhereCte := '';
    cwhereCte := cwhereCte + 'WHERE (mant_factores_riesgos_v2.selecion_automatica=0) AND (cliente_factores_riesgo.id_cliente = "' + trim(self.cCte_Sel) + '") ';
    if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
      cwhereCte := cwhereCte + 'OR (cliente_factores_riesgo.id_cliente = "' + trim(self.cTmp_Sec) + '") ';
  end;
  // cSql_Str := cSql_Str + 'WHERE (mant_factores_riesgos_v2.selecion_automatica=0) AND cliente_factores_riesgo.id_cliente=' 2527 - 1 ';

  cSql_Str := '';
  cSql_Str := cSql_Str + 'SELECT ';
  cSql_Str := cSql_Str + '  cliente_factores_riesgo.*, ';
  cSql_Str := cSql_Str + '  mant_factores_riesgos_v2.descripcion ';
  cSql_Str := cSql_Str + 'FROM cliente_factores_riesgo ';
  cSql_Str := cSql_Str + 'INNER JOIN mant_factores_riesgos_v2 ON cliente_factores_riesgo.codigo_factores_riesgo=mant_factores_riesgos_v2.codigo ';
  cSql_Str := cSql_Str + ' ' + cwhereCte + ' ';
  cSql_Str := cSql_Str + 'ORDER BY cliente_factores_riesgo.codigo_factores_riesgo ';

  {
    cSql_Str := '';
    cSql_Str := cSql_Str + 'SELECT ';
    cSql_Str := cSql_Str + '  cliente_factores_riesgo.*,';
    cSql_Str := cSql_Str + '  mant_factores_riesgos.factores_riesgo_nombre ';
    cSql_Str := cSql_Str + 'FROM cliente_factores_riesgo ';
    cSql_Str := cSql_Str + 'INNER JOIN mant_factores_riesgos ON (cliente_factores_riesgo.codigo_factores_riesgo = mant_factores_riesgos.codigo_factor) ';
    cSql_Str := cSql_Str + ' ' + cwhereCte + ' ';
    cSql_Str := cSql_Str + 'AND  (mant_factores_riesgos.factores_grp = 3) ';
    cSql_Str := cSql_Str + 'ORDER BY cliente_factores_riesgo.id_cliente_factores_riesgo ';
  }

  dmGen_Data_Mod.oQry_Cte_FR.Close;
  dmGen_Data_Mod.oQry_Cte_FR.SQL.clear;
  dmGen_Data_Mod.oQry_Cte_FR.SQL.Text := cSql_Str;
  dmGen_Data_Mod.oQry_Cte_FR.Open();
  dmGen_Data_Mod.od_Cte_FR.DataSet := dmGen_Data_Mod.oQry_Cte_FR;
  self.oGrid_Rzg_Cte.Refresh;
end;

procedure TfGen_Mant_Cte2.Asingar_Cod_Cte();
begin
  if (bCte_Resid = true) then
  begin
    if (dmGen_Data_Mod.oQry_Cte_Resid.State in [dsInsert, dsEdit]) then
    begin
      if (self.iOption = 1) then
        dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('flag_tmp').AsInteger := 1;

      dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('id_cliente').AsString := self.cCte_Sel;
      dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('ultima_fecha_actualizacion').AsDateTime := now();
      dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('ultimo_usuario_que_actualizo').AsInteger := UtilesV20.iUserID;
    end;
  end;

  if (bCte_InfoL = true) then
  begin
    if (dmGen_Data_Mod.oQry_Cte_InfL.State in [dsInsert, dsEdit]) then
    begin

      if (self.iOption = 1) then
        dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('flag_tmp').AsInteger := 1;

      dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('id_cliente').AsString := self.cCte_Sel;
      dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('ultima_fecha_actualizacion').AsDateTime := now();
      dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('ultimo_usuario_que_actualizo').AsInteger := UtilesV20.iUserID;
    end;
  end;

  if ((self.iOption = 1) or (self.iOption = 2)) then
  begin
    self.otClientes_v2.FieldByName('fecha_actualizacion').AsDateTime := now();
    self.otClientes_v2.FieldByName('usuario_actualizacion').AsInteger := UtilesV20.iUserID;
  end;
end;

procedure TfGen_Mant_Cte2.Cte_Borra_Tmp_Asig(cCod_Cte: string);
VAR
  cSql_Ln: STRING;
begin
  if (bCte_Depen = true) then
  begin
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'DELETE FROM cliente_dependientes ';
    cSql_Ln := cSql_Ln + 'WHERE ( (id_cliente ="' + trim(self.cTmp_Sec) + '") OR (id_cliente ="' + trim(cCod_Cte) + '") ) ';
    cSql_Ln := cSql_Ln + 'AND ((flag_tmp=1) OR (flag_tmp=3)) ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  if (bCte_Resid = true) then
  begin
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'DELETE FROM cliente_residencia ';
    cSql_Ln := cSql_Ln + 'WHERE ( (id_cliente ="' + trim(self.cTmp_Sec) + '") OR (id_cliente ="' + trim(cCod_Cte) + '") ) ';
    cSql_Ln := cSql_Ln + 'AND ((flag_tmp=1) OR (flag_tmp=3)) ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  if (bCte_InfoL = true) then
  begin
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'DELETE FROM cliente_info_laboral ';
    cSql_Ln := cSql_Ln + 'WHERE ( (id_cliente ="' + trim(self.cTmp_Sec) + '") OR (id_cliente ="' + trim(cCod_Cte) + '") ) ';
    cSql_Ln := cSql_Ln + 'AND ((flag_tmp=1) OR (flag_tmp=3)) ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  if (bCte_Trans = true) then
  begin
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'DELETE FROM cliente_transacciones ';
    cSql_Ln := cSql_Ln + 'WHERE ( (id_cliente ="' + trim(self.cTmp_Sec) + '") OR (id_cliente ="' + trim(cCod_Cte) + '") ) ';
    cSql_Ln := cSql_Ln + 'AND ((flag_tmp=1) OR (flag_tmp=3)) ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  if (bCte_Finan = true) then
  begin
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'DELETE FROM cliente_origen_ingresos ';
    cSql_Ln := cSql_Ln + 'WHERE ( (id_cliente ="' + trim(self.cTmp_Sec) + '") OR (id_cliente ="' + trim(cCod_Cte) + '") ) ';
    cSql_Ln := cSql_Ln + 'AND ((flag_tmp=1) OR (flag_tmp=3)) ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  if (bCte_OrigF = true) then
  begin
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'DELETE FROM cliente_origen_fondos ';
    cSql_Ln := cSql_Ln + 'WHERE ( (ofon_id_cliente ="' + trim(self.cTmp_Sec) + '") OR (ofon_id_cliente="' + trim(cCod_Cte) + '") ) ';
    cSql_Ln := cSql_Ln + 'AND ((flag_tmp=1) OR (flag_tmp=3)) ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE FROM cliente_referencias ';
  cSql_Ln := cSql_Ln + 'WHERE ( (id_cliente ="' + trim(self.cTmp_Sec) + '") OR (Id_cliente ="' + trim(cCod_Cte) + '") ) ';
  cSql_Ln := cSql_Ln + 'AND ((flag_tmp=1) OR (flag_tmp=3)) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE FROM cliente_referencias_bancarias ';
  cSql_Ln := cSql_Ln + 'WHERE ( (id_cliente ="' + trim(self.cTmp_Sec) + '") OR (id_cliente ="' + trim(cCod_Cte) + '") ) ';
  cSql_Ln := cSql_Ln + 'AND ((flag_tmp=1) OR (flag_tmp=3)) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  if (bCte_FacRi = true) then
  begin
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'DELETE FROM cliente_factores_riesgo ';
    cSql_Ln := cSql_Ln + 'WHERE ( (id_cliente ="' + trim(self.cTmp_Sec) + '") OR (id_cliente ="' + trim(cCod_Cte) + '") ) ';
    cSql_Ln := cSql_Ln + 'AND ((flag_tmp=1) OR (flag_tmp=2)) ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  if (bCte_Descu = true) then
  begin
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'DELETE FROM cliente_descuentos ';
    cSql_Ln := cSql_Ln + 'WHERE ( (id_cliente ="' + trim(self.cTmp_Sec) + '") OR (id_cliente ="' + trim(cCod_Cte) + '") ) ';
    cSql_Ln := cSql_Ln + 'AND ((flag_tmp=1) OR (flag_tmp=2)) ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE ';
  cSql_Ln := cSql_Ln + 'FROM cliente_impacto ';
  cSql_Ln := cSql_Ln + 'WHERE ( (id_cliente ="' + trim(self.cTmp_Sec) + '") OR (id_cliente ="' + trim(cCod_Cte) + '") ) ';
  cSql_Ln := cSql_Ln + 'AND ((flag_tmp=1) OR (flag_tmp=2)) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);
end;

procedure TfGen_Mant_Cte2.Cte_Limpia_Tmp_Asig(cCod_Cte: string);
VAR
  cSql_Ln: STRING;
begin
  if (bCte_Depen = true) then
  begin
    cSql_Ln := 'UPDATE cliente_dependientes SET flag_tmp=0 WHERE ((id_cliente ="' + trim(self.cTmp_Sec) + '") or (id_cliente ="' + cCod_Cte + '")) AND flag_tmp=1';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  if (bCte_Resid = true) then
  begin
    cSql_Ln := 'UPDATE cliente_residencia SET flag_tmp=0 WHERE ((id_cliente ="' + trim(self.cTmp_Sec) + '") or (id_cliente ="' + cCod_Cte + '")) AND flag_tmp=1';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  if (bCte_InfoL = true) then
  begin
    cSql_Ln := 'UPDATE cliente_info_laboral SET flag_tmp=0 WHERE ((id_cliente ="' + trim(self.cTmp_Sec) + '") or (id_cliente ="' + cCod_Cte + '")) AND flag_tmp=1';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  if (bCte_Trans = true) then
  begin
    cSql_Ln := 'UPDATE cliente_transacciones SET flag_tmp=0 WHERE ((id_cliente ="' + trim(self.cTmp_Sec) + '") or (id_cliente ="' + cCod_Cte + '")) AND flag_tmp=1';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  if (bCte_Finan = true) then
  begin
    cSql_Ln := 'UPDATE cliente_origen_ingresos SET flag_tmp=0 WHERE ((id_cliente ="' + trim(self.cTmp_Sec) + '") or (id_cliente ="' + cCod_Cte + '")) AND flag_tmp=1';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  if (bCte_OrigF = true) then
  begin
    cSql_Ln := 'UPDATE cliente_origen_fondos SET flag_tmp=0 WHERE ((ofon_id_cliente ="' + trim(self.cTmp_Sec) + '") or (ofon_id_cliente="' + cCod_Cte + '")) AND flag_tmp=1';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  cSql_Ln := 'UPDATE cliente_referencias SET flag_tmp=0 WHERE ((id_cliente ="' + trim(self.cTmp_Sec) + '") or (id_cliente ="' + cCod_Cte + '")) AND flag_tmp=1';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := 'UPDATE cliente_referencias_bancarias SET flag_tmp=0 WHERE ((id_cliente ="' + trim(self.cTmp_Sec) + '") or (id_cliente ="' + cCod_Cte + '")) AND flag_tmp=1';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  if (bCte_FacRi = true) then
  begin
    cSql_Ln := 'UPDATE cliente_factores_riesgo SET flag_tmp=0 WHERE ((id_cliente ="' + trim(self.cTmp_Sec) + '") or (id_cliente ="' + cCod_Cte + '")) AND flag_tmp=1';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  if (bCte_Descu = true) then
  begin
    cSql_Ln := 'UPDATE cliente_descuentos SET flag_tmp=0 WHERE ((id_cliente ="' + trim(self.cTmp_Sec) + '") or (id_cliente ="' + cCod_Cte + '")) AND flag_tmp=1';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  cSql_Ln := 'UPDATE cliente_impacto SET flag_tmp=0 WHERE ((id_cliente ="' + trim(self.cTmp_Sec) + '") or (id_cliente ="' + cCod_Cte + '")) AND (flag_tmp=1)';
  UtilesV20.Execute_SQL_Command(cSql_Ln);
end;

procedure TfGen_Mant_Cte2.Sw_Interfaces_from_data;
begin
  if (self.otClientes_v2.FieldByName('tipo_persona').AsInteger = 1) then
    self.Sw_Interfaces_n
  else
    self.Sw_Interfaces_j;
end;

procedure TfGen_Mant_Cte2.Sw_Interfaces_j;
begin
  // Vamos a Persona Jurídica//
  // self.oLst_tipo_persona_j.Value := 2;
  self.oTab_Gen_Nat.TabVisible := false;

  self.oTab_Gen_Jur.TabVisible := true;
  self.oGrp_Info_Jur.Visible := true;
  self.oGrp_Info_Jur.enabled := true;
  self.AdvSmoothTabPager1.ActivePage := self.oTab_Gen_Jur;
end;

procedure TfGen_Mant_Cte2.Sw_Interfaces_n;
begin
  // Vamos a Persona Natural//
  // self.oLst_tipo_persona_n.Value := 1;
  self.oTab_Gen_Jur.TabVisible := false;

  self.oTab_Gen_Nat.TabVisible := true;
  self.oGrp_Info_Nat.Visible := true;
  self.oGrp_Info_Nat.enabled := true;
  self.AdvSmoothTabPager1.ActivePage := self.oTab_Gen_Nat;
end;

procedure TfGen_Mant_Cte2.Borra_Inf_Cliente(cCod_Cte: string);
var
  cSql_Ln: string;
begin
  fUtilesV20.WaitStart(self, 'INICIANDO PROCESO DE ELIMINACION:.');

  if (bCte_Depen = true) then
  begin
    fUtilesV20.WaitSetMsg('ELIMINANDO INFORMACION DE DEPENDIENTES [1 DE 11]:..');
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'DELETE FROM cliente_dependientes ';
    cSql_Ln := cSql_Ln + 'WHERE (id_cliente="") AND (id_cliente="' + trim(cCod_Cte) + '") ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  if (bCte_Resid = true) then
  begin
    fUtilesV20.WaitSetMsg('ELIMINANDO INFORMACION DE RESIDENCIA   [2 DE 11]:..');
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'DELETE FROM cliente_residencia ';
    cSql_Ln := cSql_Ln + 'WHERE (id_cliente="") AND (id_cliente="' + trim(cCod_Cte) + '") ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  if (bCte_InfoL = true) then
  begin
    fUtilesV20.WaitSetMsg('ELIMINANDO INFORMACION LABORAL         [3 DE 11]:..');
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'DELETE FROM cliente_info_laboral ';
    cSql_Ln := cSql_Ln + 'WHERE (id_cliente="") AND (id_cliente="' + trim(cCod_Cte) + '") ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  if (bCte_Finan = true) then
  begin
    fUtilesV20.WaitSetMsg('ELIMINANDO INFORMACION ORIGEN DE FONOS  [4 DE 11]:..');
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'DELETE FROM cliente_origen_ingresos ';
    cSql_Ln := cSql_Ln + 'WHERE (id_cliente="") AND (id_cliente="' + trim(cCod_Cte) + '") ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  if (bCte_Trans = true) then
  begin
    fUtilesV20.WaitSetMsg('ELIMINANDO INFORMACION DE TRANSACCIONES [5 DE 11]:..');
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'DELETE FROM cliente_transacciones ';
    cSql_Ln := cSql_Ln + 'WHERE (id_cliente="") AND (id_cliente="' + trim(cCod_Cte) + '") ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  if (bCte_OrigF = true) then
  begin
    fUtilesV20.WaitSetMsg('ELIMINANDO INFORMACION DE PATRIMONIO    [6 DE 11]:..');
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'DELETE FROM cliente_origen_fondos ';
    cSql_Ln := cSql_Ln + 'WHERE (ofon_id_cliente="") AND (ofon_id_cliente="' + trim(cCod_Cte) + '") ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  fUtilesV20.WaitSetMsg('ELIMINANDO INFORMACION DE REF. PERSONAL [7 DE 11]:..');
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE FROM cliente_referencias ';
  cSql_Ln := cSql_Ln + 'WHERE (id_cliente="") AND (id_cliente="' + trim(cCod_Cte) + '") ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  fUtilesV20.WaitSetMsg('ELIMINANDO INFORMACION DE REF. BANCOS   [8 DE 11]:..');
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE FROM cliente_referencias_bancarias ';
  cSql_Ln := cSql_Ln + 'WHERE (id_cliente="") AND (id_cliente="' + trim(cCod_Cte) + '") ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  if (bCte_FacRi = true) then
  begin
    fUtilesV20.WaitSetMsg('ELIMINANDO INFORMACION FACTORES RIEZGOS [9 DE 11]:..');
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'DELETE FROM cliente_factores_riesgo ';
    cSql_Ln := cSql_Ln + 'WHERE (id_cliente="") AND (id_cliente="' + trim(cCod_Cte) + '") ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  if (bCte_Descu = true) then
  begin
    fUtilesV20.WaitSetMsg('ELIMINANDO INFORMACION DESCUENTO DIRECTOS [10 DE 11]:..');
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'DELETE FROM cliente_descuentos ';
    cSql_Ln := cSql_Ln + 'WHERE (id_cliente="") AND (id_cliente="' + trim(cCod_Cte) + '") ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  fUtilesV20.WaitSetMsg('ELIMINANDO INFORMACION DEL CLIENTE/SOC [11 DE 11]:..');
  self.otClientes_v2.delete;
  fUtilesV20.WaitEnd;
end;

procedure TfGen_Mant_Cte2.BUSCADORAPC1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://online.apc.com.pa/Login/tabid/468/Default.aspx?returnurl=%2fdefault.aspx', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Mant_Cte2.BUSCADORMP1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.rp.gob.pa/', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Mant_Cte2.BUSCADORUAF1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.uaf.gob.pa/Lista-Nacional', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Mant_Cte2.BUSCADORUK1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://www.gov.uk/government/publications/current-list-of-designated-persons-terrorism-and-terrorist-financing', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Mant_Cte2.NewCte_CodUpdate(cCod_Tmp: string; cCod_Fin: string);
var
  cSql_Ln: string;
begin
  if (bCte_Depen = true) then
  begin
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'UPDATE cliente_dependientes SET ';
    cSql_Ln := cSql_Ln + '  flag_tmp=0, id_cliente="' + trim(cCod_Fin) + '" ';
    cSql_Ln := cSql_Ln + 'WHERE (id_cliente="' + trim(cCod_Tmp) + '") AND (flag_tmp=1) ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  if (bCte_Resid = true) then
  begin
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'UPDATE cliente_residencia SET ';
    cSql_Ln := cSql_Ln + '  flag_tmp=0, id_cliente="' + trim(cCod_Fin) + '" ';
    cSql_Ln := cSql_Ln + 'WHERE (id_cliente="' + trim(cCod_Tmp) + '") AND (flag_tmp=1) ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  if (bCte_InfoL = true) then
  begin
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'UPDATE cliente_info_laboral SET ';
    cSql_Ln := cSql_Ln + '  flag_tmp=0, id_cliente="' + trim(cCod_Fin) + '" ';
    cSql_Ln := cSql_Ln + 'WHERE (id_cliente="' + trim(cCod_Tmp) + '") AND (flag_tmp=1) ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  if (bCte_Finan = true) then
  begin
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'UPDATE cliente_origen_ingresos SET ';
    cSql_Ln := cSql_Ln + '  flag_tmp=0, id_cliente="' + trim(cCod_Fin) + '" ';
    cSql_Ln := cSql_Ln + 'WHERE (id_cliente="' + trim(cCod_Tmp) + '") AND (flag_tmp=1) ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  if (bCte_Trans = true) then
  begin
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'UPDATE cliente_transacciones SET ';
    cSql_Ln := cSql_Ln + '  flag_tmp=0, id_cliente="' + trim(cCod_Fin) + '" ';
    cSql_Ln := cSql_Ln + 'WHERE (id_cliente="' + trim(cCod_Tmp) + '") AND (flag_tmp=1) ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  if (bCte_OrigF = true) then
  begin
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'UPDATE cliente_origen_fondos SET ';
    cSql_Ln := cSql_Ln + '  flag_tmp=0, ofon_id_cliente="' + trim(cCod_Fin) + '" ';
    cSql_Ln := cSql_Ln + 'WHERE (ofon_id_cliente="' + trim(cCod_Tmp) + '") AND (flag_tmp=1) ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'UPDATE cliente_referencias SET ';
  cSql_Ln := cSql_Ln + '  flag_tmp=0, id_cliente="' + trim(cCod_Fin) + '" ';
  cSql_Ln := cSql_Ln + 'WHERE (id_cliente="' + trim(cCod_Tmp) + '") AND (flag_tmp=1) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'UPDATE cliente_referencias_bancarias SET ';
  cSql_Ln := cSql_Ln + '  flag_tmp=0, id_cliente="' + trim(cCod_Fin) + '" ';
  cSql_Ln := cSql_Ln + 'WHERE (id_cliente="' + trim(cCod_Tmp) + '") AND (flag_tmp=1) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  if (bCte_FacRi = true) then
  begin
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'UPDATE cliente_factores_riesgo SET ';
    cSql_Ln := cSql_Ln + '  flag_tmp=0, id_cliente="' + trim(cCod_Fin) + '" ';
    cSql_Ln := cSql_Ln + 'WHERE (id_cliente="' + trim(cCod_Tmp) + '") AND (flag_tmp=1) ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;

  if (bCte_Descu = true) then
  begin
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'UPDATE cliente_descuentos SET ';
    cSql_Ln := cSql_Ln + '  flag_tmp=0, id_cliente="' + trim(cCod_Fin) + '" ';
    cSql_Ln := cSql_Ln + 'WHERE (id_cliente="' + trim(cCod_Tmp) + '") AND (flag_tmp=1) ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;
end;

procedure TfGen_Mant_Cte2.Actualiza_Riezgo_Fijo(cCod_Cte: string);
var
  cSql_Ln, cConv: string;
  cStr_Val: string;
begin
  // -----SE ENCARGAR DE VERIFICAR SI ESTA HABILITADA O NO EL RIEZGO DE INGRESOS EN EFECTIVO----//
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT ';
  cSql_Ln := cSql_Ln + '  COUNT(cliente_transacciones.`id_cliente_transacciones`) AS Cnt_Rzg_efe ';
  cSql_Ln := cSql_Ln + 'FROM cliente_transacciones ';
  cSql_Ln := cSql_Ln + 'LEFT JOIN mant_forma_pag  ON (cliente_transacciones.`cod_forma` = mant_forma_pag.`fpag_codigo`) ';
  cSql_Ln := cSql_Ln + 'WHERE ( (cliente_transacciones.id_cliente="' + trim(self.cTmp_Sec) + '") or (cliente_transacciones.id_cliente="' + cCod_Cte + '")) ';
  cSql_Ln := cSql_Ln + 'AND   mant_forma_pag.fpag_riesgo=1 ';
  cSql_Ln := cSql_Ln + 'AND   mant_forma_pag.fpag_codigo=2 ';
  cSql_Ln := cSql_Ln + 'GROUP BY cliente_transacciones.id_cliente,mant_forma_pag.fpag_riesgo  ';
  cConv := UtilesV20.Execute_SQL_Result(cSql_Ln);
  if (trim(cConv) = '') then
    cConv := '0';

  if (StrToInt(cConv) <= 0) then
    self.Add_Automatic_Riesgo(cCod_Cte, 'FP01', true)
  else
    self.Add_Automatic_Riesgo(cCod_Cte, 'FP01', false);
  // -------------------------------------------------------------------------------------------//

  // -----SE ENCARGAR DE VERIFICAR SI ESTA HABILITADA O NO EL RIEZGO DE MAS DE UAN NACIONALIDAD----//
  if (self.odoble_nacionalidad.Checked = false) then
    self.Add_Automatic_Riesgo(cCod_Cte, 'FP02', true)
  else
    self.Add_Automatic_Riesgo(cCod_Cte, 'FP02', false);
  // -------------------------------------------------------------------------------------------//

  if (bCte_InfoL = true) then
  begin
    // ------------------VALIDA ACTIVIDAD ECONOMICA/RIESGO------------------------------------------//
    cStr_Val := trim(dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('id_actividad_economica').AsString);
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'SELECT ';
    cSql_Ln := cSql_Ln + '  activ_id, activ_prob, activ_impa, (activ_prob+activ_impa) AS con_riesgo ';
    cSql_Ln := cSql_Ln + 'FROM mant_actividad_econ ';
    cSql_Ln := cSql_Ln + 'WHERE activ_id="' + cStr_Val + '" ';
    UtilesV20.Exec_Select_SQL(self.oFnd_Qry_Gen, cSql_Ln);

    if (self.oFnd_Qry_Gen.FieldByName('con_riesgo').AsInteger <= 0) then
      self.Add_Automatic_Riesgo(cCod_Cte, 'FP03', true)
    else
      self.Add_Automatic_Riesgo(cCod_Cte, 'FP03', false, self.oFnd_Qry_Gen.FieldByName('activ_prob').AsString, self.oFnd_Qry_Gen.FieldByName('activ_impa').AsString);
  end;
  // -------------------------------------------------------------------------------------------//

  // -------------------------VALIDA PAIS/RIESGO------------------------------------------------//
  if (self.otClientes_v2.FieldByName('tipo_persona').AsInteger = 1) then
    cStr_Val := self.otClientes_v2.FieldByName('pais_nacimiento').AsString
  else
    cStr_Val := self.otClientes_v2.FieldByName('id_pais_constitucion').AsString;

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT ';
  cSql_Ln := cSql_Ln + '  pais_prob, pais_prob, pais_impa, (pais_prob+pais_impa) AS con_riesgo ';
  cSql_Ln := cSql_Ln + 'FROM mant_paises ';
  cSql_Ln := cSql_Ln + 'WHERE pais_id_pais="' + cStr_Val + '" ';
  UtilesV20.Exec_Select_SQL(self.oFnd_Qry_Gen, cSql_Ln);

  if (self.oFnd_Qry_Gen.FieldByName('con_riesgo').AsInteger <= 0) then
    self.Add_Automatic_Riesgo(cCod_Cte, 'PA01', true)
  else
    self.Add_Automatic_Riesgo(cCod_Cte, 'PA01', false, self.oFnd_Qry_Gen.FieldByName('pais_prob').AsString, self.oFnd_Qry_Gen.FieldByName('pais_impa').AsString);
  // -------------------------------------------------------------------------------------------//

  if (bCte_Resid = true) then
  begin
    // -------------------------VALIDA DISTRITO/RIESGO------------------------------------------------//
    cStr_Val := dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('id_distrito').AsString;
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'SELECT ';
    cSql_Ln := cSql_Ln + '  dist_id, dist_prob, dist_impa, (dist_prob+dist_impa) AS con_riesgo ';
    cSql_Ln := cSql_Ln + 'FROM mant_distritos ';
    cSql_Ln := cSql_Ln + 'WHERE dist_id="' + cStr_Val + '" ';
    UtilesV20.Exec_Select_SQL(self.oFnd_Qry_Gen, cSql_Ln);

    if (self.oFnd_Qry_Gen.FieldByName('con_riesgo').AsInteger <= 0) then
      self.Add_Automatic_Riesgo(cCod_Cte, 'FP05', true)
    else
      self.Add_Automatic_Riesgo(cCod_Cte, 'FP05', false, self.oFnd_Qry_Gen.FieldByName('dist_prob').AsString, self.oFnd_Qry_Gen.FieldByName('dist_impa').AsString);
  end;

  // -------------------------------------------------------------------------------------------//

  if ((self.ock_pep_sujeto.Checked = false) and (self.ock_pep_relacion.Checked = false)) then
    self.Add_Automatic_Riesgo(cCod_Cte, 'FI04', true)
  else
    self.Add_Automatic_Riesgo(cCod_Cte, 'FI04', false);

  if (bCte_InfoL = true) then
  begin
    // ------------------VALIDA ACTIVIDAD ECONOMICA/RIESGO------------------------------------------//
    cStr_Val := trim(dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('id_tipo_empleado').AsString);
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'SELECT ';
    cSql_Ln := cSql_Ln + '  tipem_id, tipem_prob, tipem_impa, (tipem_prob+tipem_impa) AS con_riesgo ';
    cSql_Ln := cSql_Ln + 'FROM mant_tipos_empleados ';
    cSql_Ln := cSql_Ln + 'WHERE tipem_id="' + cStr_Val + '" ';
    UtilesV20.Exec_Select_SQL(self.oFnd_Qry_Gen, cSql_Ln);

    if (self.oFnd_Qry_Gen.FieldByName('con_riesgo').AsInteger <= 0) then
      self.Add_Automatic_Riesgo(cCod_Cte, 'ELA01', true)
    else
      self.Add_Automatic_Riesgo(cCod_Cte, 'ELA01', false, self.oFnd_Qry_Gen.FieldByName('tipem_prob').AsString, self.oFnd_Qry_Gen.FieldByName('tipem_impa').AsString);
  end;
  // -------------------------------------------------------------------------------------------//

end;

procedure TfGen_Mant_Cte2.Muestra_Cte_Impacto(bRecall: boolean = false);
var
  cSql_Ln: string;
  cCte_Imp_Ran: string;
  cCte_Imp_Des: string;
begin

  cCte_Imp_Ran := trim(self.otClientes_v2.FieldByName('nivel_riesgo').AsString);
  if (trim(cCte_Imp_Ran) = '') then
    cCte_Imp_Ran := '0';

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT ';
  cSql_Ln := cSql_Ln + '  riez_descripcion ';
  cSql_Ln := cSql_Ln + 'FROM mant_nivel_riezgo ';
  cSql_Ln := cSql_Ln + 'WHERE ' + cCte_Imp_Ran + ' BETWEEN riez_nivel_ini AND riez_nivel_fin';
  cCte_Imp_Des := UtilesV20.Execute_SQL_Result(cSql_Ln);
  // self.oNivel_Impacto.Caption := 'NIVEL DE RIESGO DEL CLIENTE/ASOCIADO: ->[' + uppercase(cCte_Imp_Des) + ']';
  // self.oNivel_Impacto.Refresh;
end;

function TfGen_Mant_Cte2.Valida_Info_Jur(): boolean;
begin
  if ((self.iTipPer = 0) or (self.iTipPer = 1)) then
  begin
    // Si es persona jurídica sale, no hace nada.
    result := true;
    exit;
  end;
  result := true;

  if (trim(self.oid_cliente_j.Text) = '') then
  begin
    MessageDlg('No es posible guardar sin colocar antes el CODIGO del cliente.', mtConfirmation, [mbOk], 0);
    self.AdvSmoothTabPager1.ActivePage := self.oTab_Gen_Jur;
    self.oid_cliente_j.SetFocus;
    result := false;
    exit;
  end;

  if (trim(self.onombre_legal.Text) = '') then
  begin
    MessageDlg('No es posible guardar sin colocar antes el NOMBRE LEGAL de la empresa.', mtConfirmation, [mbOk], 0);
    self.AdvSmoothTabPager1.ActivePage := self.oTab_Gen_Jur;
    self.onombre_legal.SetFocus;
    result := false;
    exit;
  end;

  if (trim(self.onombre_comercial.Text) = '') then
  begin
    MessageDlg('No es posible guardar sin colocar antes el NOMBRE COMERCIAL de la empresa.', mtConfirmation, [mbOk], 0);
    self.AdvSmoothTabPager1.ActivePage := self.oTab_Gen_Jur;
    self.onombre_comercial.SetFocus;
    result := false;
    exit;
  end;

  if (trim(self.onip2.Text) = '') then
  begin
    MessageDlg('No es posible guardar sin colocar antes el RUC de la empresa.', mtConfirmation, [mbOk], 0);
    self.AdvSmoothTabPager1.ActivePage := self.oTab_Gen_Jur;
    self.onip2.SetFocus;
    result := false;
    exit;
  end;

  if ((self.oid_pais_constitucion.KeyValue = 0) OR (self.oid_pais_constitucion.KeyValue = null)) then
  begin
    MessageDlg('No es posible guardar sin colocar antes EL PASI DE CONSTITUCION de la empresa.', mtConfirmation, [mbOk], 0);
    self.AdvSmoothTabPager1.ActivePage := self.oTab_Gen_Jur;
    self.oid_pais_constitucion.SetFocus;
    result := false;
    exit;
  end;

  if ((self.oLst_id_clasificasionJ.KeyValue = 0) OR (self.oLst_id_clasificasionJ.KeyValue = null)) then
  begin
    MessageDlg('No es posible guardar sin colocar antes el TIPO DE RELACION', mtConfirmation, [mbOk], 0);
    self.AdvSmoothTabPager1.ActivePage := self.oTab_Gen_Jur;
    self.oLst_id_clasificasionJ.SetFocus;
    result := false;
    exit;
  end;

  if ((self.oid_actividad_economica_e.KeyValue = 0) OR (self.oid_actividad_economica_e.KeyValue = null)) then
  begin
    MessageDlg('No es posible guardar sin colocar antes INDICAR LA ACTIVIDAD ECONOMICA de la empresa.', mtConfirmation, [mbOk], 0);
    self.AdvSmoothTabPager1.ActivePage := self.oTab_Gen_Jur;
    self.oid_actividad_economica_e.SetFocus;
    result := false;
    exit;
  end;
end;

function TfGen_Mant_Cte2.Valida_Info_Nat(): boolean;
var
  cConv: string;
begin
  if ((self.iTipPer = 0) or (self.iTipPer = 2)) then
  begin
    // Si es persona jurídica sale, no hace nada.
    result := true;
    exit;
  end;

  result := true;

  if (trim(self.oid_cliente_n.Text) = '') then
  begin
    MessageDlg('No es posible guardar sin colocar antes el CODIGO del cliente', mtConfirmation, [mbOk], 0);
    self.AdvSmoothTabPager1.ActivePage := self.oTab_Gen_Nat;
    self.oid_cliente_n.SetFocus;
    result := false;
    exit;
  end;

  if (trim(self.onombre_primero.Text) = '') then
  begin
    MessageDlg('No es posible guardar sin colocar antes el NOMBRE del cliente', mtConfirmation, [mbOk], 0);
    self.AdvSmoothTabPager1.ActivePage := self.oTab_Gen_Nat;
    self.onombre_primero.SetFocus;
    result := false;
    exit;
  end;

  if (trim(self.oapellido_paterno.Text) = '') then
  begin
    MessageDlg('No es posible guardar sin colocar antes el APELLIDO del cliente', mtConfirmation, [mbOk], 0);
    self.AdvSmoothTabPager1.ActivePage := self.oTab_Gen_Nat;
    self.oapellido_paterno.SetFocus;
    result := false;
    exit;
  end;

  if (self.ogenero.Value = '') Then
  begin
    MessageDlg('No es posible guardar sin colocar antes EL GENERO DE LA PERSONA.', mtConfirmation, [mbOk], 0);
    self.AdvSmoothTabPager1.ActivePage := self.oTab_Gen_Nat;
    self.ogenero.SetFocus;
    result := false;
    exit;
  end;

  cConv := trim(ReplaceStr(self.onip.Text, '-', ''));
  if (trim(cConv) = '') then
  begin
    MessageDlg('No es posible guardar sin colocar antes la IDENTIFICASION del cliente', mtConfirmation, [mbOk], 0);
    self.AdvSmoothTabPager1.ActivePage := self.oTab_Gen_Nat;
    self.onip.SetFocus;
    result := false;
    exit;
  end;

  if ((self.opais_nacimiento.KeyValue = 0) OR (self.opais_nacimiento.KeyValue = null)) then
  begin
    MessageDlg('No es posible guardar sin colocar antes la ACTIVIDAD ECONOMICA del cliente', mtConfirmation, [mbOk], 0);
    self.AdvSmoothTabPager1.ActivePage := self.oTab_Gen_Nat;
    self.opais_nacimiento.SetFocus;
    result := false;
    exit;
  end;

  if ((self.oLst_id_clasificasionN.KeyValue = 0) OR (self.oLst_id_clasificasionN.KeyValue = null)) then
  begin
    MessageDlg('No es posible guardar sin colocar antes el TIPO DE RELACION', mtConfirmation, [mbOk], 0);
    self.AdvSmoothTabPager1.ActivePage := self.oTab_Gen_Nat;
    self.oLst_id_clasificasionN.SetFocus;
    result := false;
    exit;
  end;

  if ((self.opais_recidencia.KeyValue = 0) OR (self.opais_recidencia.KeyValue = null)) then
  begin
    MessageDlg('No es posible guardar sin colocar antes el PAIS DE RECIDENCIA FISCAL del cliente', mtConfirmation, [mbOk], 0);
    self.AdvSmoothTabPager1.ActivePage := self.oTab_Gen_Nat;
    self.AdvSmoothTabPager2.ActivePage := self.oTab_Cte_Res;
    self.opais_recidencia.SetFocus;
    result := false;
    exit;
  end;

  if ((self.oprov_residencia.KeyValue = 0) OR (self.oprov_residencia.KeyValue = null)) then
  begin
    MessageDlg('No es posible guardar sin colocar antes el PROVINCIA DE RESIDENCIA del cliente', mtConfirmation, [mbOk], 0);
    self.AdvSmoothTabPager1.ActivePage := self.oTab_Gen_Nat;
    self.AdvSmoothTabPager2.ActivePage := self.oTab_Cte_Res;
    self.oprov_residencia.SetFocus;
    result := false;
    exit;
  end;

  if ((self.odist_residencia.KeyValue = 0) OR (self.odist_residencia.KeyValue = null)) then
  begin
    MessageDlg('No es posible guardar sin colocar antes el DISTRITO DE RESIDENCIA del cliente', mtConfirmation, [mbOk], 0);
    self.AdvSmoothTabPager1.ActivePage := self.oTab_Gen_Nat;
    self.AdvSmoothTabPager2.ActivePage := self.oTab_Cte_Res;
    self.odist_residencia.SetFocus;
    result := false;
    exit;
  end;

end;

procedure TfGen_Mant_Cte2.Buscar_Sec_Cte(bSave: boolean = false);
var
  cNext: string;
begin
  if (self.otClientes_v2.State in [dsInsert]) then
  begin
    if (bSave = true) then
    begin
      UtilesV20.Execute_SQL_Command('UPDATE mant_secuenc_docs SET num_cte=IFNULL(num_cte,0)+1 WHERE 1=1');
    end;
    cNext := fUtilesV20.query_selectgen_result('SELECT IFNULL(num_cte,0)+1 AS num_cte FROM mant_secuenc_docs LIMIT 1');

    self.oid_cliente_n.ReadOnly := true;
    self.otClientes_v2.FieldByName('id_cliente').AsString := trim(cNext);
  end;
end;

procedure TfGen_Mant_Cte2.Add_Automatic_Riesgo(pCod_Cte: string; pCod_Riesgo: string; bDelete: boolean = false; pProd: string = '0'; pImpa: string = '0');
var
  cSql_Ln: string;
begin
  if (bDelete = true) then
  begin
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'DELETE ';
    cSql_Ln := cSql_Ln + 'FROM cliente_factores_riesgo ';
    cSql_Ln := cSql_Ln + 'WHERE ( (id_cliente="' + trim(self.cTmp_Sec) + '") OR (id_cliente="' + pCod_Cte + '")) ';
    cSql_Ln := cSql_Ln + 'AND   (codigo_factores_riesgo="' + trim(pCod_Riesgo) + '")';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end
  else
  begin
    if (((trim(pProd) = '') or (trim(pProd) = '0')) and ((trim(pImpa) = '') or (trim(pImpa) = '0'))) then
    begin
      pProd := UtilesV20.Execute_SQL_Result('SELECT prob_ponderacion FROM mant_factores_riesgos_v2 WHERE codigo="' + trim(pCod_Riesgo) + '"');
      pImpa := UtilesV20.Execute_SQL_Result('SELECT impa_ponderacion FROM mant_factores_riesgos_v2 WHERE codigo="' + trim(pCod_Riesgo) + '"');
    end;

    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'INSERT INTO cliente_factores_riesgo ';
    cSql_Ln := cSql_Ln +
      '	(id_cliente	,codigo_factores_riesgo	,ultima_fecha_actualizacion	,ultimo_usuario_que_actualizo	, factor_check, prob_ponderacion,impa_ponderacion ) VALUES ';
    cSql_Ln := cSql_Ln + '	("' + pCod_Cte + '","' + trim(pCod_Riesgo) + '", NOW(),"' + trim(IntToStr(UtilesV20.iUserID)) + '",0,"' + pProd + '","' + pImpa + '") ';
    cSql_Ln := cSql_Ln + 'ON DUPLICATE KEY UPDATE ';
    cSql_Ln := cSql_Ln + '	prob_ponderacion=values(prob_ponderacion),';
    cSql_Ln := cSql_Ln + '	impa_ponderacion=values(prob_ponderacion),';
    cSql_Ln := cSql_Ln + '	ultimo_usuario_que_actualizo="' + trim(IntToStr(UtilesV20.iUserID)) + '", ';
    cSql_Ln := cSql_Ln + '	ultima_fecha_actualizacion  =NOW() ';
    UtilesV20.Execute_SQL_Command(cSql_Ln);
  end;
end;

end.
