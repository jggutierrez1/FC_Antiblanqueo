unit Gen_MantQ_Emp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.StdCtrls, AdvSmoothButton, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, ResizeKit, Vcl.ComCtrls;

type
  TfGen_MantQ_Emp = class(TForm)
    oBtn_Update: TAdvSmoothButton;
    oBtn_Salir: TAdvSmoothButton;
    Label5: TLabel;
    oGrid_Act: TDBGridEh;
    Label6: TLabel;
    Label1: TLabel;
    FDConnection1: TFDConnection;
    oQry_Epl: TFDQuery;
    oDs_Epl: TDataSource;
    ResizeKit1: TResizeKit;
    StatusBar1: TStatusBar;
    procedure oBtn_SalirClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure oGrid_ActDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Buscar_Empl(cText: string);
    procedure oBtn_UpdateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGen_MantQ_Emp: TfGen_MantQ_Emp;

implementation

USES utilesv20, Gen_Pop_Pon;
{$R *.dfm}

procedure TfGen_MantQ_Emp.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  cSql_Ln: string;
begin
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'UPDATE `mant_tipos_empleados` SET ';
  cSql_Ln := cSql_Ln + '  `tipem_riesgo_chg`= `tipem_riesgo` ';
  cSql_Ln := cSql_Ln + 'WHERE 1=1';
  utilesv20.Execute_SQL_Command(cSql_Ln);
end;

procedure TfGen_MantQ_Emp.FormCreate(Sender: TObject);
var
  cSql_Ln: string;
begin
  freeandnil(FDConnection1);
  self.oQry_Epl.Connection := futilesv20.oPublicCnn;

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'UPDATE `mant_tipos_empleados` SET ';
  cSql_Ln := cSql_Ln + '  `tipem_riesgo`=IFNULL(`tipem_riesgo`,0), `tipem_riesgo_chg`= `tipem_riesgo` ';
  cSql_Ln := cSql_Ln + 'WHERE 1=1';
  utilesv20.Execute_SQL_Command(cSql_Ln);

  self.Buscar_Empl('');
end;

procedure TfGen_MantQ_Emp.FormShow(Sender: TObject);
begin
  self.StatusBar1.Panels[0].Text := 'Usuario: ' + utilesv20.sUserName;
  self.StatusBar1.Panels[1].Text := 'Fecha: ' + formatDateTime('dd/mm/yyyy', now());
  self.StatusBar1.Panels[2].Text := 'Servidor: ' + futilesv20.oPublicCnn.Params.Values['Server'] + '/' + UpperCase(futilesv20.oPublicCnn.Params.Values['Database']);
  self.StatusBar1.Panels[3].Text := 'Empresa: ' + utilesv20.cDe_Empresa;
end;

procedure TfGen_MantQ_Emp.oBtn_SalirClick(Sender: TObject);
begin
  CLOSE;
end;

procedure TfGen_MantQ_Emp.oBtn_UpdateClick(Sender: TObject);
var
  cSql_Ln: string;
begin
  self.oBtn_Update.Enabled := false;
  self.oBtn_Salir.Enabled := false;

  if (utilesv20.bEsCooperatiba = true) then
  begin
    cSql_Ln := 'CALL App_Limpia_Fact_Riezgo_Emp(' + trim(IntToStr(utilesv20.iUserID)) + ')';
    utilesv20.Execute_SQL_Command(cSql_Ln);
  end
  else
  begin
    cSql_Ln := 'CALL App_Limpia_Fact_Riezgo_Emp2(' + trim(IntToStr(utilesv20.iUserID)) + ')';
    utilesv20.Execute_SQL_Command(cSql_Ln);
  end;

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'UPDATE `mant_tipos_empleados` SET ';
  cSql_Ln := cSql_Ln + '  `tipem_riesgo`= `tipem_riesgo_chg` ';
  cSql_Ln := cSql_Ln + 'WHERE 1=1';
  utilesv20.Execute_SQL_Command(cSql_Ln);

  self.oQry_Epl.Refresh;

  self.oBtn_Update.Enabled := true;
  self.oBtn_Salir.Enabled := true;
  MessageDlg('El re-cálculo de los perfiles de riezgos de todos los clientes coincidentes ha sido realizado.', mtConfirmation, [mbOk], 0);
end;

procedure TfGen_MantQ_Emp.oGrid_ActDblClick(Sender: TObject);
begin
  if (self.oQry_Epl.RecordCount > 0) then
  begin
    Application.CreateForm(TfGen_Pop_Pon, fGen_Pop_Pon);
    fGen_Pop_Pon.cDetalle := 'NIVELES DE RIESGO DEL TIPO DE EMPLEO?';
    fGen_Pop_Pon.iNiv_Prob := self.oQry_Epl.FieldByName('tipem_prob').AsInteger;
    fGen_Pop_Pon.iNiv_Impa := self.oQry_Epl.FieldByName('tipem_impa').AsInteger;

    fGen_Pop_Pon.ShowModal;
    self.oQry_Epl.Edit;
    if (fGen_Pop_Pon.iOption = 1) then
    begin
      self.oQry_Epl.FieldByName('tipem_prob').AsInteger := fGen_Pop_Pon.iNiv_Prob;
      self.oQry_Epl.FieldByName('tipem_impa').AsInteger := fGen_Pop_Pon.iNiv_Impa;
      // self.oQry_Epl.FieldByName('tipem_riesgo').AsInteger := (self.oQry_Epl.FieldByName('tipem_prob').AsInteger * self.oQry_Epl.FieldByName('tipem_impa').AsInteger);

      if ((fGen_Pop_Pon.iNiv_Prob = 0) AND (fGen_Pop_Pon.iNiv_Impa = 0)) THEN
        self.oQry_Epl.FieldByName('tipem_riesgo_chg').AsInteger := 0
      else
        self.oQry_Epl.FieldByName('tipem_riesgo_chg').AsInteger := 1;
      self.oQry_Epl.FieldByName('tipem_fecha_modif').AsDateTime := now();
      self.oQry_Epl.FieldByName('tipem_usuario_modif').AsInteger := utilesv20.iUserID;
    end
    else
    begin
      self.oQry_Epl.FieldByName('tipem_prob').AsInteger := 0;
      self.oQry_Epl.FieldByName('tipem_impa').AsInteger := 0;
      // self.oQry_Epl.FieldByName('tipem_riesgo').AsInteger := 0;
      self.oQry_Epl.FieldByName('tipem_riesgo_chg').AsInteger := 0;
    end;
    self.oQry_Epl.post;
    freeandnil(fGen_Pop_Pon);
  end;

end;

procedure TfGen_MantQ_Emp.Buscar_Empl(cText: string);
var
  cSql_Ln: string;
begin
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT ';
  cSql_Ln := cSql_Ln + '  *, UCASE(tipem_descripcion) AS tipem_descripcion2 ';
  cSql_Ln := cSql_Ln + 'FROM mant_tipos_empleados ';
  if ((cText <> '') AND (cText <> '%')) then
    cSql_Ln := cSql_Ln + 'WHERE UCASE(tipem_descripcion) LIKE "%' + UpperCase(trim(cText)) + '%" ';
  cSql_Ln := cSql_Ln + 'ORDER BY UCASE(tipem_descripcion) ';

  self.oQry_Epl.CLOSE();
  self.oQry_Epl.SQL.Clear;
  self.oQry_Epl.SQL.Text := cSql_Ln;
  self.oQry_Epl.Open();
  self.oDs_Epl.DataSet := self.oQry_Epl;
  self.oDs_Epl.Enabled := true;
end;

end.
