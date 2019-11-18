unit Gen_MantC_ChL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, AdvSmoothButton, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, Vcl.StdCtrls, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  Vcl.Buttons, PngBitBtn, ResizeKit, Vcl.ComCtrls;

type
  TfGen_MantC_ChL = class(TForm)
    Label1: TLabel;
    oQry_DebDil: TFDQuery;
    oDs_DebDil: TDataSource;
    oBtn_Salir: TAdvSmoothButton;
    FDConnection1: TFDConnection;
    ResizeKit1: TResizeKit;
    StatusBar1: TStatusBar;
    Label72: TLabel;
    oGrid_Rzg_Lst: TDBGridEh;
    Label73: TLabel;
    oGrid_Rzg_Cte: TDBGridEh;
    oBtn_Rzg_Add: TPngBitBtn;
    Label74: TLabel;
    oBtn_Rzg_Del: TPngBitBtn;
    Label75: TLabel;
    oQry_CheckL: TFDQuery;
    oDs_CheckL: TDataSource;
    procedure oBtn_SalirClick(Sender: TObject);
    procedure Buscar_Data(cCod_Cte: string);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Buscar_Lst();
    procedure oBtn_Rzg_AddClick(Sender: TObject);
    procedure oBtn_Rzg_DelClick(Sender: TObject);
  private
    { Private declarations }
  public
    cCod_Cte: string;
    { Public declarations }
  end;

var
  fGen_MantC_ChL: TfGen_MantC_ChL;

implementation

uses utilesv20, Gen_Pop_Pon;
{$R *.dfm}

procedure TfGen_MantC_ChL.FormCreate(Sender: TObject);
begin
  freeandnil(FDConnection1);
  self.oQry_DebDil.Connection := futilesv20.oPublicCnn;
  self.oQry_CheckL.Connection := futilesv20.oPublicCnn;

  self.Buscar_Lst();
end;

procedure TfGen_MantC_ChL.FormShow(Sender: TObject);
begin
  self.StatusBar1.Panels[0].Text := 'Usuario: ' + utilesv20.sUserName;
  self.StatusBar1.Panels[1].Text := 'Fecha: ' + formatDateTime('dd/mm/yyyy', now());
  self.StatusBar1.Panels[2].Text := 'Servidor: ' + futilesv20.oPublicCnn.Params.Values['Server'] + '/' + UpperCase(futilesv20.oPublicCnn.Params.Values['Database']);
  self.StatusBar1.Panels[3].Text := 'Empresa: ' + utilesv20.cDe_Empresa;

  //self.cCod_Cte := '09756';

  self.Buscar_Data(self.cCod_Cte);
end;

procedure TfGen_MantC_ChL.oBtn_Rzg_AddClick(Sender: TObject);
var
  cSql_Ln: string;
  cCod_Chk: string;
  bDuplica: boolean;
begin
  bDuplica := false;
  cCod_Chk := self.oQry_DebDil.FieldByName('debdi_id').AsString;

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT ';
  cSql_Ln := cSql_Ln + '  id_cliente ';
  cSql_Ln := cSql_Ln + 'FROM cliente_debida_diligencia_checklist ';
  cSql_Ln := cSql_Ln + 'WHERE (id_cliente="' + trim(self.cCod_Cte) + '") ';
  cSql_Ln := cSql_Ln + 'AND   (id_debida_diligencia_checklist="' + trim(cCod_Chk) + '") ';

  if (utilesv20.Execute_SQL_Result(cSql_Ln) <> '') then
    bDuplica := true
  else
    bDuplica := false;

  if (bDuplica = false) then
  begin
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'INSERT INTO cliente_debida_diligencia_checklist ';
    cSql_Ln := cSql_Ln + '  (id_cliente, id_debida_diligencia_checklist, ultima_fecha_actualizacion, ultimo_usuario_que_actualizo) VALUES ';
    cSql_Ln := cSql_Ln + '  ("' + self.cCod_Cte + '","' + cCod_Chk + '",NOW(),"' + trim(IntToStr(utilesv20.iUserID)) + '") ';
    cSql_Ln := cSql_Ln + 'ON DUPLICATE KEY UPDATE ';
    cSql_Ln := cSql_Ln + '  ultimo_usuario_que_actualizo="' + trim(IntToStr(utilesv20.iUserID)) + '", ';
    cSql_Ln := cSql_Ln + '  ultima_fecha_actualizacion  =NOW() ';
    utilesv20.Execute_SQL_Command(cSql_Ln);
  end;
  self.Buscar_Data(self.cCod_Cte);

  self.oGrid_Rzg_Cte.DataSource.DataSet.Locate('id_cliente_debida_diligencia_checklist', cCod_Chk, []);
end;

procedure TfGen_MantC_ChL.oBtn_Rzg_DelClick(Sender: TObject);
var
  cSql_Ln: string;
  cCod_Chk: string;
begin
  cCod_Chk := self.oQry_CheckL.FieldByName('id_debida_diligencia_checklist').AsString;

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'DELETE ';
  cSql_Ln := cSql_Ln + 'FROM cliente_debida_diligencia_checklist ';
  cSql_Ln := cSql_Ln + 'WHERE (id_cliente="' + self.cCod_Cte + '") ';
  cSql_Ln := cSql_Ln + 'AND   (id_debida_diligencia_checklist="' + cCod_Chk + '")';
  utilesv20.Execute_SQL_Command(cSql_Ln);

  self.Buscar_Data(self.cCod_Cte);
end;

procedure TfGen_MantC_ChL.oBtn_SalirClick(Sender: TObject);
begin
  close;
end;

procedure TfGen_MantC_ChL.Buscar_Lst();
var
  cSql_Ln: string;
begin
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT *, ';
  cSql_Ln := cSql_Ln + '  UCASE(debdi_descripcion) AS debdi_descripcion2, ';
  cSql_Ln := cSql_Ln + '  UCASE(debdi_descripcion_corta) AS debdi_descripcion_corta2 ';
  cSql_Ln := cSql_Ln + 'FROM mant_deb_diligencias ';
  cSql_Ln := cSql_Ln + 'WHERE (debdi_inactivo=0) ';
  cSql_Ln := cSql_Ln + 'ORDER BY LPAD(debdi_order,20,"0") ';

  self.oQry_DebDil.close();
  self.oQry_DebDil.SQL.Clear;
  self.oQry_DebDil.SQL.Text := cSql_Ln;
  self.oQry_DebDil.Open();
  self.oDs_DebDil.DataSet := self.oQry_DebDil;
  self.oDs_DebDil.Enabled := true;

  self.oGrid_Rzg_Lst.DataSource := self.oDs_DebDil;
  self.oGrid_Rzg_Lst.Refresh;
end;

procedure TfGen_MantC_ChL.Buscar_Data(cCod_Cte: string);
var
  cSql_Ln: string;
begin

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT ';
  cSql_Ln := cSql_Ln + '	chlst.*, ';
  cSql_Ln := cSql_Ln + '	dili.debdi_descripcion ';
  cSql_Ln := cSql_Ln + 'FROM cliente_debida_diligencia_checklist chlst ';
  cSql_Ln := cSql_Ln + 'LEFT JOIN mant_deb_diligencias dili ON (chlst.id_debida_diligencia_checklist = dili.debdi_id)  ';
  cSql_Ln := cSql_Ln + 'WHERE (chlst.id_cliente="' + trim(cCod_Cte) + '") ';

  self.oQry_CheckL.close();
  self.oQry_CheckL.SQL.Clear;
  self.oQry_CheckL.SQL.Text := cSql_Ln;
  self.oQry_CheckL.Open();
  self.oDs_CheckL.DataSet := self.oQry_CheckL;
  self.oDs_CheckL.Enabled := true;

  self.oGrid_Rzg_Cte.DataSource := self.oDs_CheckL;
  self.oGrid_Rzg_Cte.Refresh;
end;

end.
