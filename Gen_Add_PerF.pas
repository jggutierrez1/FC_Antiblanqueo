unit Gen_Add_PerF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, PngBitBtn, DBCtrlsEh, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ExtCtrls, DBGridEh, DBLookupEh, Data.DB, System.DateUtils, AdvSmoothButton,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfGen_Add_PerF = class(TForm)
    Shape2: TShape;
    Label2: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Shape1: TShape;
    Label8: TLabel;
    Label9: TLabel;
    oMonto_fijo: TDBNumberEditEh;
    oId_cliente: TDBEdit;
    oId_origen_ingresos: TDBEdit;
    oLst_Concepto: TDBLookupComboboxEh;
    Label1: TLabel;
    oLst_FP: TDBLookupComboboxEh;
    oLst_Frec: TDBLookupComboboxEh;
    Label3: TLabel;
    oOrigen_fondo: TDBEdit;
    oBtn_Save_Dep: TAdvSmoothButton;
    oBtn_Ign_Dep: TAdvSmoothButton;
    oConn: TFDConnection;
    oQry_Pf: TFDQuery;
    oDs_Pf: TDataSource;
    procedure oBtn_Ign_DepClick(Sender: TObject);
    procedure oBtn_Save_DepClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  fGen_Add_PerF: TfGen_Add_PerF;

implementation

uses UtilesV20, Gen_Data_Mod;

{$R *.dfm}

procedure TfGen_Add_PerF.FormCreate(Sender: TObject);
begin
  self.iOption := 0;
  self.cCte_Id := '';
  self.cReg_Id := '';
  freeandnil(oConn);
  self.oQry_Pf.Connection := fUtilesV20.oPublicCnn;
end;

procedure TfGen_Add_PerF.FormShow(Sender: TObject);
VAR
  cSql_Ln: string;
begin
  self.AssgnTabs();
  self.Fnd_Data();

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SET @MAX_value:=(SELECT MAX(id_origen_ingresos)+1 AS id_origen_ingresos FROM cliente_origen_ingresos);';
  cSql_Ln := cSql_Ln + 'UPDATE mant_secuenc_docs SET num_origen_ingresos=@MAX_value WHERE IFNULL(num_origen_ingresos,0)=0;';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  if (self.iOption = 1) then
  begin
    self.oQry_Pf.Insert;
    self.oQry_Pf.FieldByName('id_cliente').AsString := self.cTmp_Id;
    self.oQry_Pf.FieldByName('monto_fijo').AsInteger := 0;
    self.oQry_Pf.FieldByName('concepto').AsInteger := 0;
    self.oQry_Pf.FieldByName('cod_freq').AsInteger := 0;
    self.oQry_Pf.FieldByName('cod_forma').AsInteger := 0;
    self.oQry_Pf.FieldByName('origen_fondo').AsString := '';
  end
  else if (self.iOption = 2) then
  begin
    self.oQry_Pf.Edit;
  end;

  self.oLst_Concepto.SetFocus;
end;

procedure TfGen_Add_PerF.oBtn_Ign_DepClick(Sender: TObject);
begin
  if (self.oQry_Pf.State in [dsInsert, dsedit]) then
    self.oQry_Pf.cancel;

  close;
end;

procedure TfGen_Add_PerF.oBtn_Save_DepClick(Sender: TObject);
var
  cNext: string;
begin

  if (self.iOption = 1) then
  begin
    cNext := fUtilesV20.query_selectgen_result('SELECT IFNULL(num_origen_ingresos,0)+1 AS num_origen_ingresos FROM mant_secuenc_docs LIMIT 1');
    self.oQry_Pf.FieldByName('id_origen_ingresos').AsString := trim(cNext);
    UtilesV20.Execute_SQL_Command('UPDATE mant_secuenc_docs SET num_origen_ingresos=IFNULL(num_origen_ingresos,0)+1 WHERE 1=1');
  end;

  if ((self.iOption = 1) or (self.iOption = 2)) then
  begin
    if ((self.oLst_Concepto.KeyValue = 0) or (self.oLst_Concepto.KeyValue = null)) then
    begin
      MessageDlg('No es posible hacer cambios sino regira el concepto.', mtConfirmation, [mbOk], 0);
      self.oLst_Concepto.SetFocus;
      exit;
    end;

    if ((self.oLst_Frec.KeyValue = 0) or (self.oLst_Frec.KeyValue = null)) then
    begin
      MessageDlg('No es posible hacer cambios sino regira el la frecuencia.', mtConfirmation, [mbOk], 0);
      self.oLst_Frec.SetFocus;
      exit;
    end;

    if ((self.oLst_FP.KeyValue = 0) or (self.oLst_FP.KeyValue = null)) then
    begin
      MessageDlg('No es posible hacer cambios sino regira el la forma de pago.', mtConfirmation, [mbOk], 0);
      self.oLst_FP.SetFocus;
      exit;
    end;

    if (self.oMonto_fijo.Value = 0) then
    begin
      MessageDlg('No es posible hacer cambios sino regira el monto.', mtConfirmation, [mbOk], 0);
      self.oMonto_fijo.SetFocus;
      exit;
    end;

    if (self.oOrigen_fondo.Text = '') then
    begin
      MessageDlg('No es posible hacer cambios sino regira el origen de los fondos.', mtConfirmation, [mbOk], 0);
      self.oOrigen_fondo.SetFocus;
      exit;
    end;

    if (self.oQry_Pf.State in [dsInsert, dsedit]) then
    begin

      if (self.oQry_Pf.State in [dsInsert]) then
      begin
        self.oQry_Pf.FieldByName('flag_tmp').AsInteger := 1;
        self.oQry_Pf.FieldByName('id_cliente').AsString := self.cTmp_Id;
      end
      else
        self.oQry_Pf.FieldByName('id_cliente').AsString := self.cCte_Id;

      self.oQry_Pf.FieldByName('como_recibe').AsString := self.oLst_Concepto.Text;
      self.oQry_Pf.FieldByName('frecuencia').AsString := self.oLst_Frec.Text;
      self.oQry_Pf.FieldByName('ultima_fecha_actualizacion').AsDateTime := now();
      self.oQry_Pf.FieldByName('ultimo_usuario_que_actualizo').AsInteger := UtilesV20.iUserID;
      self.oQry_Pf.Post;
    end;
  end;

  close;
end;

procedure TfGen_Add_PerF.Fnd_Data();
VAR
  cSql_Str: string;
begin
  if (trim(self.cCte_Id) = '') then
    self.cCte_Id := 'ABC-123';

  cSql_Str := '';
  cSql_Str := cSql_Str + 'SELECT * ';
  cSql_Str := cSql_Str + 'FROM cliente_origen_ingresos ';
  cSql_Str := cSql_Str + 'WHERE (id_cliente="' + self.cCte_Id + '") ';
  if (trim(self.cReg_Id) <> '') then
    cSql_Str := cSql_Str + 'AND (id_origen_ingresos="' + self.cReg_Id + '") ';

  self.oQry_Pf.close;
  self.oQry_Pf.SQL.Clear;
  self.oQry_Pf.SQL.Text := cSql_Str;
  self.oQry_Pf.Open();
  self.oDs_Pf.DataSet := self.oQry_Pf;
end;

procedure TfGen_Add_PerF.AssgnTabs;
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

procedure TfGen_Add_PerF.EnterAsTab(Sender: TObject; var Key: Char);
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
