unit Mant_Gen_Dist;

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
  TfMant_Gen_Dist = class(TForm)
    PageControl1: TPageControl;
    oTabMant: TTabSheet;
    Label5: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    odist_inactivo: TDBCheckBox;
    odist_descripcion: TDBEdit;
    odist_id: TDBEdit;
    oTabAudit: TTabSheet;
    Label16: TLabel;
    Label32: TLabel;
    Label17: TLabel;
    Label33: TLabel;
    odec_fecha_alta: TDBDateTimeEditEh;
    odec_usuario_alta: TDBEdit;
    odec_fecha_modif: TDBDateTimeEditEh;
    odec_usuario_modif: TDBEdit;
    oBtnExit: TPngBitBtn;
    oBtnAbort: TPngBitBtn;
    oBtnSave: TPngBitBtn;
    oBtnDelete: TPngBitBtn;
    oBtnEdit: TPngBitBtn;
    oBtnNew: TPngBitBtn;
    StatusBar1: TStatusBar;
    Label2: TLabel;
    oLst_pais: TDBLookupComboboxEh;
    oLst_Prov: TDBLookupComboboxEh;
    oDs_Pais: TDataSource;
    oQry_Pais: TFDQuery;
    oDs_Prov: TDataSource;
    oQry_Prov: TFDQuery;
    FDConnection1: TFDConnection;
    oDs_Dist: TDataSource;
    oQry_Dist: TFDQuery;
    Label4: TLabel;
    oBtnFind: TPngBitBtn;
    odist_riesgo: TDBComboBoxEh;
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
    procedure Buscar_Pais(cCod_Pais: string);
    procedure Buscar_Prov(cCod_Pais: string; cCod_Prov: string);
    procedure Buscar_Dist(cCod_Dist: string; bFirts: boolean = false);
    procedure oBtnFindClick(Sender: TObject);
  private
    iOption: integer;
    cId_Pais: string;
    cId_Prov: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMant_Gen_Dist: TfMant_Gen_Dist;

implementation

uses utilesv20, BuscarGenM4;
{$R *.dfm}

procedure TfMant_Gen_Dist.oBtnAbortClick(Sender: TObject);
begin
  self.oQry_Dist.Cancel;
  self.Action_Control(7);
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
  self.iOption := 0;

  self.cId_Pais := self.oQry_Dist.FieldByName('dist_pais_id').AsString;
  self.cId_Prov := self.oQry_Dist.FieldByName('dist_prov_id').AsString;
  self.Buscar_Pais(self.cId_Pais);
  self.Buscar_Prov(self.cId_Pais, self.cId_Prov);
end;

procedure TfMant_Gen_Dist.oBtnDeleteClick(Sender: TObject);
var
  nResp: integer;
begin
  if self.oQry_Dist.isEmpty then
  begin
    self.Action_Control(6);
    self.iOption := 0;
    exit;
  end;
  self.Action_Control(3);
  nResp := MessageDlg('Seguro que desea borrar eliminar el registro alctual?', mtConfirmation, [mbYes, mbNo], 0);
  If (nResp = mrYes) Then
  begin
    self.oQry_Dist.Delete;
    self.oQry_Dist.Refresh;
  end;
  self.PageControl1.ActivePageIndex := 0;
  self.iOption := 0;
end;

procedure TfMant_Gen_Dist.oBtnEditClick(Sender: TObject);
begin
  if self.oQry_Dist.isEmpty then
  begin
    self.Action_Control(6);
    exit;
  end;
  self.iOption := 2;
  self.PageControl1.ActivePageIndex := 0;
  self.oQry_Dist.Edit;
  self.cId_Pais := self.oQry_Dist.FieldByName('dist_pais_id').AsString;
  self.cId_Prov := self.oQry_Dist.FieldByName('dist_prov_id').AsString;
  self.Buscar_Pais(self.cId_Pais);
  self.Buscar_Prov(self.cId_Pais, self.cId_Prov);

  self.Action_Control(2);
  self.Activa_Objetos(true);
  self.odist_descripcion.SetFocus;
end;

procedure TfMant_Gen_Dist.oBtnExitClick(Sender: TObject);
begin
  self.close;
end;

procedure TfMant_Gen_Dist.oBtnFindClick(Sender: TObject);
var
  cSql_Ln: string;
begin
  self.Action_Control(4);

  Application.CreateForm(TfBuscarGenM4, fBuscarGenM4);

  fBuscarGenM4.Hide;
  fBuscarGenM4.oLst_campos.Clear;

  BuscarGenM4.oListData[1].Texto := 'Código';
  BuscarGenM4.oListData[1].Campo := 'dist_id';
  BuscarGenM4.oListData[1].LLave := true;

  BuscarGenM4.oListData[2].Texto := 'Nombre';
  BuscarGenM4.oListData[2].Campo := 'dist_descripcion';
  BuscarGenM4.oListData[2].LLave := false;

  BuscarGenM4.oListData[3].Texto := 'Inactivo';
  BuscarGenM4.oListData[3].Campo := 'Inactivo';
  BuscarGenM4.oListData[3].LLave := false;

  fBuscarGenM4.oSql1.Clear;
  fBuscarGenM4.oSql1.Lines.Add
    ('SELECT dist_id,UCASE(dist_descripcion) as dist_descripcion, IF(dist_inactivo=1,"SI","NO") AS Inactivo, dist_pais_id, dist_prov_id FROM mant_distritos WHERE 1=1 ');

  // ****************************************************************************/
  fBuscarGenM4.oLabel_List1.Caption := 'LISTA DE PAISES';
  fBuscarGenM4.cLst1_Val_Def := '136';
  fBuscarGenM4.cLst1_Key_Fld := 'pais_id_pais';
  fBuscarGenM4.cLst1_Lst_Fld := 'pais_descripcion';
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT pais_id_pais, UCASE(pais_descripcion) AS pais_descripcion ';
  cSql_Ln := cSql_Ln + 'FROM mant_paises ';
  cSql_Ln := cSql_Ln + 'ORDER BY UCASE(pais_descripcion)';
  fBuscarGenM4.cLst1_Sql_Cmd := cSql_Ln;
  fBuscarGenM4.cLst1_Where_Fld := 'dist_pais_id';
  // ****************************************************************************/

  // ****************************************************************************/
  fBuscarGenM4.oLabel_List2.Caption := 'LISTA DE PROVINCIAS';
  fBuscarGenM4.cLst2_Val_Def := '8';
  fBuscarGenM4.cLst2_Key_Fld := 'prov_id';
  fBuscarGenM4.cLst2_Lst_Fld := 'prov_descripcion';
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT prov_id, UCASE(prov_descripcion) AS prov_descripcion, prov_id_pais ';
  cSql_Ln := cSql_Ln + 'FROM mant_provincias ';
  cSql_Ln := cSql_Ln + 'ORDER BY UCASE(prov_descripcion)';
  fBuscarGenM4.cLst2_Sql_Cmd := cSql_Ln;
  fBuscarGenM4.cLst2_Where_Fld := 'dist_prov_id';

  fBuscarGenM4.cLst2_Key_Fld_Lnk := 'prov_id_pais';
  // ****************************************************************************/

  fBuscarGenM4.ShowModal;
  if BuscarGenM4.vFindResult <> '' then
  begin
    self.Buscar_Dist(BuscarGenM4.vFindResult);

    self.cId_Pais := self.oQry_Dist.FieldByName('dist_pais_id').AsString;
    self.cId_Prov := self.oQry_Dist.FieldByName('dist_prov_id').AsString;
    self.Buscar_Pais(self.cId_Pais);
    self.Buscar_Prov(self.cId_Pais, self.cId_Prov);
  end;
  freeandnil(fBuscarGenM4);
  self.PageControl1.ActivePageIndex := 0;
  self.iOption := 0;
end;

procedure TfMant_Gen_Dist.oBtnNewClick(Sender: TObject);
var
  cNext: string;
begin
  self.iOption := 1;
  self.PageControl1.ActivePageIndex := 0;
  self.oQry_Dist.Insert;
  self.Buscar_Pais('136');
  self.Buscar_Prov('136', '%');
  self.odist_inactivo.Checked := false;
  self.Action_Control(1);
  self.Activa_Objetos(true);
  self.oQry_Dist.FieldByName('dist_inactivo').Value := 0;

  self.odist_descripcion.SetFocus;

  cNext := futilesv20.query_selectgen_result('SELECT IFNULL(num_dist,0)+1 AS num_dist FROM mant_secuenc_docs LIMIT 1');
  self.oQry_Dist.FieldByName('dist_id').AsString := futilesv20.PadL(trim(cNext), 3, '0');
end;

procedure TfMant_Gen_Dist.oBtnSaveClick(Sender: TObject);
var
  cNext: string;
begin
  if (self.iOption = 1) then
  begin
    cNext := futilesv20.query_selectgen_result
      ('SELECT IFNULL(num_dist,0)+1 AS num_dist FROM mant_secuenc_docs LIMIT 1');
    self.oQry_Dist.FieldByName('dist_id').AsString := futilesv20.PadL(trim(cNext), 3, '0');

    utilesv20.Execute_SQL_Command('UPDATE mant_secuenc_docs SET num_dist=IFNULL(num_dist,0)+1 WHERE 1=1');
  end;

  if (self.oQry_Dist.State = dsedit) then
  begin
    self.oQry_Dist.FieldByName('dist_usuario_modif').AsString := utilesv20.sUserName;
    self.oQry_Dist.FieldByName('dist_fecha_modif').Value := now();
  end
  else if (self.oQry_Dist.State = dsInsert) then
  begin
    self.oQry_Dist.FieldByName('dist_usuario_alta').AsString := utilesv20.sUserName;
    self.oQry_Dist.FieldByName('dist_fecha_alta').Value := now();
  end;

  if self.oQry_Dist.State in [dsedit, dsInsert] then
  begin
    if futilesv20.isEmpty(self.oQry_Dist.FieldByName('dist_descripcion').AsString) then
    begin
      ShowMessage('Debe especificar la descripción ara continuar.');
      self.PageControl1.TabIndex := 0;
      self.odist_descripcion.SetFocus;
      abort;
    end;

  end;

  self.oQry_Dist.FieldByName('dist_pais_id').AsInteger := self.oLst_pais.KeyValue;
  self.oQry_Dist.FieldByName('dist_prov_id').AsInteger := self.oLst_Prov.KeyValue;
  self.oQry_Dist.Post;
  self.Action_Control(6);
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
  self.iOption := 0;

  self.cId_Pais := self.oQry_Dist.FieldByName('dist_pais_id').AsString;
  self.cId_Prov := self.oQry_Dist.FieldByName('dist_prov_id').AsString;
  self.Buscar_Pais(self.cId_Pais);
  self.Buscar_Prov(self.cId_Pais, self.cId_Prov);
end;

procedure TfMant_Gen_Dist.Action_Control(pOption: integer);
begin
  if ((pOption = 1) or (pOption = 2)) then
  begin
    oBtnNew.Visible := false;
    oBtnEdit.Visible := false;
    oBtnDelete.Visible := false;
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

procedure TfMant_Gen_Dist.Activa_Objetos(bFlag: boolean);
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

procedure TfMant_Gen_Dist.FormCreate(Sender: TObject);
begin
  self.iOption := 0;
  // self.ResizeKit1.Enabled := utiles.Ctrl_Resize;
  freeandnil(FDConnection1);
  self.PageControl1.ActivePageIndex := 0;

  self.oQry_Pais.Connection := futilesv20.oPublicCnn;
  self.oQry_Prov.Connection := futilesv20.oPublicCnn;
  self.oQry_Dist.Connection := futilesv20.oPublicCnn;

  self.Buscar_Dist('%', true);
  self.cId_Pais := self.oQry_Dist.FieldByName('dist_pais_id').AsString;
  self.cId_Prov := self.oQry_Dist.FieldByName('dist_prov_id').AsString;

  self.Buscar_Pais(self.cId_Pais);
  self.Buscar_Prov(self.cId_Pais, self.cId_Prov);
end;

procedure TfMant_Gen_Dist.FormShow(Sender: TObject);
begin
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
end;

procedure TfMant_Gen_Dist.Buscar_Dist(cCod_Dist: string; bFirts: boolean = false);
var
  cSql_Ln: string;
begin
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT * ';
  cSql_Ln := cSql_Ln + 'FROM mant_distritos ';
  if (bFirts = true) then
    cSql_Ln := cSql_Ln + 'ORDER BY UCASE(dist_descripcion) LIMIT 1'
  else
    cSql_Ln := cSql_Ln + 'WHERE dist_id="' + trim(cCod_Dist) + '" ';

  self.oQry_Dist.close();
  self.oQry_Dist.Connection := futilesv20.oPublicCnn;
  self.oQry_Dist.SQL.Clear;
  self.oQry_Dist.SQL.Text := cSql_Ln;
  self.oQry_Dist.Open();
  self.oDs_Dist.Enabled := true;
end;

procedure TfMant_Gen_Dist.Buscar_Pais(cCod_Pais: string);
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

  if ((trim(cCod_Pais) <> '') or (trim(cCod_Pais) <> '%')) then
    self.oLst_pais.KeyValue := cCod_Pais;
end;

procedure TfMant_Gen_Dist.Buscar_Prov(cCod_Pais: string; cCod_Prov: string);
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

  if ((trim(cCod_Prov) <> '') or (trim(cCod_Prov) <> '%')) then
    self.oLst_Prov.KeyValue := cCod_Prov;
end;

end.
