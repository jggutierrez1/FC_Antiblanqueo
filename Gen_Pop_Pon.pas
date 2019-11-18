unit Gen_Pop_Pon;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, DBGridEh, AdvSmoothButton,
  Vcl.ExtCtrls, Vcl.ComCtrls, DBCtrlsEh, DBLookupEh, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TfGen_Pop_Pon = class(TForm)
    otImpa: TFDTable;
    odImpa: TDataSource;
    otProva: TFDTable;
    odProva: TDataSource;
    oConn: TFDConnection;
    Label3: TLabel;
    odescripcion: TDBEdit;
    Label4: TLabel;
    oLst_prob_ponderacion: TDBLookupComboboxEh;
    Label6: TLabel;
    oLst_impa_ponderacion: TDBLookupComboboxEh;
    StatusBar1: TStatusBar;
    Shape1: TShape;
    oBtn_Save_Dep: TAdvSmoothButton;
    oBtn_Ign_Dep: TAdvSmoothButton;
    Label1: TLabel;
    Shape2: TShape;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure oBtn_Ign_DepClick(Sender: TObject);
    procedure oBtn_Save_DepClick(Sender: TObject);
  private
    { Private declarations }
  public
    iNiv_Prob, iNiv_Impa: integer;
    cDetalle: string;
    iOption: integer;
    { Public declarations }
  end;

var
  fGen_Pop_Pon: TfGen_Pop_Pon;

implementation

uses UtilesV20;

{$R *.dfm}

procedure TfGen_Pop_Pon.FormCreate(Sender: TObject);
begin
  freeandnil(oConn);
  self.otProva.Connection := fUtilesV20.oPublicCnn;
  self.otImpa.Connection := fUtilesV20.oPublicCnn;
  self.iOption := 0;
  self.iNiv_Prob := 0;
  self.iNiv_Impa := 0;
  self.cDetalle := '';
end;

procedure TfGen_Pop_Pon.FormShow(Sender: TObject);
begin
  self.otProva.Open();
  self.otImpa.Open();
  self.oLst_prob_ponderacion.Value := self.iNiv_Prob;
  self.oLst_impa_ponderacion.Value := self.iNiv_Impa;
  self.odescripcion.Text := self.cDetalle;
  self.odescripcion.Refresh;
end;

procedure TfGen_Pop_Pon.oBtn_Ign_DepClick(Sender: TObject);
begin
  self.iOption := 0;
  self.iNiv_Prob := -1;
  self.iNiv_Impa := -1;
  close;
end;

procedure TfGen_Pop_Pon.oBtn_Save_DepClick(Sender: TObject);
begin
  self.iOption := 1;
  self.iNiv_Prob := self.oLst_prob_ponderacion.Value;
  self.iNiv_Impa := self.oLst_impa_ponderacion.Value;
  close;
end;

end.
