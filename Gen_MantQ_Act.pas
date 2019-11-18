unit Gen_MantQ_Act;

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
  TfGen_MantQ_Act = class(TForm)
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    oGrid_Act: TDBGridEh;
    oQry_Act: TFDQuery;
    oDs_Act: TDataSource;
    oBtn_Update: TAdvSmoothButton;
    oBtn_Salir: TAdvSmoothButton;
    FDConnection1: TFDConnection;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    oText_Fnd: TEdit;
    oBtn_Fnd: TPngBitBtn;
    ResizeKit1: TResizeKit;
    StatusBar1: TStatusBar;
    procedure oBtn_SalirClick(Sender: TObject);
    procedure Buscar_Acti(cText: string);
    procedure FormCreate(Sender: TObject);
    procedure oGrid_ActDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure oBtn_FndClick(Sender: TObject);
    procedure oText_FndKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure oBtn_UpdateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGen_MantQ_Act: TfGen_MantQ_Act;

implementation

uses utilesv20, Gen_Pop_Pon;
{$R *.dfm}

procedure TfGen_MantQ_Act.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  cSql_Ln: string;
begin
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'UPDATE `mant_actividad_econ` SET ';
  cSql_Ln := cSql_Ln + '  `activ_riesgo_chg`= `activ_riesgo` ';
  cSql_Ln := cSql_Ln + 'WHERE 1=1';
  utilesv20.Execute_SQL_Command(cSql_Ln);
end;

procedure TfGen_MantQ_Act.FormCreate(Sender: TObject);
var
  cSql_Ln: string;
begin
  freeandnil(FDConnection1);
  self.oQry_Act.Connection := futilesv20.oPublicCnn;

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'UPDATE `mant_actividad_econ` SET ';
  cSql_Ln := cSql_Ln + '  `activ_riesgo`=IFNULL(`activ_riesgo`,0), `activ_riesgo_chg`= `activ_riesgo` ';
  cSql_Ln := cSql_Ln + 'WHERE 1=1';
  utilesv20.Execute_SQL_Command(cSql_Ln);

  self.Buscar_Acti('');
end;

procedure TfGen_MantQ_Act.FormShow(Sender: TObject);
begin
  self.StatusBar1.Panels[0].Text := 'Usuario: ' + utilesv20.sUserName;
  self.StatusBar1.Panels[1].Text := 'Fecha: ' + formatDateTime('dd/mm/yyyy', now());
  self.StatusBar1.Panels[2].Text := 'Servidor: ' + futilesv20.oPublicCnn.Params.Values['Server'] + '/' + UpperCase(futilesv20.oPublicCnn.Params.Values['Database']);
  self.StatusBar1.Panels[3].Text := 'Empresa: ' + utilesv20.cDe_Empresa;

  self.oText_Fnd.Text := '';
  self.oText_Fnd.SetFocus;
end;

procedure TfGen_MantQ_Act.oBtn_FndClick(Sender: TObject);
begin
  self.Buscar_Acti(self.oText_Fnd.Text);
  self.oText_Fnd.Text := '';
  self.oGrid_Act.SetFocus;
end;

procedure TfGen_MantQ_Act.oBtn_SalirClick(Sender: TObject);
begin
  close;
end;

procedure TfGen_MantQ_Act.oBtn_UpdateClick(Sender: TObject);
var
  cSql_Ln: string;
begin
  self.oBtn_Update.Enabled := false;
  self.oBtn_Salir.Enabled := false;

  cSql_Ln := 'CALL App_Limpia_Fact_Riezgo_ActE(' + trim(IntToStr(utilesv20.iUserID)) + ')';
  utilesv20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'UPDATE `mant_actividad_econ` SET ';
  cSql_Ln := cSql_Ln + '  `activ_riesgo`= `activ_riesgo_chg` ';
  cSql_Ln := cSql_Ln + 'WHERE 1=1';
  utilesv20.Execute_SQL_Command(cSql_Ln);

  self.oQry_Act.Refresh;

  self.oBtn_Update.Enabled := true;
  self.oBtn_Salir.Enabled := true;
  MessageDlg('El re-cálculo de los perfiles de riezgos de todos los clientes coincidentes ha sido realizado.', mtConfirmation, [mbOk], 0);
end;

procedure TfGen_MantQ_Act.oGrid_ActDblClick(Sender: TObject);
begin
  if (self.oQry_Act.RecordCount > 0) then
  begin
    Application.CreateForm(TfGen_Pop_Pon, fGen_Pop_Pon);
    fGen_Pop_Pon.cDetalle := 'NIVELES DE RIESGO DE LA ACTIVIDAD?';
    fGen_Pop_Pon.iNiv_Prob := self.oQry_Act.FieldByName('activ_prob').AsInteger;
    fGen_Pop_Pon.iNiv_Impa := self.oQry_Act.FieldByName('activ_impa').AsInteger;

    fGen_Pop_Pon.ShowModal;
    self.oQry_Act.Edit;
    if (fGen_Pop_Pon.iOption = 1) then
    begin
      self.oQry_Act.FieldByName('activ_prob').AsInteger := fGen_Pop_Pon.iNiv_Prob;
      self.oQry_Act.FieldByName('activ_impa').AsInteger := fGen_Pop_Pon.iNiv_Impa;
      //self.oQry_Act.FieldByName('activ_riesgo').AsInteger := (self.oQry_Act.FieldByName('activ_prob').AsInteger * self.oQry_Act.FieldByName('activ_impa').AsInteger);

      if ((fGen_Pop_Pon.iNiv_Prob = 0) AND (fGen_Pop_Pon.iNiv_Impa = 0)) THEN
        self.oQry_Act.FieldByName('activ_riesgo_chg').AsInteger := 0
      else
        self.oQry_Act.FieldByName('activ_riesgo_chg').AsInteger := 1;
      self.oQry_Act.FieldByName('activ_fecha_modif').AsDateTime := now();
      self.oQry_Act.FieldByName('activ_usuario_modif').AsInteger := utilesv20.iUserID;
    end
    else
    begin
      self.oQry_Act.FieldByName('activ_prob').AsInteger := 0;
      self.oQry_Act.FieldByName('activ_impa').AsInteger := 0;
      //self.oQry_Act.FieldByName('activ_riesgo').AsInteger := 0;
      self.oQry_Act.FieldByName('activ_riesgo_chg').AsInteger := 0;
    end;
    self.oQry_Act.post;
    freeandnil(fGen_Pop_Pon);
  end;
end;

procedure TfGen_MantQ_Act.oText_FndKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_RETURN then
  begin
    self.oBtn_FndClick(self);
  end;
end;

procedure TfGen_MantQ_Act.Buscar_Acti(cText: string);
var
  cSql_Ln: string;
begin
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT ';
  cSql_Ln := cSql_Ln + '  *, UCASE(activ_descripcion) AS activ_descripcion2 ';
  cSql_Ln := cSql_Ln + 'FROM mant_actividad_econ ';
  if ((cText <> '') AND (cText <> '%')) then
    cSql_Ln := cSql_Ln + 'WHERE UCASE(activ_descripcion) LIKE "%' + UpperCase(trim(cText)) + '%" ';
  cSql_Ln := cSql_Ln + 'ORDER BY UCASE(activ_descripcion) ';

  self.oQry_Act.close();
  self.oQry_Act.SQL.Clear;
  self.oQry_Act.SQL.Text := cSql_Ln;
  self.oQry_Act.Open();
  self.oDs_Act.DataSet := self.oQry_Act;
  self.oDs_Act.Enabled := true;
end;

end.
