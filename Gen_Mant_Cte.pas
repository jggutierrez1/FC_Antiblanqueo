unit Gen_Mant_Cte;

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
  cxMaskEdit, cxDBEdit, inifiles, StrUtils, ShellApi, Vcl.Menus, System.RegularExpressions, Vcl.ComCtrls,
  System.TypInfo, Xml.XMLSchema, Soap.WSDLPub, HtmlGlobals,
  HTMLUn2, HtmlView, Soap.WebServExp, Soap.WSDLBind, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TfGen_Mant_Cte = class(TForm)
    ResizeKit1: TResizeKit;
    GridPanel1: TGridPanel;
    AdvSmoothTabPager1: TAdvSmoothTabPager;
    Tab_Gen: TAdvSmoothTabPage;
    Tab_Dep: TAdvSmoothTabPage;
    Tab_Res: TAdvSmoothTabPage;
    oTitulo: TLabel;
    Tab_Lab: TAdvSmoothTabPage;
    Tab_Tra: TAdvSmoothTabPage;
    Tab_Pat: TAdvSmoothTabPage;
    Tab_Ref: TAdvSmoothTabPage;
    AdvGroupBox1: TAdvGroupBox;
    Tab_Ult: TAdvSmoothTabPage;
    oGrid_Ultimos: TDBGridEh;
    oGrid_Dep: TDBGridEh;
    oBtn_Add_Dep: TPngBitBtn;
    oBtn_Del_Dep: TPngBitBtn;
    oBtn_Edit_Dep: TPngBitBtn;
    oFnd_Socio: TEdit;
    Label1: TLabel;
    AdvGroupBox4: TAdvGroupBox;
    Label33: TLabel;
    oId_provincia: TDBLookupComboboxEh;
    Label34: TLabel;
    oId_distrito: TDBLookupComboboxEh;
    Label35: TLabel;
    oId_corregimiento: TDBLookupComboboxEh;
    Label36: TLabel;
    oSector_avenida: TDBEdit;
    Label37: TLabel;
    oBarrio: TDBEdit;
    Label38: TLabel;
    oCalle: TDBMemo;
    Label39: TLabel;
    oResidencia: TDBComboBoxEh;
    Label44: TLabel;
    Label40: TLabel;
    oNombre_edificio: TDBEdit;
    Label41: TLabel;
    oNumero_casa: TDBEdit;
    Label42: TLabel;
    oPunto_referencia: TDBMemo;
    Label43: TLabel;
    oTiempo_residir: TDBEdit;
    AdvGroupBox5: TAdvGroupBox;
    Label47: TLabel;
    Label48: TLabel;
    Label55: TLabel;
    oId_tipo_empleado: TDBLookupComboboxEh;
    oProfesion: TDBEdit;
    AdvGroupBox6: TAdvGroupBox;
    Label49: TLabel;
    oDireccion: TDBEdit;
    Label50: TLabel;
    oNombre_empresa: TDBEdit;
    oTipo_empresa_laboral: TDBComboBoxEh;
    Label51: TLabel;
    Label52: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    oId_tipo_vivienda: TDBLookupComboboxEh;
    Label53: TLabel;
    Label54: TLabel;
    Label56: TLabel;
    oExtension: TDBEdit;
    Label57: TLabel;
    oEmail_empresa: TDBEdit;
    Label58: TLabel;
    oNum_empleado: TDBEdit;
    Label59: TLabel;
    oSeccion: TDBEdit;
    Label60: TLabel;
    Label61: TLabel;
    oDigito_verificador: TDBEdit;
    Label62: TLabel;
    oId_estado_laboral: TDBLookupComboboxEh;
    oSalario_bruto: TDBNumberEditEh;
    Label63: TLabel;
    oFecha_ingresoLab: TDBDateTimeEditEh;
    Label64: TLabel;
    oId_tipo_planilla: TDBLookupComboboxEh;
    Label65: TLabel;
    Label66: TLabel;
    oSalario_neto: TDBNumberEditEh;
    oTelefonoLab: TDBEdit;
    oFaxLab: TDBEdit;
    oDepartamento: TDBEdit;
    oId_actividad_economica: TDBLookupComboboxEh;
    oEmpresa_actividad_economica: TDBLookupComboboxEh;
    oCargoLab: TDBEdit;
    oanos_servicio: TDBEdit;
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
    Tab_Eva: TAdvSmoothTabPage;
    oGrid_Rzg_Lst: TDBGridEh;
    Tab_Com: TAdvSmoothTabPage;
    Label32: TLabel;
    oComentarios: TDBMemo;
    Label72: TLabel;
    oGrid_Rzg_Cte: TDBGridEh;
    Label73: TLabel;
    oBtn_Rzg_Add: TPngBitBtn;
    oBtn_Rzg_Del: TPngBitBtn;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    AdvGroupBox7: TAdvGroupBox;
    oGrd_Ptran: TDBGridEh;
    oBtn_Add_PerT: TPngBitBtn;
    oBtn_Edit_PerT: TPngBitBtn;
    oBtn_Del_PerT: TPngBitBtn;
    AdvGroupBox8: TAdvGroupBox;
    oGrd_Pfin: TDBGridEh;
    oBtn_Add_PerF: TPngBitBtn;
    oBtn_Edit_PerF: TPngBitBtn;
    oBtn_Del_PerF: TPngBitBtn;
    AdvGroupBox9: TAdvGroupBox;
    oGrid_Patr: TDBGridEh;
    oBtn_Add_Patr: TPngBitBtn;
    oBtn_Edit_Patr: TPngBitBtn;
    oBtn_Del_Patr: TPngBitBtn;
    oGrp_Info_Nat: TAdvGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    oLst_id_cliente_tipo_ingreso: TDBComboBoxEh;
    oid_cliente: TDBEdit;
    oLst_Sec: TDBComboBoxEh;
    oNombre: TDBEdit;
    oApellido: TDBEdit;
    oApe_casada: TDBEdit;
    oLst_Genero: TDBComboBoxEh;
    oidentificacion: TcxDBMaskEdit;
    oVencimiento_cedula: TDBDateTimeEditEh;
    oLst_id_estado_civil: TDBComboBoxEh;
    oSeguro_social: TDBEdit;
    oseguro_vida: TDBCheckBox;
    oTipo_sangre: TDBEdit;
    oFecha_nacimiento: TDBDateTimeEditEh;
    oLst_id_pais: TDBLookupComboboxEh;
    oId_res_fiscal: TDBLookupComboboxEh;
    oTelefono: TDBEdit;
    oCelular: TDBEdit;
    oEmail: TDBEdit;
    oApartado_postal: TDBEdit;
    onumero_cuenta_banco: TDBEdit;
    AdvSmoothTabPager2: TAdvSmoothTabPager;
    oTab_Conj: TAdvSmoothTabPage;
    oGrp_Conj: TAdvGroupBox;
    Label28: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    oNombre_conyuge: TDBEdit;
    oCedula_conyuge: TDBEdit;
    oTelefono_conyuge: TDBEdit;
    oLugar_trabajo_conyuge: TDBEdit;
    oSalario_conyuge: TDBNumberEditEh;
    oTab_FACTA: TAdvSmoothTabPage;
    oGrp_Facta: TAdvGroupBox;
    Label22: TLabel;
    oCiudadano_americano: TDBCheckBox;
    oViaja_frecuente: TDBCheckBox;
    oDoble_nacional: TDBCheckBox;
    onacio_eeuu: TDBCheckBox;
    opasaporte_eeuu: TDBCheckBox;
    otarjeta_eeuu: TDBCheckBox;
    oreside_eeuu: TDBCheckBox;
    ootra_nacionalidad: TDBCheckBox;
    oNacionalidad: TDBEdit;
    Label5: TLabel;
    oLst_tipo_persona: TDBComboBoxEh;
    oTab_COOPE: TAdvSmoothTabPage;
    oGrp_Coop: TAdvGroupBox;
    Label2: TLabel;
    ofecha_ingreso_cooperativa: TDBDateTimeEditEh;
    Label3: TLabel;
    ofecha_reingreso: TDBDateTimeEditEh;
    Label4: TLabel;
    oLst_id_tipo_recomendacion: TDBComboBoxEh;
    oDirectivo: TDBCheckBox;
    oCargo_directivo: TDBEdit;
    Label17: TLabel;
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
    AdvGroupBox2: TAdvGroupBox;
    DBGridEh1: TDBGridEh;
    oBtn_Add_Desc: TPngBitBtn;
    oBtn_Edit_Desc: TPngBitBtn;
    oBtn_Del_Desc: TPngBitBtn;
    Label100: TLabel;
    Label67: TLabel;
    oLst_categoria_cliente: TDBLookupComboboxEh;
    oFnd_Qry_Gen: TFDQuery;
    AdvSmoothTabPage1: TAdvSmoothTabPage;
    AdvGroupBox3: TAdvGroupBox;
    Label68: TLabel;
    Label69: TLabel;
    Label77: TLabel;
    opep_cargo: TDBEdit;
    opep_relacion_cargo: TDBEdit;
    ock_pep_sujeto: TDBCheckBox;
    Label81: TLabel;
    opep_fecha_fin: TDBDateTimeEditEh;
    ock_pep_relacion: TDBCheckBox;
    opep_relacion_tipo: TDBComboBoxEh;
    Label78: TLabel;
    Label79: TLabel;
    oBtn_ChekList: TPngBitBtn;
    oBtn_MatrizR: TPngBitBtn;
    Label80: TLabel;
    procedure oBtnExitClick(Sender: TObject);
    procedure oBtnFindClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure oGrid_UltimosTitleClick(Column: TColumnEh);
    procedure AssgnTabs;
    procedure Enabled_Screen(bFlag: boolean);
    procedure EnterAsTab(Sender: TObject; var Key: Char);
    procedure oBtn_Add_DepClick(Sender: TObject);
    procedure oBtn_Edit_DepClick(Sender: TObject);
    procedure oBtn_Del_DepClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure oBtnNewClick(Sender: TObject);
    procedure Action_Control(pOption: integer);
    procedure oBtnEditClick(Sender: TObject);
    procedure oBtnDeleteClick(Sender: TObject);
    procedure oBtnAbortClick(Sender: TObject);
    procedure oBtnSaveClick(Sender: TObject);
    function Select_dbf(cSql_Ln: string; bExecute: boolean = false): string;
    procedure oGrid_UltimosDblClick(Sender: TObject);
    procedure oFnd_SocioKeyPress(Sender: TObject; var Key: Char);
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
    procedure oBtn_Add_PatrClick(Sender: TObject);
    procedure oBtn_Edit_PatrClick(Sender: TObject);
    procedure oBtn_Del_PatrClick(Sender: TObject);
    procedure oBtn_Add_PerFClick(Sender: TObject);
    procedure oBtn_Edit_PerFClick(Sender: TObject);
    procedure oBtn_Del_PerFClick(Sender: TObject);
    procedure oBtn_Add_PerTClick(Sender: TObject);
    procedure oBtn_Edit_PerTClick(Sender: TObject);
    procedure oBtn_Del_PerTClick(Sender: TObject);
    procedure oDBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
    procedure Asingar_Cod_Cte();
    procedure oBtn_Del_RefGClick(Sender: TObject);
    procedure oBtn_Del_RefBClick(Sender: TObject);
    procedure oBtn_Add_RefBClick(Sender: TObject);
    procedure oBtn_Edit_RefBClick(Sender: TObject);
    procedure oBtnPrintClick(Sender: TObject);
    procedure oLst_SecCloseUp(Sender: TObject; Accept: boolean);
    procedure Buscar_Sec_Dbf(bSave: boolean = false);
    procedure Cte_Borra_Tmp_Asig(cCod_Cte: string);
    procedure Cte_Limpia_Tmp_Asig(cCod_Cte: string);
    procedure oBtn_Rzg_DelClick(Sender: TObject);
    procedure oBtn_Rzg_AddClick(Sender: TObject);
    procedure oBtn_Add_RefGClick(Sender: TObject);
    procedure oBtn_Edit_RefGClick(Sender: TObject);
    procedure Sw_Interfaces;
    procedure Sw_Interfaces_e;
    procedure oLst_tipo_personaCloseUp(Sender: TObject; Accept: boolean);
    procedure otipo_persona_eCloseUp(Sender: TObject; Accept: boolean);
    procedure Borra_Inf_Cliente(cCod_Cte: string);
    procedure NewCte_CodUpdate(cCod_Tmp: string; cCod_Fin: string);
    procedure Actualiza_Riezgo_Fijo(cCod_Cte: string);
    procedure oid_clienteExit(Sender: TObject);
    procedure Valid_oLst_Sec();
    procedure ONU1Click(Sender: TObject);
    procedure OFAC1Click(Sender: TObject);
    procedure OC1Click(Sender: TObject);
    procedure OSFI1Click(Sender: TObject);
    procedure BUSCADORUK1Click(Sender: TObject);
    procedure BUSCADORUAF1Click(Sender: TObject);
    procedure BUSCADORMP1Click(Sender: TObject);
    procedure BUSCADORAPC1Click(Sender: TObject);
    procedure oidentificacionExit(Sender: TObject);
    procedure oBtn_Add_DescClick(Sender: TObject);
    procedure oBtn_Edit_DescClick(Sender: TObject);
    procedure oBtn_Del_DescClick(Sender: TObject);
    procedure Muestra_Cte_Riesgo(bRecall: boolean = false);
    procedure Add_Automatic_Riesgo(pCod_Cte: string; pCod_Riesgo: string; bDelete: boolean = false; pProd: string = '0'; pImpa: string = '0');
    procedure ock_pep_sujetoClick(Sender: TObject);
    procedure ock_pep_relacionClick(Sender: TObject);
    procedure oBtn_ChekListClick(Sender: TObject);
    procedure oBtn_MatrizRClick(Sender: TObject);
  private
    oINI: TINIFile;
    cIni_File, cIni_Path: string;
    cNom_Modulo: string;
    iTipoSecCte: integer;
    cId_Empresa: string;
    iShow_Ult_Cng: integer;
    iShow_Per_Jur: integer;
    iOption: integer;
    cTmp_Sec: String;
    cCte_Sel: String;
    cCte_Fnd: String;
    { Private declarations }
  public
    { Public declarations }
    pCod_Cte: string;
  end;

var
  fGen_Mant_Cte: TfGen_Mant_Cte;

implementation

uses UtilesV20, Gen_Data_Mod, Gen_Add_Depend, Gen_Add_Activos, BuscarGenM2,
  Gen_Add_PerF, Gen_Add_PerT, Gen_Add_RefB, Gen_Scrn_Prn, Gen_Add_RefG,
  Gen_Add_Desc, Gen_MantC_ChL, Show_Matriz_Cte;
{$R *.dfm}

procedure TfGen_Mant_Cte.oGrid_UltimosDblClick(Sender: TObject);
begin
  if dmGen_Data_Mod.oQry_Ultimos.RecordCount <= 0 then
    exit;

  if dmGen_Data_Mod.oQry_Ultimos.FieldByName('id_cliente').IsNull then
    exit;

  dmGen_Data_Mod.otClientes.Locate('id_cliente', dmGen_Data_Mod.oQry_Ultimos.FieldByName('id_cliente').AsString, []);

  self.Show_Data_Refresh();
end;

procedure TfGen_Mant_Cte.oGrid_UltimosTitleClick(Column: TColumnEh);
{$J+}
const
  PreviousColumnIndex: integer = 1;
{$J-}
begin
  try
    oGrid_Ultimos.Columns[PreviousColumnIndex].title.Font.Style := oGrid_Ultimos.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
  except
  end;

  Column.title.Font.Style := Column.title.Font.Style + [fsBold];
  PreviousColumnIndex := Column.Index;

  if (Pos(Column.Field.FieldName, dmGen_Data_Mod.oQry_Ultimos.IndexFieldNames) = 1) and (Pos(' DESC', uppercase(dmGen_Data_Mod.oQry_Ultimos.IndexFieldNames)) = 0) then
    dmGen_Data_Mod.oQry_Ultimos.IndexFieldNames := Column.Field.FieldName + ':D'
  else
    dmGen_Data_Mod.oQry_Ultimos.IndexFieldNames := Column.Field.FieldName + ':A';

  dmGen_Data_Mod.oQry_Ultimos.First;
end;

procedure TfGen_Mant_Cte.oidentificacionExit(Sender: TObject);
VAR
  cSql_Ln, cResult, cValue: STRING;
  iResult: integer;
  oQry_Fnd_Ced: TFDQuery;
begin

  if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsInsert]) then
    self.oidentificacion.Text := trim(self.oidentificacion.Text);

  if (dmGen_Data_Mod.otClientes.State in [dsInsert]) then
  begin
    oQry_Fnd_Ced := TFDQuery.Create(self);
    oQry_Fnd_Ced.Connection := fUtilesV20.oPublicCnn;

    cSql_Ln := 'SELECT id_cliente, COUNT(id_cliente) AS cnt_regs FROM clientes WHERE (identificacion="' + trim(self.oidentificacion.Text) + '") LIMIT 1';
    UtilesV20.Execute_SQL_Query(oQry_Fnd_Ced, cSql_Ln);

    if (oQry_Fnd_Ced.RecordCount <= 0) then
    begin
      self.oid_cliente.SetFocus;
      freeandnil(oQry_Fnd_Ced);
      exit;
    end;

    if (oQry_Fnd_Ced.FieldByName('id_cliente').IsNull or (oQry_Fnd_Ced.FieldByName('cnt_regs').AsInteger = 0)) then
    begin
      self.oid_cliente.SetFocus;
    end
    else
    begin
      iResult := MessageDlg('EL NUMERO DE IDENTIFICASION REGISTRADA, YA EXISTE!!!' + #13 + 'DESEA MOSTRAR LA INFORMACION CORRESPONDIENTE?', mtConfirmation, [mbYes, mbNo], 0);
      if (iResult = mrYes) then
      begin
        cValue := trim(oQry_Fnd_Ced.FieldByName('id_cliente').AsString);

        if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
          dmGen_Data_Mod.otClientes.cancel;

        if (dmGen_Data_Mod.oQry_Cte_Resid.State in [dsInsert, dsEdit]) then
          dmGen_Data_Mod.oQry_Cte_Resid.cancel;

        if (dmGen_Data_Mod.oQry_Cte_InfL.State in [dsInsert, dsEdit]) then
          dmGen_Data_Mod.oQry_Cte_InfL.cancel;

        self.cCte_Fnd := cValue;
        self.cCte_Sel := trim(self.cCte_Fnd);

        self.oBtnAbortClick(self);
      end
      else
      begin
        self.oid_cliente.SetFocus;
      end;
    end;
    freeandnil(oQry_Fnd_Ced);
  end;
end;

procedure TfGen_Mant_Cte.oid_clienteExit(Sender: TObject);
var
  cSql_Ln, cResult, cValue: string;
  iResult: integer;
begin
  if (dmGen_Data_Mod.otClientes.State in [dsInsert]) then
  begin
    cSql_Ln := 'SELECT COUNT(id_cliente) AS cnt_regs FROM clientes WHERE id_cliente="' + trim(self.oid_cliente.Text) + '" LIMIT 1';
    cResult := UtilesV20.Execute_SQL_Result(cSql_Ln);
    if (trim(cResult) = '') then
      cResult := '0';
    if (StrToInt(cResult) > 0) then
    begin
      iResult := MessageDlg('LA SECUENCIA DIGITADA, YA EXISTE.' + #13 + 'DESEA MOSTRAR LA INFORMACION CORRESPONDIENTE?', mtConfirmation, [mbYes, mbNo], 0);
      if (iResult = mrYes) then
      begin
        cValue := trim(self.oid_cliente.Text);

        if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
          dmGen_Data_Mod.otClientes.cancel;

        if (dmGen_Data_Mod.oQry_Cte_Resid.State in [dsInsert, dsEdit]) then
          dmGen_Data_Mod.oQry_Cte_Resid.cancel;

        if (dmGen_Data_Mod.oQry_Cte_InfL.State in [dsInsert, dsEdit]) then
          dmGen_Data_Mod.oQry_Cte_InfL.cancel;

        self.cCte_Fnd := cValue;
        self.cCte_Sel := self.cCte_Fnd;
        self.oBtnAbortClick(self);
      end
      else
      begin
        self.Buscar_Sec_Dbf(true);
        self.Buscar_Sec_Dbf();
        self.oid_cliente.SetFocus;
        exit;
      end;

      self.cCte_Sel := trim(self.oid_cliente.Text);
    end;

    if (self.oLst_Sec.Value = 3) then
    begin
      if (trim(self.oid_cliente.Text) <> '') then
        self.oid_cliente.Text := fUtilesV20.PadL(trim(self.oid_cliente.Text), 5, '0');
    end;

  end;
end;

procedure TfGen_Mant_Cte.oLst_SecCloseUp(Sender: TObject; Accept: boolean);
begin
  self.Valid_oLst_Sec();
  if (self.oLst_Sec.Value = 3) then
  begin
    self.oid_cliente.ReadOnly := false;
    dmGen_Data_Mod.otClientes.FieldByName('id_cliente').AsString := '';
  end
  else
    self.oid_cliente.ReadOnly := true;

  self.oid_cliente.SetFocus;
end;

procedure TfGen_Mant_Cte.oLst_tipo_personaCloseUp(Sender: TObject; Accept: boolean);
begin
  if ((self.oLst_tipo_persona.Value <> 0) or (self.oLst_tipo_persona.Value <> null)) then
    self.Sw_Interfaces();
end;

procedure TfGen_Mant_Cte.ONU1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://scsanctions.un.org/search/', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Mant_Cte.OSFI1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.osfi-bsif.gc.ca/Eng/fi-if/amlc-clrpc/atf-fat/Pages/default.aspx', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Mant_Cte.oBtn_Rzg_AddClick(Sender: TObject);
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

procedure TfGen_Mant_Cte.oBtn_Rzg_DelClick(Sender: TObject);
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

procedure TfGen_Mant_Cte.OC1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.opencorporates.com/', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Mant_Cte.oBtn_Del_RefBClick(Sender: TObject);
var
  nResp: integer;
  cSql_Ln: string;
  cTmp_Cte: string;
begin
  cTmp_Cte := dmGen_Data_Mod.oQry_Cte_RefB.FieldByName('id_cliente').AsString;
  if (trim(cTmp_Cte) <> '') then
  begin
    nResp := MessageDlg('Seguro que desea eliminar el activo seleccionado?', mtConfirmation, [mbYes, mbNo], 0);
    If (nResp = mrYes) Then
    begin
      cSql_Ln := '';
      cSql_Ln := cSql_Ln + 'DELETE FROM cliente_referencias_bancarias ';
      cSql_Ln := cSql_Ln + 'WHERE ((id_cliente="' + trim(cTmp_Cte) + '") or (id_cliente="' + self.cTmp_Sec + '")) ';
      cSql_Ln := cSql_Ln + 'AND   (id_cliente_referencias_bancarias ="' + trim(dmGen_Data_Mod.oQry_Cte_RefB.FieldByName('id_cliente_referencias_bancarias').AsString) + '") ';
      UtilesV20.Execute_SQL_Command(cSql_Ln);

      if (dmGen_Data_Mod.otClientes.State in [dsInsert]) then
        self.Fnd_Cte_RefeB()
      ELSE
        dmGen_Data_Mod.oQry_Cte_RefB.Refresh;
    end;
  end;
end;

procedure TfGen_Mant_Cte.oBtn_Add_PatrClick(Sender: TObject);
begin
  if (trim(self.cCte_Sel) = '') then
  begin
    MessageDlg('Debe ingresar el codigo de cliente para poder crear los activos?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  if (trim(self.oNombre.Text) = '') then
  begin
    MessageDlg('Seguro ingresar el nombre del socio/ahorrista/prospecto para poder crear activos?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  Application.CreateForm(TfGen_Add_Activos, fGen_Add_Activos);
  fGen_Add_Activos.iOption := 1;
  fGen_Add_Activos.cCte_Id := trim(self.cCte_Sel);
  fGen_Add_Activos.cTmp_Id := trim(self.cTmp_Sec);
  fGen_Add_Activos.cReg_Id := 'ABC-123';
  fGen_Add_Activos.ShowModal;
  freeandnil(fGen_Add_Activos);

  if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
    self.Fnd_Cte_OrigF()
  ELSE
    dmGen_Data_Mod.oQry_Cte_OFon.Refresh;
end;

procedure TfGen_Mant_Cte.oBtn_Add_PerFClick(Sender: TObject);
begin
  if (trim(self.cCte_Sel) = '') then
  begin
    MessageDlg('Debe ingresar el codigo de cliente para poder continuar con esta opción', mtConfirmation, [mbOk], 0);
    exit;
  end;

  if (trim(self.oNombre.Text) = '') then
  begin
    MessageDlg('Seguro ingresar el nombre del socio/ahorrista/prospecto para poder continuar con esta opción', mtConfirmation, [mbOk], 0);
    exit;
  end;

  Application.CreateForm(TfGen_Add_PerF, fGen_Add_PerF);
  fGen_Add_PerF.cCte_Id := trim(self.cCte_Sel);
  fGen_Add_PerF.cTmp_Id := trim(self.cTmp_Sec);
  fGen_Add_PerF.cReg_Id := 'ABC-123';
  fGen_Add_PerF.iOption := 1;
  fGen_Add_PerF.ShowModal;
  freeandnil(fGen_Add_PerF);

  if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
    self.Fnd_Cte_Finan()
  ELSE
    dmGen_Data_Mod.oQry_Cte_OIng.Refresh;
end;

procedure TfGen_Mant_Cte.oBtn_Add_PerTClick(Sender: TObject);
begin
  if (trim(self.cCte_Sel) = '') then
  begin
    MessageDlg('Debe ingresar el codigo de cliente para poder continuar en esta opción?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  if (trim(self.oNombre.Text) = '') then
  begin
    MessageDlg('Seguro ingresar el nombre del socio/ahorrista/prospecto para poder continuar en esta opción?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  Application.CreateForm(TfGen_Add_PerT, fGen_Add_PerT);
  fGen_Add_PerT.cCte_Id := trim(self.cCte_Sel);
  fGen_Add_PerT.cTmp_Id := trim(self.cTmp_Sec);
  fGen_Add_PerT.cReg_Id := 'ABC-123';
  fGen_Add_PerT.iOption := 1;
  fGen_Add_PerT.ShowModal;
  freeandnil(fGen_Add_PerT);

  if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
    self.Fnd_Cte_Trans()
  ELSE
    dmGen_Data_Mod.oQry_Cte_Tran.Refresh;
end;

procedure TfGen_Mant_Cte.oBtn_Add_RefBClick(Sender: TObject);
begin
  if (trim(self.cCte_Sel) = '') then
  begin
    MessageDlg('Debe ingresar el codigo de cliente para poder crear los activos?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  if (trim(self.oNombre.Text) = '') then
  begin
    MessageDlg('Seguro ingresar el nombre del socio/ahorrista/prospecto para poder crear activos?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  Application.CreateForm(TfGen_Add_RefB, fGen_Add_RefB);
  fGen_Add_RefB.iOption := 1;
  fGen_Add_RefB.cCte_Id := trim(self.cCte_Sel);
  fGen_Add_RefB.cTmp_Id := trim(self.cTmp_Sec);
  fGen_Add_RefB.cReg_Id := 'ABC-123';
  fGen_Add_RefB.ShowModal;
  freeandnil(fGen_Add_RefB);

  if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
    self.Fnd_Cte_RefeB()
  ELSE
    dmGen_Data_Mod.oQry_Cte_RefB.Refresh;
end;

procedure TfGen_Mant_Cte.oBtn_Add_RefGClick(Sender: TObject);
begin
  if (trim(self.cCte_Sel) = '') then
  begin
    MessageDlg('Debe ingresar el codigo de cliente para poder crear las referencias?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  if (trim(self.oNombre.Text) = '') then
  begin
    MessageDlg('Seguro ingresar el nombre del socio/ahorrista/prospecto para poder crear referencias?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  Application.CreateForm(TfGen_Add_RefG, fGen_Add_RefG);
  fGen_Add_RefG.iOption := 1;
  fGen_Add_RefG.cCte_Id := trim(self.cCte_Sel);
  fGen_Add_RefG.cTmp_Id := trim(self.cTmp_Sec);
  fGen_Add_RefG.cReg_Id := 'ABC-123';
  fGen_Add_RefG.ShowModal;
  freeandnil(fGen_Add_RefG);

  if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
    self.Fnd_Cte_Refe1()
  ELSE
    dmGen_Data_Mod.oQry_Cte_Ref1.Refresh;
end;

procedure TfGen_Mant_Cte.FormCreate(Sender: TObject);
var
  cDriverID, cDataSource: string;
begin
  self.pCod_Cte := '';
  self.cNom_Modulo := 'MANTENIMIENTO-CLIENTES';
  self.cCte_Fnd := '';
  self.iOption := 0;
  self.cCte_Sel := '';
  self.cTmp_Sec := fUtilesV20.RandomPassword(10);

  dmGen_Data_Mod.Open_All_DataGen();
  dmGen_Data_Mod.Open_All_DataQryRef();

  self.cIni_Path := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  self.cIni_File := self.cIni_Path + 'Data\Config.ini';

  self.oINI := TINIFile.Create(self.cIni_File);
  cDriverID := oINI.ReadString('ODBC_DBF', 'DRIVER_ID', 'ODBC');
  cDataSource := oINI.ReadString('ODBC_DBF', 'ODBC_NAME', 'COMPUCAS_DBF');
  self.iTipoSecCte := oINI.ReadInteger('GENERAL', 'SECUENCIA_DBF', 1);
  self.iShow_Ult_Cng := oINI.ReadInteger('GENERAL', 'MOSTRAR_TAB_ULT_CAMB', 0);
  self.iShow_Per_Jur := oINI.ReadInteger('GENERAL', 'MOSTRAR_PERSONA_JURI', 0);

  self.oINI.Free;

  fUtilesV20.WaitStart(self, 'COMPROVANDO CONEXION CON FORMUCOOP');
  fUtilesV20.WaitSetMsg('COMPROVANDO CONEXION CON FORMUCOOP');
  dmGen_Data_Mod.oDbf_Cnn.Params.clear;
  dmGen_Data_Mod.oDbf_Cnn.Params.Add('DriverID=' + cDriverID);
  dmGen_Data_Mod.oDbf_Cnn.Params.Add('DataSource=' + cDataSource);
  dmGen_Data_Mod.oDbf_Cnn.LoginPrompt := false;
  dmGen_Data_Mod.oDbf_Cnn.Open();
  dmGen_Data_Mod.oDbf_Qry.Connection := dmGen_Data_Mod.oDbf_Cnn;
  fUtilesV20.WaitEnd;
end;

procedure TfGen_Mant_Cte.FormShow(Sender: TObject);
begin
  dmGen_Data_Mod.oDbf_Cnn.Connected := false;

  self.StatusBar1.Panels[0].Text := 'Usuario: ' + UtilesV20.sUserName;
  self.StatusBar1.Panels[1].Text := 'Fecha: ' + formatDateTime('dd/mm/yyyy', now());
  self.StatusBar1.Panels[2].Text := 'Servidor: ' + fUtilesV20.oPublicCnn.Params.Values['Server'] + '/' + uppercase(fUtilesV20.oPublicCnn.Params.Values['Database']);
  self.StatusBar1.Panels[3].Text := 'Empresa: ' + UtilesV20.cDe_Empresa;

  self.AssgnTabs();

  if self.iShow_Per_Jur = 1 then
  begin
    self.oLst_tipo_persona.Items.clear;
    self.oLst_tipo_persona.Items.Add('Persona Natural');
    self.oLst_tipo_persona.Items.Add('Persona Jurídica');
    self.oLst_tipo_persona.KeyItems.clear;
    self.oLst_tipo_persona.KeyItems.Add('1');
    self.oLst_tipo_persona.KeyItems.Add('2');
  end
  else
  begin
    self.oLst_tipo_persona.Items.clear;
    self.oLst_tipo_persona.Items.Add('Persona Natural');
    self.oLst_tipo_persona.KeyItems.clear;
    self.oLst_tipo_persona.KeyItems.Add('1');
  end;

  dmGen_Data_Mod.oQry_Ultimos.Close;
  dmGen_Data_Mod.oQry_Ultimos.Filter := '';
  dmGen_Data_Mod.oQry_Ultimos.Filtered := false;
  if (self.iShow_Ult_Cng = 0) then
  begin
    dmGen_Data_Mod.oQry_Ultimos.Open;
    dmGen_Data_Mod.oD_Ultimos.DataSet := dmGen_Data_Mod.oQry_Ultimos;
  end;

  dmGen_Data_Mod.otClientes.Filter := '';
  dmGen_Data_Mod.otClientes.Filtered := false;
  dmGen_Data_Mod.otClientes.Open;
  dmGen_Data_Mod.oDClientes.DataSet := dmGen_Data_Mod.otClientes;

  if (trim(self.pCod_Cte) <> '') then
  begin
    dmGen_Data_Mod.otClientes.Locate('id_cliente', self.pCod_Cte, []);
  end;

  self.cCte_Sel := trim(dmGen_Data_Mod.otClientes.FieldByName('id_cliente').AsString);

  // self.Muestra_Cte_Riesgo();

  self.Show_Data_Refresh();
  self.oFnd_Socio.Text := '';
  self.Enabled_Screen(false);

  if (self.iShow_Ult_Cng = 0) then
    self.Tab_Ult.TabVisible := false
  else
    self.Tab_Ult.TabVisible := true;
  self.AdvSmoothTabPager1.Refresh;

  if (self.iShow_Ult_Cng = 1) then
    self.AdvSmoothTabPager1.ActivePageIndex := 0
  else
    self.AdvSmoothTabPager1.ActivePageIndex := 1;

  self.Sw_Interfaces();

  self.oidentificacion.Properties.EditMask := '';

  self.oFnd_Socio.Text := '';
  self.oFnd_Socio.SetFocus;
end;

procedure TfGen_Mant_Cte.oBtnAbortClick(Sender: TObject);
var
  ctCod_Cte: string;
begin
  if (dmGen_Data_Mod.oQry_Cte_Resid.State in [dsInsert, dsEdit]) then
    dmGen_Data_Mod.oQry_Cte_Resid.cancel;

  if (dmGen_Data_Mod.oQry_Cte_InfL.State in [dsInsert, dsEdit]) then
    dmGen_Data_Mod.oQry_Cte_InfL.cancel;

  ctCod_Cte := trim(dmGen_Data_Mod.otClientes.FieldByName('id_cliente').AsString);
  self.Cte_Borra_Tmp_Asig(ctCod_Cte);

  if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
    dmGen_Data_Mod.otClientes.cancel;

  self.cCte_Sel := trim(dmGen_Data_Mod.otClientes.FieldByName('id_cliente').AsString);

  self.Action_Control(7);
  self.Enabled_Screen(false);
  self.Tab_Ult.TabVisible := true;
  if (self.iShow_Ult_Cng = 1) then
    self.AdvSmoothTabPager1.ActivePageIndex := 0
  else
    self.AdvSmoothTabPager1.ActivePageIndex := 1;
  // self.Show_calc_fields();
  self.iOption := 0;

  if (trim(self.cCte_Fnd) <> '') then
  begin
    if (dmGen_Data_Mod.otClientes.RecordCount <= 0) then
      exit;

    dmGen_Data_Mod.otClientes.Locate('id_cliente', self.cCte_Fnd, []);
    dmGen_Data_Mod.otClientes.Refresh;
    self.cCte_Fnd := '';
  end;

  self.Show_Data_Refresh(true, false);
  // self.oidentificacion.Properties.EditMask := '';

  self.oid_cliente.ReadOnly := false;
  self.oLst_tipo_persona.ReadOnly := false;

  self.oLst_Sec.Visible := false;
  self.oFnd_Socio.Text := '';
  self.oFnd_Socio.SetFocus;
end;

procedure TfGen_Mant_Cte.oBtnDeleteClick(Sender: TObject);
var
  nResp: integer;
  cSql_Ln: string;
begin
  if dmGen_Data_Mod.otClientes.isEmpty then
  begin
    self.Action_Control(6);
    exit;
  end;
  self.iOption := 3;
  self.cCte_Sel := trim(dmGen_Data_Mod.otClientes.FieldByName('id_cliente').AsString);
  self.cId_Empresa := IntToStr(UtilesV20.iId_Empresa);
  self.Action_Control(3);
  nResp := MessageDlg('Seguro que desea borrar eliminar el cliente alctual?.' + #13 + 'SE BORRARAN TODOS LOS DATOS DEL CLIENTE, INFORMACION ADICIONAL.' + #13 +
    '¿ESTA ESTA SEGUTO QUE DESEA CONTINUAR?', mtConfirmation, [mbYes, mbNo], 0);
  If (nResp = mrYes) Then
  begin
    self.Borra_Inf_Cliente(self.oid_cliente.Text);
    dmGen_Data_Mod.otClientes.Refresh;
  end;
  self.iOption := 0;

end;

procedure TfGen_Mant_Cte.oBtnEditClick(Sender: TObject);
begin
  if dmGen_Data_Mod.otClientes.isEmpty then
  begin
    self.Action_Control(6);
    exit;
  end;
  self.iOption := 2;
  self.cCte_Sel := trim(dmGen_Data_Mod.otClientes.FieldByName('id_cliente').AsString);
  self.cId_Empresa := IntToStr(UtilesV20.iId_Empresa);
  self.AdvSmoothTabPager1.ActivePageIndex := 1;
  self.Tab_Ult.TabVisible := false;
  dmGen_Data_Mod.otClientes.Edit;
  self.oTitulo.Caption := 'Maestro de Clientes: ' + uppercase(dmGen_Data_Mod.otClientes.FieldByName('nombre').AsString) + ' ' +
    uppercase(dmGen_Data_Mod.otClientes.FieldByName('apellido').AsString);

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

  self.Action_Control(2);
  self.Enabled_Screen(true);

  // self.oidentificacion.Properties.EditMask := 'AA-AA-9999-99999';

  self.ock_pep_relacionClick(self);
  self.ock_pep_sujetoClick(self);

  self.oid_cliente.ReadOnly := true;
  self.oLst_tipo_persona.ReadOnly := true;
end;

procedure TfGen_Mant_Cte.oBtnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfGen_Mant_Cte.oBtnFindClick(Sender: TObject);
var
  cSql_Cmd: string;
begin
  self.cId_Empresa := IntToStr(UtilesV20.iId_Empresa);
  /// self.Action_Control(4);

  cSql_Cmd := cSql_Cmd + 'SELECT ';
  cSql_Cmd := cSql_Cmd + '  id_cliente, ';
  cSql_Cmd := cSql_Cmd + '  UCASE(nombre)      AS nombre   , ';
  cSql_Cmd := cSql_Cmd + '  UCASE(apellido)    AS apellido  , ';
  cSql_Cmd := cSql_Cmd + '  UCASE(identificacion)  AS identificacion, ';
  cSql_Cmd := cSql_Cmd + '  UCASE(seguro_social) AS seguro_social ';
  cSql_Cmd := cSql_Cmd + 'FROM clientes ';
  cSql_Cmd := cSql_Cmd + 'WHERE 1=1 ';

  Application.CreateForm(TfBuscarGenM2, fBuscarGenM2);
  fBuscarGenM2.Hide;
  fBuscarGenM2.oLst_campos.clear;

  BuscarGenM2.oListData[1].Texto := 'Código';
  BuscarGenM2.oListData[1].Campo := 'id_cliente';
  BuscarGenM2.oListData[1].LLave := true;

  BuscarGenM2.oListData[2].Texto := 'Nombre';
  BuscarGenM2.oListData[2].Campo := 'nombre';
  BuscarGenM2.oListData[2].LLave := false;

  BuscarGenM2.oListData[3].Texto := 'Apellido';
  BuscarGenM2.oListData[3].Campo := 'apellido';
  BuscarGenM2.oListData[3].LLave := false;

  BuscarGenM2.oListData[4].Texto := 'Número N.I.P (Identif. Personal)';
  BuscarGenM2.oListData[4].Campo := 'identificacion';
  BuscarGenM2.oListData[4].LLave := false;

  BuscarGenM2.oListData[5].Texto := 'Número S.S.';
  BuscarGenM2.oListData[5].Campo := 'seguro_social';
  BuscarGenM2.oListData[5].LLave := false;

  fBuscarGenM2.oSql1.clear;
  fBuscarGenM2.oSql1.Lines.Add(cSql_Cmd);

  fBuscarGenM2.ShowModal;
  if BuscarGenM2.vFindResult <> '' then
  begin
    self.cCte_Sel := BuscarGenM2.vFindResult;
    dmGen_Data_Mod.otClientes.Locate('id_cliente', BuscarGenM2.vFindResult, []);
    self.Show_Data_Refresh();
  end;
  freeandnil(fBuscarGenM2);
end;

procedure TfGen_Mant_Cte.oBtnNewClick(Sender: TObject);
begin
  self.iOption := 1;
  self.cId_Empresa := IntToStr(UtilesV20.iId_Empresa);
  self.AdvSmoothTabPager1.ActivePageIndex := 1;
  self.Tab_Ult.TabVisible := false;

  dmGen_Data_Mod.otClientes.Insert;
  self.cCte_Sel := self.cTmp_Sec;

  self.iTipoSecCte := 1;

  self.oLst_Sec.Value := 1;
  self.Valid_oLst_Sec();

  dmGen_Data_Mod.otClientes.FieldByName('tipo_persona').AsInteger := 1;
  dmGen_Data_Mod.otClientes.FieldByName('id_cliente_tipo_ingreso').AsInteger := 0;
  dmGen_Data_Mod.otClientes.FieldByName('id_tipo_recomendacion').AsInteger := 0;
  dmGen_Data_Mod.otClientes.FieldByName('genero').AsString := 'M';
  dmGen_Data_Mod.otClientes.FieldByName('id_estado_civil').AsInteger := 0;
  dmGen_Data_Mod.otClientes.FieldByName('id_pais').AsInteger := 136;
  dmGen_Data_Mod.otClientes.FieldByName('id_res_fiscal').AsInteger := 136;
  dmGen_Data_Mod.otClientes.FieldByName('ciudadano_americano').AsInteger := 0;
  dmGen_Data_Mod.otClientes.FieldByName('viaja_frecuente').AsInteger := 0;
  dmGen_Data_Mod.otClientes.FieldByName('doble_nacional').AsInteger := 0;
  dmGen_Data_Mod.otClientes.FieldByName('nacio_eeuu').AsInteger := 0;
  dmGen_Data_Mod.otClientes.FieldByName('pasaporte_eeuu').AsInteger := 0;
  dmGen_Data_Mod.otClientes.FieldByName('tarjeta_eeuu').AsInteger := 0;
  dmGen_Data_Mod.otClientes.FieldByName('reside_eeuu').AsInteger := 0;
  dmGen_Data_Mod.otClientes.FieldByName('otra_nacionalidad').AsInteger := 0;
  dmGen_Data_Mod.otClientes.FieldByName('nacionalidad').AsString := '';
  dmGen_Data_Mod.otClientes.FieldByName('directivo').AsInteger := 0;
  dmGen_Data_Mod.otClientes.FieldByName('seguro_vida').AsInteger := 0;
  dmGen_Data_Mod.otClientes.FieldByName('salario_conyuge').AsFloat := 0.00;
  dmGen_Data_Mod.otClientes.FieldByName('comentarios').AsString := '';
  dmGen_Data_Mod.otClientes.FieldByName('pep_sujeto').AsInteger := 0;
  dmGen_Data_Mod.otClientes.FieldByName('pep_cargo').AsString := '';
  dmGen_Data_Mod.otClientes.FieldByName('pep_fecha_fin').Value := null;
  dmGen_Data_Mod.otClientes.FieldByName('pep_relacion').AsInteger := 0;
  dmGen_Data_Mod.otClientes.FieldByName('pep_relacion_tipo').AsString := '';
  dmGen_Data_Mod.otClientes.FieldByName('pep_relacion_cargo').AsString := '';

  begin
    dmGen_Data_Mod.oQry_Cte_Resid.Insert;
    dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('id_cliente').AsString := self.cCte_Sel;
    dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('id_provincia').AsString := '0';
    dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('id_distrito').AsString := '0';
    dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('id_corregimiento').AsString := '0';
    dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('Residencia').AsString := ' ';
    dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('id_tipo_vivienda').AsInteger := 0;
  end;

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

  self.opep_cargo.Enabled := false;
  self.opep_fecha_fin.Enabled := false;
  self.opep_relacion_tipo.Enabled := false;
  self.opep_relacion_cargo.Enabled := false;

  self.Action_Control(1);
  self.Enabled_Screen(true);
  self.Show_Data_Refresh(false, true);

  if (self.iTipoSecCte = 1) then
  begin
    self.oLst_Sec.Visible := true;
    self.oLst_Sec.Value := 1;
    self.Buscar_Sec_Dbf();
  end;
  self.oLst_tipo_persona.Value := 1;
  self.Sw_Interfaces();

  self.ock_pep_relacionClick(self);
  self.ock_pep_sujetoClick(self);

  self.oid_cliente.ReadOnly := false;
  self.oLst_tipo_persona.ReadOnly := false;
  // self.oidentificacion.Properties.EditMask := 'AA-AA-9999-99999';

  self.oLst_tipo_persona.SetFocus;
end;

procedure TfGen_Mant_Cte.oBtnPrintClick(Sender: TObject);
begin
  self.oBtnPrint.Enabled := false;
  Application.CreateForm(TfGen_Scrn_Prn, fGen_Scrn_Prn);
  fGen_Scrn_Prn.cCod_Cte := self.cCte_Sel;
  fGen_Scrn_Prn.ShowModal;
  freeandnil(fGen_Scrn_Prn);
  self.oBtnPrint.Enabled := true;
end;

procedure TfGen_Mant_Cte.oBtnSaveClick(Sender: TObject);
var
  cNext: string;
  cSql_Ln: string;
  cConv: string;
  iConv: integer;
  fConv: extended;
begin
  if ((self.iOption = 1) or (self.iOption = 2)) then
  begin

    if ((trim(self.oLst_tipo_persona.Value) = '') OR (self.oLst_tipo_persona.Value = null)) then
    begin
      MessageDlg('No es posible guardar sin colocar antes el TIPO DE PERSONA del cliente', mtConfirmation, [mbOk], 0);
      self.AdvSmoothTabPager1.ActivePage := Tab_Gen;
      self.oLst_tipo_persona.SetFocus;
      exit;
    end;

    if (trim(self.oid_cliente.Text) = '') then
    begin
      MessageDlg('No es posible guardar sin colocar antes el CODIGO del cliente', mtConfirmation, [mbOk], 0);
      self.AdvSmoothTabPager1.ActivePage := Tab_Gen;
      self.oid_cliente.SetFocus;
      exit;
    end;

    if (trim(self.oNombre.Text) = '') then
    begin
      MessageDlg('No es posible guardar sin colocar antes el NOMBRE del cliente', mtConfirmation, [mbOk], 0);
      self.AdvSmoothTabPager1.ActivePage := Tab_Gen;
      self.oNombre.SetFocus;
      exit;
    end;

    if (trim(self.oApellido.Text) = '') then
    begin
      MessageDlg('No es posible guardar sin colocar antes el APELLIDO del cliente', mtConfirmation, [mbOk], 0);
      self.AdvSmoothTabPager1.ActivePage := Tab_Gen;
      self.oApellido.SetFocus;
      exit;
    end;

    cConv := trim(ReplaceStr(self.oidentificacion.Text, '-', ''));
    if (trim(cConv) = '') then
    begin
      MessageDlg('No es posible guardar sin colocar antes la IDENTIFICASION del cliente', mtConfirmation, [mbOk], 0);
      self.AdvSmoothTabPager1.ActivePage := Tab_Gen;
      self.oidentificacion.SetFocus;
      exit;
    end;

    if ((self.oLst_id_pais.KeyValue = 0) OR (self.oLst_id_pais.KeyValue = null)) then
    begin
      MessageDlg('No es posible guardar sin colocar antes el PAIS DE NACIMIENTO del cliente', mtConfirmation, [mbOk], 0);
      self.AdvSmoothTabPager1.ActivePage := Tab_Gen;
      self.oLst_id_pais.SetFocus;
      exit;
    end;

    if ((self.oId_res_fiscal.KeyValue = 0) OR (self.oId_res_fiscal.KeyValue = null)) then
    begin
      MessageDlg('No es posible guardar sin colocar antes el PAIS DE RECIDENCIA FISCAL del cliente', mtConfirmation, [mbOk], 0);
      self.AdvSmoothTabPager1.ActivePage := Tab_Gen;
      self.oId_res_fiscal.SetFocus;
      exit;
    end;

    if ((self.oId_provincia.KeyValue = 0) OR (self.oId_provincia.KeyValue = null)) then
    begin
      MessageDlg('No es posible guardar sin colocar antes el PROVINCIA DE RESIDENCIA del cliente', mtConfirmation, [mbOk], 0);
      self.AdvSmoothTabPager1.ActivePage := Tab_Res;
      self.oId_provincia.SetFocus;
      exit;
    end;

    if ((self.oId_distrito.KeyValue = 0) OR (self.oId_distrito.KeyValue = null)) then
    begin
      MessageDlg('No es posible guardar sin colocar antes el DISTRITO DE RESIDENCIA del cliente', mtConfirmation, [mbOk], 0);
      self.AdvSmoothTabPager1.ActivePage := Tab_Res;
      self.oId_distrito.SetFocus;
      exit;
    end;

    if ((self.oId_tipo_empleado.KeyValue = 0) OR (self.oId_tipo_empleado.KeyValue = null)) then
    begin
      MessageDlg('No es posible guardar sin colocar antes el TIPO DE EMPLEADO del cliente', mtConfirmation, [mbOk], 0);
      self.AdvSmoothTabPager1.ActivePage := Tab_Lab;
      self.oId_tipo_empleado.SetFocus;
      exit;
    end;

    if ((self.oId_actividad_economica.KeyValue = 0) OR (self.oId_actividad_economica.KeyValue = null)) then
    begin
      MessageDlg('No es posible guardar sin colocar antes la ACTIVIDAD ECONOMICA del cliente', mtConfirmation, [mbOk], 0);
      self.AdvSmoothTabPager1.ActivePage := Tab_Lab;
      self.oId_actividad_economica.SetFocus;
      exit;
    end;
  end;

  if (self.iOption = 1) then
  begin
    if (self.iTipoSecCte = 0) then
    begin
      cNext := fUtilesV20.query_selectgen_result('SELECT IFNULL(no_personal,0)+1 AS no_personal FROM nume_trans LIMIT 1');
      dmGen_Data_Mod.otClientes.FieldByName('id_cliente').AsString := trim(cNext);
      UtilesV20.Execute_SQL_Command('UPDATE nume_trans SET no_personal=IFNULL(no_personal,0)+1 WHERE 1=1');
    end
    else
    begin
      if ((self.oLst_Sec.Value = 1) OR (self.oLst_Sec.Value = 2)) then
        self.Buscar_Sec_Dbf(true);
    end;
  end;

  self.Asingar_Cod_Cte();

  if (dmGen_Data_Mod.oQry_Cte_Resid.State in [dsInsert, dsEdit]) then
    dmGen_Data_Mod.oQry_Cte_Resid.Post;

  if (dmGen_Data_Mod.oQry_Cte_InfL.State in [dsInsert, dsEdit]) then
    dmGen_Data_Mod.oQry_Cte_InfL.Post;

  if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
    dmGen_Data_Mod.otClientes.Post;

  self.cCte_Sel := trim(dmGen_Data_Mod.otClientes.FieldByName('id_cliente').AsString);

  if ((self.iOption = 1) OR (self.iOption = 2)) then
    self.NewCte_CodUpdate(self.cTmp_Sec, self.cCte_Sel);

  self.Actualiza_Riezgo_Fijo(self.cCte_Sel);

  self.Cte_Limpia_Tmp_Asig(self.cCte_Sel);

  self.Action_Control(6);
  self.Enabled_Screen(false);
  if (self.iShow_Ult_Cng = 1) then
    self.AdvSmoothTabPager1.ActivePageIndex := 0
  else
    self.AdvSmoothTabPager1.ActivePageIndex := 1;
  self.iOption := 0;

  cSql_Ln := 'CALL App_Calc_Cte_Matriz("' + trim(self.cCte_Sel) + '","' + IntToStr(UtilesV20.iUserID) + '","' + UtilesV20.sUserName + '","' + trim(self.cNom_Modulo) +
    '/RECALCULO DE MATRIZ",0)';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  // self.Muestra_Cte_Riesgo(true);

  self.Show_Data_Refresh(true, false);
  // self.oidentificacion.Properties.EditMask := '';

  self.oid_cliente.ReadOnly := false;
  self.oLst_tipo_persona.ReadOnly := false;

  self.oLst_Sec.Visible := false;
  self.oFnd_Socio.Text := '';
  self.oFnd_Socio.SetFocus;
end;

procedure TfGen_Mant_Cte.oBtn_Add_DepClick(Sender: TObject);
begin
  if (trim(self.cCte_Sel) = '') then
  begin
    MessageDlg('Debe ingresar el codigo de cliente para poder agregar los dependientes?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  if (trim(self.oNombre.Text) = '') then
  begin
    MessageDlg('Seguro ingresar el nombre del socio/ahorrista/prospecto para poder agregar dependientes?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  Application.CreateForm(TfGen_Add_Depend, fGen_Add_Depend);
  fGen_Add_Depend.iOption := 1;
  fGen_Add_Depend.cCte_Id := trim(self.cCte_Sel);
  fGen_Add_Depend.cTmp_Id := trim(self.cTmp_Sec);
  fGen_Add_Depend.cReg_Id := 'ABC-123';
  fGen_Add_Depend.ShowModal;
  freeandnil(fGen_Add_Depend);

  if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
    self.Fnd_Cte_Depen()
  ELSE
    dmGen_Data_Mod.oQry_Cte_Depe.Refresh;

end;

procedure TfGen_Mant_Cte.oBtn_Add_DescClick(Sender: TObject);
begin
  if (trim(self.cCte_Sel) = '') then
  begin
    MessageDlg('Debe ingresar el codigo de cliente para poder crear los activos?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  if (trim(self.oNombre.Text) = '') then
  begin
    MessageDlg('Seguro ingresar el nombre del socio/ahorrista/prospecto para poder crear activos?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  Application.CreateForm(TfGen_Add_Desc, fGen_Add_Desc);
  fGen_Add_Desc.iOption := 1;
  fGen_Add_Desc.cCte_Id := trim(self.cCte_Sel);
  fGen_Add_Desc.cTmp_Id := trim(self.cTmp_Sec);
  fGen_Add_Desc.cReg_Id := 'ABC-123';
  fGen_Add_Desc.ShowModal;
  freeandnil(fGen_Add_Desc);

  if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
    self.Fnd_Cte_Descu()
  ELSE
    dmGen_Data_Mod.oQry_Cte_De.Refresh;
end;

procedure TfGen_Mant_Cte.oBtn_Del_DepClick(Sender: TObject);
var
  nResp: integer;
  cSql_Ln: string;
  cTmp_Cte: string;
begin
  cTmp_Cte := dmGen_Data_Mod.oQry_Cte_Depe.FieldByName('id_cliente').AsString;
  if (trim(cTmp_Cte) <> '') then
  begin
    nResp := MessageDlg('Seguro que desea eliminar el dependiente seleccionado?', mtConfirmation, [mbYes, mbNo], 0);
    If (nResp = mrYes) Then
    begin
      cSql_Ln := '';
      cSql_Ln := cSql_Ln + 'DELETE FROM cliente_dependientes ';
      cSql_Ln := cSql_Ln + 'WHERE ((id_cliente="' + trim(cTmp_Cte) + '") or (id_cliente="' + self.cTmp_Sec + '")) ';
      cSql_Ln := cSql_Ln + 'AND   (id_cliente_dependientes ="' + trim(dmGen_Data_Mod.oQry_Cte_Depe.FieldByName('id_cliente_dependientes').AsString) + '") ';
      UtilesV20.Execute_SQL_Command(cSql_Ln);

      if (dmGen_Data_Mod.otClientes.State in [dsInsert]) then
        self.Fnd_Cte_Depen()
      ELSE
        dmGen_Data_Mod.oQry_Cte_Depe.Refresh;
    end;
  end;
end;

procedure TfGen_Mant_Cte.oBtn_Del_DescClick(Sender: TObject);
var
  nResp: integer;
  cSql_Ln: string;
  cTmp_Cte: string;
begin
  cTmp_Cte := dmGen_Data_Mod.oQry_Cte_De.FieldByName('id_cliente').AsString;
  if (trim(cTmp_Cte) <> '') then
  begin
    nResp := MessageDlg('Seguro que desea eliminar el activo seleccionado?', mtConfirmation, [mbYes, mbNo], 0);
    If (nResp = mrYes) Then
    begin
      cSql_Ln := '';
      cSql_Ln := cSql_Ln + 'DELETE FROM cliente_descuentos ';
      cSql_Ln := cSql_Ln + 'WHERE ((id_cliente="' + trim(cTmp_Cte) + '") or (id_cliente="' + self.cTmp_Sec + '")) ';
      cSql_Ln := cSql_Ln + 'AND   (id_cliente_descuento ="' + trim(dmGen_Data_Mod.oQry_Cte_De.FieldByName('id_cliente_descuento').AsString) + '") ';
      UtilesV20.Execute_SQL_Command(cSql_Ln);

      if (dmGen_Data_Mod.otClientes.State in [dsInsert]) then
        self.Fnd_Cte_Descu()
      ELSE
        dmGen_Data_Mod.oQry_Cte_De.Refresh;
    end;
  end;
end;

procedure TfGen_Mant_Cte.oBtn_Del_PatrClick(Sender: TObject);
var
  nResp: integer;
  cSql_Ln: string;
  cTmp_Cte: string;
begin
  cTmp_Cte := dmGen_Data_Mod.oQry_Cte_OFon.FieldByName('ofon_id_cliente').AsString;
  if (trim(cTmp_Cte) <> '') then
  begin
    nResp := MessageDlg('Seguro que desea eliminar el activo seleccionado?', mtConfirmation, [mbYes, mbNo], 0);
    If (nResp = mrYes) Then
    begin
      cSql_Ln := '';
      cSql_Ln := cSql_Ln + 'DELETE FROM cliente_origen_fondos ';
      cSql_Ln := cSql_Ln + 'WHERE ((ofon_id_cliente="' + trim(cTmp_Cte) + '") or (ofon_id_cliente="' + self.cTmp_Sec + '")) ';
      cSql_Ln := cSql_Ln + 'AND   (ofon_id ="' + trim(dmGen_Data_Mod.oQry_Cte_OFon.FieldByName('ofon_id').AsString) + '") ';
      UtilesV20.Execute_SQL_Command(cSql_Ln);

      if (dmGen_Data_Mod.otClientes.State in [dsInsert]) then
        self.Fnd_Cte_OrigF()
      ELSE
        dmGen_Data_Mod.oQry_Cte_OFon.Refresh;
    end;
  end;
end;

procedure TfGen_Mant_Cte.oBtn_Del_PerFClick(Sender: TObject);
var
  nResp: integer;
  cSql_Ln: string;
  cTmp_Cte: string;
begin
  cTmp_Cte := dmGen_Data_Mod.oQry_Cte_Tran.FieldByName('id_cliente').AsString;
  if (trim(cTmp_Cte) <> '') then
  begin
    nResp := MessageDlg('Seguro que desea eliminar el registro seleccionado?', mtConfirmation, [mbYes, mbNo], 0);
    If (nResp = mrYes) Then
    begin
      cSql_Ln := '';
      cSql_Ln := cSql_Ln + 'DELETE FROM cliente_origen_ingresos ';
      cSql_Ln := cSql_Ln + 'WHERE ((id_cliente="' + trim(cTmp_Cte) + '") or (id_cliente="' + self.cTmp_Sec + '")) ';
      cSql_Ln := cSql_Ln + 'AND   (id_origen_ingresos ="' + trim(dmGen_Data_Mod.oQry_Cte_OIng.FieldByName('id_origen_ingresos').AsString) + '") ';
      UtilesV20.Execute_SQL_Command(cSql_Ln);

      if (dmGen_Data_Mod.otClientes.State in [dsInsert]) then
        self.Fnd_Cte_Finan()
      ELSE
        dmGen_Data_Mod.oQry_Cte_OIng.Refresh;
    end;
  end;
end;

procedure TfGen_Mant_Cte.oBtn_Del_PerTClick(Sender: TObject);
var
  nResp: integer;
  cSql_Ln: string;
  cTmp_Cte: string;
begin
  cTmp_Cte := dmGen_Data_Mod.oQry_Cte_Tran.FieldByName('id_cliente').AsString;
  if (trim(cTmp_Cte) <> '') then
  begin
    nResp := MessageDlg('Seguro que desea eliminar el registro seleccionado?', mtConfirmation, [mbYes, mbNo], 0);
    If (nResp = mrYes) Then
    begin
      cSql_Ln := '';
      cSql_Ln := cSql_Ln + 'DELETE FROM cliente_transacciones ';
      cSql_Ln := cSql_Ln + 'WHERE ((id_cliente="' + trim(cTmp_Cte) + '") or (id_cliente="' + self.cTmp_Sec + '")) ';
      cSql_Ln := cSql_Ln + 'AND   (id_cliente_transacciones ="' + trim(dmGen_Data_Mod.oQry_Cte_Tran.FieldByName('id_cliente_transacciones').AsString) + '") ';
      UtilesV20.Execute_SQL_Command(cSql_Ln);

      if (dmGen_Data_Mod.otClientes.State in [dsInsert]) then
        self.Fnd_Cte_Trans()
      ELSE
        dmGen_Data_Mod.oQry_Cte_Tran.Refresh;
    end;
  end;
end;

procedure TfGen_Mant_Cte.oBtn_Del_RefGClick(Sender: TObject);
var
  nResp: integer;
  cSql_Ln: string;
  cTmp_Cte: string;
begin
  cTmp_Cte := dmGen_Data_Mod.oQry_Cte_Ref1.FieldByName('id_cliente').AsString;
  if (cTmp_Cte <> '') then
  begin
    nResp := MessageDlg('Seguro que desea eliminar el activo seleccionado?', mtConfirmation, [mbYes, mbNo], 0);
    If (nResp = mrYes) Then
    begin
      cSql_Ln := '';
      cSql_Ln := cSql_Ln + 'DELETE FROM cliente_referencias ';
      cSql_Ln := cSql_Ln + 'WHERE ((id_cliente="' + trim(cTmp_Cte) + '") or (id_cliente="' + self.cTmp_Sec + '")) ';
      cSql_Ln := cSql_Ln + 'AND   (id_cliente_referencias ="' + trim(dmGen_Data_Mod.oQry_Cte_Ref1.FieldByName('id_cliente_referencias').AsString) + '") ';
      UtilesV20.Execute_SQL_Command(cSql_Ln);

      if (dmGen_Data_Mod.otClientes.State in [dsInsert]) then
        self.Fnd_Cte_Refe1()
      ELSE
        dmGen_Data_Mod.oQry_Cte_Ref1.Refresh;
    end;
  end;
end;

procedure TfGen_Mant_Cte.oBtn_Edit_DepClick(Sender: TObject);
begin
  if (trim(self.cCte_Sel) = '') then
  begin
    MessageDlg('Debe ingresar el codigo de cliente para poder agregar los dependientes?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  if (trim(self.oNombre.Text) = '') then
  begin
    MessageDlg('Seguro ingresar el nombre del socio/ahorrista/prospecto para poder modificar dependientes?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  Application.CreateForm(TfGen_Add_Depend, fGen_Add_Depend);
  fGen_Add_Depend.iOption := 2;
  fGen_Add_Depend.cCte_Id := trim(dmGen_Data_Mod.oQry_Cte_Depe.FieldByName('id_cliente').AsString);
  fGen_Add_Depend.cTmp_Id := trim(dmGen_Data_Mod.oQry_Cte_Depe.FieldByName('id_cliente').AsString);
  fGen_Add_Depend.cReg_Id := dmGen_Data_Mod.oQry_Cte_Depe.FieldByName('id_cliente_dependientes').AsString;
  fGen_Add_Depend.ShowModal;
  freeandnil(fGen_Add_Depend);

  if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
    self.Fnd_Cte_Depen()
  ELSE
    dmGen_Data_Mod.oQry_Cte_Depe.Refresh;
end;

procedure TfGen_Mant_Cte.oBtn_Edit_DescClick(Sender: TObject);
begin
  if (trim(self.cCte_Sel) = '') then
  begin
    MessageDlg('Debe ingresar el codigo de cliente para poder crear los activos?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  if (trim(self.oNombre.Text) = '') then
  begin
    MessageDlg('Seguro ingresar el nombre del socio/ahorrista/prospecto para poder crear activos?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  Application.CreateForm(TfGen_Add_Desc, fGen_Add_Desc);
  fGen_Add_Desc.iOption := 2;
  fGen_Add_Desc.cCte_Id := trim(dmGen_Data_Mod.oQry_Cte_De.FieldByName('id_cliente').AsString);
  fGen_Add_Desc.cTmp_Id := trim(dmGen_Data_Mod.oQry_Cte_De.FieldByName('id_cliente').AsString);
  fGen_Add_Desc.cReg_Id := dmGen_Data_Mod.oQry_Cte_De.FieldByName('id_cliente_descuento').AsString;
  fGen_Add_Desc.ShowModal;
  freeandnil(fGen_Add_Desc);

  if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
    self.Fnd_Cte_Descu()
  ELSE
    dmGen_Data_Mod.oQry_Cte_De.Refresh;
end;

procedure TfGen_Mant_Cte.oBtn_Edit_PatrClick(Sender: TObject);
begin
  if (trim(self.cCte_Sel) = '') then
  begin
    MessageDlg('Debe ingresar el codigo de cliente para poder modificar los activos?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  if (trim(self.oNombre.Text) = '') then
  begin
    MessageDlg('Seguro ingresar el nombre del socio/ahorrista/prospecto para poder modificar activos?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  Application.CreateForm(TfGen_Add_Activos, fGen_Add_Activos);
  fGen_Add_Activos.iOption := 2;
  fGen_Add_Activos.cCte_Id := trim(dmGen_Data_Mod.oQry_Cte_OFon.FieldByName('ofon_id_cliente').AsString);
  fGen_Add_Activos.cTmp_Id := trim(dmGen_Data_Mod.oQry_Cte_OFon.FieldByName('ofon_id_cliente').AsString);
  fGen_Add_Activos.cReg_Id := dmGen_Data_Mod.oQry_Cte_OFon.FieldByName('ofon_id').AsString;
  fGen_Add_Activos.ShowModal;
  freeandnil(fGen_Add_Activos);

  if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
    self.Fnd_Cte_OrigF()
  ELSE
    dmGen_Data_Mod.oQry_Cte_OFon.Refresh;
end;

procedure TfGen_Mant_Cte.oBtn_Edit_PerFClick(Sender: TObject);
begin
  if (trim(self.cCte_Sel) = '') then
  begin
    MessageDlg('Debe ingresar el codigo de cliente para poder continuar con esta opción', mtConfirmation, [mbOk], 0);
    exit;
  end;

  if (trim(self.oNombre.Text) = '') then
  begin
    MessageDlg('Seguro ingresar el nombre del socio/ahorrista/prospecto para poder continuar con esta opción', mtConfirmation, [mbOk], 0);
    exit;
  end;

  Application.CreateForm(TfGen_Add_PerF, fGen_Add_PerF);
  fGen_Add_PerF.iOption := 2;
  fGen_Add_PerF.cCte_Id := trim(dmGen_Data_Mod.oQry_Cte_OIng.FieldByName('id_cliente').AsString);
  fGen_Add_PerF.cTmp_Id := trim(dmGen_Data_Mod.oQry_Cte_OIng.FieldByName('id_cliente').AsString);
  fGen_Add_PerF.cReg_Id := dmGen_Data_Mod.oQry_Cte_OIng.FieldByName('id_origen_ingresos').AsString;
  fGen_Add_PerF.ShowModal;
  freeandnil(fGen_Add_PerF);

  if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
    self.Fnd_Cte_Finan()
  ELSE
    dmGen_Data_Mod.oQry_Cte_OIng.Refresh;
end;

procedure TfGen_Mant_Cte.oBtn_Edit_PerTClick(Sender: TObject);
begin
  if (trim(self.cCte_Sel) = '') then
  begin
    MessageDlg('Debe ingresar el codigo de cliente para poder continuar en esta opción?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  if (trim(self.oNombre.Text) = '') then
  begin
    MessageDlg('Seguro ingresar el nombre del socio/ahorrista/prospecto para poder continuar en esta opción?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  Application.CreateForm(TfGen_Add_PerT, fGen_Add_PerT);
  fGen_Add_PerT.iOption := 2;
  fGen_Add_PerT.cCte_Id := dmGen_Data_Mod.oQry_Cte_Tran.FieldByName('id_cliente').AsString;
  fGen_Add_PerT.cTmp_Id := dmGen_Data_Mod.oQry_Cte_Tran.FieldByName('id_cliente').AsString;
  fGen_Add_PerT.cReg_Id := dmGen_Data_Mod.oQry_Cte_Tran.FieldByName('id_cliente_transacciones').AsString;
  fGen_Add_PerT.ShowModal;
  freeandnil(fGen_Add_PerT);

  if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
    self.Fnd_Cte_Trans()
  ELSE
    dmGen_Data_Mod.oQry_Cte_Tran.Refresh;
end;

procedure TfGen_Mant_Cte.oBtn_Edit_RefBClick(Sender: TObject);
begin
  if (trim(self.cCte_Sel) = '') then
  begin
    MessageDlg('Debe ingresar el codigo de cliente para poder crear los activos?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  if (trim(self.oNombre.Text) = '') then
  begin
    MessageDlg('Seguro ingresar el nombre del socio/ahorrista/prospecto para poder crear activos?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  Application.CreateForm(TfGen_Add_RefB, fGen_Add_RefB);
  fGen_Add_RefB.iOption := 2;
  fGen_Add_RefB.cCte_Id := trim(dmGen_Data_Mod.oQry_Cte_RefB.FieldByName('id_cliente').AsString);
  fGen_Add_RefB.cTmp_Id := trim(dmGen_Data_Mod.oQry_Cte_RefB.FieldByName('id_cliente').AsString);
  fGen_Add_RefB.cReg_Id := dmGen_Data_Mod.oQry_Cte_RefB.FieldByName('id_cliente_referencias_bancarias').AsString;
  fGen_Add_RefB.ShowModal;
  freeandnil(fGen_Add_RefB);

  if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
    self.Fnd_Cte_RefeB()
  ELSE
    dmGen_Data_Mod.oQry_Cte_RefB.Refresh;
end;

procedure TfGen_Mant_Cte.oBtn_Edit_RefGClick(Sender: TObject);
begin
  if (trim(self.cCte_Sel) = '') then
  begin
    MessageDlg('Debe ingresar el codigo de cliente para poder crear las referencias?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  if (trim(self.oNombre.Text) = '') then
  begin
    MessageDlg('Seguro ingresar el nombre del socio/ahorrista/prospecto para poder crear referencias?', mtConfirmation, [mbOk], 0);
    exit;
  end;

  Application.CreateForm(TfGen_Add_RefG, fGen_Add_RefG);
  fGen_Add_RefG.iOption := 2;
  fGen_Add_RefG.cCte_Id := trim(dmGen_Data_Mod.oQry_Cte_Ref1.FieldByName('id_cliente').AsString);
  fGen_Add_RefG.cTmp_Id := trim(dmGen_Data_Mod.oQry_Cte_Ref1.FieldByName('id_cliente').AsString);
  fGen_Add_RefG.cReg_Id := dmGen_Data_Mod.oQry_Cte_Ref1.FieldByName('id_cliente_referencias').AsString;
  fGen_Add_RefG.ShowModal;
  freeandnil(fGen_Add_RefG);

  if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
    self.Fnd_Cte_Refe1()
  ELSE
    dmGen_Data_Mod.oQry_Cte_Ref1.Refresh;
end;

procedure TfGen_Mant_Cte.ock_pep_relacionClick(Sender: TObject);
begin
  if (self.ock_pep_relacion.Checked = true) then
  begin
    self.opep_relacion_tipo.Enabled := true;
    self.opep_relacion_cargo.Enabled := true;
  end
  else
  begin
    self.opep_relacion_tipo.Enabled := false;
    self.opep_relacion_cargo.Enabled := false;
    self.opep_relacion_tipo.Value := '';
    self.opep_relacion_cargo.Text := '';
  end;
end;

procedure TfGen_Mant_Cte.ock_pep_sujetoClick(Sender: TObject);
begin
  if (self.ock_pep_sujeto.Checked = true) then
  begin
    self.opep_cargo.Enabled := true;
    self.opep_fecha_fin.Enabled := true;
  end
  else
  begin
    self.opep_cargo.Enabled := false;
    self.opep_fecha_fin.Enabled := false;
    self.opep_cargo.Text := '';
    self.opep_fecha_fin.Value := null;
  end;
end;

procedure TfGen_Mant_Cte.oDBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
begin
  self.cCte_Sel := trim(self.oDBNavigator.DataSource.DataSet.FieldByName('id_cliente').AsString);
  self.Show_Data_Refresh(true, false);

  // self.Muestra_Cte_Riesgo();
end;

procedure TfGen_Mant_Cte.OFAC1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://sanctionssearch.ofac.treas.gov/', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Mant_Cte.oFnd_SocioKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_RETURN then
  begin
    if (trim(self.oFnd_Socio.Text) = '') then
      exit;

    if (dmGen_Data_Mod.otClientes.RecordCount <= 0) then
      exit;

    if (dmGen_Data_Mod.otClientes.FieldByName('id_cliente').IsNull) then
      exit;

    self.cCte_Sel := trim(self.oFnd_Socio.Text);
    dmGen_Data_Mod.otClientes.Locate('id_cliente', trim(self.oFnd_Socio.Text), []);

    self.Show_Data_Refresh(true, false);
    // self.Muestra_Cte_Riesgo();
    self.oFnd_Socio.Text := '';
    Key := #0; // prevent beeping
  end;
end;

procedure TfGen_Mant_Cte.Enabled_Screen(bFlag: boolean);
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
          oComponents.Enabled := bFlag;
        1:
          oComponents.Enabled := not bFlag;
        2:
          oComponents.Enabled := false;
        3:
          oComponents.Enabled := true;
      end;
    end;
    if (Components[j] is TDBCheckBox) then
    begin
      oComponents := TDBCheckBox(self.Components[j]);
      case oComponents.Tag of
        0:
          oComponents.Enabled := bFlag;
        1:
          oComponents.Enabled := not bFlag;
        2:
          oComponents.Enabled := false;
        3:
          oComponents.Enabled := true;
      end;
    end;
    if (Components[j] is TDBMemo) then
    begin
      oComponents := TDBMemo(self.Components[j]);
      case oComponents.Tag of
        0:
          oComponents.Enabled := bFlag;
        1:
          oComponents.Enabled := not bFlag;
        2:
          oComponents.Enabled := false;
        3:
          oComponents.Enabled := true;
      end;
    end;
    if (Components[j] is TDBEdit) then
    begin
      oComponents := TDBEdit(self.Components[j]);
      case oComponents.Tag of
        0:
          oComponents.Enabled := bFlag;
        1:
          oComponents.Enabled := not bFlag;
        2:
          oComponents.Enabled := false;
        3:
          oComponents.Enabled := true;
      end;
    end;
    if (Components[j] is TDBDateTimeEditEh) then
    begin
      oComponents := TDBDateTimeEditEh(self.Components[j]);
      case oComponents.Tag of
        0:
          oComponents.Enabled := bFlag;
        1:
          oComponents.Enabled := not bFlag;
        2:
          oComponents.Enabled := false;
        3:
          oComponents.Enabled := true;
      end;
    end;
    if (Components[j] is TDBNumberEditEh) then
    begin
      oComponents := TDBNumberEditEh(self.Components[j]);
      case oComponents.Tag of
        0:
          oComponents.Enabled := bFlag;
        1:
          oComponents.Enabled := not bFlag;
        2:
          oComponents.Enabled := false;
        3:
          oComponents.Enabled := true;
      end;
    end;
    if (Components[j] is TDBLookupComboboxEh) then
    begin
      oComponents := TDBLookupComboboxEh(self.Components[j]);
      case oComponents.Tag of
        0:
          oComponents.Enabled := bFlag;
        1:
          oComponents.Enabled := not bFlag;
        2:
          oComponents.Enabled := false;
        3:
          oComponents.Enabled := true;
      end;
    end;

    if (Components[j] is TDBComboBoxEh) then
    begin
      oComponents := TDBComboBoxEh(self.Components[j]);
      case oComponents.Tag of
        0:
          oComponents.Enabled := bFlag;
        1:
          oComponents.Enabled := not bFlag;
        2:
          oComponents.Enabled := false;
        3:
          oComponents.Enabled := true;
      end;
    end;

    if (Components[j] is TPngBitBtn) then
    begin
      oComponents := TPngBitBtn(self.Components[j]);
      case oComponents.Tag of
        0:
          oComponents.Enabled := bFlag;
        1:
          oComponents.Enabled := not bFlag;
        2:
          oComponents.Enabled := false;
        3:
          oComponents.Enabled := true;
      end;
    end;

    if (Components[j] is TDBNavigator) then
    begin
      oComponents := TDBNavigator(self.Components[j]);
      case oComponents.Tag of
        0:
          oComponents.Enabled := bFlag;
        1:
          oComponents.Enabled := not bFlag;
        2:
          oComponents.Enabled := false;
        3:
          oComponents.Enabled := true;
      end;
    end;

    if (Components[j] is TEdit) then
    begin
      oComponents := TEdit(self.Components[j]);
      case oComponents.Tag of
        0:
          oComponents.Enabled := bFlag;
        1:
          oComponents.Enabled := not bFlag;
        2:
          oComponents.Enabled := false;
        3:
          oComponents.Enabled := true;
      end;
    end;

    if (Components[j] is TcxDBMaskEdit) then
    begin
      oComponents := TcxDBMaskEdit(self.Components[j]);
      case oComponents.Tag of
        0:
          oComponents.Enabled := bFlag;
        1:
          oComponents.Enabled := not bFlag;
        2:
          oComponents.Enabled := false;
        3:
          oComponents.Enabled := true;
      end;
    end;

  end;
end;

procedure TfGen_Mant_Cte.AssgnTabs;
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
      if TEdit(self.Components[j]).Name <> 'oFnd_Socio' then
        TEdit(self.Components[j]).OnKeyPress := self.EnterAsTab;
    end;

    if (Components[j] is TcxDBMaskEdit) then
      TcxDBMaskEdit(self.Components[j]).OnKeyPress := self.EnterAsTab;

  end;
end;

procedure TfGen_Mant_Cte.EnterAsTab(Sender: TObject; var Key: Char);
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

procedure TfGen_Mant_Cte.Action_Control(pOption: integer);
begin
  if ((pOption = 1) or (pOption = 2)) then
  begin
    // oDBNav.Visible := false;
    oBtnNew.Visible := false;
    oBtnEdit.Visible := false;
    oBtnDelete.Visible := false;
    oBtnFind.Visible := false;
    oBtnPrint.Visible := false;
    oBtnExit.Enabled := false;

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
    oBtnExit.Enabled := true;
    oBtnSave.Top := oBtnNew.Top;
    oBtnSave.Left := oBtnNew.Left;

    oBtnAbort.Top := oBtnEdit.Top;
    oBtnAbort.Left := oBtnEdit.Left;

    oBtnAbort.Visible := false;
    oBtnSave.Visible := false;
    oBtnExit.Visible := true;
  end;

end;

function TfGen_Mant_Cte.Select_dbf(cSql_Ln: string; bExecute: boolean = false): string;
begin
  dmGen_Data_Mod.oDbf_Cnn.Connected := true;
  dmGen_Data_Mod.oDbf_Qry.Connection := dmGen_Data_Mod.oDbf_Cnn;
  dmGen_Data_Mod.oDbf_Qry.SQL.clear;
  dmGen_Data_Mod.oDbf_Qry.SQL.Text := cSql_Ln;
  if (bExecute = false) then
  begin
    dmGen_Data_Mod.oDbf_Qry.Open;
    Result := dmGen_Data_Mod.oDbf_Qry.Fields[0].AsWideString;
  end
  else
  begin
    dmGen_Data_Mod.oDbf_Qry.ExecSQL;
    Result := '';
  end;

  dmGen_Data_Mod.oDbf_Qry.Close;
  dmGen_Data_Mod.oDbf_Cnn.Connected := false;
end;

procedure TfGen_Mant_Cte.Show_Data_Refresh(bShow_Tible: boolean = true; bFirstTab: boolean = true);
begin
  if (bShow_Tible = true) then
  begin
    self.oTitulo.Caption := 'Clientes: ' + uppercase(dmGen_Data_Mod.otClientes.FieldByName('nombre').AsString) + ' ' +
      uppercase(dmGen_Data_Mod.otClientes.FieldByName('apellido').AsString);
    dmGen_Data_Mod.otClientes.RefreshRecord();
  end
  else
    self.oTitulo.Caption := '';

  if (bFirstTab = true) then
  begin
    self.AdvSmoothTabPager1.ActivePageIndex := 1;
  end;

  self.Fnd_Cte_Depen();
  self.Fnd_Cte_Resid();
  self.Fnd_Cte_InfoL();
  self.Fnd_Cte_Trans();
  self.Fnd_Cte_Finan();
  self.Fnd_Cte_OrigF();
  self.Fnd_Cte_RefeB();
  self.Fnd_Cte_Refe1();
  self.Fnd_Cte_FacRi();
  self.Fnd_Cte_Descu();
  self.Sw_Interfaces();
end;

procedure TfGen_Mant_Cte.Fnd_Cte_Descu();
VAR
  cSql_Str: string;
  cwhereCte: string;
begin
  if (dmGen_Data_Mod.otClientes.State in [dsInsert]) then
    cwhereCte := 'WHERE (id_cliente = "' + trim(self.cTmp_Sec) + '") '
  else
  begin
    // self.cCte_Sel := trim(dmGen_Data_Mod.otClientes.FieldByName('id_cliente').AsString);
    if (trim(self.cCte_Sel) = '') then
      self.cCte_Sel := 'ABC-123';
    cwhereCte := '';
    cwhereCte := cwhereCte + 'WHERE (id_cliente = "' + self.cCte_Sel + '") ';
    if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
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
  dmGen_Data_Mod.oQry_Cte_De.SQL.clear;
  dmGen_Data_Mod.oQry_Cte_De.SQL.Text := cSql_Str;
  dmGen_Data_Mod.oQry_Cte_De.Open();
  dmGen_Data_Mod.oD_Cte_De.DataSet := dmGen_Data_Mod.oQry_Cte_De;
end;

procedure TfGen_Mant_Cte.Fnd_Cte_Depen();
VAR
  cSql_Str: string;
  cwhereCte: string;
begin
  if (dmGen_Data_Mod.otClientes.State in [dsInsert]) then
    cwhereCte := 'WHERE (id_cliente = "' + trim(self.cTmp_Sec) + '") '
  else
  begin
    // self.cCte_Sel := trim(dmGen_Data_Mod.otClientes.FieldByName('id_cliente').AsString);
    if (trim(self.cCte_Sel) = '') then
      self.cCte_Sel := 'ABC-123';
    cwhereCte := '';
    cwhereCte := cwhereCte + 'WHERE (id_cliente = "' + self.cCte_Sel + '") ';
    if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
      cwhereCte := cwhereCte + 'OR   (id_cliente = "' + trim(self.cTmp_Sec) + '") ';
  end;

  cSql_Str := 'SELECT * FROM cliente_dependientes ' + cwhereCte + ' ORDER BY id_cliente_dependientes';

  dmGen_Data_Mod.oQry_Cte_Depe.Close;
  dmGen_Data_Mod.oQry_Cte_Depe.SQL.clear;
  dmGen_Data_Mod.oQry_Cte_Depe.SQL.Text := cSql_Str;
  dmGen_Data_Mod.oQry_Cte_Depe.Open();
  dmGen_Data_Mod.odCte_Depe.DataSet := dmGen_Data_Mod.oQry_Cte_Depe;
end;

procedure TfGen_Mant_Cte.Fnd_Cte_Resid();
VAR
  cSql_Str: string;
  cwhereCte: string;
begin
  if (dmGen_Data_Mod.otClientes.State in [dsInsert]) then
    cwhereCte := 'WHERE (id_cliente = "' + trim(self.cTmp_Sec) + '") '
  else
  begin
    // self.cCte_Sel := trim(dmGen_Data_Mod.otClientes.FieldByName('id_cliente').AsString);
    if (trim(self.cCte_Sel) = '') then
      self.cCte_Sel := 'ABC-123';
    cwhereCte := '';
    cwhereCte := cwhereCte + 'WHERE (id_cliente = "' + self.cCte_Sel + '") ';
    if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
      cwhereCte := cwhereCte + 'OR   (id_cliente = "' + trim(self.cTmp_Sec) + '") ';
  end;

  cSql_Str := 'SELECT * FROM cliente_residencia ' + cwhereCte + ' ORDER BY id_cliente_residencia';

  dmGen_Data_Mod.oQry_Cte_Resid.Close;
  dmGen_Data_Mod.oQry_Cte_Resid.SQL.clear;
  dmGen_Data_Mod.oQry_Cte_Resid.SQL.Text := cSql_Str;
  dmGen_Data_Mod.oQry_Cte_Resid.Open();
  dmGen_Data_Mod.odCte_Resid.DataSet := dmGen_Data_Mod.oQry_Cte_Resid;
end;

procedure TfGen_Mant_Cte.Fnd_Cte_InfoL();
VAR
  cSql_Str: string;
  cwhereCte: string;
begin
  if (dmGen_Data_Mod.otClientes.State in [dsInsert]) then
    cwhereCte := 'WHERE (id_cliente = "' + trim(self.cTmp_Sec) + '") '
  else
  begin
    // self.cCte_Sel := trim(dmGen_Data_Mod.otClientes.FieldByName('id_cliente').AsString);
    if (trim(self.cCte_Sel) = '') then
      self.cCte_Sel := 'ABC-123';
    cwhereCte := '';
    cwhereCte := cwhereCte + 'WHERE (id_cliente = "' + self.cCte_Sel + '") ';
    if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
      cwhereCte := cwhereCte + 'OR   (id_cliente = "' + trim(self.cTmp_Sec) + '") ';
  end;

  cSql_Str := 'SELECT * FROM cliente_info_laboral ' + cwhereCte + ' ORDER BY id_cliente_info_laboral';

  dmGen_Data_Mod.oQry_Cte_InfL.Close;
  dmGen_Data_Mod.oQry_Cte_InfL.SQL.clear;
  dmGen_Data_Mod.oQry_Cte_InfL.SQL.Text := cSql_Str;
  dmGen_Data_Mod.oQry_Cte_InfL.Open();
  dmGen_Data_Mod.odCte_InfL.DataSet := dmGen_Data_Mod.oQry_Cte_InfL;
end;

procedure TfGen_Mant_Cte.Fnd_Cte_Trans();
VAR
  cSql_Str: string;
  cwhereCte: string;
begin
  if (dmGen_Data_Mod.otClientes.State in [dsInsert]) then
    cwhereCte := 'WHERE (cliente_transacciones.id_cliente = "' + trim(self.cTmp_Sec) + '") '
  else
  begin
    // self.cCte_Sel := trim(dmGen_Data_Mod.otClientes.FieldByName('id_cliente').AsString);
    if (trim(self.cCte_Sel) = '') then
      self.cCte_Sel := 'ABC-123';
    cwhereCte := '';
    cwhereCte := cwhereCte + 'WHERE (cliente_transacciones.id_cliente = "' + self.cCte_Sel + '") ';
    if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
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
  dmGen_Data_Mod.oQry_Cte_Tran.SQL.clear;
  dmGen_Data_Mod.oQry_Cte_Tran.SQL.Text := cSql_Str;
  dmGen_Data_Mod.oQry_Cte_Tran.Open();
  dmGen_Data_Mod.odCte_Tran.DataSet := dmGen_Data_Mod.oQry_Cte_Tran;
end;

procedure TfGen_Mant_Cte.Fnd_Cte_Finan();
VAR
  cSql_Str: string;
  cwhereCte: string;
begin
  if (dmGen_Data_Mod.otClientes.State in [dsInsert]) then
    cwhereCte := 'WHERE (cliente_origen_ingresos.id_cliente = "' + trim(self.cTmp_Sec) + '") '
  else
  begin
    // self.cCte_Sel := trim(dmGen_Data_Mod.otClientes.FieldByName('id_cliente').AsString);
    if (trim(self.cCte_Sel) = '') then
      self.cCte_Sel := 'ABC-123';
    cwhereCte := '';
    cwhereCte := cwhereCte + 'WHERE (cliente_origen_ingresos.id_cliente = "' + self.cCte_Sel + '") ';
    if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
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
  dmGen_Data_Mod.oQry_Cte_OIng.SQL.clear;
  dmGen_Data_Mod.oQry_Cte_OIng.SQL.Text := cSql_Str;
  dmGen_Data_Mod.oQry_Cte_OIng.Open();
  dmGen_Data_Mod.odCte_OIng.DataSet := dmGen_Data_Mod.oQry_Cte_OIng;
end;

procedure TfGen_Mant_Cte.Fnd_Cte_OrigF();
VAR
  cSql_Str: string;
  cwhereCte: string;
begin
  if (dmGen_Data_Mod.otClientes.State in [dsInsert]) then
    cwhereCte := 'WHERE (ofon_id_cliente = "' + trim(self.cTmp_Sec) + '") '
  else
  begin
    // self.cCte_Sel := trim(dmGen_Data_Mod.otClientes.FieldByName('id_cliente').AsString);
    if (trim(self.cCte_Sel) = '') then
      self.cCte_Sel := 'ABC-123';
    cwhereCte := '';
    cwhereCte := cwhereCte + 'WHERE (ofon_id_cliente = "' + self.cCte_Sel + '") ';
    if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
      cwhereCte := cwhereCte + 'OR   (ofon_id_cliente = "' + trim(self.cTmp_Sec) + '") ';
  end;

  cSql_Str := 'SELECT * FROM cliente_origen_fondos ' + cwhereCte + ' ORDER BY ofon_id';

  dmGen_Data_Mod.oQry_Cte_OFon.Close;
  dmGen_Data_Mod.oQry_Cte_OFon.SQL.clear;
  dmGen_Data_Mod.oQry_Cte_OFon.SQL.Text := cSql_Str;
  dmGen_Data_Mod.oQry_Cte_OFon.Open();
  dmGen_Data_Mod.odCte_OFon.DataSet := dmGen_Data_Mod.oQry_Cte_OFon;
end;

procedure TfGen_Mant_Cte.Fnd_Cte_Refe1();
VAR
  cSql_Str: string;
  cwhereCte: string;
begin
  if (dmGen_Data_Mod.otClientes.State in [dsInsert]) then
    cwhereCte := 'WHERE (cliente_referencias.id_cliente = "' + trim(self.cTmp_Sec) + '") '
  else
  begin
    // self.cCte_Sel := trim(dmGen_Data_Mod.otClientes.FieldByName('id_cliente').AsString);
    if (trim(self.cCte_Sel) = '') then
      self.cCte_Sel := 'ABC-123';
    cwhereCte := '';
    cwhereCte := cwhereCte + 'WHERE (cliente_referencias.id_cliente = "' + self.cCte_Sel + '") ';
    if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
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
  dmGen_Data_Mod.oQry_Cte_Ref1.SQL.clear;
  dmGen_Data_Mod.oQry_Cte_Ref1.SQL.Text := cSql_Str;
  dmGen_Data_Mod.oQry_Cte_Ref1.Open();
  dmGen_Data_Mod.oD_Cte_Ref1.DataSet := dmGen_Data_Mod.oQry_Cte_Ref1;
end;

procedure TfGen_Mant_Cte.Fnd_Cte_RefeB();
VAR
  cSql_Str: string;
  cwhereCte: string;
begin
  if (dmGen_Data_Mod.otClientes.State in [dsInsert]) then
    cwhereCte := 'WHERE (cliente_referencias_bancarias.id_cliente = "' + trim(self.cTmp_Sec) + '") '
  else
  begin
    // self.cCte_Sel := trim(dmGen_Data_Mod.otClientes.FieldByName('id_cliente').AsString);
    if (trim(self.cCte_Sel) = '') then
      self.cCte_Sel := 'ABC-123';
    cwhereCte := '';
    cwhereCte := cwhereCte + 'WHERE (cliente_referencias_bancarias.id_cliente = "' + self.cCte_Sel + '") ';
    if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
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
  dmGen_Data_Mod.oQry_Cte_RefB.SQL.clear;
  dmGen_Data_Mod.oQry_Cte_RefB.SQL.Text := cSql_Str;
  dmGen_Data_Mod.oQry_Cte_RefB.Open();
  dmGen_Data_Mod.od_Cte_RefB.DataSet := dmGen_Data_Mod.oQry_Cte_RefB;
end;

procedure TfGen_Mant_Cte.Fnd_Cte_FacRi();
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

procedure TfGen_Mant_Cte.Asingar_Cod_Cte();
begin
  if (dmGen_Data_Mod.oQry_Cte_Resid.State in [dsInsert, dsEdit]) then
  begin

    if (dmGen_Data_Mod.oQry_Cte_Resid.State in [dsInsert]) then
      dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('flag_tmp').AsInteger := 1;

    dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('id_cliente').AsString := self.cCte_Sel; // self.oid_cliente.Text;
    dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('ultima_fecha_actualizacion').AsDateTime := now();
    dmGen_Data_Mod.oQry_Cte_Resid.FieldByName('ultimo_usuario_que_actualizo').AsInteger := UtilesV20.iUserID;
  end;

  if (dmGen_Data_Mod.oQry_Cte_InfL.State in [dsInsert, dsEdit]) then
  begin

    if (dmGen_Data_Mod.oQry_Cte_InfL.State in [dsInsert]) then
      dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('flag_tmp').AsInteger := 1;

    dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('id_cliente').AsString := self.cCte_Sel; // self.oid_cliente.Text;
    dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('ultima_fecha_actualizacion').AsDateTime := now();
    dmGen_Data_Mod.oQry_Cte_InfL.FieldByName('ultimo_usuario_que_actualizo').AsInteger := UtilesV20.iUserID;
  end;

  if (dmGen_Data_Mod.otClientes.State in [dsInsert, dsEdit]) then
  begin
    dmGen_Data_Mod.otClientes.FieldByName('ultima_fecha_actualizacion').AsDateTime := now();
    dmGen_Data_Mod.otClientes.FieldByName('ultimo_usuario_que_actualizo').AsInteger := UtilesV20.iUserID;
  end;
end;

procedure TfGen_Mant_Cte.Buscar_Sec_Dbf(bSave: boolean = false);
VAR
  cCod_Soc: string;
  iCod_Soc: integer;
begin
  if (self.iOption = 1) then
  begin

    if (self.oLst_Sec.Value = 1) or (self.oLst_Sec.Value = 2) then
    begin
      if (self.oLst_Sec.Value = 1) then
        cCod_Soc := self.Select_dbf('SELECT ultsocio FROM numetran FIRST')
      else if (self.oLst_Sec.Value = 2) then
        cCod_Soc := self.Select_dbf('SELECT ultahorros FROM numetran FIRST');

      cCod_Soc := trim(cCod_Soc);

      if (cCod_Soc = '') then
        cCod_Soc := '0';

      if (cCod_Soc = 'NULL') then
        cCod_Soc := '0';
      iCod_Soc := StrToInt(cCod_Soc);
      cCod_Soc := fUtilesV20.PadL(trim(IntToStr(iCod_Soc + 1)), 5, '0');

      dmGen_Data_Mod.otClientes.FieldByName('id_cliente').AsString := cCod_Soc;
      if (bSave = true) then
      begin
        if (self.oLst_Sec.Value = 1) then
        begin
          self.Select_dbf('UPDATE numetran SET ultsocio="' + cCod_Soc + '" ', true);
        end
        else if (self.oLst_Sec.Value = 2) then
        begin
          self.Select_dbf('UPDATE numetran SET ultahorros="' + cCod_Soc + '" ', true);
        end;
      end;
    end
    else
    begin
      dmGen_Data_Mod.otClientes.FieldByName('id_cliente').AsString := '';
    end;
  end;
end;

procedure TfGen_Mant_Cte.Cte_Borra_Tmp_Asig(cCod_Cte: string);
VAR
  cSql_Ln: STRING;
begin
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE ';
  cSql_Ln := cSql_Ln + 'FROM cliente_dependientes ';
  cSql_Ln := cSql_Ln + 'WHERE ( (id_cliente ="' + trim(self.cTmp_Sec) + '") OR (id_cliente ="' + trim(cCod_Cte) + '") ) ';
  cSql_Ln := cSql_Ln + 'AND ((flag_tmp=1) OR (flag_tmp=3)) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE ';
  cSql_Ln := cSql_Ln + 'FROM cliente_residencia ';
  cSql_Ln := cSql_Ln + 'WHERE ( (id_cliente ="' + trim(self.cTmp_Sec) + '") OR (id_cliente ="' + trim(cCod_Cte) + '") ) ';
  cSql_Ln := cSql_Ln + 'AND ((flag_tmp=1) OR (flag_tmp=3)) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE ';
  cSql_Ln := cSql_Ln + 'FROM cliente_info_laboral ';
  cSql_Ln := cSql_Ln + 'WHERE ( (id_cliente ="' + trim(self.cTmp_Sec) + '") OR (id_cliente ="' + trim(cCod_Cte) + '") ) ';
  cSql_Ln := cSql_Ln + 'AND ((flag_tmp=1) OR (flag_tmp=3)) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE ';
  cSql_Ln := cSql_Ln + 'FROM cliente_transacciones ';
  cSql_Ln := cSql_Ln + 'WHERE ( (id_cliente ="' + trim(self.cTmp_Sec) + '") OR (id_cliente ="' + trim(cCod_Cte) + '") ) ';
  cSql_Ln := cSql_Ln + 'AND ((flag_tmp=1) OR (flag_tmp=3)) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE ';
  cSql_Ln := cSql_Ln + 'FROM cliente_origen_ingresos ';
  cSql_Ln := cSql_Ln + 'WHERE ( (id_cliente ="' + trim(self.cTmp_Sec) + '") OR (id_cliente ="' + trim(cCod_Cte) + '") ) ';
  cSql_Ln := cSql_Ln + 'AND ((flag_tmp=1) OR (flag_tmp=3)) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE ';
  cSql_Ln := cSql_Ln + 'FROM cliente_origen_fondos ';
  cSql_Ln := cSql_Ln + 'WHERE ( (ofon_id_cliente ="' + trim(self.cTmp_Sec) + '") OR (ofon_id_cliente="' + trim(cCod_Cte) + '") ) ';
  cSql_Ln := cSql_Ln + 'AND ((flag_tmp=1) OR (flag_tmp=3)) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE ';
  cSql_Ln := cSql_Ln + 'FROM cliente_referencias ';
  cSql_Ln := cSql_Ln + 'WHERE ( (id_cliente ="' + trim(self.cTmp_Sec) + '") OR (Id_cliente ="' + trim(cCod_Cte) + '") ) ';
  cSql_Ln := cSql_Ln + 'AND ((flag_tmp=1) OR (flag_tmp=3)) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE ';
  cSql_Ln := cSql_Ln + 'FROM cliente_referencias_bancarias ';
  cSql_Ln := cSql_Ln + 'WHERE ( (id_cliente ="' + trim(self.cTmp_Sec) + '") OR (id_cliente ="' + trim(cCod_Cte) + '") ) ';
  cSql_Ln := cSql_Ln + 'AND ((flag_tmp=1) OR (flag_tmp=3)) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE ';
  cSql_Ln := cSql_Ln + 'FROM cliente_factores_riesgo ';
  cSql_Ln := cSql_Ln + 'WHERE ( (id_cliente ="' + trim(self.cTmp_Sec) + '") OR (id_cliente ="' + trim(cCod_Cte) + '") ) ';
  cSql_Ln := cSql_Ln + 'AND ((flag_tmp=1) OR (flag_tmp=2)) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE ';
  cSql_Ln := cSql_Ln + 'FROM cliente_descuentos ';
  cSql_Ln := cSql_Ln + 'WHERE ( (id_cliente ="' + trim(self.cTmp_Sec) + '") OR (id_cliente ="' + trim(cCod_Cte) + '") ) ';
  cSql_Ln := cSql_Ln + 'AND ((flag_tmp=1) OR (flag_tmp=2)) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE ';
  cSql_Ln := cSql_Ln + 'FROM cliente_impacto ';
  cSql_Ln := cSql_Ln + 'WHERE ( (id_cliente ="' + trim(self.cTmp_Sec) + '") OR (id_cliente ="' + trim(cCod_Cte) + '") ) ';
  cSql_Ln := cSql_Ln + 'AND ((flag_tmp=1) OR (flag_tmp=2)) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);
end;

procedure TfGen_Mant_Cte.Cte_Limpia_Tmp_Asig(cCod_Cte: string);
VAR
  cSql_Ln: STRING;
begin
  cSql_Ln := 'UPDATE cliente_dependientes SET flag_tmp=0 WHERE ((id_cliente ="' + trim(self.cTmp_Sec) + '") or (id_cliente ="' + cCod_Cte + '")) AND (flag_tmp=1)';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := 'UPDATE cliente_residencia SET flag_tmp=0 WHERE ((id_cliente ="' + trim(self.cTmp_Sec) + '") or (id_cliente ="' + cCod_Cte + '")) AND (flag_tmp=1)';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := 'UPDATE cliente_info_laboral SET flag_tmp=0 WHERE ((id_cliente ="' + trim(self.cTmp_Sec) + '") or (id_cliente ="' + cCod_Cte + '")) AND (flag_tmp=1)';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := 'UPDATE cliente_transacciones SET flag_tmp=0 WHERE ((id_cliente ="' + trim(self.cTmp_Sec) + '") or (id_cliente ="' + cCod_Cte + '")) AND (flag_tmp=1)';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := 'UPDATE cliente_origen_ingresos SET flag_tmp=0 WHERE ((id_cliente ="' + trim(self.cTmp_Sec) + '") or (id_cliente ="' + cCod_Cte + '")) AND (flag_tmp=1)';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := 'UPDATE cliente_origen_fondos SET flag_tmp=0 WHERE ((ofon_id_cliente ="' + trim(self.cTmp_Sec) + '") or (ofon_id_cliente="' + cCod_Cte + '")) AND (flag_tmp=1)';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := 'UPDATE cliente_referencias SET flag_tmp=0 WHERE ((id_cliente ="' + trim(self.cTmp_Sec) + '") or (id_cliente ="' + cCod_Cte + '")) AND (flag_tmp=1)';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := 'UPDATE cliente_referencias_bancarias SET flag_tmp=0 WHERE ((id_cliente ="' + trim(self.cTmp_Sec) + '") or (id_cliente ="' + cCod_Cte + '")) AND (flag_tmp=1)';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := 'UPDATE cliente_factores_riesgo SET flag_tmp=0 WHERE ((id_cliente ="' + trim(self.cTmp_Sec) + '") or (id_cliente ="' + cCod_Cte + '")) AND (flag_tmp=1)';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := 'UPDATE cliente_descuentos SET flag_tmp=0 WHERE ((id_cliente ="' + trim(self.cTmp_Sec) + '") or (id_cliente ="' + cCod_Cte + '")) AND (flag_tmp=1)';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := 'UPDATE cliente_impacto SET flag_tmp=0 WHERE ((id_cliente ="' + trim(self.cTmp_Sec) + '") or (id_cliente ="' + cCod_Cte + '")) AND (flag_tmp=1)';
  UtilesV20.Execute_SQL_Command(cSql_Ln);
end;

procedure TfGen_Mant_Cte.Sw_Interfaces;
begin
  // Persona Juridica//
  if (self.oLst_tipo_persona.Value = 2) then
  begin
    { self.Tab_Dep.TabVisible := false;
      self.Tab_Res.TabVisible := false;
      self.Tab_Lab.TabVisible := false;
      self.oGrp_Info_Nat.Visible := true;
      self.oGrp_Info_Jur.Visible := false;
      self.otipo_persona_e.Value := 1;
      // self.oGrp_Info_Nat.Top := Tab_Gen.Height div 2;
      // self.oGrp_Info_Nat.Left := Tab_Gen.Width div 2;
    } end;
end;

procedure TfGen_Mant_Cte.Sw_Interfaces_e;
begin
  // Persona Matural //
  { if (self.otipo_persona_e.Value = 1) then
    begin
    self.Tab_Dep.TabVisible := true;
    self.Tab_Res.TabVisible := true;
    self.Tab_Lab.TabVisible := true;
    self.oGrp_Info_Nat.Visible := true;
    self.oGrp_Info_Jur.Visible := false;
    self.oLst_tipo_persona.Value := 2;
    // self.oGrp_Info_Nat.Top := Tab_Gen.Height div 2;
    // self.oGrp_Info_Nat.Left := Tab_Gen.Width div 2;
    end;
  }
end;

procedure TfGen_Mant_Cte.otipo_persona_eCloseUp(Sender: TObject; Accept: boolean);
begin
  { if ((self.otipo_persona_e.Value <> 0) or (self.otipo_persona_e.Value <> null)) then
    self.Sw_Interfaces_e();
  }
end;

procedure TfGen_Mant_Cte.oBtn_ChekListClick(Sender: TObject);
begin

  Application.CreateForm(TfGen_MantC_ChL, fGen_MantC_ChL);
  if (dmGen_Data_Mod.otClientes.State in [dsInsert]) then
    fGen_MantC_ChL.cCod_Cte := trim(self.cTmp_Sec)
  else
    fGen_MantC_ChL.cCod_Cte := trim(self.cCte_Sel);
  fGen_MantC_ChL.ShowModal;
  freeandnil(fGen_MantC_ChL);
end;

procedure TfGen_Mant_Cte.oBtn_MatrizRClick(Sender: TObject);
begin
  Application.CreateForm(TfShow_Matriz_Cte, fShow_Matriz_Cte);
  if (dmGen_Data_Mod.otClientes.State in [dsInsert]) then
    fShow_Matriz_Cte.cCte_Sel := trim(self.cTmp_Sec)
  else
    fShow_Matriz_Cte.cCte_Sel := trim(self.cCte_Sel);
  fShow_Matriz_Cte.ShowModal;
  freeandnil(fShow_Matriz_Cte);
end;

procedure TfGen_Mant_Cte.Borra_Inf_Cliente(cCod_Cte: string);
var
  cSql_Ln: string;
begin
  fUtilesV20.WaitStart(self, 'INICIANDO PROCESO DE ELIMINACION:.');

  fUtilesV20.WaitSetMsg('ELIMINANDO INFORMACION DE DEPENDIENTES [1 DE 11]:..');
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE FROM cliente_dependientes ';
  cSql_Ln := cSql_Ln + 'WHERE (id_cliente="") AND (id_cliente="' + trim(cCod_Cte) + '") ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  fUtilesV20.WaitSetMsg('ELIMINANDO INFORMACION DE RESIDENCIA   [2 DE 11]:..');
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE FROM cliente_residencia ';
  cSql_Ln := cSql_Ln + 'WHERE (id_cliente="") AND (id_cliente="' + trim(cCod_Cte) + '") ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  fUtilesV20.WaitSetMsg('ELIMINANDO INFORMACION LABORAL         [3 DE 11]:..');
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE FROM cliente_info_laboral ';
  cSql_Ln := cSql_Ln + 'WHERE (id_cliente="") AND (id_cliente="' + trim(cCod_Cte) + '") ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  fUtilesV20.WaitSetMsg('ELIMINANDO INFORMACION ORIGEN DE FONOS  [4 DE 11]:..');
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE FROM cliente_origen_ingresos ';
  cSql_Ln := cSql_Ln + 'WHERE (id_cliente="") AND (id_cliente="' + trim(cCod_Cte) + '") ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  fUtilesV20.WaitSetMsg('ELIMINANDO INFORMACION DE TRANSACCIONES [5 DE 11]:..');
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE FROM cliente_transacciones ';
  cSql_Ln := cSql_Ln + 'WHERE (id_cliente="") AND (id_cliente="' + trim(cCod_Cte) + '") ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  fUtilesV20.WaitSetMsg('ELIMINANDO INFORMACION DE PATRIMONIO    [6 DE 11]:..');
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE FROM cliente_origen_fondos ';
  cSql_Ln := cSql_Ln + 'WHERE (ofon_id_cliente="") AND (ofon_id_cliente="' + trim(cCod_Cte) + '") ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

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

  fUtilesV20.WaitSetMsg('ELIMINANDO INFORMACION FACTORES RIEZGOS [9 DE 11]:..');
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE FROM cliente_factores_riesgo ';
  cSql_Ln := cSql_Ln + 'WHERE (id_cliente="") AND (id_cliente="' + trim(cCod_Cte) + '") ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  fUtilesV20.WaitSetMsg('ELIMINANDO INFORMACION DESCUENTO DIRECTOS [10 DE 11]:..');
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE FROM cliente_descuentos ';
  cSql_Ln := cSql_Ln + 'WHERE (id_cliente="") AND (id_cliente="' + trim(cCod_Cte) + '") ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  fUtilesV20.WaitSetMsg('ELIMINANDO INFORMACION DEL CLIENTE/SOC [11 DE 11]:..');
  dmGen_Data_Mod.otClientes.delete;
  fUtilesV20.WaitEnd;
end;

procedure TfGen_Mant_Cte.BUSCADORAPC1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://online.apc.com.pa/Login/tabid/468/Default.aspx?returnurl=%2fdefault.aspx', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Mant_Cte.BUSCADORMP1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.rp.gob.pa/', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Mant_Cte.BUSCADORUAF1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.uaf.gob.pa/Lista-Nacional', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Mant_Cte.BUSCADORUK1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://www.gov.uk/government/publications/current-list-of-designated-persons-terrorism-and-terrorist-financing', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Mant_Cte.NewCte_CodUpdate(cCod_Tmp: string; cCod_Fin: string);
var
  cSql_Ln: string;
begin
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'UPDATE cliente_dependientes SET ';
  cSql_Ln := cSql_Ln + '  flag_tmp=0, id_cliente="' + trim(cCod_Fin) + '" ';
  cSql_Ln := cSql_Ln + 'WHERE (id_cliente="' + trim(cCod_Tmp) + '") AND (flag_tmp=1) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'UPDATE cliente_residencia SET ';
  cSql_Ln := cSql_Ln + '  flag_tmp=0, id_cliente="' + trim(cCod_Fin) + '" ';
  cSql_Ln := cSql_Ln + 'WHERE (id_cliente="' + trim(cCod_Tmp) + '") AND (flag_tmp=1) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'UPDATE cliente_info_laboral SET ';
  cSql_Ln := cSql_Ln + '  flag_tmp=0, id_cliente="' + trim(cCod_Fin) + '" ';
  cSql_Ln := cSql_Ln + 'WHERE (id_cliente="' + trim(cCod_Tmp) + '") AND (flag_tmp=1) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'UPDATE cliente_origen_ingresos SET ';
  cSql_Ln := cSql_Ln + '  flag_tmp=0, id_cliente="' + trim(cCod_Fin) + '" ';
  cSql_Ln := cSql_Ln + 'WHERE (id_cliente="' + trim(cCod_Tmp) + '") AND (flag_tmp=1) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'UPDATE cliente_transacciones SET ';
  cSql_Ln := cSql_Ln + '  flag_tmp=0, id_cliente="' + trim(cCod_Fin) + '" ';
  cSql_Ln := cSql_Ln + 'WHERE (id_cliente="' + trim(cCod_Tmp) + '") AND (flag_tmp=1) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'UPDATE cliente_origen_fondos SET ';
  cSql_Ln := cSql_Ln + '  flag_tmp=0, ofon_id_cliente="' + trim(cCod_Fin) + '" ';
  cSql_Ln := cSql_Ln + 'WHERE (ofon_id_cliente="' + trim(cCod_Tmp) + '") AND (flag_tmp=1) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

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

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'UPDATE cliente_factores_riesgo SET ';
  cSql_Ln := cSql_Ln + '  flag_tmp=0, id_cliente="' + trim(cCod_Fin) + '" ';
  cSql_Ln := cSql_Ln + 'WHERE (id_cliente="' + trim(cCod_Tmp) + '") AND (flag_tmp=1) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'UPDATE cliente_descuentos SET ';
  cSql_Ln := cSql_Ln + '  flag_tmp=0, id_cliente="' + trim(cCod_Fin) + '" ';
  cSql_Ln := cSql_Ln + 'WHERE (id_cliente="' + trim(cCod_Tmp) + '") AND (flag_tmp=1) ';
  UtilesV20.Execute_SQL_Command(cSql_Ln);
end;

procedure TfGen_Mant_Cte.Actualiza_Riezgo_Fijo(cCod_Cte: string);
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
  if (self.oDoble_nacional.Checked = false) then
    self.Add_Automatic_Riesgo(cCod_Cte, 'FP02', true)
  else
    self.Add_Automatic_Riesgo(cCod_Cte, 'FP02', false);
  // -------------------------------------------------------------------------------------------//

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
  // -------------------------------------------------------------------------------------------//

  // -------------------------VALIDA PAIS/RIESGO------------------------------------------------//
  cStr_Val := dmGen_Data_Mod.otClientes.FieldByName('id_pais').AsString;
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

  // -------------------------------------------------------------------------------------------//

  if (self.ock_pep_sujeto.Checked = false) then
    self.Add_Automatic_Riesgo(cCod_Cte, 'FI04', true)
  else
    self.Add_Automatic_Riesgo(cCod_Cte, 'FI04', false);

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
  // -------------------------------------------------------------------------------------------//
end;

procedure TfGen_Mant_Cte.Valid_oLst_Sec();
begin
  if ((self.oLst_Sec.Value = 1) OR (self.oLst_Sec.Value = 2)) then
  begin
    self.oid_cliente.ReadOnly := true;
    self.Buscar_Sec_Dbf();
  end
  else
  begin
    self.oid_cliente.ReadOnly := false;
  end;
end;

procedure TfGen_Mant_Cte.Muestra_Cte_Riesgo(bRecall: boolean = false);
var
  cSql_Ln: string;
  cCte_Imp_Ran: string;
  cCte_Imp_Des: string;
begin

  cCte_Imp_Ran := trim(dmGen_Data_Mod.otClientes.FieldByName('nivel_riesgo').AsString);
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

procedure TfGen_Mant_Cte.Add_Automatic_Riesgo(pCod_Cte: string; pCod_Riesgo: string; bDelete: boolean = false; pProd: string = '0'; pImpa: string = '0');
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
