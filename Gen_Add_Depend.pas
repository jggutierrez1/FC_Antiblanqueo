unit Gen_Add_Depend;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBCtrlsEh, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Buttons,
  PngBitBtn, Data.DB, System.DateUtils, AdvSmoothButton, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, DBGridEh, DBLookupEh;

type
  TfGen_Add_Depend = class(TForm)
    Label2: TLabel;
    oFecha_nacimiento: TDBDateTimeEditEh;
    Label7: TLabel;
    oNombre: TDBEdit;
    Label1: TLabel;
    oApellido: TDBEdit;
    Label3: TLabel;
    oParentezco: TDBEdit;
    oEdad: TDBNumberEditEh;
    Label4: TLabel;
    oEs_beneficiario: TDBCheckBoxEh;
    Label5: TLabel;
    Label6: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Label8: TLabel;
    oId_cliente: TDBEdit;
    Label9: TLabel;
    oId_cliente_dependientes: TDBEdit;
    Label10: TLabel;
    oPorcentaje: TDBNumberEditEh;
    oBtn_Save_Dep: TAdvSmoothButton;
    oBtn_Ign_Dep: TAdvSmoothButton;
    oConn: TFDConnection;
    oQry_De: TFDQuery;
    oDs_De: TDataSource;
    procedure oBtn_Ign_DepClick(Sender: TObject);
    procedure oBtn_Save_DepClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure oFecha_nacimientoExit(Sender: TObject);
    procedure oEdadExit(Sender: TObject);
    procedure oEs_beneficiarioClick(Sender: TObject);
    procedure Fnd_Data();
    procedure EnterAsTab(Sender: TObject; var Key: Char);
    procedure AssgnTabs;
  private
    { Private declarations }
  public
    iOption: integer;
    cCte_Id: string;
    cTmp_Id: string;
    cReg_Id: string;
    { Public declarations }
  end;

var
  fGen_Add_Depend: TfGen_Add_Depend;

implementation

uses UtilesV20, Gen_Data_Mod;
{$R *.dfm}

procedure TfGen_Add_Depend.FormCreate(Sender: TObject);
begin
  self.iOption := 0;
  self.cCte_Id := '';
  self.cReg_Id := '';
  freeandnil(oConn);
  self.oQry_De.Connection := fUtilesV20.oPublicCnn;
end;

procedure TfGen_Add_Depend.FormShow(Sender: TObject);
begin
  self.AssgnTabs();
  self.Fnd_Data();

  if self.iOption = 1 then
  begin
    self.oQry_De.Insert;
    self.oQry_De.FieldByName('id_cliente').AsString := cTmp_Id;
    self.oQry_De.FieldByName('edad').AsFloat := 0.00;
    self.oQry_De.FieldByName('es_beneficiario').AsInteger := 0;
    self.oQry_De.FieldByName('porcentaje').AsFloat := 0.00;
  end
  else if self.iOption = 2 then
  begin
    self.oQry_De.Edit;
  end;

  if (self.oEs_beneficiario.Checked = true) then
    self.oPorcentaje.Enabled := true
  else
    self.oPorcentaje.Enabled := false;

end;

procedure TfGen_Add_Depend.oBtn_Ign_DepClick(Sender: TObject);
begin
  if (self.oQry_De.State in [dsInsert, dsedit]) then
    self.oQry_De.cancel;

  close;
end;

procedure TfGen_Add_Depend.oBtn_Save_DepClick(Sender: TObject);
var
  cNext: string;
begin

  if (self.iOption = 1) then
  begin
    cNext := fUtilesV20.query_selectgen_result('SELECT IFNULL(num_depend,0)+1 AS num_depend FROM mant_secuenc_docs LIMIT 1');
    self.oQry_De.FieldByName('id_cliente_dependientes').AsString := trim(cNext);
    UtilesV20.Execute_SQL_Command('UPDATE mant_secuenc_docs SET num_depend=IFNULL(num_depend,0)+1 WHERE 1=1');
  end;

  if ((self.iOption = 1) or (self.iOption = 2)) then
  begin
    if (self.oNombre.Text = '') then
    begin
      MessageDlg('No es posible hacer cambios sino regira el nombre.', mtConfirmation, [mbOk], 0);
      self.oNombre.SetFocus;
      exit;
    end;

    if (self.oParentezco.Text = '') then
    begin
      MessageDlg('No es posible hacer cambios sino regira el parentezco.', mtConfirmation, [mbOk], 0);
      self.oParentezco.SetFocus;
      exit;
    end;

    if (self.oFecha_nacimiento.value = null) then
    begin
      MessageDlg('Es importante colocar la fecha de nacimiento', mtConfirmation, [mbOk], 0);
      exit;
    end;

    if (self.oQry_De.State in [dsInsert, dsedit]) then
    begin

      if (self.oQry_De.State in [dsInsert]) then
      begin
        self.oQry_De.FieldByName('flag_tmp').AsInteger := 1;
        self.oQry_De.FieldByName('id_cliente').AsString := trim(self.cTmp_Id);
      end
      else
        self.oQry_De.FieldByName('id_cliente').AsString := trim(self.cCte_Id);

      self.oQry_De.FieldByName('ultima_fecha_actualizacion').AsDateTime := now();
      self.oQry_De.FieldByName('ultimo_usuario_que_actualizo').AsInteger := UtilesV20.iUserID;
      self.oQry_De.Post;
    end;
  end;

  close;
end;

procedure TfGen_Add_Depend.oEdadExit(Sender: TObject);
begin
  if (self.oQry_De.State in [dsInsert, dsedit]) then
  begin
    if (self.oFecha_nacimiento.value = null) then
    begin
      self.oFecha_nacimiento.value := now() - (self.oEdad.value * 365);
      self.oFecha_nacimiento.Refresh;
      self.oEdad.Enabled := false;
    end;
  end;
end;

procedure TfGen_Add_Depend.oEs_beneficiarioClick(Sender: TObject);
begin
  if (self.oQry_De.State in [dsInsert, dsedit]) then
  begin
    if (self.oEs_beneficiario.Checked = true) then
    begin
      self.oPorcentaje.Enabled := true;
    end
    else
    begin
      self.oPorcentaje.value := 0.00;
      self.oPorcentaje.Enabled := false;
    end;
  end;
end;

procedure TfGen_Add_Depend.oFecha_nacimientoExit(Sender: TObject);
begin
  if (self.oQry_De.State in [dsInsert, dsedit]) then
  begin
    if (self.oFecha_nacimiento.value <> null) then
    begin
      self.oEdad.value := YearOf(now()) - YearOf(self.oFecha_nacimiento.value);
      self.oEdad.Enabled := false;
      self.oParentezco.SetFocus;
    end
    else
    begin
      self.oEdad.Enabled := true;
      self.oEdad.SetFocus;
    end;
  end;
end;

procedure TfGen_Add_Depend.Fnd_Data();
VAR
  cSql_Str: string;
begin
  if (trim(self.cCte_Id) = '') then
    self.cCte_Id := 'ABC-123';

  cSql_Str := '';
  cSql_Str := cSql_Str + 'SELECT * ';
  cSql_Str := cSql_Str + 'FROM cliente_dependientes ';
  cSql_Str := cSql_Str + 'WHERE (id_cliente="' + self.cCte_Id + '") ';
  if (trim(self.cReg_Id) <> '') then
    cSql_Str := cSql_Str + 'AND (id_cliente_dependientes="' + self.cReg_Id + '") ';

  self.oQry_De.close;
  self.oQry_De.SQL.Clear;
  self.oQry_De.SQL.Text := cSql_Str;
  self.oQry_De.Open();
  self.oDs_De.DataSet := self.oQry_De;
end;

procedure TfGen_Add_Depend.AssgnTabs;
var
  j: integer;
  oComponents: TControl;
begin
  for j := 0 to ComponentCount - 1 do
  begin
    if (Components[j] is TCheckBox) then
      TCheckBox(self.Components[j]).OnKeyPress := self.EnterAsTab;

    if (Components[j] is TDBCheckBox) then
      TDBCheckBox(self.Components[j]).OnKeyPress := self.EnterAsTab;

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
      TEdit(self.Components[j]).OnKeyPress := self.EnterAsTab;
  end;
end;

procedure TfGen_Add_Depend.EnterAsTab(Sender: TObject; var Key: Char);
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

end.
