unit Mant_Gen_Cte_Cat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, DBGridEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, DBCtrlsEh, Vcl.StdCtrls,
  Vcl.DBCtrls, DBLookupEh, Vcl.Mask, EhLibVCL, GridsEh, DBAxisGridsEh,
  Vcl.ComCtrls, Vcl.Buttons, PngBitBtn, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, cxDBEdit, ResizeKit;

type
  TfMant_Gen_Cte_Cat = class(TForm)
    oBtnExit: TPngBitBtn;
    oBtnAbort: TPngBitBtn;
    oBtnSave: TPngBitBtn;
    oBtnDelete: TPngBitBtn;
    oBtnEdit: TPngBitBtn;
    oBtnNew: TPngBitBtn;
    oBtnFind: TPngBitBtn;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGridEh1: TDBGridEh;
    oTabAudit: TTabSheet;
    Label16: TLabel;
    Label32: TLabel;
    Label17: TLabel;
    Label33: TLabel;
    ocat_fecha_alta: TDBDateTimeEditEh;
    ocat_usuario_alta: TDBEdit;
    ocat_fecha_modif: TDBDateTimeEditEh;
    ocat_usuario_modif: TDBEdit;
    oConection: TFDConnection;
    otCtes_Cat: TFDTable;
    oDCtes_Cat: TDataSource;
    oTabMant: TTabSheet;
    Label3: TLabel;
    Label2: TLabel;
    ocat_nombre: TDBEdit;
    ocat_id_categoria: TDBEdit;
    ocat_inactiva: TDBCheckBox;
    ResizeKit1: TResizeKit;
    procedure oBtnNewClick(Sender: TObject);
    procedure Action_Control(pOption: integer);
    procedure AssgnTabs;
    procedure Activa_Objetos(bFlag: boolean);
    procedure EnterAsTab(Sender: TObject; var Key: Char);
    procedure oBtnEditClick(Sender: TObject);
    procedure oBtnDeleteClick(Sender: TObject);
    procedure oBtnFindClick(Sender: TObject);
    procedure oBtnExitClick(Sender: TObject);
    procedure oBtnAbortClick(Sender: TObject);
    procedure oBtnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ocat_id_categoriaExit(Sender: TObject);
  private
    { Private declarations }
    iOption: integer;
  public
    { Public declarations }
  end;

var
  fMant_Gen_Cte_Cat: TfMant_Gen_Cte_Cat;

implementation

uses utilesv20, BuscarGenM2;

{$R *.dfm}

procedure TfMant_Gen_Cte_Cat.oBtnAbortClick(Sender: TObject);
begin
  self.otCtes_Cat.Cancel;
  self.Action_Control(7);
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
  self.iOption := 0;
end;

procedure TfMant_Gen_Cte_Cat.oBtnDeleteClick(Sender: TObject);
var
  nResp: integer;
begin
  if self.otCtes_Cat.isEmpty then
  begin
    self.Action_Control(6);
    self.iOption := 0;
    exit;
  end;
  self.Action_Control(3);
  nResp := MessageDlg('Seguro que desea borrar eliminar el registro alctual?', mtConfirmation, [mbYes, mbNo], 0);
  If (nResp = mrYes) Then
  begin
    self.otCtes_Cat.Delete;
    self.otCtes_Cat.Refresh;
  end;
  self.iOption := 0;
end;

procedure TfMant_Gen_Cte_Cat.oBtnEditClick(Sender: TObject);
begin
  if self.otCtes_Cat.isEmpty then
  begin
    self.Action_Control(6);
    exit;
  end;
  self.iOption := 2;
  self.PageControl1.ActivePageIndex := 1;
  self.otCtes_Cat.Edit;
  self.Action_Control(2);
  self.Activa_Objetos(true);
  self.ocat_nombre.SetFocus;
end;

procedure TfMant_Gen_Cte_Cat.oBtnExitClick(Sender: TObject);
begin
  self.close;
end;

procedure TfMant_Gen_Cte_Cat.oBtnFindClick(Sender: TObject);
begin
  self.Action_Control(4);

  Application.CreateForm(TfBuscarGenM2, fBuscarGenM2);
  fBuscarGenM2.Hide;
  fBuscarGenM2.oLst_campos.Clear;

  BuscarGenM2.oListData[1].Texto := 'Código';
  BuscarGenM2.oListData[1].Campo := 'cat_id_categoria';
  BuscarGenM2.oListData[1].LLave := true;

  BuscarGenM2.oListData[2].Texto := 'Nombre';
  BuscarGenM2.oListData[2].Campo := 'cat_nombre';
  BuscarGenM2.oListData[2].LLave := false;

  BuscarGenM2.oListData[3].Texto := 'Inactivo';
  BuscarGenM2.oListData[3].Campo := 'Inactivo';
  BuscarGenM2.oListData[3].LLave := false;

  fBuscarGenM2.oSql1.Clear;
  fBuscarGenM2.oSql1.Lines.Add('SELECT cat_id_categoria, UCASE(cat_nombre) AS cat_nombre, IF(cat_inactiva=1,"SI","NO") AS Inactivo FROM clientes_categoria WHERE 1=1 ');
  fBuscarGenM2.ShowModal;
  if BuscarGenM2.vFindResult <> '' then
  begin
    self.otCtes_Cat.Locate('cat_id_categoria', BuscarGenM2.vFindResult, []);
  end;
  freeandnil(fBuscarGenM2);
  self.PageControl1.ActivePageIndex := 0;
  self.iOption := 0;
end;

procedure TfMant_Gen_Cte_Cat.oBtnNewClick(Sender: TObject);
var
  cNext: string;
begin
  self.iOption := 1;
  self.PageControl1.ActivePageIndex := 1;
  self.otCtes_Cat.Insert;
  self.Action_Control(1);
  self.Activa_Objetos(true);

  self.ocat_nombre.SetFocus;

  // cNext := futilesv20.query_selectgen_result('SELECT IFNULL(num_fact_ries_tipo,0)+1 AS num_fact_ries_tipo FROM mant_secuenc_docs LIMIT 1');
  // self.otCtes_Cat.FieldByName('id_riezgo').AsString := trim(cNext);

  self.otCtes_Cat.FieldByName('cat_id_categoria').AsString := ''; // trim(cNext);
  self.otCtes_Cat.FieldByName('cat_inactiva').AsInteger := 0;
end;

procedure TfMant_Gen_Cte_Cat.oBtnSaveClick(Sender: TObject);
var
  cNext: string;
begin
  if (self.iOption = 1) then
  begin
    // cNext := futilesv20.query_selectgen_result('SELECT IFNULL(num_fact_ries_tipo,0)+1 AS num_fact_ries_tipo FROM mant_secuenc_docs LIMIT 1');
    // self.oQry_Frzg.FieldByName('id_riezgo').AsString := trim(cNext);

    // utilesv20.Execute_SQL_Command('UPDATE mant_secuenc_docs SET num_fact_ries_tipo=IFNULL(num_fact_ries_tipo,0)+1 WHERE 1=1');
  end;

  if (self.otCtes_Cat.State = dsedit) then
  begin
    self.otCtes_Cat.FieldByName('cat_usuario_modif').AsString := utilesv20.sUserName;
    self.otCtes_Cat.FieldByName('cat_fecha_modif').Value := now();
  end
  else if (self.otCtes_Cat.State = dsInsert) then
  begin
    self.otCtes_Cat.FieldByName('cat_usuario_alta').AsString := utilesv20.sUserName;
    self.otCtes_Cat.FieldByName('cat_fecha_alta').Value := now();
  end;

  if self.otCtes_Cat.State in [dsedit, dsInsert] then
  begin
    if futilesv20.isEmpty(self.otCtes_Cat.FieldByName('cat_id_categoria').AsString) then
    begin
      ShowMessage('Debe especificar un código válido para continuar.');
      self.PageControl1.TabIndex := 0;
      self.ocat_id_categoria.SetFocus;
      abort;
    end;

    if futilesv20.isEmpty(self.otCtes_Cat.FieldByName('cat_nombre').AsString) then
    begin
      ShowMessage('Debe especificar la descripción para continuar.');
      self.PageControl1.TabIndex := 0;
      self.ocat_nombre.SetFocus;
      abort;
    end;

  end;

  self.otCtes_Cat.Post;
  self.Action_Control(6);
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
  self.iOption := 0;
end;

procedure TfMant_Gen_Cte_Cat.ocat_id_categoriaExit(Sender: TObject);
var
  cSql_Ln, cResult, cValue: string;
  iResult: integer;
begin
  if (self.otCtes_Cat.State in [dsInsert]) then
  begin
    if (trim(self.ocat_id_categoria.Text) = '') then
      exit;

    cSql_Ln := 'SELECT COUNT(cat_id_categoria) AS cnt_regs FROM clientes_categoria WHERE cat_id_categoria="' + trim(self.ocat_id_categoria.Text) + '" LIMIT 1';
    cResult := utilesv20.Execute_SQL_Result(cSql_Ln);
    if (trim(cResult) = '') then
      cResult := '0';
    if (StrToInt(cResult) > 0) then
    begin
      iResult := MessageDlg('EL CODIGO DE ESRA CATEGORÍA, YA EXISTE.' + #13 + 'DESEA MOSTRAR LA INFORMACION CORRESPONDIENTE?', mtConfirmation, [mbYes, mbNo], 0);
      if (iResult = mrYes) then
      begin
        cValue := trim(self.ocat_id_categoria.Text);
        self.otCtes_Cat.Cancel;
        self.oBtnAbortClick(self);
        self.PageControl1.ActivePageIndex := 1;
        self.otCtes_Cat.Locate('cat_id_categoria', cValue, []);
      end
      else
      begin
        self.ocat_id_categoria.Text := '';
        self.otCtes_Cat.FieldByName('cat_id_categoria').AsString;
        exit;
      end;
    end;
  end;
end;

procedure TfMant_Gen_Cte_Cat.Action_Control(pOption: integer);
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

procedure TfMant_Gen_Cte_Cat.AssgnTabs;
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

procedure TfMant_Gen_Cte_Cat.Activa_Objetos(bFlag: boolean);
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

procedure TfMant_Gen_Cte_Cat.EnterAsTab(Sender: TObject; var Key: Char);
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

procedure TfMant_Gen_Cte_Cat.FormCreate(Sender: TObject);
begin
  self.iOption := 0;
  // self.ResizeKit1.Enabled := utiles.Ctrl_Resize;
  freeandnil(oConection);
  self.PageControl1.ActivePageIndex := 0;

  self.otCtes_Cat.Connection := futilesv20.oPublicCnn;
end;

procedure TfMant_Gen_Cte_Cat.FormShow(Sender: TObject);
begin
  self.otCtes_Cat.Open();
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
end;

end.
