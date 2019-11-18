unit Gen_Add_Desc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEh, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh,
  DBLookupEh, AdvSmoothButton, Vcl.ExtCtrls;

type
  TfGen_Add_Desc = class(TForm)
    Shape2: TShape;
    Shape1: TShape;
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    oBtn_Save_Dep: TAdvSmoothButton;
    oBtn_Ign_Dep: TAdvSmoothButton;
    oid_cliente_descuento: TDBEdit;
    oConn: TFDConnection;
    oQry_De: TFDQuery;
    oDs_De: TDataSource;
    otipo_descuento: TDBLookupComboboxEh;
    ofreq_descuento: TDBLookupComboboxEh;
    omonto_descuento: TDBNumberEditEh;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure oBtn_Ign_DepClick(Sender: TObject);
    procedure oBtn_Save_DepClick(Sender: TObject);
    procedure EnterAsTab(Sender: TObject; var Key: Char);
    procedure AssgnTabs;
    procedure Fnd_Data();
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
  fGen_Add_Desc: TfGen_Add_Desc;

implementation

USES UtilesV20, Gen_Data_Mod;
{$R *.dfm}

procedure TfGen_Add_Desc.FormCreate(Sender: TObject);
begin
  self.iOption := 0;
  self.cCte_Id := '';
  self.cReg_Id := '';
  freeandnil(oConn);
  self.oQry_De.Connection := fUtilesV20.oPublicCnn;
end;

procedure TfGen_Add_Desc.FormShow(Sender: TObject);
begin
  self.AssgnTabs();
  self.Fnd_Data();

  if (self.iOption = 1) then
  begin
    self.oQry_De.Insert;
    self.oQry_De.FieldByName('id_cliente').AsString := self.cTmp_Id;
    self.oQry_De.FieldByName('tipo_descuento').AsInteger := 0;
    self.oQry_De.FieldByName('freq_descuento').AsInteger := 0;
    self.oQry_De.FieldByName('monto_descuento').AsFloat := 0.00;
  end
  else if (self.iOption = 2) then
  begin
    self.oQry_De.Edit;
  end;
end;

procedure TfGen_Add_Desc.oBtn_Ign_DepClick(Sender: TObject);
begin
  if (self.oQry_De.State in [dsInsert, dsedit]) then
    self.oQry_De.cancel;
  close;
end;

procedure TfGen_Add_Desc.oBtn_Save_DepClick(Sender: TObject);
var
  cNext: string;
begin
  if (self.iOption = 1) then
  begin
    cNext := fUtilesV20.query_selectgen_result('SELECT IFNULL(num_cdesc,0)+1 AS num_cdesc FROM mant_secuenc_docs LIMIT 1');
    self.oQry_De.FieldByName('id_cliente_descuento').AsString := trim(cNext);
    UtilesV20.Execute_SQL_Command('UPDATE mant_secuenc_docs SET num_cdesc=IFNULL(num_cdesc,0)+1 WHERE 1=1');
  end;

  if ((self.iOption = 1) or (self.iOption = 2)) then
  begin
    if ((self.otipo_descuento.KeyValue = 0) or (self.otipo_descuento.KeyValue = null)) then
    begin
      MessageDlg('No es posible hacer cambios si no regira el TIPO DE DESCUENTO.', mtConfirmation, [mbOk], 0);
      self.otipo_descuento.SetFocus;
      exit;
    end;

    if ((self.ofreq_descuento.KeyValue = 0) or (self.ofreq_descuento.KeyValue = null)) then
    begin
      MessageDlg('No es posible hacer cambios si no regira el FREQUENCIA DE COBRO.', mtConfirmation, [mbOk], 0);
      self.ofreq_descuento.SetFocus;
      exit;
    end;

    if (self.omonto_descuento.value = 0) then
    begin
      MessageDlg('No es posible hacer cambios si no regira el MONTO DEL DESCUENTO.', mtConfirmation, [mbOk], 0);
      self.omonto_descuento.SetFocus;
      exit;
    end;

  end;

  if (self.oQry_De.State in [dsInsert, dsedit]) then
  begin
    if (self.oQry_De.State in [dsInsert]) then
    begin
      self.oQry_De.FieldByName('flag_tmp').AsInteger := 1;
      self.oQry_De.FieldByName('id_cliente').AsString := self.cTmp_Id;
    end
    else
      self.oQry_De.FieldByName('id_cliente').AsString := self.cCte_Id;

    self.oQry_De.FieldByName('ultima_fecha_actualizacion').AsDateTime := now();
    self.oQry_De.FieldByName('ultimo_usuario_que_actualizo').AsInteger := UtilesV20.iUserID;
    self.oQry_De.Post;
  end;

  close;
end;

procedure TfGen_Add_Desc.Fnd_Data();
VAR
  cSql_Str: string;
begin
  if (trim(self.cCte_Id) = '') then
    self.cCte_Id := 'ABC-123';

  cSql_Str := '';
  cSql_Str := cSql_Str + 'SELECT * ';
  cSql_Str := cSql_Str + 'FROM cliente_descuentos ';
  cSql_Str := cSql_Str + 'WHERE (id_cliente="' + self.cCte_Id + '") ';
  if (trim(self.cReg_Id) <> '') then
    cSql_Str := cSql_Str + 'AND (id_cliente_descuento="' + self.cReg_Id + '") ';

  self.oQry_De.close;
  self.oQry_De.SQL.Clear;
  self.oQry_De.SQL.Text := cSql_Str;
  self.oQry_De.Open();
  self.oDs_De.DataSet := self.oQry_De;
end;

procedure TfGen_Add_Desc.AssgnTabs;
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

procedure TfGen_Add_Desc.EnterAsTab(Sender: TObject; var Key: Char);
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
