unit Gen_Add_PerT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEh, DBLookupEh, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, PngBitBtn,
  Vcl.Mask, DBCtrlsEh, Vcl.ExtCtrls, Data.DB, System.DateUtils, AdvSmoothButton,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfGen_Add_PerT = class(TForm)
    Shape2: TShape;
    Label2: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Shape1: TShape;
    Label8: TLabel;
    Label9: TLabel;
    oId_cliente: TDBEdit;
    oId_cliente_transacciones: TDBEdit;
    Label1: TLabel;
    Label3: TLabel;
    oMonto_transaccion: TDBNumberEditEh;
    oLst_Tipo_Trans: TDBLookupComboboxEh;
    oLst_FP: TDBLookupComboboxEh;
    oBtn_Save_Dep: TAdvSmoothButton;
    oBtn_Ign_Dep: TAdvSmoothButton;
    oNumero_transaccion: TDBNumberEditEh;
    Label4: TLabel;
    oLst_Frec: TDBLookupComboboxEh;
    oConn: TFDConnection;
    oQry_Pt: TFDQuery;
    oDs_Pt: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure oBtn_Ign_DepClick(Sender: TObject);
    procedure oBtn_Save_DepClick(Sender: TObject);
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
  fGen_Add_PerT: TfGen_Add_PerT;

implementation

uses UtilesV20, Gen_Data_Mod;
{$R *.dfm}

procedure TfGen_Add_PerT.FormCreate(Sender: TObject);
begin
  self.iOption := 0;
  self.cCte_Id := '';
  self.cReg_Id := '';
  freeandnil(oConn);
  self.oQry_Pt.Connection := fUtilesV20.oPublicCnn;
end;

procedure TfGen_Add_PerT.FormShow(Sender: TObject);
VAR
  cSql_Ln: string;
begin
  self.AssgnTabs();
  self.Fnd_Data();

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SET @MAX_value:=(SELECT MAX(id_cliente_transacciones)+1 AS id_cliente_transacciones FROM cliente_transacciones);';
  cSql_Ln := cSql_Ln + 'UPDATE mant_secuenc_docs SET cliente_transacciones=@MAX_value WHERE IFNULL(cliente_transacciones,0)=0;';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  if (self.iOption = 1) then
  begin
    self.oQry_Pt.Insert;
    self.oQry_Pt.FieldByName('id_cliente').AsString := self.cTmp_Id;
    self.oQry_Pt.FieldByName('monto_transaccion').AsInteger := 0;
    self.oQry_Pt.FieldByName('monto_transaccion_retiro').AsInteger := 0;
    self.oQry_Pt.FieldByName('cod_tipo_tran').AsInteger := 0;
    self.oQry_Pt.FieldByName('tipo_transaccion').AsString := '';
    self.oQry_Pt.FieldByName('cod_forma').AsInteger := 0;
    self.oQry_Pt.FieldByName('forma_pago').AsString := '';
    self.oQry_Pt.FieldByName('numero_transaccion').AsString := '';
  end
  else if (self.iOption = 2) then
  begin
    self.oQry_Pt.Edit;
  end;

  self.oLst_Tipo_Trans.SetFocus;
end;

procedure TfGen_Add_PerT.oBtn_Ign_DepClick(Sender: TObject);
begin
  if (self.oQry_Pt.State in [dsInsert, dsedit]) then
    self.oQry_Pt.cancel;

  close;
end;

procedure TfGen_Add_PerT.oBtn_Save_DepClick(Sender: TObject);
var
  cNext: string;
begin
  if (self.iOption = 1) then
  begin
    cNext := fUtilesV20.query_selectgen_result('SELECT IFNULL(cliente_transacciones,0)+1 AS cliente_transacciones FROM mant_secuenc_docs LIMIT 1');
    self.oQry_Pt.FieldByName('id_cliente_transacciones').AsString := trim(cNext);
    UtilesV20.Execute_SQL_Command('UPDATE mant_secuenc_docs SET cliente_transacciones=IFNULL(cliente_transacciones,0)+1 WHERE 1=1');
  end;

  if ((self.iOption = 1) or (self.iOption = 2)) then
  begin
    if ((self.oLst_Tipo_Trans.KeyValue = 0) or (self.oLst_Tipo_Trans.KeyValue = null)) then
    begin
      MessageDlg('No es posible hacer cambios sin regira el tipo de transacción.', mtConfirmation, [mbOk], 0);
      self.oLst_Tipo_Trans.SetFocus;
      exit;
    end;

    if ((self.oLst_FP.KeyValue = 0) or (self.oLst_FP.KeyValue = null)) then
    begin
      MessageDlg('No es posible hacer cambios sino regira el la forma de pago.', mtConfirmation, [mbOk], 0);
      self.oLst_FP.SetFocus;
      exit;
    end;

    if (self.oMonto_transaccion.Value = 0) then
    begin
      MessageDlg('No es posible hacer cambios sino regira los montos.', mtConfirmation, [mbOk], 0);
      self.oMonto_transaccion.SetFocus;
      exit;
    end;

    if (self.oNumero_transaccion.Text = '') then
    begin
      MessageDlg('No es posible hacer cambios sino regira la frecuencia.', mtConfirmation, [mbOk], 0);
      self.oNumero_transaccion.SetFocus;
      exit;
    end;

    if (self.oQry_Pt.State in [dsInsert, dsedit]) then
    begin

      if (self.oQry_Pt.State in [dsInsert]) then
      begin
        self.oQry_Pt.FieldByName('flag_tmp').AsInteger := 1;
        self.oQry_Pt.FieldByName('id_cliente').AsString := self.cTmp_Id;
      end
      else
        self.oQry_Pt.FieldByName('id_cliente').AsString := self.cCte_Id;

      self.oQry_Pt.FieldByName('ultima_fecha_actualizacion').AsDateTime := now();
      self.oQry_Pt.FieldByName('ultimo_usuario_que_actualizo').AsInteger := UtilesV20.iUserID;
      self.oQry_Pt.FieldByName('tipo_transaccion').AsString := self.oLst_Tipo_Trans.Text;
      self.oQry_Pt.FieldByName('forma_pago').AsString := self.oLst_FP.Text;
      self.oQry_Pt.Post;
    end;
  end;

  close;
end;

procedure TfGen_Add_PerT.Fnd_Data();
VAR
  cSql_Str: string;
begin
  if (trim(self.cCte_Id) = '') then
    self.cCte_Id := 'ABC-123';

  cSql_Str := '';
  cSql_Str := cSql_Str + 'SELECT * ';
  cSql_Str := cSql_Str + 'FROM cliente_transacciones ';
  cSql_Str := cSql_Str + 'WHERE (id_cliente="' + self.cCte_Id + '") ';
  if (trim(self.cReg_Id) <> '') then
    cSql_Str := cSql_Str + 'AND (id_cliente_transacciones="' + self.cReg_Id + '") ';

  self.oQry_Pt.close;
  self.oQry_Pt.SQL.Clear;
  self.oQry_Pt.SQL.Text := cSql_Str;
  self.oQry_Pt.Open();
  self.oDs_Pt.DataSet := self.oQry_Pt;
end;

procedure TfGen_Add_PerT.AssgnTabs;
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

procedure TfGen_Add_PerT.EnterAsTab(Sender: TObject; var Key: Char);
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
