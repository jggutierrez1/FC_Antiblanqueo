unit Gen_Add_RefG;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls, AdvSmoothButton, DBCtrlsEh,
  Vcl.Mask, Vcl.DBCtrls, DBGridEh, DBLookupEh;

type
  TfGen_Add_RefG = class(TForm)
    oConn: TFDConnection;
    oQry_Rg: TFDQuery;
    oDs_Rg: TDataSource;
    Shape2: TShape;
    Label6: TLabel;
    Shape1: TShape;
    oBtn_Save_Dep: TAdvSmoothButton;
    oBtn_Ign_Dep: TAdvSmoothButton;
    olNombre: TLabel;
    onombre: TDBEdit;
    Label2: TLabel;
    orelacion: TDBEdit;
    Label3: TLabel;
    otelefono: TDBEdit;
    Label4: TLabel;
    olugar_trabajo: TDBEdit;
    Label5: TLabel;
    otipo: TDBComboBoxEh;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Fnd_Data();
    procedure oBtn_Ign_DepClick(Sender: TObject);
    procedure oBtn_Save_DepClick(Sender: TObject);
    procedure otipoCloseUp(Sender: TObject; Accept: Boolean);
    procedure Check_Tipo;
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
  fGen_Add_RefG: TfGen_Add_RefG;

implementation

uses UtilesV20;

{$R *.dfm}

procedure TfGen_Add_RefG.FormCreate(Sender: TObject);
begin
  self.iOption := 0;
  self.cCte_Id := '';
  self.cReg_Id := '';
  freeandnil(oConn);
  self.oQry_Rg.Connection := fUtilesV20.oPublicCnn;
end;

procedure TfGen_Add_RefG.FormShow(Sender: TObject);
begin
  self.AssgnTabs();
  self.Fnd_Data();

  if (self.iOption = 1) then
  begin
    self.oQry_Rg.Insert;
    self.oQry_Rg.FieldByName('id_cliente').AsString := self.cTmp_Id;
    self.oQry_Rg.FieldByName('tipo').AsInteger := 2;
    self.oQry_Rg.FieldByName('nombre').AsString := '';
    self.oQry_Rg.FieldByName('telefono').AsString := '';
    self.oQry_Rg.FieldByName('relacion').AsString := '';
    self.Check_Tipo();
  end
  else if (self.iOption = 2) then
  begin
    self.oQry_Rg.Edit;
  end;
end;

procedure TfGen_Add_RefG.oBtn_Ign_DepClick(Sender: TObject);
begin
  if (self.oQry_Rg.State in [dsInsert, dsedit]) then
    self.oQry_Rg.cancel;
  close;
end;

procedure TfGen_Add_RefG.oBtn_Save_DepClick(Sender: TObject);
var
  cNext: string;
begin
  if (self.iOption = 1) then
  begin
    cNext := fUtilesV20.query_selectgen_result('SELECT IFNULL(num_refer_g,0)+1 AS num_refer_g FROM mant_secuenc_docs LIMIT 1');
    self.oQry_Rg.FieldByName('id_cliente_referencias').AsString := trim(cNext);
    UtilesV20.Execute_SQL_Command('UPDATE mant_secuenc_docs SET num_refer_g=IFNULL(num_refer_g,0)+1 WHERE 1=1');
  end;

  if ((self.iOption = 1) or (self.iOption = 2)) then
  begin
    if ((self.otipo.Value = 0) or (self.otipo.Value = null)) then
    begin
      MessageDlg('No es posible hacer cambios sino seleccionar el tipo de referencia.', mtConfirmation, [mbOk], 0);
      self.otipo.SetFocus;
      exit;
    end;

    if (self.onombre.Text = '') then
    begin
      MessageDlg('No es posible hacer cambios sino regira el nombre.', mtConfirmation, [mbOk], 0);
      self.onombre.SetFocus;
      exit;
    end;

    if ((self.orelacion.Text = '') and (self.otipo.Value = 2)) then
    begin
      MessageDlg('No es posible hacer cambios sino regira la relación.', mtConfirmation, [mbOk], 0);
      self.orelacion.SetFocus;
      exit;
    end;
  end;

  if (self.oQry_Rg.State in [dsInsert, dsedit]) then
  begin
    if (self.oQry_Rg.State in [dsInsert]) then
    begin
      self.oQry_Rg.FieldByName('flag_tmp').AsInteger := 1;
      self.oQry_Rg.FieldByName('id_cliente').AsString := self.cTmp_Id;
    end
    else
      self.oQry_Rg.FieldByName('id_cliente').AsString := self.cCte_Id;

    self.oQry_Rg.FieldByName('ultima_fecha_actualizacion').AsDateTime := now();
    self.oQry_Rg.FieldByName('ultimo_usuario_que_actualizo').AsInteger := UtilesV20.iUserID;
    self.oQry_Rg.Post;
  end;

  close;
end;

procedure TfGen_Add_RefG.otipoCloseUp(Sender: TObject; Accept: Boolean);
begin
  self.Check_Tipo();
end;

procedure TfGen_Add_RefG.Fnd_Data();
VAR
  cSql_Str: string;
begin
  if (trim(self.cCte_Id) = '') then
    self.cCte_Id := 'ABC-123';

  cSql_Str := '';
  cSql_Str := cSql_Str + 'SELECT * ';
  cSql_Str := cSql_Str + 'FROM cliente_referencias ';
  cSql_Str := cSql_Str + 'WHERE (id_cliente="' + self.cCte_Id + '") ';
  if (trim(self.cReg_Id) <> '') then
    cSql_Str := cSql_Str + 'AND (id_cliente_referencias="' + self.cReg_Id + '") ';

  self.oQry_Rg.close;
  self.oQry_Rg.SQL.Clear;
  self.oQry_Rg.SQL.Text := cSql_Str;
  self.oQry_Rg.Open();
  self.oDs_Rg.DataSet := self.oQry_Rg;
end;

procedure TfGen_Add_RefG.Check_Tipo;
begin
  if not((self.otipo.Value = null) or (self.otipo.Value = 0)) then
  begin
    if (self.otipo.Value = 1) then
    begin
      self.olNombre.Caption := 'Nombre del Comercio:';
      self.orelacion.Enabled := false;
      self.olugar_trabajo.Enabled := false;
    end
    else
    begin
      if (self.otipo.Value = 2) then
      begin
        self.olNombre.Caption := 'Nombre:';
        self.orelacion.Enabled := true;
        self.olugar_trabajo.Enabled := true;
      end;
    end;
  end;
end;

procedure TfGen_Add_RefG.AssgnTabs;
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

procedure TfGen_Add_RefG.EnterAsTab(Sender: TObject; var Key: Char);
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
