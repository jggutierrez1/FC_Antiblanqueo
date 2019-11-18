unit Mant_Gen_fRiez;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEh, DBCtrlsEh, DBLookupEh,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Buttons, PngBitBtn,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, EhLibVCL, GridsEh, DBAxisGridsEh;

type
  TfMant_Gen_fRiez = class(TForm)
    StatusBar1: TStatusBar;
    oBtnExit: TPngBitBtn;
    oBtnDelete: TPngBitBtn;
    oBtnEdit: TPngBitBtn;
    oBtnNew: TPngBitBtn;
    oBtnFind: TPngBitBtn;
    PageControl1: TPageControl;
    oTabMant: TTabSheet;
    Label5: TLabel;
    Label3: TLabel;
    oid_riezgo: TDBEdit;
    odescripcion: TDBEdit;
    oTabAudit: TTabSheet;
    Label16: TLabel;
    Label32: TLabel;
    Label17: TLabel;
    Label33: TLabel;
    fecha_alta: TDBDateTimeEditEh;
    usuario_alta: TDBEdit;
    fecha_modif: TDBDateTimeEditEh;
    usuario_modif: TDBEdit;
    TabSheet1: TTabSheet;
    DBGridEh1: TDBGridEh;
    FDConnection1: TFDConnection;
    oDs_Frzg: TDataSource;
    oQry_Frzg: TFDQuery;
    Label2: TLabel;
    ocodigo: TDBEdit;
    Label4: TLabel;
    Label6: TLabel;
    oLst_prob_ponderacion: TDBLookupComboboxEh;
    oLst_impa_ponderacion: TDBLookupComboboxEh;
    odProva: TDataSource;
    odImpa: TDataSource;
    otProva: TFDTable;
    otImpa: TFDTable;
    oBtnSave: TPngBitBtn;
    oBtnAbort: TPngBitBtn;
    oes_nivel_superior: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Activa_Objetos(bFlag: boolean);
    procedure Action_Control(pOption: integer);
    procedure oBtnExitClick(Sender: TObject);
    procedure oBtnAbortClick(Sender: TObject);
    procedure oBtnSaveClick(Sender: TObject);
    procedure oBtnDeleteClick(Sender: TObject);
    procedure oBtnEditClick(Sender: TObject);
    procedure oBtnNewClick(Sender: TObject);
    procedure Buscar_Data(cCodido: string = '');
  private
    { Private declarations }
    iOption: integer;
  public
    { Public declarations }
  end;

var
  fMant_Gen_fRiez: TfMant_Gen_fRiez;

implementation

uses utilesv20, BuscarGenM3;

{$R *.dfm}

procedure TfMant_Gen_fRiez.FormCreate(Sender: TObject);
begin
  self.iOption := 0;
  freeandnil(FDConnection1);
  self.otProva.Connection := futilesv20.oPublicCnn;
  self.otImpa.Connection := futilesv20.oPublicCnn;
  self.oQry_Frzg.Connection := futilesv20.oPublicCnn;
  // self.ResizeKit1.Enabled := utiles.Ctrl_Resize;
  self.PageControl1.ActivePageIndex := 0;

end;

procedure TfMant_Gen_fRiez.FormShow(Sender: TObject);
begin
  self.otProva.Open();
  self.otImpa.Open();
  self.Buscar_Data();
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
end;

procedure TfMant_Gen_fRiez.oBtnAbortClick(Sender: TObject);
begin
  self.oQry_Frzg.Cancel;
  self.Action_Control(7);
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
  self.iOption := 0;
end;

procedure TfMant_Gen_fRiez.oBtnDeleteClick(Sender: TObject);
var
  nResp: integer;
begin
  if self.oQry_Frzg.isEmpty then
  begin
    self.Action_Control(6);
    self.iOption := 0;
    exit;
  end;
  self.Action_Control(3);
  nResp := MessageDlg('Seguro que desea borrar eliminar el registro alctual?', mtConfirmation, [mbYes, mbNo], 0);
  If (nResp = mrYes) Then
  begin
    self.oQry_Frzg.Delete;
    self.oQry_Frzg.Refresh;
  end;
  self.iOption := 0;
end;

procedure TfMant_Gen_fRiez.oBtnEditClick(Sender: TObject);
begin
  if self.oQry_Frzg.isEmpty then
  begin
    self.Action_Control(6);
    exit;
  end;
  self.iOption := 2;
  self.PageControl1.ActivePageIndex := 1;
  self.oQry_Frzg.Edit;
  self.Action_Control(2);
  self.Activa_Objetos(true);
  self.odescripcion.SetFocus;
end;

procedure TfMant_Gen_fRiez.oBtnExitClick(Sender: TObject);
begin
  self.close;
end;

procedure TfMant_Gen_fRiez.oBtnNewClick(Sender: TObject);
var
  cNext: string;
begin
  self.iOption := 1;
  self.PageControl1.ActivePageIndex := 1;
  self.oQry_Frzg.Insert;
  self.Action_Control(1);
  self.Activa_Objetos(true);

  self.odescripcion.SetFocus;

  cNext := futilesv20.query_selectgen_result('SELECT IFNULL(num_fact_ries_tipo,0)+1 AS num_fact_ries_tipo FROM mant_secuenc_docs LIMIT 1');
  self.oQry_Frzg.FieldByName('id_riezgo').AsString := trim(cNext);

  self.oQry_Frzg.FieldByName('codigo').AsString := 'RC' + trim(cNext);
  self.oQry_Frzg.FieldByName('prob_ponderacion').AsInteger := 0;
  self.oQry_Frzg.FieldByName('impa_ponderacion').AsInteger := 0;
  self.oQry_Frzg.FieldByName('es_nivel_superior').AsInteger := 0;
end;

procedure TfMant_Gen_fRiez.oBtnSaveClick(Sender: TObject);
var
  cNext: string;
begin
  if (self.iOption = 1) then
  begin
    cNext := futilesv20.query_selectgen_result('SELECT IFNULL(num_fact_ries_tipo,0)+1 AS num_fact_ries_tipo FROM mant_secuenc_docs LIMIT 1');
    self.oQry_Frzg.FieldByName('id_riezgo').AsString := trim(cNext);

    utilesv20.Execute_SQL_Command('UPDATE mant_secuenc_docs SET num_fact_ries_tipo=IFNULL(num_fact_ries_tipo,0)+1 WHERE 1=1');
  end;

  if (self.oQry_Frzg.State = dsedit) then
  begin
    self.oQry_Frzg.FieldByName('usuario_modif').AsString := utilesv20.sUserName;
    self.oQry_Frzg.FieldByName('fecha_modif').Value := now();
  end
  else if (self.oQry_Frzg.State = dsInsert) then
  begin
    self.oQry_Frzg.FieldByName('usuario_alta').AsString := utilesv20.sUserName;
    self.oQry_Frzg.FieldByName('fecha_alta').Value := now();
  end;

  if self.oQry_Frzg.State in [dsedit, dsInsert] then
  begin
    if futilesv20.isEmpty(self.oQry_Frzg.FieldByName('descripcion').AsString) then
    begin
      ShowMessage('Debe especificar la descripción del causal para continuar.');
      self.PageControl1.TabIndex := 0;
      self.odescripcion.SetFocus;
      abort;
    end;

    if ((self.oLst_prob_ponderacion.KeyValue = -1) or (self.oLst_prob_ponderacion.KeyValue = null)) then
    begin
      ShowMessage('Debe especificar la ponderación de LA PROBABILIDAD para poder continuar');
      self.PageControl1.TabIndex := 0;
      self.oLst_prob_ponderacion.SetFocus;
      abort;
    end;

    if ((self.oLst_impa_ponderacion.KeyValue = -1) or (self.oLst_impa_ponderacion.KeyValue = null)) then
    begin
      ShowMessage('Debe especificar la ponderación del IMPACTO para poder continuar');
      self.PageControl1.TabIndex := 0;
      self.oLst_impa_ponderacion.SetFocus;
      abort;
    end;

  end;

  self.oQry_Frzg.Post;
  self.Action_Control(6);
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
  self.iOption := 0;
end;

procedure TfMant_Gen_fRiez.Action_Control(pOption: integer);
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

procedure TfMant_Gen_fRiez.Activa_Objetos(bFlag: boolean);
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

procedure TfMant_Gen_fRiez.Buscar_Data(cCodido: string = '');
var
  cSql_Ln: string;
begin
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT * ';
  cSql_Ln := cSql_Ln + 'FROM mant_factores_riesgos_v2 ';
  if (trim(cCodido) <> '') then
    cSql_Ln := cSql_Ln + 'WHERE codigo="' + trim(cCodido) + '" ';
  cSql_Ln := cSql_Ln + 'ORDER BY id_riezgo ';

  self.oQry_Frzg.close();
  self.oQry_Frzg.Connection := futilesv20.oPublicCnn;
  self.oQry_Frzg.SQL.Clear;
  self.oQry_Frzg.SQL.Text := cSql_Ln;
  self.oQry_Frzg.Open();
  self.oDs_Frzg.Enabled := true;
end;

end.
