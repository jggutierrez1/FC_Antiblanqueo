unit Gen_MantQ_Geo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask,
  DBCtrlsEh, DBLookupEh, AdvSmoothButton, Vcl.Buttons, PngBitBtn, ResizeKit, Vcl.ComCtrls;

type
  TfGen_ManrQ_Geo = class(TForm)
    FDConnection1: TFDConnection;
    oGrid_Pais: TDBGridEh;
    Label1: TLabel;
    oGrid_Dist: TDBGridEh;
    oDs_Pais: TDataSource;
    oQry_Pais: TFDQuery;
    oDs_Prov: TDataSource;
    oQry_Prov: TFDQuery;
    oDs_Dist: TDataSource;
    oQry_Dist: TFDQuery;
    Label2: TLabel;
    oLst_Prov: TDBLookupComboboxEh;
    Label3: TLabel;
    Label4: TLabel;
    oBtn_Salir: TAdvSmoothButton;
    Label5: TLabel;
    Label6: TLabel;
    oBtn_Update: TAdvSmoothButton;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    oText_Fnd: TEdit;
    oBtn_Fnd: TPngBitBtn;
    ResizeKit1: TResizeKit;
    StatusBar1: TStatusBar;
    procedure Buscar_Pais(cText: string = '');
    procedure Buscar_Prov();
    procedure Buscar_Dist();
    procedure oBtn_SalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure oGrid_PaisCellClick(Column: TColumnEh);
    procedure oLst_ProvCloseUp(Sender: TObject; Accept: Boolean);
    procedure oGrid_PaisDblClick(Sender: TObject);
    procedure oGrid_DistDblClick(Sender: TObject);
    procedure oText_FndKeyPress(Sender: TObject; var Key: Char);
    procedure oBtn_FndClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure oBtn_UpdateClick(Sender: TObject);
  private
    { Private declarations }
    cId_Pais: string;
    cId_Prov: string;
  public
    { Public declarations }
  end;

var
  fGen_ManrQ_Geo: TfGen_ManrQ_Geo;

implementation

uses utilesv20, Gen_Pop_Pon;
{$R *.dfm}

procedure TfGen_ManrQ_Geo.Buscar_Pais(cText: string = '');
var
  cSql_Ln: string;
begin
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT *, UCASE(pais_descripcion) AS pais_descripcion2 ';
  cSql_Ln := cSql_Ln + 'FROM mant_paises ';
  if ((cText <> '') AND (cText <> '%')) then
    cSql_Ln := cSql_Ln + 'WHERE UCASE(pais_descripcion) LIKE "%' + Uppercase(TRIM(cText)) + '%" ';
  cSql_Ln := cSql_Ln + 'ORDER BY UCASE(pais_descripcion) ';

  self.oQry_Pais.close();
  self.oQry_Pais.SQL.Clear;
  self.oQry_Pais.SQL.Text := cSql_Ln;
  self.oQry_Pais.Open();
  self.oDs_Pais.Enabled := true;

  self.oQry_Pais.Locate('pais_id_pais', '136', []);
end;

procedure TfGen_ManrQ_Geo.Buscar_Prov();
var
  cSql_Ln: string;
begin
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT *, UCASE(prov_descripcion) AS prov_descripcion2 ';
  cSql_Ln := cSql_Ln + 'FROM mant_provincias ';
  cSql_Ln := cSql_Ln + 'WHERE (prov_id_pais="' + TRIM(self.cId_Pais) + '") ';
  cSql_Ln := cSql_Ln + 'ORDER BY UCASE(prov_descripcion) ';

  self.oQry_Prov.close();
  self.oQry_Prov.SQL.Clear;
  self.oQry_Prov.SQL.Text := cSql_Ln;
  self.oQry_Prov.Open();
  self.oDs_Prov.Enabled := true;
end;

procedure TfGen_ManrQ_Geo.Buscar_Dist();
var
  cSql_Ln: string;
begin
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT *, UCASE(dist_descripcion) dist_descripcion2 ';
  cSql_Ln := cSql_Ln + 'FROM mant_distritos ';
  cSql_Ln := cSql_Ln + 'WHERE (dist_pais_id="' + TRIM(self.cId_Pais) + '") ';
  cSql_Ln := cSql_Ln + 'AND   (dist_prov_id="' + TRIM(self.cId_Prov) + '") ';
  cSql_Ln := cSql_Ln + 'ORDER BY UCASE(dist_descripcion) ';

  self.oQry_Dist.close();
  self.oQry_Dist.SQL.Clear;
  self.oQry_Dist.SQL.Text := cSql_Ln;
  self.oQry_Dist.Open();
  self.oDs_Dist.Enabled := true;
end;

procedure TfGen_ManrQ_Geo.oBtn_FndClick(Sender: TObject);
begin
  self.Buscar_Pais(self.oText_Fnd.Text);
  self.cId_Pais := self.oQry_Pais.FieldByName('pais_id_pais').AsString;
  self.Buscar_Prov();
  self.cId_Prov := self.oQry_Prov.FieldByName('prov_id').AsString;
  self.Buscar_Dist();
  self.oText_Fnd.Text := '';
  self.oGrid_Pais.SetFocus;
end;

procedure TfGen_ManrQ_Geo.oBtn_SalirClick(Sender: TObject);
begin
  close;
end;

procedure TfGen_ManrQ_Geo.oBtn_UpdateClick(Sender: TObject);
var
  cSql_Ln: string;
begin
  self.oBtn_Update.Enabled := false;
  self.oBtn_Salir.Enabled := false;

  if (utilesv20.bEsCooperatiba = true) then
  begin
    cSql_Ln := 'CALL App_Limpia_Fact_Riezgo_Pais(' + TRIM(IntToStr(utilesv20.iUserID)) + ',0)';
    utilesv20.Execute_SQL_Command(cSql_Ln);
  end
  else
  begin
    cSql_Ln := 'CALL App_Limpia_Fact_Riezgo_Pais2(' + TRIM(IntToStr(utilesv20.iUserID)) + ',0)';
    utilesv20.Execute_SQL_Command(cSql_Ln);
  end;

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'UPDATE `mant_paises` SET ';
  cSql_Ln := cSql_Ln + '  `pais_riesgo`= `pais_riesgo_chg` ';
  cSql_Ln := cSql_Ln + 'WHERE 1=1';
  utilesv20.Execute_SQL_Command(cSql_Ln);

  if (utilesv20.bEsCooperatiba = true) then
  begin
    cSql_Ln := 'CALL App_Limpia_Fact_Riezgo_Dist(' + TRIM(IntToStr(utilesv20.iUserID)) + ')';
    utilesv20.Execute_SQL_Command(cSql_Ln);
  end
  else
  begin
    cSql_Ln := 'CALL App_Limpia_Fact_Riezgo_Dist2(' + TRIM(IntToStr(utilesv20.iUserID)) + ')';
    utilesv20.Execute_SQL_Command(cSql_Ln);
  end;

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'UPDATE `mant_distritos` SET ';
  cSql_Ln := cSql_Ln + '  `dist_riesgo`=`dist_riesgo_chg` ';
  cSql_Ln := cSql_Ln + 'WHERE 1=1';
  utilesv20.Execute_SQL_Command(cSql_Ln);

  self.oQry_Pais.Refresh;
  self.oQry_Dist.Refresh;

  self.oBtn_Update.Enabled := true;
  self.oBtn_Salir.Enabled := true;
  MessageDlg('El re-cálculo de los perfiles de riezgos de todos los clientes coincidentes ha sido realizado.', mtConfirmation, [mbOk], 0);
end;

procedure TfGen_ManrQ_Geo.oGrid_DistDblClick(Sender: TObject);
begin
  if (self.oQry_Dist.RecordCount > 0) then
  begin
    Application.CreateForm(TfGen_Pop_Pon, fGen_Pop_Pon);
    fGen_Pop_Pon.cDetalle := 'NIVELES DE RIESGO DEl DISTRITO?';
    fGen_Pop_Pon.iNiv_Prob := self.oQry_Dist.FieldByName('dist_prob').AsInteger;
    fGen_Pop_Pon.iNiv_Impa := self.oQry_Dist.FieldByName('dist_impa').AsInteger;

    fGen_Pop_Pon.ShowModal;
    self.oQry_Dist.Edit;
    if (fGen_Pop_Pon.iOption = 1) then
    begin
      self.oQry_Dist.FieldByName('dist_prob').AsInteger := fGen_Pop_Pon.iNiv_Prob;
      self.oQry_Dist.FieldByName('dist_impa').AsInteger := fGen_Pop_Pon.iNiv_Impa;
      // self.oQry_Dist.FieldByName('dist_riesgo').AsInteger := (self.oQry_Dist.FieldByName('dist_prob').AsInteger * self.oQry_Dist.FieldByName('dist_impa').AsInteger);

      if ((fGen_Pop_Pon.iNiv_Prob = 0) AND (fGen_Pop_Pon.iNiv_Impa = 0)) THEN
        self.oQry_Dist.FieldByName('dist_riesgo_chg').AsInteger := 0
      else
        self.oQry_Dist.FieldByName('dist_riesgo_chg').AsInteger := 1;
      self.oQry_Dist.FieldByName('dist_fecha_modif').AsDateTime := now();
      self.oQry_Dist.FieldByName('dist_usuario_modif').AsInteger := utilesv20.iUserID;
    end
    else
    begin
      self.oQry_Dist.FieldByName('dist_prob').AsInteger := 0;
      self.oQry_Dist.FieldByName('dist_impa').AsInteger := 0;
      // self.oQry_Dist.FieldByName('dist_riesgo').AsInteger := 0;
      self.oQry_Dist.FieldByName('dist_riesgo_chg').AsInteger := 0;
    end;
    self.oQry_Dist.post;
    freeandnil(fGen_Pop_Pon);
  end;
end;

procedure TfGen_ManrQ_Geo.oGrid_PaisDblClick(Sender: TObject);
begin
  if (self.oQry_Pais.RecordCount > 0) then
  begin
    Application.CreateForm(TfGen_Pop_Pon, fGen_Pop_Pon);
    fGen_Pop_Pon.cDetalle := 'NIVELES DE RIESGO DE PAIS?';
    fGen_Pop_Pon.iNiv_Prob := self.oQry_Pais.FieldByName('pais_prob').AsInteger;
    fGen_Pop_Pon.iNiv_Impa := self.oQry_Pais.FieldByName('pais_impa').AsInteger;

    fGen_Pop_Pon.ShowModal;
    self.oQry_Pais.Edit;
    if (fGen_Pop_Pon.iOption = 1) then
    begin
      self.oQry_Pais.FieldByName('pais_prob').AsInteger := fGen_Pop_Pon.iNiv_Prob;
      self.oQry_Pais.FieldByName('pais_impa').AsInteger := fGen_Pop_Pon.iNiv_Impa;
      // self.oQry_Pais.FieldByName('pais_riesgo').AsInteger := (self.oQry_Pais.FieldByName('pais_prob').AsInteger * self.oQry_Pais.FieldByName('pais_impa').AsInteger);

      if ((fGen_Pop_Pon.iNiv_Prob = 0) AND (fGen_Pop_Pon.iNiv_Impa = 0)) THEN
        self.oQry_Pais.FieldByName('pais_riesgo_chg').AsInteger := 0
      else
        self.oQry_Pais.FieldByName('pais_riesgo_chg').AsInteger := 1;
      self.oQry_Pais.FieldByName('pais_fecha_modif').AsDateTime := now();
      self.oQry_Pais.FieldByName('pais_usuario_modif').AsInteger := utilesv20.iUserID;
    end
    else
    begin
      self.oQry_Pais.FieldByName('pais_prob').AsInteger := 0;
      self.oQry_Pais.FieldByName('pais_impa').AsInteger := 0;
      // self.oQry_Pais.FieldByName('pais_riesgo').AsInteger := 0;
      self.oQry_Pais.FieldByName('pais_riesgo_chg').AsInteger := 0;
    end;
    self.oQry_Pais.post;
    freeandnil(fGen_Pop_Pon);
  end;
end;

procedure TfGen_ManrQ_Geo.oGrid_PaisCellClick(Column: TColumnEh);
begin
  self.cId_Pais := self.oQry_Pais.FieldByName('pais_id_pais').AsString;
  self.Buscar_Prov();
  self.cId_Prov := self.oQry_Prov.FieldByName('prov_id').AsString;
  self.oLst_Prov.KeyValue := self.cId_Prov;
  self.Buscar_Dist();
end;

procedure TfGen_ManrQ_Geo.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
VAR
  cSql_Ln: string;
begin
  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'UPDATE `mant_paises` SET ';
  cSql_Ln := cSql_Ln + '  `pais_riesgo_chg`= `pais_riesgo` ';
  cSql_Ln := cSql_Ln + 'WHERE 1=1';
  utilesv20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'UPDATE `mant_distritos` SET ';
  cSql_Ln := cSql_Ln + '  `dist_riesgo_chg`= `dist_riesgo` ';
  cSql_Ln := cSql_Ln + 'WHERE 1=1';
  utilesv20.Execute_SQL_Command(cSql_Ln);

end;

procedure TfGen_ManrQ_Geo.FormCreate(Sender: TObject);
VAR
  cSql_Ln: string;
begin
  freeandnil(FDConnection1);

  self.oQry_Pais.Connection := futilesv20.oPublicCnn;
  self.oQry_Prov.Connection := futilesv20.oPublicCnn;
  self.oQry_Dist.Connection := futilesv20.oPublicCnn;

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'UPDATE `mant_paises` SET ';
  cSql_Ln := cSql_Ln + '  `pais_riesgo`=IFNULL(`pais_riesgo`,0), `pais_riesgo_chg`= `pais_riesgo` ';
  cSql_Ln := cSql_Ln + 'WHERE 1=1';
  utilesv20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'UPDATE `mant_distritos` SET ';
  cSql_Ln := cSql_Ln + '  `dist_riesgo`=IFNULL(`dist_riesgo`,0), `dist_riesgo_chg`= `dist_riesgo` ';
  cSql_Ln := cSql_Ln + 'WHERE 1=1';
  utilesv20.Execute_SQL_Command(cSql_Ln);

  self.Buscar_Pais();
  self.cId_Pais := self.oQry_Pais.FieldByName('pais_id_pais').AsString;
  self.Buscar_Prov();
  self.cId_Prov := self.oQry_Prov.FieldByName('prov_id').AsString;
  self.Buscar_Dist();
end;

procedure TfGen_ManrQ_Geo.FormShow(Sender: TObject);
var
  olPickList: TStringList;
  olKey_List: TStringList;
  oQry_Gen: TFDQuery;
  cSql_Ln: string;
begin
  olPickList := TStringList.Create;
  olKey_List := TStringList.Create;
  oQry_Gen := TFDQuery.Create(self);

  cSql_Ln := 'SELECT impa_descripcion,impa_valor FROM mant_nivel_impacto ORDER BY impa_valor';
  utilesv20.Exec_Select_SQL(oQry_Gen, cSql_Ln);
  while not oQry_Gen.EOF do
  begin
    olPickList.Add(oQry_Gen.FieldByName('impa_descripcion').AsString);
    olKey_List.Add(oQry_Gen.FieldByName('impa_valor').AsString);
    oQry_Gen.Next;
  end;

  cSql_Ln := 'SELECT prov_descripcion,prov_valor FROM mant_nivel_provabilidad ORDER BY prov_valor';
  utilesv20.Exec_Select_SQL(oQry_Gen, cSql_Ln);
  while not oQry_Gen.EOF do
  begin
    olPickList.Add(oQry_Gen.FieldByName('prov_descripcion').AsString);
    olKey_List.Add(oQry_Gen.FieldByName('prov_valor').AsString);
    oQry_Gen.Next;
  end;

  self.StatusBar1.Panels[0].Text := 'Usuario: ' + utilesv20.sUserName;
  self.StatusBar1.Panels[1].Text := 'Fecha: ' + formatDateTime('dd/mm/yyyy', now());
  self.StatusBar1.Panels[2].Text := 'Servidor: ' + futilesv20.oPublicCnn.Params.Values['Server'] + '/' + Uppercase(futilesv20.oPublicCnn.Params.Values['Database']);
  self.StatusBar1.Panels[3].Text := 'Empresa: ' + utilesv20.cDe_Empresa;

  self.oText_Fnd.Text := '';
  self.oText_Fnd.SetFocus;
  self.oGrid_Pais.Columns[1].PickList
  // SELF.oGrid_Pais.Columns[1].KeyList

end;

procedure TfGen_ManrQ_Geo.oLst_ProvCloseUp(Sender: TObject; Accept: Boolean);
begin
  if (self.oLst_Prov.KeyValue <> null) then
  begin
    self.cId_Prov := self.oQry_Prov.FieldByName('prov_id').AsString;
    self.Buscar_Dist();
  end;
end;

procedure TfGen_ManrQ_Geo.oText_FndKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_RETURN then
  begin
    self.oBtn_FndClick(self);
  end;
end;

end.
