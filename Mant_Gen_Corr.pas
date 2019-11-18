unit Mant_Gen_Corr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons, PngBitBtn, Vcl.DBCtrls, DBCtrlsEh, Vcl.ExtCtrls,
  PlannerCal,
  DBPlannerCal, Vcl.Mask, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ComCtrls, FireDAC.Stan.StorageBin, DBLookupEh;

type
  TfMant_Gen_Corr = class(TForm)
    PageControl1: TPageControl;
    oTabMant: TTabSheet;
    Label5: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    omantc_inactivo: TDBCheckBox;
    omantc_descripcion: TDBEdit;
    omantc_id: TDBEdit;
    oTabAudit: TTabSheet;
    Label16: TLabel;
    Label32: TLabel;
    Label17: TLabel;
    Label33: TLabel;
    omantc_fecha_alta: TDBDateTimeEditEh;
    omantc_usuario_alta: TDBEdit;
    omantc_fecha_modif: TDBDateTimeEditEh;
    omantc_usuario_modif: TDBEdit;
    oBtnExit: TPngBitBtn;
    oBtnAbort: TPngBitBtn;
    oBtnSave: TPngBitBtn;
    oBtnDelete: TPngBitBtn;
    oBtnEdit: TPngBitBtn;
    oBtnNew: TPngBitBtn;
    StatusBar1: TStatusBar;
    oBtnFind: TPngBitBtn;
    oLst_Dist: TDBLookupComboboxEh;
    oDs_Pais: TDataSource;
    oQry_Pais: TFDQuery;
    oDs_Prov: TDataSource;
    oQry_Prov: TFDQuery;
    oDs_Dist: TDataSource;
    oQry_Dist: TFDQuery;
    oDs_Corr: TDataSource;
    oQry_Corr: TFDQuery;
    Label4: TLabel;
    oLst_pais: TDBLookupComboboxEh;
    Label1: TLabel;
    oLst_Prov: TDBLookupComboboxEh;
    FDConnection1: TFDConnection;
    procedure oBtnNewClick(Sender: TObject);
    procedure oBtnEditClick(Sender: TObject);
    procedure oBtnDeleteClick(Sender: TObject);
    procedure oBtnExitClick(Sender: TObject);
    procedure oBtnSaveClick(Sender: TObject);
    procedure oBtnAbortClick(Sender: TObject);
    procedure Activa_Objetos(bFlag: boolean);
    procedure Action_Control(pOption: integer);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure oBtnFindClick(Sender: TObject);
    procedure Buscar_Pais(cCod_Pais: string);
    procedure Buscar_Prov(cCod_Pais: string; cCod_Prov: string);
    procedure Buscar_Dist(cCod_Pais: string; cCod_Prov: string; cCod_Dist: string);
    procedure Buscar_Corr(cCod_Dist: string; cCod_Corr: string; bFirts: boolean = false);
  private
    iOption: integer;
    cId_Pais: string;
    cId_Prov: string;
    cId_Ditr: string;
    cId_Corr: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMant_Gen_Corr: TfMant_Gen_Corr;

implementation

uses utilesv20, Mant_Gen_Prov, BuscarGenM5;
{$R *.dfm}

procedure TfMant_Gen_Corr.oBtnAbortClick(Sender: TObject);
begin
  self.oQry_Corr.Cancel;
  self.Action_Control(7);
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
  self.iOption := 0;

  self.cId_Ditr := self.oQry_Corr.FieldByName('mantc_distr_id').AsString;
  self.cId_Pais := self.oQry_Corr.FieldByName('mantc_pais_id').AsString;
  self.cId_Prov := self.oQry_Corr.FieldByName('mantc_prov_id').AsString;

  self.oLst_pais.KeyValue := self.cId_Pais;
  self.oLst_Prov.KeyValue := self.cId_Prov;
  self.oLst_Dist.KeyValue := self.cId_Ditr;
end;

procedure TfMant_Gen_Corr.oBtnDeleteClick(Sender: TObject);
var
  nResp: integer;
begin
  if self.oQry_Corr.isEmpty then
  begin
    self.Action_Control(6);
    self.iOption := 0;
    exit;
  end;
  self.Action_Control(3);
  nResp := MessageDlg('Seguro que desea borrar eliminar el registro alctual?', mtConfirmation, [mbYes, mbNo], 0);
  If (nResp = mrYes) Then
  begin
    self.oQry_Corr.Delete;
    self.oQry_Corr.Refresh;
  end;
  self.PageControl1.ActivePageIndex := 0;
  self.iOption := 0;
end;

procedure TfMant_Gen_Corr.oBtnEditClick(Sender: TObject);
begin
  if self.oQry_Corr.isEmpty then
  begin
    self.Action_Control(6);
    exit;
  end;
  self.iOption := 2;
  self.PageControl1.ActivePageIndex := 0;
  self.oQry_Corr.Edit;

  self.cId_Ditr := self.oQry_Corr.FieldByName('mantc_distr_id').AsString;
  self.cId_Pais := self.oQry_Corr.FieldByName('mantc_pais_id').AsString;
  self.cId_Prov := self.oQry_Corr.FieldByName('mantc_prov_id').AsString;

  self.oLst_pais.KeyValue := self.cId_Pais;
  self.oLst_Prov.KeyValue := self.cId_Prov;
  self.oLst_Dist.KeyValue := self.cId_Ditr;

  self.Action_Control(2);
  self.Activa_Objetos(true);
  self.omantc_descripcion.SetFocus;
  // self.otgen_correg.IndexName := 'prov_nombre';
end;

procedure TfMant_Gen_Corr.oBtnExitClick(Sender: TObject);
begin
  self.close;
end;

procedure TfMant_Gen_Corr.oBtnFindClick(Sender: TObject);
var
  cSql_Ln: string;
begin
  self.Action_Control(4);

  Application.CreateForm(TfBuscarGenM5, fBuscarGenM5);

  fBuscarGenM5.Hide;
  fBuscarGenM5.oLst_campos.Clear;

  BuscarGenM5.oListData[1].Texto := 'Código';
  BuscarGenM5.oListData[1].Campo := 'mantc_id';
  BuscarGenM5.oListData[1].LLave := true;

  BuscarGenM5.oListData[2].Texto := 'Nombre';
  BuscarGenM5.oListData[2].Campo := 'mantc_descripcion';
  BuscarGenM5.oListData[2].LLave := false;

  BuscarGenM5.oListData[3].Texto := 'Inactivo';
  BuscarGenM5.oListData[3].Campo := 'Inactivo';
  BuscarGenM5.oListData[3].LLave := false;

  fBuscarGenM5.oSql1.Clear;
  fBuscarGenM5.oSql1.Lines.Add
    ('SELECT mantc_id, UCASE(mantc_descripcion) AS mantc_descripcion, IF(mantc_inactivo=1,"SI","NO") AS Inactivo, mantc_distr_id FROM mant_corregimientos WHERE 1=1 ');

  // ****************************************************************************/
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT pais_id_pais, UCASE(pais_descripcion) AS pais_descripcion ';
  cSql_Ln := cSql_Ln + 'FROM mant_paises ';
  cSql_Ln := cSql_Ln + 'ORDER BY UCASE(pais_descripcion)';

  fBuscarGenM5.oLabel_List1.Caption := 'LISTA DE PAISES';
  fBuscarGenM5.cLst1_Val_Def := '136';
  fBuscarGenM5.cLst1_Key_Fld := 'pais_id_pais';
  fBuscarGenM5.cLst1_Lst_Fld := 'pais_descripcion';
  fBuscarGenM5.cLst1_Sql_Cmd := cSql_Ln;
  fBuscarGenM5.cLst1_Where_Fld := 'mantc_pais_id';
  // ****************************************************************************/

  // ****************************************************************************/
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT prov_id, UCASE(prov_descripcion) AS prov_descripcion, prov_id_pais ';
  cSql_Ln := cSql_Ln + 'FROM mant_provincias ';
  cSql_Ln := cSql_Ln + 'ORDER BY UCASE(prov_descripcion)';

  fBuscarGenM5.oLabel_List2.Caption := 'LISTA DE PROVINCIAS';
  fBuscarGenM5.cLst2_Val_Def := '8';
  fBuscarGenM5.cLst2_Key_Fld := 'prov_id';
  fBuscarGenM5.cLst2_Lst_Fld := 'prov_descripcion';
  fBuscarGenM5.cLst2_Sql_Cmd := cSql_Ln;
  fBuscarGenM5.cLst2_Where_Fld := 'mantc_prov_id';

  fBuscarGenM5.cLst2_Fld_Mas := 'prov_id_pais';
  // ****************************************************************************/

  // ****************************************************************************/
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT dist_id, UCASE(dist_descripcion) AS dist_descripcion, dist_pais_id, dist_prov_id ';
  cSql_Ln := cSql_Ln + 'FROM mant_distritos ';
  cSql_Ln := cSql_Ln + 'ORDER BY UCASE(dist_descripcion)';

  fBuscarGenM5.oLabel_List3.Caption := 'LISTA DE DISTRITOS';
  fBuscarGenM5.cLst3_Val_Def := '8';
  fBuscarGenM5.cLst3_Key_Fld := 'dist_id';
  fBuscarGenM5.cLst3_Lst_Fld := 'dist_descripcion';
  fBuscarGenM5.cLst3_Sql_Cmd := cSql_Ln;
  fBuscarGenM5.cLst3_Where_Fld := 'mantc_distr_id';

  fBuscarGenM5.cLst3_Fld_Mas := 'dist_prov_id';
  // ****************************************************************************/

  fBuscarGenM5.ShowModal;
  if BuscarGenM5.vFindResult <> '' then
  begin
    self.cId_Pais := fBuscarGenM5.oLst_List1.KeyValue;
    self.cId_Prov := fBuscarGenM5.oLst_List2.KeyValue;
    self.cId_Ditr := fBuscarGenM5.oLst_List3.KeyValue;
    self.cId_Corr := BuscarGenM5.vFindResult;

    self.Buscar_Corr(self.cId_Ditr, self.cId_Corr);

    self.Buscar_Pais(self.cId_Pais);
    self.Buscar_Prov(self.cId_Pais, self.cId_Prov);
    self.Buscar_Dist(self.cId_Pais, self.cId_Prov, self.cId_Ditr);
  end;
  freeandnil(fBuscarGenM5);
  self.PageControl1.ActivePageIndex := 0;
  self.iOption := 0;

  self.cId_Ditr := self.oQry_Corr.FieldByName('mantc_distr_id').AsString;
  self.cId_Pais := self.oQry_Corr.FieldByName('mantc_pais_id').AsString;
  self.cId_Prov := self.oQry_Corr.FieldByName('mantc_prov_id').AsString;

  self.oLst_pais.KeyValue := self.cId_Pais;
  self.oLst_Prov.KeyValue := self.cId_Prov;
  self.oLst_Dist.KeyValue := self.cId_Ditr;
end;

procedure TfMant_Gen_Corr.oBtnNewClick(Sender: TObject);
var
  cNext: string;
begin
  self.iOption := 1;
  self.PageControl1.ActivePageIndex := 0;
  self.oQry_Corr.Insert;
  self.omantc_inactivo.Checked := false;
  self.Action_Control(1);
  self.Activa_Objetos(true);
  self.oQry_Corr.FieldByName('mantc_inactivo').Value := 0;
  self.oQry_Corr.FieldByName('mantc_pais_id').AsString := '01';
  self.oQry_Corr.FieldByName('mantc_prov_id').AsString := '01';

  self.omantc_descripcion.SetFocus;

  cNext := futilesv20.query_selectgen_result('SELECT IFNULL(num_corr,0)+1 AS num_corr FROM mant_secuenc_docs LIMIT 1');
  self.oQry_Corr.FieldByName('mantc_id').AsString := futilesv20.PadL(trim(cNext), 3, '0');
  // self.otgen_provin.IndexName := 'prov_nombre';
end;

procedure TfMant_Gen_Corr.oBtnSaveClick(Sender: TObject);
var
  cNext: string;
begin
  if (self.iOption = 1) then
  begin
    cNext := futilesv20.query_selectgen_result('SELECT IFNULL(num_corr,0)+1 AS num_corr FROM mant_secuenc_docs LIMIT 1');
    self.oQry_Corr.FieldByName('mantc_id').AsString := futilesv20.PadL(trim(cNext), 3, '0');

    utilesv20.Execute_SQL_Command('UPDATE mant_secuenc_docs SET num_corr=IFNULL(num_corr,0)+1 WHERE 1=1');
  end;

  if (self.oQry_Corr.State = dsedit) then
  begin
    self.oQry_Corr.FieldByName('mantc_usuario_modif').AsString := utilesv20.sUserName;
    self.oQry_Corr.FieldByName('mantc_fecha_modif').Value := now();
  end
  else if (self.oQry_Corr.State = dsInsert) then
  begin
    self.oQry_Corr.FieldByName('mantc_usuario_alta').AsString := utilesv20.sUserName;
    self.oQry_Corr.FieldByName('mantc_fecha_alta').Value := now();
  end;

  if self.oQry_Corr.State in [dsedit, dsInsert] then
  begin
    if futilesv20.isEmpty(self.oQry_Corr.FieldByName('mantc_descripcion').AsString) then
    begin
      ShowMessage('Debe especificar la descripción ara continuar.');
      self.PageControl1.TabIndex := 0;
      self.omantc_descripcion.SetFocus;
      abort;
    end;

  end;

  self.oQry_Corr.FieldByName('mantc_pais_id').AsString := self.oLst_pais.KeyValue;
  self.oQry_Corr.FieldByName('mantc_prov_id').AsString := self.oLst_Prov.KeyValue;
  self.oQry_Corr.FieldByName('mantc_distr_id').AsString := self.oLst_Dist.KeyValue;

  self.oQry_Corr.Post;
  // self.otgen_provin.IndexName := 'prov_codigo';
  self.oQry_Corr.Refresh;
  self.Action_Control(6);
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
  self.iOption := 0;

  self.cId_Ditr := self.oQry_Corr.FieldByName('mantc_distr_id').AsString;
  self.cId_Pais := self.oQry_Corr.FieldByName('mantc_pais_id').AsString;
  self.cId_Prov := self.oQry_Corr.FieldByName('mantc_prov_id').AsString;

  self.oLst_pais.KeyValue := self.cId_Pais;
  self.oLst_Prov.KeyValue := self.cId_Prov;
  self.oLst_Dist.KeyValue := self.cId_Ditr;
end;

procedure TfMant_Gen_Corr.Action_Control(pOption: integer);
begin
  if ((pOption = 1) or (pOption = 2)) then
  begin
    oBtnNew.Visible := false;
    oBtnEdit.Visible := false;
    oBtnDelete.Visible := false;
    oBtnFind.Visible := false;
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
    oBtnNew.Visible := true;
    oBtnEdit.Visible := true;
    oBtnDelete.Visible := true;
    oBtnFind.Visible := true;
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

procedure TfMant_Gen_Corr.Activa_Objetos(bFlag: boolean);
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

  end;
end;

procedure TfMant_Gen_Corr.FormCreate(Sender: TObject);
begin
  self.iOption := 0;
  // self.ResizeKit1.Enabled := utiles.Ctrl_Resize;
  freeandnil(FDConnection1);
  self.PageControl1.ActivePageIndex := 0;

  self.oQry_Pais.Connection := futilesv20.oPublicCnn;
  self.oQry_Prov.Connection := futilesv20.oPublicCnn;
  self.oQry_Dist.Connection := futilesv20.oPublicCnn;
  self.oQry_Corr.Connection := futilesv20.oPublicCnn;

  self.Buscar_Corr('%', '%', true);
  self.cId_Ditr := self.oQry_Corr.FieldByName('mantc_distr_id').AsString;

  self.cId_Pais := self.oQry_Corr.FieldByName('mantc_pais_id').AsString;
  self.cId_Prov := self.oQry_Corr.FieldByName('mantc_prov_id').AsString;

  self.Buscar_Pais(self.cId_Pais);
  self.Buscar_Prov(self.cId_Pais, '%');
  self.Buscar_Dist(self.cId_Pais, self.cId_Prov, '%');

  self.oLst_pais.KeyValue := self.cId_Pais;
  self.oLst_Prov.KeyValue := self.cId_Prov;
  self.oLst_Dist.KeyValue := self.cId_Ditr;
end;

procedure TfMant_Gen_Corr.FormShow(Sender: TObject);
begin
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
end;

procedure TfMant_Gen_Corr.Buscar_Pais(cCod_Pais: string);
var
  cSql_Ln: string;
begin
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT pais_id_pais,UCASE(pais_descripcion) as pais_descripcion ';
  cSql_Ln := cSql_Ln + 'FROM mant_paises ';
  cSql_Ln := cSql_Ln + 'ORDER BY UCASE(pais_descripcion) ';

  self.oQry_Pais.close();
  self.oQry_Pais.Connection := futilesv20.oPublicCnn;
  self.oQry_Pais.SQL.Clear;
  self.oQry_Pais.SQL.Text := cSql_Ln;
  self.oQry_Pais.Open();
  self.oDs_Pais.Enabled := true;

  if NOT((trim(cCod_Pais) = '') or (trim(cCod_Pais) = '%')) then
    self.oLst_pais.KeyValue := cCod_Pais;
end;

procedure TfMant_Gen_Corr.Buscar_Prov(cCod_Pais: string; cCod_Prov: string);
var
  cSql_Ln: string;
begin
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT prov_id, UCASE(prov_descripcion) AS prov_descripcion ';
  cSql_Ln := cSql_Ln + 'FROM mant_provincias ';
  cSql_Ln := cSql_Ln + 'WHERE prov_id_pais="' + trim(cCod_Pais) + '" ';
  cSql_Ln := cSql_Ln + 'ORDER BY UCASE(prov_descripcion) ';

  self.oQry_Prov.close();
  self.oQry_Prov.Connection := futilesv20.oPublicCnn;
  self.oQry_Prov.SQL.Clear;
  self.oQry_Prov.SQL.Text := cSql_Ln;
  self.oQry_Prov.Open();
  self.oDs_Prov.Enabled := true;

  if NOT((trim(cCod_Prov) = '') or (trim(cCod_Prov) = '%')) then
    self.oLst_Prov.KeyValue := cCod_Prov;
end;

procedure TfMant_Gen_Corr.Buscar_Dist(cCod_Pais: string; cCod_Prov: string; cCod_Dist: string);
var
  cSql_Ln: string;
begin
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT * ';
  cSql_Ln := cSql_Ln + 'FROM mant_distritos ';
  cSql_Ln := cSql_Ln + 'WHERE (dist_pais_id="' + trim(cCod_Pais) + '") ';
  cSql_Ln := cSql_Ln + 'AND   (dist_prov_id="' + trim(cCod_Prov) + '") ';
  cSql_Ln := cSql_Ln + 'ORDER BY UCASE(dist_descripcion) ';

  self.oQry_Dist.close();
  self.oQry_Dist.Connection := futilesv20.oPublicCnn;
  self.oQry_Dist.SQL.Clear;
  self.oQry_Dist.SQL.Text := cSql_Ln;
  self.oQry_Dist.Open();
  self.oDs_Dist.Enabled := true;

  if NOT((trim(cCod_Dist) = '') or (trim(cCod_Dist) = '%')) then
    self.oLst_Dist.KeyValue := cCod_Dist;
end;

procedure TfMant_Gen_Corr.Buscar_Corr(cCod_Dist: string; cCod_Corr: string; bFirts: boolean = false);
var
  cSql_Ln: string;
begin
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT * ';
  cSql_Ln := cSql_Ln + 'FROM mant_corregimientos ';
  if (bFirts = false) then
  begin
    cSql_Ln := cSql_Ln + 'WHERE (mantc_distr_id="' + trim(cCod_Dist) + '") ';
    if not((cCod_Corr = '') or (cCod_Corr = '%')) then
      cSql_Ln := cSql_Ln + 'AND (mantc_id="' + trim(cCod_Corr) + '") ';
  end
  else
    cSql_Ln := cSql_Ln + 'ORDER BY UCASE(mantc_descripcion) LIMIT 1';

  self.oQry_Corr.close();
  self.oQry_Corr.Connection := futilesv20.oPublicCnn;
  self.oQry_Corr.SQL.Clear;
  self.oQry_Corr.SQL.Text := cSql_Ln;
  self.oQry_Corr.Open();
  self.oDs_Corr.Enabled := true;
end;

end.
