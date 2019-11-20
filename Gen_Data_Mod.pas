unit Gen_Data_Mod;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Phys.ODBC,
  FireDAC.Phys.ODBCDef, MemTableDataEh, MemTableEh, ZAbstractConnection,
  ZConnection;

type
  TdmGen_Data_Mod = class(TDataModule)
    odPais: TDataSource;
    otPais: TFDTable;
    odProv: TDataSource;
    otProv: TFDTable;
    odDist: TDataSource;
    otDist: TFDTable;
    odCorr: TDataSource;
    otCorr: TFDTable;
    odTipEmp: TDataSource;
    otTipEmp: TFDTable;
    odActvEco: TDataSource;
    otActvEco: TFDTable;
    odTipVivi: TDataSource;
    otTipVivi: TFDTable;
    odEstLab: TDataSource;
    otEstLab: TFDTable;
    odTipPla: TDataSource;
    otTipPla: TFDTable;
    odConcI: TDataSource;
    otConcI: TFDTable;
    odFormP: TDataSource;
    otFormP: TFDTable;
    odCte_OIng: TDataSource;
    oQry_Cte_OIng: TFDQuery;
    odCte_Tran: TDataSource;
    oQry_Cte_Tran: TFDQuery;
    odCte_InfL: TDataSource;
    oQry_Cte_InfL: TFDQuery;
    odCte_Depe: TDataSource;
    oQry_Cte_Depe: TFDQuery;
    odCte_Resid: TDataSource;
    oQry_Cte_Resid: TFDQuery;
    oDClientes: TDataSource;
    otClientes: TFDTable;
    oD_Ultimos: TDataSource;
    oQry_Ultimos: TFDQuery;
    oDbf_Qry: TFDQuery;
    FDConnection1: TFDConnection;
    odFrecP: TDataSource;
    otFrecP: TFDTable;
    oDbf_Cnn: TFDConnection;
    odConcIng: TDataSource;
    otConcIng: TFDTable;
    odCte_OFon: TDataSource;
    oQry_Cte_OFon: TFDQuery;
    odTipTr: TDataSource;
    otTipTr: TFDTable;
    oD_Cte_Ref1: TDataSource;
    oQry_Cte_Ref1: TFDQuery;
    oD_Cte_RefB: TDataSource;
    oQry_Cte_RefB: TFDQuery;
    odBanc: TDataSource;
    otBanc: TFDTable;
    otTipo_refe: TMemTableEh;
    otTipo_refeid_Tipo: TIntegerField;
    otTipo_refeNombre: TStringField;
    oD_Cte_FR: TDataSource;
    oQry_Cte_FR: TFDQuery;
    otFacR: TFDTable;
    odFacR: TDataSource;
    odTipDe: TDataSource;
    otTipDe: TFDTable;
    oD_Cte_De: TDataSource;
    oQry_Cte_De: TFDQuery;
    odCte_Cat: TDataSource;
    otCte_Cat: TFDTable;
    odClase: TDataSource;
    otClase: TFDTable;
    procedure DataModuleCreate(Sender: TObject);
    procedure Init_Conection;
    procedure Open_All_DataGen();
    procedure Open_All_DataQryRef();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmGen_Data_Mod: TdmGen_Data_Mod;

implementation

uses UtilesV20;
{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TdmGen_Data_Mod.Init_Conection();
begin
  self.otPais.Connection := fUtilesV20.oPublicCnn;
  self.otProv.Connection := fUtilesV20.oPublicCnn;
  self.otDist.Connection := fUtilesV20.oPublicCnn;
  self.otCorr.Connection := fUtilesV20.oPublicCnn;
  self.otTipEmp.Connection := fUtilesV20.oPublicCnn;
  self.otActvEco.Connection := fUtilesV20.oPublicCnn;
  self.otTipVivi.Connection := fUtilesV20.oPublicCnn;
  self.otEstLab.Connection := fUtilesV20.oPublicCnn;
  self.otTipPla.Connection := fUtilesV20.oPublicCnn;
  self.otConcI.Connection := fUtilesV20.oPublicCnn;
  self.otFormP.Connection := fUtilesV20.oPublicCnn;
  self.otFrecP.Connection := fUtilesV20.oPublicCnn;
  self.otTipTr.Connection := fUtilesV20.oPublicCnn;
  self.otConcIng.Connection := fUtilesV20.oPublicCnn;
  self.otBanc.Connection := fUtilesV20.oPublicCnn;
  self.otFacR.Connection := fUtilesV20.oPublicCnn;
  self.otTipDe.Connection := fUtilesV20.oPublicCnn;
  self.otCte_Cat.Connection := fUtilesV20.oPublicCnn;
  self.otClase.Connection := fUtilesV20.oPublicCnn;

  self.oQry_Ultimos.Connection := fUtilesV20.oPublicCnn;
  self.otClientes.Connection := fUtilesV20.oPublicCnn;
  self.oQry_Cte_InfL.Connection := fUtilesV20.oPublicCnn;
  self.oQry_Cte_Depe.Connection := fUtilesV20.oPublicCnn;
  self.oQry_Cte_Resid.Connection := fUtilesV20.oPublicCnn;
  self.oQry_Cte_Tran.Connection := fUtilesV20.oPublicCnn;
  self.oQry_Cte_OIng.Connection := fUtilesV20.oPublicCnn;
  self.oQry_Cte_OFon.Connection := fUtilesV20.oPublicCnn;
  self.oQry_Cte_RefB.Connection := fUtilesV20.oPublicCnn;
  self.oQry_Cte_Ref1.Connection := fUtilesV20.oPublicCnn;
  self.oQry_Cte_FR.Connection := fUtilesV20.oPublicCnn;
  self.oQry_Cte_De.Connection := fUtilesV20.oPublicCnn;
end;

procedure TdmGen_Data_Mod.Open_All_DataQryRef();
begin
  self.oQry_Cte_RefB.Close;
  self.oQry_Cte_RefB.Filter := '';
  self.oQry_Cte_RefB.Filtered := false;
  self.oQry_Cte_RefB.Open;
  self.oD_Cte_RefB.DataSet := self.oQry_Cte_RefB;

  self.oQry_Cte_Ref1.Close;
  self.oQry_Cte_Ref1.Filter := '';
  self.oQry_Cte_Ref1.Filtered := false;
  self.oQry_Cte_Ref1.Open;
  self.oD_Cte_Ref1.DataSet := self.oQry_Cte_Ref1;
end;

procedure TdmGen_Data_Mod.Open_All_DataGen();
begin
  self.otCte_Cat.Close;
  self.otCte_Cat.Filter := 'cat_inactiva=0';
  self.otCte_Cat.Filtered := true;
  self.otCte_Cat.Open;
  self.odCte_Cat.DataSet := self.otCte_Cat;

  self.otFacR.Close;
  self.otFacR.Filter := 'selecion_automatica=0';
  self.otFacR.Filtered := true;
  self.otFacR.Open;
  self.odFacR.DataSet := self.otFacR;

  self.otPais.Close;
  self.otPais.Filter := '';
  self.otPais.Filtered := false;
  self.otPais.Open;
  self.otPais.Locate('pais_id_pais', '136', []);
  self.odPais.DataSet := self.otPais;

  self.otProv.Close;
  self.otProv.Filter := '';
  self.otProv.Filtered := false;
  self.otProv.Open;
  self.odProv.DataSet := self.otProv;

  self.otDist.Close;
  self.otDist.Filter := '';
  self.otDist.Filtered := false;
  self.otDist.Open;
  self.odDist.DataSet := self.otDist;

  self.otTipPla.Close;
  self.otTipPla.Filter := '';
  self.otTipPla.Filtered := false;
  self.otTipPla.Open;
  self.odTipPla.DataSet := self.otTipPla;

  self.otEstLab.Close;
  self.otEstLab.Filter := '';
  self.otEstLab.Filtered := false;
  self.otEstLab.Open;
  self.odEstLab.DataSet := self.otEstLab;

  self.otTipVivi.Close;
  self.otTipVivi.Filter := '';
  self.otTipVivi.Filtered := false;
  self.otTipVivi.Open;
  self.odTipVivi.DataSet := self.otTipVivi;

  self.otActvEco.Close;
  self.otActvEco.Filter := '';
  self.otActvEco.Filtered := false;
  self.otActvEco.Open;
  self.odActvEco.DataSet := self.otActvEco;

  self.otTipEmp.Close;
  self.otTipEmp.Filter := '';
  self.otTipEmp.Filtered := false;
  self.otTipEmp.Open;
  self.odTipEmp.DataSet := self.otTipEmp;

  self.otCorr.Close;
  self.otCorr.Filter := '';
  self.otCorr.Filtered := false;
  self.otCorr.Open;
  self.odCorr.DataSet := self.otCorr;

  self.otConcI.Close;
  self.otConcI.Filter := '';
  self.otConcI.Filtered := false;
  self.otConcI.Open;
  self.odConcI.DataSet := self.otConcI;

  self.otFormP.Close;
  self.otFormP.Filter := '';
  self.otFormP.Filtered := false;
  self.otFormP.Open;
  self.odFormP.DataSet := self.otFormP;

  self.otFrecP.Close;
  self.otFrecP.Filter := '';
  self.otFrecP.Filtered := false;
  self.otFrecP.Open;
  self.odFrecP.DataSet := self.otFrecP;

  self.otTipTr.Close;
  self.otTipTr.Filter := '';
  self.otTipTr.Filtered := false;
  self.otTipTr.Open;
  self.odTipTr.DataSet := self.otTipTr;

  self.otBanc.Close;
  self.otBanc.Filter := '';
  self.otBanc.Filtered := false;
  self.otBanc.Open;
  self.odBanc.DataSet := self.otBanc;

  self.otConcIng.Close;
  self.otConcIng.Filter := '';
  self.otConcIng.Filtered := false;
  self.otConcIng.Open;
  self.odConcIng.DataSet := self.otConcIng;

  self.otTipDe.Close;
  self.otTipDe.Filter := '';
  self.otTipDe.Filtered := false;
  self.otTipDe.Open;
  self.odTipDe.DataSet := self.otTipDe;

  self.otClase.Close;
  self.otClase.Filter := '';
  self.otClase.Filtered := false;
  self.otClase.Open;
  self.odClase.DataSet := self.otClase;
end;

procedure TdmGen_Data_Mod.DataModuleCreate(Sender: TObject);
begin
  self.oDbf_Cnn.Close;
  self.FDConnection1.Close;
  freeandnil(self.FDConnection1);
end;

end.
