unit Mant_Ded_Dil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Vcl.ComCtrls, ResizeKit, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, DBCtrlsEh, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Mask, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.Buttons, PngBitBtn, DBLookupEh, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, cxDBEdit;

type
  TfMant_Ded_Dil = class(TForm)
    oBtnExit: TPngBitBtn;
    oBtnAbort: TPngBitBtn;
    oBtnSave: TPngBitBtn;
    oBtnDelete: TPngBitBtn;
    oBtnEdit: TPngBitBtn;
    oBtnNew: TPngBitBtn;
    oBtnFind: TPngBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGridEh1: TDBGridEh;
    oTabMant: TTabSheet;
    Label3: TLabel;
    Label2: TLabel;
    odebdi_descripcion: TDBEdit;
    odebdi_id: TDBEdit;
    odebdi_inactivo: TDBCheckBox;
    oTabAudit: TTabSheet;
    Label16: TLabel;
    Label32: TLabel;
    Label17: TLabel;
    Label33: TLabel;
    ofecha_alta: TDBDateTimeEditEh;
    ousuario_alta: TDBEdit;
    ofecha_modif: TDBDateTimeEditEh;
    ousuario_modif: TDBEdit;
    oConection: TFDConnection;
    otCtes_Dedd: TFDTable;
    oDCtes_Dedd: TDataSource;
    ResizeKit1: TResizeKit;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    odebdi_descripcion_corta: TDBEdit;
    Label4: TLabel;
    odebdi_clave: TDBEdit;
    Label5: TLabel;
    odebdi_order: TDBNumberEditEh;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure oBtnNewClick(Sender: TObject);
    procedure oBtnEditClick(Sender: TObject);
    procedure oBtnDeleteClick(Sender: TObject);
    procedure oBtnFindClick(Sender: TObject);
    procedure oBtnExitClick(Sender: TObject);
    procedure oBtnAbortClick(Sender: TObject);
    procedure oBtnSaveClick(Sender: TObject);
    procedure Action_Control(pOption: integer);
    procedure Activa_Objetos(bFlag: boolean);
  private
    { Private declarations }
    iOption: integer;
  public
    { Public declarations }
  end;

var
  fMant_Ded_Dil: TfMant_Ded_Dil;

implementation

uses utilesv20, BuscarGenM2;

{$R *.dfm}

procedure TfMant_Ded_Dil.FormCreate(Sender: TObject);
begin
  self.iOption := 0;
  // self.ResizeKit1.Enabled := utiles.Ctrl_Resize;
  freeandnil(oConection);
  self.PageControl1.ActivePageIndex := 0;

  self.otCtes_Dedd.Connection := futilesv20.oPublicCnn;
end;

procedure TfMant_Ded_Dil.FormShow(Sender: TObject);
begin
  self.otCtes_Dedd.Open();
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
end;

procedure TfMant_Ded_Dil.oBtnAbortClick(Sender: TObject);
begin
  self.otCtes_Dedd.Cancel;
  self.Action_Control(7);
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
  self.iOption := 0;
end;

procedure TfMant_Ded_Dil.oBtnDeleteClick(Sender: TObject);
var
  nResp: integer;
begin
  if self.otCtes_Dedd.isEmpty then
  begin
    self.Action_Control(6);
    self.iOption := 0;
    exit;
  end;
  self.Action_Control(3);
  nResp := MessageDlg('Seguro que desea borrar eliminar el registro alctual?', mtConfirmation, [mbYes, mbNo], 0);
  If (nResp = mrYes) Then
  begin
    self.otCtes_Dedd.Delete;
    self.otCtes_Dedd.Refresh;
  end;
  self.iOption := 0;
end;

procedure TfMant_Ded_Dil.oBtnEditClick(Sender: TObject);
begin
  if self.otCtes_Dedd.isEmpty then
  begin
    self.Action_Control(6);
    exit;
  end;
  self.iOption := 2;
  self.PageControl1.ActivePageIndex := 1;
  self.otCtes_Dedd.Edit;
  self.Action_Control(2);
  self.Activa_Objetos(true);
  self.odebdi_descripcion.SetFocus;
end;

procedure TfMant_Ded_Dil.oBtnExitClick(Sender: TObject);
begin
  self.close;
end;

procedure TfMant_Ded_Dil.oBtnFindClick(Sender: TObject);
begin
  self.Action_Control(4);

  Application.CreateForm(TfBuscarGenM2, fBuscarGenM2);
  fBuscarGenM2.Hide;
  fBuscarGenM2.oLst_campos.Clear;

  BuscarGenM2.oListData[1].Texto := 'Código';
  BuscarGenM2.oListData[1].Campo := 'debdi_id';
  BuscarGenM2.oListData[1].LLave := true;

  BuscarGenM2.oListData[2].Texto := 'Nombre';
  BuscarGenM2.oListData[2].Campo := 'debdi_descripcion';
  BuscarGenM2.oListData[2].LLave := false;

  BuscarGenM2.oListData[3].Texto := 'Inactivo';
  BuscarGenM2.oListData[3].Campo := 'Inactivo';
  BuscarGenM2.oListData[3].LLave := false;

  fBuscarGenM2.oSql1.Clear;
  fBuscarGenM2.oSql1.Lines.Add('SELECT debdi_id, UCASE(debdi_descripcion) AS debdi_descripcion, IF(debdi_inactivo=1,"SI","NO") AS Inactivo FROM mant_deb_diligencias WHERE 1=1 ');
  fBuscarGenM2.ShowModal;
  if BuscarGenM2.vFindResult <> '' then
  begin
    self.otCtes_Dedd.Locate('debdi_id', BuscarGenM2.vFindResult, []);
  end;
  freeandnil(fBuscarGenM2);
  self.PageControl1.ActivePageIndex := 0;
  self.iOption := 0;
end;

procedure TfMant_Ded_Dil.oBtnNewClick(Sender: TObject);
var
  cNext: string;
begin
  self.iOption := 1;
  self.PageControl1.ActivePageIndex := 1;
  self.otCtes_Dedd.Insert;
  self.Action_Control(1);
  self.Activa_Objetos(true);

  self.odebdi_descripcion.SetFocus;

  cNext := futilesv20.query_selectgen_result('SELECT IFNULL(num_debdil,0)+1 AS num_debdil FROM mant_secuenc_docs LIMIT 1');
  self.otCtes_Dedd.FieldByName('debdi_id').AsString := trim(cNext);

  self.otCtes_Dedd.FieldByName('debdi_descripcion').AsString := '';
  self.otCtes_Dedd.FieldByName('debdi_descripcion_corta').AsString := '';
  self.otCtes_Dedd.FieldByName('debdi_clave').AsString := '';
  self.otCtes_Dedd.FieldByName('debdi_inactivo').AsInteger := 0;
end;

procedure TfMant_Ded_Dil.oBtnSaveClick(Sender: TObject);
var
  cNext: string;
begin
  if (self.iOption = 1) then
  begin
    cNext := futilesv20.query_selectgen_result('SELECT IFNULL(num_debdil,0)+1 AS num_debdil FROM mant_secuenc_docs LIMIT 1');
    self.otCtes_Dedd.FieldByName('debdi_id').AsString := trim(cNext);

    utilesv20.Execute_SQL_Command('UPDATE mant_secuenc_docs SET num_debdil=IFNULL(num_debdil,0)+1 WHERE 1=1');
  end;

  if (self.otCtes_Dedd.State = dsedit) then
  begin
    self.otCtes_Dedd.FieldByName('usuario_modif').AsString := utilesv20.sUserName;
    self.otCtes_Dedd.FieldByName('fecha_modif').Value := now();
  end
  else if (self.otCtes_Dedd.State = dsInsert) then
  begin
    self.otCtes_Dedd.FieldByName('usuario_alta').AsString := utilesv20.sUserName;
    self.otCtes_Dedd.FieldByName('fecha_alta').Value := now();
  end;

  if self.otCtes_Dedd.State in [dsedit, dsInsert] then
  begin
    if futilesv20.isEmpty(self.otCtes_Dedd.FieldByName('debdi_id').AsString) then
    begin
      ShowMessage('Debe especificar un código válido para continuar.');
      self.PageControl1.TabIndex := 0;
      self.odebdi_id.SetFocus;
      abort;
    end;

    if futilesv20.isEmpty(self.otCtes_Dedd.FieldByName('debdi_descripcion').AsString) then
    begin
      ShowMessage('Debe especificar la descripción para continuar.');
      self.PageControl1.TabIndex := 0;
      self.odebdi_descripcion.SetFocus;
      abort;
    end;
  end;

  self.otCtes_Dedd.Post;
  self.Action_Control(6);
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
  self.iOption := 0;
end;

procedure TfMant_Ded_Dil.Action_Control(pOption: integer);
begin
  if ((pOption = 1) or (pOption = 2)) then
  begin
    // oDBNav.Visible := false;
    oBtnNew.Visible := false;
    oBtnEdit.Visible := false;
    oBtnDelete.Visible := false;
    oBtnFind.Visible := false;
    // oBtnPrint.Visible := false;
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
    // oBtnPrint.Visible := true;
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

procedure TfMant_Ded_Dil.Activa_Objetos(bFlag: boolean);
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

end.
