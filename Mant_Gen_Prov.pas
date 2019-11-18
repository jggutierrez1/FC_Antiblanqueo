unit Mant_Gen_Prov;

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
  TfMant_Gen_Prov = class(TForm)
    PageControl1: TPageControl;
    oTabMant: TTabSheet;
    oprov_inactiva: TDBCheckBox;
    oTabAudit: TTabSheet;
    Label16: TLabel;
    Label32: TLabel;
    Label17: TLabel;
    Label33: TLabel;
    fecha_alta: TDBDateTimeEditEh;
    usuario_alta: TDBEdit;
    fecha_modif: TDBDateTimeEditEh;
    usuario_modif: TDBEdit;
    oBtnExit: TPngBitBtn;
    oBtnAbort: TPngBitBtn;
    oBtnSave: TPngBitBtn;
    oBtnDelete: TPngBitBtn;
    oBtnEdit: TPngBitBtn;
    oBtnNew: TPngBitBtn;
    StatusBar1: TStatusBar;
    Label7: TLabel;
    oprov_id: TDBEdit;
    oprov_descripcion: TDBEdit;
    Label5: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    oLst_prov_id_pais: TDBLookupComboboxEh;
    oBtnFind: TPngBitBtn;
    FDConnection1: TFDConnection;
    oDs_Pais: TDataSource;
    oQry_Pais: TFDQuery;
    oDs_Prov: TDataSource;
    oQry_Prov: TFDQuery;
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
    procedure Buscar_Pais();
    procedure Buscar_Prov(cCod_Prov: string; bFirts: boolean = false);
  private
    iOption: integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMant_Gen_Prov: TfMant_Gen_Prov;

implementation

uses utilesv20, BuscarGenM3;
{$R *.dfm}

procedure TfMant_Gen_Prov.oBtnAbortClick(Sender: TObject);
begin
  self.oQry_Prov.Cancel;
  self.Action_Control(7);
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
  self.iOption := 0;
end;

procedure TfMant_Gen_Prov.oBtnDeleteClick(Sender: TObject);
var
  nResp: integer;
begin
  if self.oQry_Prov.isEmpty then
  begin
    self.Action_Control(6);
    self.iOption := 0;
    exit;
  end;
  self.Action_Control(3);
  nResp := MessageDlg('Seguro que desea borrar eliminar el registro alctual?', mtConfirmation, [mbYes, mbNo], 0);
  If (nResp = mrYes) Then
  begin
    self.oQry_Prov.Delete;
    self.oQry_Prov.Refresh;
  end;
  self.iOption := 0;
end;

procedure TfMant_Gen_Prov.oBtnEditClick(Sender: TObject);
begin
  if self.oQry_Prov.isEmpty then
  begin
    self.Action_Control(6);
    exit;
  end;
  self.iOption := 2;
  self.PageControl1.ActivePageIndex := 0;
  self.oQry_Prov.Edit;
  self.Action_Control(2);
  self.Activa_Objetos(true);
  self.oprov_descripcion.SetFocus;
end;

procedure TfMant_Gen_Prov.oBtnExitClick(Sender: TObject);
begin
  self.close;
end;

procedure TfMant_Gen_Prov.oBtnFindClick(Sender: TObject);
var
  cSql_Ln: string;
begin
  self.Action_Control(4);

  Application.CreateForm(TfBuscarGenM3, fBuscarGenM3);

  fBuscarGenM3.Hide;
  fBuscarGenM3.oLst_campos.Clear;

  BuscarGenM3.oListData[1].Texto := 'Código';
  BuscarGenM3.oListData[1].Campo := 'prov_id';
  BuscarGenM3.oListData[1].LLave := true;

  BuscarGenM3.oListData[2].Texto := 'Nombre';
  BuscarGenM3.oListData[2].Campo := 'prov_descripcion';
  BuscarGenM3.oListData[2].LLave := false;

  BuscarGenM3.oListData[3].Texto := 'Inactivo';
  BuscarGenM3.oListData[3].Campo := 'Inactivo';
  BuscarGenM3.oListData[3].LLave := false;

  fBuscarGenM3.oSql1.Clear;
  fBuscarGenM3.oSql1.Lines.Add('SELECT prov_id,UCASE(prov_descripcion) as prov_descripcion, IF(prov_inactiva=1,"SI","NO") AS Inactivo FROM mant_provincias WHERE 1=1 ');

  // ****************************************************************************/
  fBuscarGenM3.oLabel_List.Caption := 'LISTA DE PAISES';
  fBuscarGenM3.cLst_Val_Def := '136';
  fBuscarGenM3.cLst_Key_Fld := 'pais_id_pais';
  fBuscarGenM3.cLst_Lst_Fld := 'pais_descripcion';
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT pais_id_pais,UCASE(pais_descripcion) as pais_descripcion ';
  cSql_Ln := cSql_Ln + 'FROM mant_paises ';
  cSql_Ln := cSql_Ln + 'ORDER BY UCASE(pais_descripcion)';
  fBuscarGenM3.cLst_Sql_Cmd := cSql_Ln;
  fBuscarGenM3.cLst_Where_Fld := 'prov_id_pais';
  // ****************************************************************************/

  fBuscarGenM3.ShowModal;
  if BuscarGenM3.vFindResult <> '' then
  begin
    self.Buscar_Prov(BuscarGenM3.vFindResult);
  end;
  freeandnil(fBuscarGenM3);
  self.PageControl1.ActivePageIndex := 0;
  self.iOption := 0;
end;

procedure TfMant_Gen_Prov.oBtnNewClick(Sender: TObject);
var
  cNext: string;
begin
  self.iOption := 1;
  self.PageControl1.ActivePageIndex := 0;
  self.oQry_Prov.Insert;
  self.oprov_inactiva.Checked := false;
  self.Action_Control(1);
  self.Activa_Objetos(true);
  self.oQry_Prov.FieldByName('prov_inactiva').Value := 0;

  self.oprov_descripcion.SetFocus;

  cNext := futilesv20.query_selectgen_result('SELECT IFNULL(num_prov,0)+1 AS num_prov FROM mant_secuenc_docs LIMIT 1');
  self.oQry_Prov.FieldByName('prov_id').AsString := futilesv20.PadL(trim(cNext), 3, '0');
end;

procedure TfMant_Gen_Prov.oBtnSaveClick(Sender: TObject);
var
  cNext: string;
begin
  if (self.iOption = 1) then
  begin
    cNext := futilesv20.query_selectgen_result('SELECT IFNULL(num_prov,0)+1 AS num_prov FROM mant_secuenc_docs LIMIT 1');
    self.oQry_Prov.FieldByName('prov_id').AsString := futilesv20.PadL(trim(cNext), 3, '0');

    utilesv20.Execute_SQL_Command('UPDATE mant_secuenc_docs SET num_prov=IFNULL(num_prov,0)+1 WHERE 1=1');
  end;

  if (self.oQry_Prov.State = dsedit) then
  begin
    self.oQry_Prov.FieldByName('prov_usuario_modif').AsString := utilesv20.sUserName;
    self.oQry_Prov.FieldByName('prov_fecha_modif').Value := now();
  end
  else if (self.oQry_Prov.State = dsInsert) then
  begin
    self.oQry_Prov.FieldByName('prov_usuario_alta').AsString := utilesv20.sUserName;
    self.oQry_Prov.FieldByName('prov_fecha_alta').Value := now();
  end;

  if self.oQry_Prov.State in [dsedit, dsInsert] then
  begin
    if futilesv20.isEmpty(self.oQry_Prov.FieldByName('prov_descripcion').AsString) then
    begin
      ShowMessage('Debe especificar la descripción ara continuar.');
      self.PageControl1.TabIndex := 0;
      self.oprov_descripcion.SetFocus;
      abort;
    end;

    if ((self.oLst_prov_id_pais.KeyValue = 0) or (self.oLst_prov_id_pais.KeyValue = null)) then
    begin
      ShowMessage('Debe especificar el país de la provincia.');
      self.PageControl1.TabIndex := 0;
      self.oLst_prov_id_pais.SetFocus;
      abort;
    end;

  end;

  self.oQry_Prov.Post;
  self.Action_Control(6);
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
  self.iOption := 0;
end;

procedure TfMant_Gen_Prov.Action_Control(pOption: integer);
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

procedure TfMant_Gen_Prov.Activa_Objetos(bFlag: boolean);
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

procedure TfMant_Gen_Prov.FormCreate(Sender: TObject);
var
  cSql_Ln: string;
begin
  self.iOption := 0;
  freeandnil(FDConnection1);
  // self.ResizeKit1.Enabled := utiles.Ctrl_Resize;
  self.PageControl1.ActivePageIndex := 0;

  self.Buscar_Pais();
  self.Buscar_Prov('', true);
end;

procedure TfMant_Gen_Prov.FormShow(Sender: TObject);
begin
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
end;

procedure TfMant_Gen_Prov.Buscar_Prov(cCod_Prov: string; bFirts: boolean = false);
var
  cSql_Ln: string;
begin
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT * ';
  cSql_Ln := cSql_Ln + 'FROM mant_provincias ';
  if (bFirts = true) then
    cSql_Ln := cSql_Ln + 'ORDER BY UCASE(prov_descripcion) LIMIT 1'
  else
    cSql_Ln := cSql_Ln + 'WHERE prov_id="' + trim(cCod_Prov) + '" ';

  self.oQry_Prov.close();
  self.oQry_Prov.Connection := futilesv20.oPublicCnn;
  self.oQry_Prov.SQL.Clear;
  self.oQry_Prov.SQL.Text := cSql_Ln;
  self.oQry_Prov.Open();
  self.oDs_Prov.Enabled := true;
end;

procedure TfMant_Gen_Prov.Buscar_Pais();
var
  cSql_Ln: string;
begin
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT pais_id_pais,UCASE(pais_descripcion) as pais_descripcion ';
  cSql_Ln := cSql_Ln + 'FROM mant_paises ';
  cSql_Ln := cSql_Ln + 'ORDER BY UCASE(pais_descripcion)';

  self.oQry_Pais.close();
  self.oQry_Pais.Connection := futilesv20.oPublicCnn;
  self.oQry_Pais.SQL.Clear;
  self.oQry_Pais.SQL.Text := cSql_Ln;
  self.oQry_Pais.Open();
  self.oDs_Pais.Enabled := true;
end;

end.
