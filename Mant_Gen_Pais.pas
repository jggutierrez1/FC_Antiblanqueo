unit Mant_Gen_Pais;

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
  TfMant_Gen_Pais = class(TForm)
    PageControl1: TPageControl;
    oTabMant: TTabSheet;
    Label5: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    opais_inactivo: TDBCheckBox;
    opais_descripcion: TDBEdit;
    opais_id_pais: TDBEdit;
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
    oBtnFind: TPngBitBtn;
    oDs_Pais: TDataSource;
    FDConnection1: TFDConnection;
    oQry_Pais: TFDQuery;
    opais_riesgo: TDBComboBoxEh;
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
    procedure Buscar_Pais(cCod_Pais: string; bFirts: boolean = false);
  private
    iOption: integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMant_Gen_Pais: TfMant_Gen_Pais;

implementation

uses utilesv20, BuscarGenM2;
{$R *.dfm}

procedure TfMant_Gen_Pais.oBtnAbortClick(Sender: TObject);
begin
  self.oQry_Pais.Cancel;
  self.Action_Control(7);
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
  self.iOption := 0;
end;

procedure TfMant_Gen_Pais.oBtnDeleteClick(Sender: TObject);
var
  nResp: integer;
begin
  if self.oQry_Pais.isEmpty then
  begin
    self.Action_Control(6);
    self.iOption := 0;
    exit;
  end;
  self.Action_Control(3);
  nResp := MessageDlg('Seguro que desea borrar eliminar el registro alctual?', mtConfirmation, [mbYes, mbNo], 0);
  If (nResp = mrYes) Then
  begin
    self.oQry_Pais.Delete;
    self.oQry_Pais.Refresh;
  end;
  self.iOption := 0;
end;

procedure TfMant_Gen_Pais.oBtnEditClick(Sender: TObject);
begin
  if self.oQry_Pais.isEmpty then
  begin
    self.Action_Control(6);
    exit;
  end;
  self.iOption := 2;
  self.PageControl1.ActivePageIndex := 0;
  self.oQry_Pais.Edit;
  self.Action_Control(2);
  self.Activa_Objetos(true);
  self.opais_descripcion.SetFocus;
end;

procedure TfMant_Gen_Pais.oBtnExitClick(Sender: TObject);
begin
  self.close;
end;

procedure TfMant_Gen_Pais.oBtnFindClick(Sender: TObject);
begin
  self.Action_Control(4);

  Application.CreateForm(TfBuscarGenM2, fBuscarGenM2);
  fBuscarGenM2.Hide;
  fBuscarGenM2.oLst_campos.Clear;

  BuscarGenM2.oListData[1].Texto := 'Código';
  BuscarGenM2.oListData[1].Campo := 'pais_id_pais';
  BuscarGenM2.oListData[1].LLave := true;

  BuscarGenM2.oListData[2].Texto := 'Nombre';
  BuscarGenM2.oListData[2].Campo := 'pais_descripcion';
  BuscarGenM2.oListData[2].LLave := false;

  BuscarGenM2.oListData[3].Texto := 'Inactivo';
  BuscarGenM2.oListData[3].Campo := 'Inactivo';
  BuscarGenM2.oListData[3].LLave := false;

  fBuscarGenM2.oSql1.Clear;
  fBuscarGenM2.oSql1.Lines.Add('SELECT pais_id_pais,UCASE(pais_descripcion) as pais_descripcion, IF(pais_inactivo=1,"SI","NO") AS Inactivo FROM mant_paises WHERE 1=1 ');
  fBuscarGenM2.ShowModal;
  if BuscarGenM2.vFindResult <> '' then
  begin
    self.Buscar_Pais(BuscarGenM2.vFindResult);
  end;
  freeandnil(fBuscarGenM2);
  self.PageControl1.ActivePageIndex := 0;
  self.iOption := 0;
end;

procedure TfMant_Gen_Pais.oBtnNewClick(Sender: TObject);
var
  cNext: string;
begin
  self.iOption := 1;
  self.PageControl1.ActivePageIndex := 0;
  self.oQry_Pais.Insert;
  self.opais_inactivo.Checked := false;
  self.Action_Control(1);
  self.Activa_Objetos(true);
  self.oQry_Pais.FieldByName('pais_inactivo').Value := 0;

  self.opais_descripcion.SetFocus;

  cNext := futilesv20.query_selectgen_result('SELECT IFNULL(num_pais,0)+1 AS num_pais FROM mant_secuenc_docs LIMIT 1');
  self.oQry_Pais.FieldByName('pais_id_pais').AsString := futilesv20.PadL(trim(cNext), 3, '0');
end;

procedure TfMant_Gen_Pais.oBtnSaveClick(Sender: TObject);
var
  cNext: string;
begin
  if (self.iOption = 1) then
  begin
    cNext := futilesv20.query_selectgen_result('SELECT IFNULL(num_pais,0)+1 AS num_pais FROM mant_secuenc_docs LIMIT 1');
    self.oQry_Pais.FieldByName('pais_id_pais').AsString := futilesv20.PadL(trim(cNext), 3, '0');

    utilesv20.Execute_SQL_Command('UPDATE mant_secuenc_docs SET num_pais=IFNULL(num_pais,0)+1 WHERE 1=1');
  end;

  if (self.oQry_Pais.State = dsedit) then
  begin
    self.oQry_Pais.FieldByName('pais_usuario_modif').AsString := utilesv20.sUserName;
    self.oQry_Pais.FieldByName('pais_fecha_modif').Value := now();
  end
  else if (self.oQry_Pais.State = dsInsert) then
  begin
    self.oQry_Pais.FieldByName('pais_usuario_alta').AsString := utilesv20.sUserName;
    self.oQry_Pais.FieldByName('pais_fecha_alta').Value := now();
  end;

  if self.oQry_Pais.State in [dsedit, dsInsert] then
  begin
    if futilesv20.isEmpty(self.oQry_Pais.FieldByName('pais_descripcion').AsString) then
    begin
      ShowMessage('Debe especificar la descripción ara continuar.');
      self.PageControl1.TabIndex := 0;
      self.opais_descripcion.SetFocus;
      abort;
    end;

  end;

  self.oQry_Pais.Post;
  self.Action_Control(6);
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
  self.iOption := 0;
end;

procedure TfMant_Gen_Pais.Action_Control(pOption: integer);
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

procedure TfMant_Gen_Pais.Activa_Objetos(bFlag: boolean);
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

procedure TfMant_Gen_Pais.FormCreate(Sender: TObject);
begin
  self.iOption := 0;
  freeandnil(FDConnection1);
  // self.ResizeKit1.Enabled := utiles.Ctrl_Resize;
  self.PageControl1.ActivePageIndex := 0;

  self.Buscar_Pais('', true);
end;

procedure TfMant_Gen_Pais.FormShow(Sender: TObject);
begin
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
end;

procedure TfMant_Gen_Pais.Buscar_Pais(cCod_Pais: string; bFirts: boolean = false);
var
  cSql_Ln: string;
begin
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT * ';
  cSql_Ln := cSql_Ln + 'FROM mant_paises ';
  if (bFirts = true) then
    cSql_Ln := cSql_Ln + 'ORDER BY UCASE(pais_descripcion) LIMIT 1'
  else
    cSql_Ln := cSql_Ln + 'WHERE pais_id_pais="' + trim(cCod_Pais) + '" ';

  self.oQry_Pais.close();
  self.oQry_Pais.Connection := futilesv20.oPublicCnn;
  self.oQry_Pais.SQL.Clear;
  self.oQry_Pais.SQL.Text := cSql_Ln;
  self.oQry_Pais.Open();
  self.oDs_Pais.Enabled := true;
end;

end.
