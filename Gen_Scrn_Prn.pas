unit Gen_Scrn_Prn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  PngBitBtn, AdvSmoothButton;

type
  TfGen_Scrn_Prn = class(TForm)
    oTitulo: TLabel;
    Shape4: TShape;
    Shape2: TShape;
    oBtn_Preview: TAdvSmoothButton;
    oBtn_Print: TAdvSmoothButton;
    oBtnExit: TAdvSmoothButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure oBtnExitClick(Sender: TObject);
    procedure oBtn_PreviewClick(Sender: TObject);
    procedure oBtn_PrintClick(Sender: TObject);
    procedure Show_Report(nOption: integer);
  private
    { Private declarations }
    iOption: integer;
    bSwitchPrev: Boolean;
    bActivesOk: Boolean;
    bPrintToFile: Boolean;
    cFilePDF: string;
    cDB_file: string;
  public
    cCod_Cte: string;
    { Public declarations }
  end;

var
  fGen_Scrn_Prn: TfGen_Scrn_Prn;

implementation

uses reportes, UtilesV20;
{$R *.dfm}

procedure TfGen_Scrn_Prn.FormCreate(Sender: TObject);
begin
  self.iOption := 1;
  self.bActivesOk := false;
  self.cCod_Cte := '';
  // self.ResizeKit1.Enabled := Utiles.Ctrl_Resize;

  self.bSwitchPrev := true;
end;

procedure TfGen_Scrn_Prn.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F11 then
  begin
    if (self.bSwitchPrev = true) then
    begin
      self.oBtn_Preview.Caption := 'Diseño';
      self.bSwitchPrev := false;
    end
    else
    begin
      self.oBtn_Preview.Caption := 'Visualizar';
      self.bSwitchPrev := true;
    end;
  end;

end;

procedure TfGen_Scrn_Prn.FormShow(Sender: TObject);
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
end;

procedure TfGen_Scrn_Prn.oBtnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfGen_Scrn_Prn.oBtn_PreviewClick(Sender: TObject);
begin
  self.oBtn_Preview.Enabled := false;
  if bSwitchPrev = true then
    self.Show_Report(1)
  else
    self.Show_Report(3);
  self.oBtn_Preview.Enabled := true;
end;

procedure TfGen_Scrn_Prn.oBtn_PrintClick(Sender: TObject);
begin
  self.oBtn_Print.Enabled := false;
  self.Show_Report(2);
  self.oBtn_Print.Enabled := true;
end;

procedure TfGen_Scrn_Prn.Show_Report(nOption: integer);
var
  cFilePDF, sFileRep, cPath: string;
  cSql_Ln: widestring;
begin
  reportes.Initialize;

  if (bPrintToFile = true) then
  begin
    cPath := ExtractFilePath(Application.ExeName);
    cFilePDF := cPath + 'Adjuntos\' + futilesV20.CreateUniqueFileName(cPath + 'Adjuntos') + '.PDF';
    reportes.ExpotrPDF.IS_Active := true;
    reportes.ExpotrPDF.PDF_Name := cFilePDF;
  end;

  FormatSettings.ShortDateFormat := 'yyyy-mm-dd';

  sFileRep := UtilesV20.sPathReports + '\Formulario_01.fr3';

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT ';
  cSql_Ln := cSql_Ln + '	clientes.id_cliente, ';
  cSql_Ln := cSql_Ln + '	clientes.nombre             AS Nombre, ';
  cSql_Ln := cSql_Ln + '	clientes.apellido           AS apellido, ';
  cSql_Ln := cSql_Ln + '	clientes.identificacion     AS cedula, ';
  cSql_Ln := cSql_Ln + '	clientes.vencimiento_cedula AS fecha_venc_cedula, ';
  cSql_Ln := cSql_Ln + '	clientes.fecha_nacimiento   AS fecha_nacimiento, ';
  cSql_Ln := cSql_Ln + '	clientes.nacionalidad       AS nacionalidad, ';
  cSql_Ln := cSql_Ln + '	clientes.genero             AS sexo, ';
  cSql_Ln := cSql_Ln + '	mant_estados_civiles.estac_descripcion AS estado_civil, ';
  cSql_Ln := cSql_Ln + '	clientes.seguro_social      AS num_ss, ';
  cSql_Ln := cSql_Ln + '	clientes.telefono, ';
  cSql_Ln := cSql_Ln + '	clientes.celular, ';
  cSql_Ln := cSql_Ln + '	mant_niveles_academ.nacad_descripcion AS estudios, ';
  cSql_Ln := cSql_Ln + '	clientes.pasaporte, ';
  cSql_Ln := cSql_Ln + '	clientes.tipo_sangre, ';
  cSql_Ln := cSql_Ln + '	clientes.email, ';
  cSql_Ln := cSql_Ln + '	clientes.fecha_ingreso_cooperativa, ';
  cSql_Ln := cSql_Ln + '	clientes.fecha_reingreso, ';
  cSql_Ln := cSql_Ln + '	clientes.fecha_salida_cooperativa,';
  cSql_Ln := cSql_Ln + '	clientes.nombre_conyuge, ';
  cSql_Ln := cSql_Ln + '	clientes.telefono_conyuge, ';
  cSql_Ln := cSql_Ln + '	paisO.pais_descripcion AS pais_origen, ';
  cSql_Ln := cSql_Ln + '	paisR.pais_descripcion AS pais_recidencia, ';
  cSql_Ln := cSql_Ln + '	mant_provincias.prov_descripcion      AS provincia, ';
  cSql_Ln := cSql_Ln + '	mant_distritos.dist_descripcion       AS distrito, ';
  cSql_Ln := cSql_Ln + '	mant_corregimientos.mantc_descripcion AS correhimiento, ';
  cSql_Ln := cSql_Ln + '	cliente_residencia.barrio, ';
  cSql_Ln := cSql_Ln + '	cliente_residencia.calle, ';
  cSql_Ln := cSql_Ln + '	cliente_residencia.numero_casa, ';
  cSql_Ln := cSql_Ln + '	cliente_residencia.nombre_edificio, ';
  cSql_Ln := cSql_Ln + '	clientes.apartado_postal, ';
  cSql_Ln := cSql_Ln + '	"" AS piso, ';
  cSql_Ln := cSql_Ln + '	mant_tipos_viviendas.tipv_descripcion AS tipo_vivienda, ';
  cSql_Ln := cSql_Ln + '	IF(clientes.ciudadano_americano=0 ,"NO","SI") AS ciudadano_americano, ';
  cSql_Ln := cSql_Ln + '	IF(clientes.doble_nacional=0      ,"NO","SI") AS doble_nacionalidad, ';
  cSql_Ln := cSql_Ln + '	IF(clientes.viaja_frecuente=0     ,"NO","SI") AS viaja_a_estadosunidos, ';
  cSql_Ln := cSql_Ln + '	IF(clientes.nacio_eeuu=0          ,"NO","SI") AS nacio_eeuu, ';
  cSql_Ln := cSql_Ln + '	IF(clientes.pasaporte_eeuu=0      ,"NO","SI") AS pasaporte_eeuu, ';
  cSql_Ln := cSql_Ln + '	IF(clientes.tarjeta_eeuu=0        ,"NO","SI") AS tarjeta_eeuu, ';
  cSql_Ln := cSql_Ln + '	IF(clientes.otra_nacionalidad=0   ,"NO","SI") AS otra_nacionalidad, ';
  cSql_Ln := cSql_Ln + '	IF(clientes.reside_eeuu=0         ,"NO","SI") AS reside_eeuu, ';
  cSql_Ln := cSql_Ln + '	IF(IFNULL(rsg_op_int.codigo_factores_riesgo,"")="","NO","SI") AS op_int, ';
  cSql_Ln := cSql_Ln + '	IF(IFNULL(rsg_op_gob.codigo_factores_riesgo,"")="","NO","SI") AS op_gob, ';
  cSql_Ln := cSql_Ln + '	IF(IFNULL(clientes.pep_sujeto  ,0)=0,"NO","SI") AS es_pep, ';
  cSql_Ln := cSql_Ln + '	clientes.pep_cargo, ';
  cSql_Ln := cSql_Ln + '	clientes.pep_fecha_fin, ';
  cSql_Ln := cSql_Ln + '	IF(IFNULL(clientes.pep_relacion,0)=0,"NO","SI") AS re_pep, ';
  cSql_Ln := cSql_Ln + '	clientes.pep_relacion_tipo, ';
  cSql_Ln := cSql_Ln + '	clientes.pep_relacion_cargo, ';
  cSql_Ln := cSql_Ln + '	IF(IFNULL(rsg_fn_ter.codigo_factores_riesgo,"")="","NO","SI") AS fo_ter ';
  cSql_Ln := cSql_Ln + 'FROM clientes ';
  cSql_Ln := cSql_Ln + 'LEFT JOIN mant_paises paisO    ON (clientes.id_pais = paisO.pais_id_pais) ';
  cSql_Ln := cSql_Ln + 'LEFT JOIN mant_paises paisR    ON (clientes.id_res_fiscal = paisR.pais_id_pais) ';
  cSql_Ln := cSql_Ln + 'LEFT JOIN mant_estados_civiles ON (clientes.id_estado_civil  = mant_estados_civiles.estac_id) ';
  cSql_Ln := cSql_Ln + 'LEFT JOIN mant_niveles_academ  ON (clientes.id_nivel_estudios= mant_niveles_academ.nacad_id) ';
  cSql_Ln := cSql_Ln + 'LEFT JOIN cliente_residencia   ON (clientes.id_cliente       = cliente_residencia.id_cliente) ';
  cSql_Ln := cSql_Ln + 'LEFT JOIN mant_provincias      ON (cliente_residencia.id_provincia = mant_provincias.prov_id) ';
  cSql_Ln := cSql_Ln + 'LEFT JOIN mant_distritos       ON (cliente_residencia.id_distrito  = mant_distritos.dist_id) ';
  cSql_Ln := cSql_Ln + 'LEFT JOIN mant_corregimientos  ON (cliente_residencia.id_corregimiento = mant_corregimientos.mantc_id) ';
  cSql_Ln := cSql_Ln + 'LEFT JOIN mant_tipos_viviendas ON (cliente_residencia.id_tipo_vivienda = mant_tipos_viviendas.tipv_id) ';
  cSql_Ln := cSql_Ln + 'LEFT JOIN cliente_factores_riesgo rsg_op_int ON (clientes.id_cliente=rsg_op_int.id_cliente) AND (rsg_op_int.codigo_factores_riesgo="RC01") ';
  cSql_Ln := cSql_Ln + 'LEFT JOIN cliente_factores_riesgo rsg_op_gob ON (clientes.id_cliente=rsg_op_gob.id_cliente) AND (rsg_op_gob.codigo_factores_riesgo="RC02") ';
  cSql_Ln := cSql_Ln + 'LEFT JOIN cliente_impacto      ON (clientes.id_cliente=cliente_impacto.id_cliente) ';
  cSql_Ln := cSql_Ln + 'LEFT JOIN cliente_factores_riesgo rsg_fn_ter ON (clientes.id_cliente=rsg_fn_ter.id_cliente) AND (rsg_fn_ter.codigo_factores_riesgo="RC05") ';
  cSql_Ln := cSql_Ln + 'WHERE clientes.id_cliente="' + self.cCod_Cte + '" ';

  reportes.Report.File_Name := sFileRep;

  futilesV20.LogToFile(cSql_Ln, ExcludeTrailingBackslash(ExtractFilePath(Application.ExeName)) + '\debug_sql_log.txt');

  reportes.Queries[1].active := true;
  reportes.Queries[1].AssignDataset := false;
  reportes.Queries[1].DB_DSName := 'Info_Cliente';
  reportes.Queries[1].Sql_IsProcedure := false;
  reportes.Queries[1].Sql_ExecNoOpen := false;
  reportes.Queries[1].Sql_String := cSql_Ln;

  cSql_Ln := 'SELECT * FROM cliente_dependientes WHERE id_cliente="' + self.cCod_Cte + '" AND es_beneficiario=0';
  futilesV20.LogToFile(cSql_Ln, ExcludeTrailingBackslash(ExtractFilePath(Application.ExeName)) + '\debug_sql_log.txt');
  reportes.Queries[2].active := true;
  reportes.Queries[2].AssignDataset := false;
  reportes.Queries[2].DB_DSName := 'Info_Depen';
  reportes.Queries[2].Sql_IsProcedure := false;
  reportes.Queries[2].Sql_ExecNoOpen := false;
  reportes.Queries[2].Sql_String := cSql_Ln;

  cSql_Ln := 'SELECT * FROM cliente_dependientes WHERE id_cliente="' + self.cCod_Cte + '" AND es_beneficiario=1';
  futilesV20.LogToFile(cSql_Ln, ExcludeTrailingBackslash(ExtractFilePath(Application.ExeName)) + '\debug_sql_log.txt');
  reportes.Queries[3].active := true;
  reportes.Queries[3].AssignDataset := false;
  reportes.Queries[3].DB_DSName := 'Info_Venef';
  reportes.Queries[3].Sql_IsProcedure := false;
  reportes.Queries[3].Sql_ExecNoOpen := false;
  reportes.Queries[3].Sql_String := cSql_Ln;

  cSql_Ln := 'SELECT * FROM cliente_residencia WHERE id_cliente="' + self.cCod_Cte + '"';
  futilesV20.LogToFile(cSql_Ln, ExcludeTrailingBackslash(ExtractFilePath(Application.ExeName)) + '\debug_sql_log.txt');
  reportes.Queries[4].active := true;
  reportes.Queries[4].AssignDataset := false;
  reportes.Queries[4].DB_DSName := 'Info_Recide';
  reportes.Queries[4].Sql_IsProcedure := false;
  reportes.Queries[4].Sql_ExecNoOpen := false;
  reportes.Queries[4].Sql_String := cSql_Ln;

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT ';
  cSql_Ln := cSql_Ln + '	il.id_cliente, ';
  cSql_Ln := cSql_Ln + '	il.id_cliente 			  AS empr_cod_cte, ';
  cSql_Ln := cSql_Ln + '	te.tipem_descripcion  AS empr_tipo_empleado, ';
  cSql_Ln := cSql_Ln + '	il.profesion			    AS empr_profesion, ';
  cSql_Ln := cSql_Ln + '	ae1.activ_descripcion AS ctes_act_economica, ';
  cSql_Ln := cSql_Ln + '	ae2.activ_descripcion AS empr_act_economica, ';
  cSql_Ln := cSql_Ln + '	il.nombre_empresa 	  AS empr_nomb, ';
  cSql_Ln := cSql_Ln + '	il.direccion 			    AS empr_dire, ';
  cSql_Ln := cSql_Ln + '	il.telefono				    AS empr_tele, ';
  cSql_Ln := cSql_Ln + '	il.fax					      AS empr_fax, ';
  cSql_Ln := cSql_Ln + '	il.email_empresa		  AS empr_corr, ';
  cSql_Ln := cSql_Ln + '	tp.tplan_descripcion 	AS empr_planilla, ';
  cSql_Ln := cSql_Ln + '	il.seccion				    AS empr_seccion, ';
  cSql_Ln := cSql_Ln + '	il.cargo					    AS empr_cargo, ';
  cSql_Ln := cSql_Ln + '	il.fecha_ingreso		  AS empr_fecha_ingreso, ';
  cSql_Ln := cSql_Ln + '	il.digito_verificador AS empr_dv, ';
  cSql_Ln := cSql_Ln + '	el.cteest_descripcion AS cte_estado_laboral ';
  cSql_Ln := cSql_Ln + 'FROM cliente_info_laboral il ';
  cSql_Ln := cSql_Ln + 'LEFT JOIN mant_tipos_empleados te  ON (il.id_tipo_empleado		        = te.tipem_id) ';
  cSql_Ln := cSql_Ln + 'LEFT JOIN mant_actividad_econ  ae1 ON (il.id_actividad_economica      = ae1.activ_id) ';
  cSql_Ln := cSql_Ln + 'LEFT JOIN mant_actividad_econ  ae2 ON (il.empresa_actividad_economica = ae2.activ_id) ';
  cSql_Ln := cSql_Ln + 'LEFT JOIN mant_tipo_planillas  tp  ON (il.id_tipo_planilla		        = tp.tplan_id) ';
  cSql_Ln := cSql_Ln + 'LEFT JOIN mant_clientes_estados_laboral el  ON (il.id_estado_laboral	= el.cteest_id) ';
  cSql_Ln := cSql_Ln + 'WHERE il.id_cliente="' + self.cCod_Cte + '"';
  futilesV20.LogToFile(cSql_Ln, ExcludeTrailingBackslash(ExtractFilePath(Application.ExeName)) + '\debug_sql_log.txt');

  reportes.Queries[5].active := true;
  reportes.Queries[5].AssignDataset := false;
  reportes.Queries[5].DB_DSName := 'Info_Laboral';
  reportes.Queries[5].Sql_IsProcedure := false;
  reportes.Queries[5].Sql_ExecNoOpen := false;
  reportes.Queries[5].Sql_String := cSql_Ln;

  cSql_Ln := 'SELECT * FROM cliente_origen_ingresos WHERE id_cliente="' + self.cCod_Cte + '"';
  reportes.Queries[6].active := true;
  reportes.Queries[6].AssignDataset := false;
  reportes.Queries[6].DB_DSName := 'Info_Financ';
  reportes.Queries[6].Sql_IsProcedure := false;
  reportes.Queries[6].Sql_ExecNoOpen := false;
  reportes.Queries[6].Sql_String := cSql_Ln;
  futilesV20.LogToFile(cSql_Ln, ExcludeTrailingBackslash(ExtractFilePath(Application.ExeName)) + '\debug_sql_log.txt');

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT ';
  cSql_Ln := cSql_Ln + '	tt.ttnombre,fp.fpnombre,ct.* ';
  cSql_Ln := cSql_Ln + 'FROM cliente_transacciones ct ';
  cSql_Ln := cSql_Ln + 'LEFT JOIN mant_tipo_trans tt ON (ct.cod_tipo_tran = tt.ttcodigo) ';
  cSql_Ln := cSql_Ln + 'LEFT JOIN mant_frec_pagos fp ON (ct.cod_freq      = fp.fpcodigo) ';
  cSql_Ln := cSql_Ln + 'WHERE ct.id_cliente="' + self.cCod_Cte + '"';
  futilesV20.LogToFile(cSql_Ln, ExcludeTrailingBackslash(ExtractFilePath(Application.ExeName)) + '\debug_sql_log.txt');

  reportes.Queries[7].active := true;
  reportes.Queries[7].AssignDataset := false;
  reportes.Queries[7].DB_DSName := 'Info_Transac';
  reportes.Queries[7].Sql_IsProcedure := false;
  reportes.Queries[7].Sql_ExecNoOpen := false;
  reportes.Queries[7].Sql_String := cSql_Ln;

  cSql_Ln := 'SELECT * FROM cliente_origen_fondos WHERE ofon_id_cliente="' + self.cCod_Cte + '"';
  futilesV20.LogToFile(cSql_Ln, ExcludeTrailingBackslash(ExtractFilePath(Application.ExeName)) + '\debug_sql_log.txt');
  reportes.Queries[8].active := true;
  reportes.Queries[8].AssignDataset := false;
  reportes.Queries[8].DB_DSName := 'Info_patrimon';
  reportes.Queries[8].Sql_IsProcedure := false;
  reportes.Queries[8].Sql_ExecNoOpen := false;
  reportes.Queries[8].Sql_String := cSql_Ln;

  cSql_Ln := 'SELECT * FROM cliente_referencias WHERE id_cliente="' + self.cCod_Cte + '" AND tipo=2 ';
  futilesV20.LogToFile(cSql_Ln, ExcludeTrailingBackslash(ExtractFilePath(Application.ExeName)) + '\debug_sql_log.txt');
  reportes.Queries[9].active := true;
  reportes.Queries[9].AssignDataset := false;
  reportes.Queries[9].DB_DSName := 'Info_Refer_PE';
  reportes.Queries[9].Sql_IsProcedure := false;
  reportes.Queries[9].Sql_ExecNoOpen := false;
  reportes.Queries[9].Sql_String := cSql_Ln;

  cSql_Ln := 'SELECT * FROM cliente_referencias WHERE id_cliente="' + self.cCod_Cte + '" AND tipo=1 ';
  futilesV20.LogToFile(cSql_Ln, ExcludeTrailingBackslash(ExtractFilePath(Application.ExeName)) + '\debug_sql_log.txt');
  reportes.Queries[10].active := true;
  reportes.Queries[10].AssignDataset := false;
  reportes.Queries[10].DB_DSName := 'Info_Refer_CO';
  reportes.Queries[10].Sql_IsProcedure := false;
  reportes.Queries[10].Sql_ExecNoOpen := false;
  reportes.Queries[10].Sql_String := cSql_Ln;

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT ';
  cSql_Ln := cSql_Ln + '  rb.*, ';
  cSql_Ln := cSql_Ln + '  ba.banc_descripcion ';
  cSql_Ln := cSql_Ln + 'FROM cliente_referencias_bancarias rb ';
  cSql_Ln := cSql_Ln + 'LEFT JOIN mant_bancos ba ON rb.id_banco= ba.banc_id ';
  cSql_Ln := cSql_Ln + 'WHERE id_cliente="' + self.cCod_Cte + '"';
  futilesV20.LogToFile(cSql_Ln, ExcludeTrailingBackslash(ExtractFilePath(Application.ExeName)) + '\debug_sql_log.txt');

  reportes.Queries[11].active := true;
  reportes.Queries[11].AssignDataset := false;
  reportes.Queries[11].DB_DSName := 'Info_Refer_BA';
  reportes.Queries[11].Sql_IsProcedure := false;
  reportes.Queries[11].Sql_ExecNoOpen := false;
  reportes.Queries[11].Sql_String := cSql_Ln;

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT ';
  cSql_Ln := cSql_Ln + '  cd.*, ';
  cSql_Ln := cSql_Ln + '  td.desc_nombre AS Nom_Tipo_Desc, ';
  cSql_Ln := cSql_Ln + '  fp.fpnombre		AS Nom_Freq_Desc ';
  cSql_Ln := cSql_Ln + '  FROM cliente_descuentos cd ';
  cSql_Ln := cSql_Ln + '  LEFT JOIN mant_frec_pagos 		fp ON cd.freq_descuento= fp.fpcodigo ';
  cSql_Ln := cSql_Ln + '  LEFT JOIN mant_tipo_descuento td ON cd.tipo_descuento= td.desc_codigo ';
  cSql_Ln := cSql_Ln + 'WHERE id_cliente="' + self.cCod_Cte + '"';
  cSql_Ln := cSql_Ln + '  ORDER BY cd.autoin ';
  futilesV20.LogToFile(cSql_Ln, ExcludeTrailingBackslash(ExtractFilePath(Application.ExeName)) + '\debug_sql_log.txt');

  reportes.Queries[12].active := true;
  reportes.Queries[12].AssignDataset := false;
  reportes.Queries[12].DB_DSName := 'Info_Descu_AU';
  reportes.Queries[12].Sql_IsProcedure := false;
  reportes.Queries[12].Sql_ExecNoOpen := false;
  reportes.Queries[12].Sql_String := cSql_Ln;

  reportes.Report.OutOption := nOption;
  reportes.Prepare;

  reportes.Make_report;
  reportes.Clear_all;
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
end;

end.
