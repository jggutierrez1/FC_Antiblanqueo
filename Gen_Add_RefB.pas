unit Gen_Add_RefB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvSmoothButton, Data.DB, System.DateUtils,
  Vcl.ExtCtrls, DBGridEh, DBCtrlsEh, DBLookupEh, Vcl.Mask, Vcl.DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfGen_Add_RefB = class(TForm)
    Shape1: TShape;
    oBtn_Save_Dep: TAdvSmoothButton;
    oBtn_Ign_Dep: TAdvSmoothButton;
    Label6: TLabel;
    Shape2: TShape;
    Label1: TLabel;
    Label2: TLabel;
    oId_banco: TDBLookupComboboxEh;
    Label3: TLabel;
    Label9: TLabel;
    oid_cliente_referencias_bancarias: TDBEdit;
    oNum_cuenta: TDBEdit;
    oTipo_cuenta: TDBEdit;
    oConn: TFDConnection;
    oQry_Rb: TFDQuery;
    oDs_Rb: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure oBtn_Ign_DepClick(Sender: TObject);
    procedure oBtn_Save_DepClick(Sender: TObject);
    procedure Fnd_Data();
    procedure AssgnTabs;
    procedure EnterAsTab(Sender: TObject; var Key: Char);
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
  fGen_Add_RefB: TfGen_Add_RefB;

implementation

uses UtilesV20, Gen_Data_Mod;

{$R *.dfm}

procedure TfGen_Add_RefB.FormCreate(Sender: TObject);
begin
  self.iOption := 0;
  self.cCte_Id := '';
  self.cReg_Id := '';
  freeandnil(oConn);
  self.oQry_Rb.Connection := fUtilesV20.oPublicCnn;
end;

procedure TfGen_Add_RefB.FormShow(Sender: TObject);
begin
  self.AssgnTabs();
  self.Fnd_Data();

  if (self.iOption = 1) then
  begin
    self.oQry_Rb.Insert;
    self.oQry_Rb.FieldByName('id_cliente').AsString := self.cTmp_Id;
    self.oQry_Rb.FieldByName('id_banco').AsInteger := 0;
    self.oQry_Rb.FieldByName('num_cuenta').AsString := '';
    self.oQry_Rb.FieldByName('tipo_cuenta').AsString := '';
  end
  else if (self.iOption = 2) then
  begin
    self.oQry_Rb.Edit;
  end;
end;

procedure TfGen_Add_RefB.oBtn_Ign_DepClick(Sender: TObject);
begin
  if (self.oQry_Rb.State in [dsInsert, dsedit]) then
    self.oQry_Rb.cancel;
  close;
end;

procedure TfGen_Add_RefB.oBtn_Save_DepClick(Sender: TObject);
var
  cNext: string;
begin
  if (self.iOption = 1) then
  begin
    cNext := fUtilesV20.query_selectgen_result('SELECT IFNULL(num_refer_b,0)+1 AS num_refer_b FROM mant_secuenc_docs LIMIT 1');
    self.oQry_Rb.FieldByName('id_cliente_referencias_bancarias').AsString := trim(cNext);
    UtilesV20.Execute_SQL_Command('UPDATE mant_secuenc_docs SET num_refer_b=IFNULL(num_refer_b,0)+1 WHERE 1=1');
  end;

  if ((self.iOption = 1) or (self.iOption = 2)) then
  begin
    if ((self.oId_banco.KeyValue = 0) or (self.oId_banco.KeyValue = null)) then
    begin
      MessageDlg('No es posible hacer cambios sino regira el nombre del BANCO.', mtConfirmation, [mbOk], 0);
      self.oId_banco.SetFocus;
      exit;
    end;

    if (self.oNum_cuenta.Text = '') then
    begin
      MessageDlg('No es posible hacer cambios sino regira el número de cuenta.', mtConfirmation, [mbOk], 0);
      self.oNum_cuenta.SetFocus;
      exit;
    end;

    if (self.oTipo_cuenta.Text = '') then
    begin
      MessageDlg('No es posible hacer cambios sino regira el tipo de cuenta.', mtConfirmation, [mbOk], 0);
      self.oTipo_cuenta.SetFocus;
      exit;
    end;
  end;

  if (self.oQry_Rb.State in [dsInsert, dsedit]) then
  begin
    if (self.oQry_Rb.State in [dsInsert]) then
    begin
      self.oQry_Rb.FieldByName('flag_tmp').AsInteger := 1;
      self.oQry_Rb.FieldByName('id_cliente').AsString := self.cTmp_Id;
    end
    else
      self.oQry_Rb.FieldByName('id_cliente').AsString := self.cCte_Id;

    self.oQry_Rb.FieldByName('ultima_fecha_actualizacion').AsDateTime := now();
    self.oQry_Rb.FieldByName('ultimo_usuario_que_actualizo').AsInteger := UtilesV20.iUserID;
    self.oQry_Rb.Post;
  end;

  close;
end;

procedure TfGen_Add_RefB.Fnd_Data();
VAR
  cSql_Str: string;
begin
  if (trim(self.cCte_Id) = '') then
    self.cCte_Id := 'ABC-123';

  cSql_Str := '';
  cSql_Str := cSql_Str + 'SELECT * ';
  cSql_Str := cSql_Str + 'FROM cliente_referencias_bancarias ';
  cSql_Str := cSql_Str + 'WHERE (id_cliente="' + self.cCte_Id + '") ';
  if (trim(self.cReg_Id) <> '') then
    cSql_Str := cSql_Str + 'AND (id_cliente_referencias_bancarias="' + self.cReg_Id + '") ';

  self.oQry_Rb.close;
  self.oQry_Rb.SQL.Clear;
  self.oQry_Rb.SQL.Text := cSql_Str;
  self.oQry_Rb.Open();
  self.oDs_Rb.DataSet := self.oQry_Rb;
end;

procedure TfGen_Add_RefB.AssgnTabs;
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

procedure TfGen_Add_RefB.EnterAsTab(Sender: TObject; var Key: Char);
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
