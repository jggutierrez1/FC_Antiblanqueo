unit Gen_Add_Activos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, PngBitBtn, DBCtrlsEh, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Data.DB, System.DateUtils, AdvSmoothButton, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, DBGridEh, DBLookupEh;

type
  TfGen_Add_Activos = class(TForm)
    Shape2: TShape;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Shape1: TShape;
    Label8: TLabel;
    Label9: TLabel;
    oOfon_descripcion: TDBEdit;
    oOfon_avaluo_activo: TDBNumberEditEh;
    oOfon_id_cliente: TDBEdit;
    oOfon_id: TDBEdit;
    oBtn_Save_Dep: TAdvSmoothButton;
    oBtn_Ign_Dep: TAdvSmoothButton;
    Label1: TLabel;
    oOfon_nombre_activo: TDBEdit;
    oConn: TFDConnection;
    oQry_Ac: TFDQuery;
    oDs_Ac: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure oBtn_Edit_DepClick(Sender: TObject);
    procedure oBtn_Del_DepClick(Sender: TObject);
    procedure Fnd_Data();
    procedure EnterAsTab(Sender: TObject; var Key: Char);
    procedure AssgnTabs;
  private
    { Private declarations }
  public
    { Public declarations }
    iOption: integer;
    cCte_Id: string;
    cTmp_Id: string;
    cReg_Id: string;
  end;

var
  fGen_Add_Activos: TfGen_Add_Activos;

implementation

uses UtilesV20;
{$R *.dfm}

procedure TfGen_Add_Activos.FormCreate(Sender: TObject);
begin
  self.iOption := 0;
  self.cCte_Id := '';
  self.cReg_Id := '';
  freeandnil(oConn);
  self.oQry_Ac.Connection := fUtilesV20.oPublicCnn;
end;

procedure TfGen_Add_Activos.FormShow(Sender: TObject);
begin
  self.AssgnTabs();
  self.Fnd_Data();

  if (self.iOption = 1) then
  begin
    self.oQry_Ac.Insert;
    self.oQry_Ac.FieldByName('ofon_id_cliente').AsString := self.cTmp_Id;
    self.oQry_Ac.FieldByName('ofon_descripcion').AsString := '';
    self.oQry_Ac.FieldByName('ofon_avaluo_activo').AsFloat := 0.00;
  end
  else if (self.iOption = 2) then
  begin
    self.oQry_Ac.Edit;
  end;

end;

procedure TfGen_Add_Activos.oBtn_Del_DepClick(Sender: TObject);
begin
  if (self.oQry_Ac.State in [dsInsert, dsedit]) then
    self.oQry_Ac.cancel;
  close;
end;

procedure TfGen_Add_Activos.oBtn_Edit_DepClick(Sender: TObject);
var
  cNext: string;
begin
  if (self.iOption = 1) then
  begin
    cNext := fUtilesV20.query_selectgen_result('SELECT IFNULL(num_activo,0)+1 AS num_activo FROM mant_secuenc_docs LIMIT 1');
    self.oQry_Ac.FieldByName('ofon_id').AsString := trim(cNext);
    UtilesV20.Execute_SQL_Command('UPDATE mant_secuenc_docs SET num_activo=IFNULL(num_activo,0)+1 WHERE 1=1');
  end;

  if ((self.iOption = 1) or (self.iOption = 2)) then
  begin
    if (self.oOfon_descripcion.Text = '') then
    begin
      MessageDlg('No es posible hacer cambios sino regira el nombre del activo.', mtConfirmation, [mbOk], 0);
      self.oOfon_descripcion.SetFocus;
      exit;
    end;

    if (self.oOfon_avaluo_activo.Value <= 0) then
    begin
      MessageDlg('No es posible hacer cambios sino regira el monto del avaluo.', mtConfirmation, [mbOk], 0);
      self.oOfon_avaluo_activo.SetFocus;
      exit;
    end;
  end;

  if (self.oQry_Ac.State in [dsInsert, dsedit]) then
  begin
    if (self.oQry_Ac.State in [dsInsert]) then
    begin
      self.oQry_Ac.FieldByName('flag_tmp').AsInteger := 1;
      self.oQry_Ac.FieldByName('ofon_id_cliente').AsString := self.cTmp_Id;
    end
    else
      self.oQry_Ac.FieldByName('ofon_id_cliente').AsString := self.cCte_Id;

    self.oQry_Ac.FieldByName('ultima_fecha_actualizacion').AsDateTime := now();
    self.oQry_Ac.FieldByName('ultimo_usuario_que_actualizo').AsInteger := UtilesV20.iUserID;
    self.oQry_Ac.Post;
  end;

  close;
end;

procedure TfGen_Add_Activos.Fnd_Data();
VAR
  cSql_Str: string;
begin
  if (trim(self.cCte_Id) = '') then
    self.cCte_Id := 'ABC-123';

  cSql_Str := '';
  cSql_Str := cSql_Str + 'SELECT * ';
  cSql_Str := cSql_Str + 'FROM cliente_origen_fondos ';
  cSql_Str := cSql_Str + 'WHERE (ofon_id_cliente="' + self.cCte_Id + '") ';
  if (trim(self.cReg_Id) <> '') then
    cSql_Str := cSql_Str + 'AND (ofon_id="' + self.cReg_Id + '") ';

  self.oQry_Ac.close;
  self.oQry_Ac.SQL.Clear;
  self.oQry_Ac.SQL.Text := cSql_Str;
  self.oQry_Ac.Open();
  self.oDs_Ac.DataSet := self.oQry_Ac;
end;

procedure TfGen_Add_Activos.AssgnTabs;
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

procedure TfGen_Add_Activos.EnterAsTab(Sender: TObject; var Key: Char);
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
