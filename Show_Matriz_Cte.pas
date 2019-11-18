unit Show_Matriz_Cte;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvSmoothButton, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Buttons, PngBitBtn, HTMLUn2, HtmlView, Vcl.ComCtrls;

type
  TfShow_Matriz_Cte = class(TForm)
    HtmlViewer1: THtmlViewer;
    ohtml_matriz: TDBMemo;
    oNivel_Impacto: TLabel;
    oBtn_Salir: TAdvSmoothButton;
    oBtn_Recall: TAdvSmoothButton;
    StatusBar1: TStatusBar;
    procedure oBtn_RecallClick(Sender: TObject);
    procedure oBtn_SalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Muestra_Cte_Riesgo();
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    cNom_Modulo: string;
  public
    cCte_Sel: string;
    { Public declarations }
  end;

var
  fShow_Matriz_Cte: TfShow_Matriz_Cte;

implementation

uses UtilesV20, Gen_Data_Mod;
{$R *.dfm}

procedure TfShow_Matriz_Cte.oBtn_RecallClick(Sender: TObject);
var
  cSql_Ln: string;
begin
  cSql_Ln := 'CALL App_Calc_Cte_Matriz("' + trim(self.cCte_Sel) + '","' + IntToStr(UtilesV20.iUserID) + '","' + UtilesV20.sUserName + '","' + trim(self.cNom_Modulo) +
    '/RECALCULO DE MATRIZ",0)';
  UtilesV20.Execute_SQL_Command(cSql_Ln);

  dmGen_Data_Mod.otClientes.Refresh;

  self.HtmlViewer1.LoadFromString(dmGen_Data_Mod.otClientes.FieldByName('html_matriz').AsWideString);
  self.HtmlViewer1.Repaint;
  MessageDlg('PROCESO FINALIZADO', mtInformation, [mbOk], 0);
end;

procedure TfShow_Matriz_Cte.FormCreate(Sender: TObject);
begin
  self.cNom_Modulo := 'MANTENIMIENTO-CLIENTES';
  self.HtmlViewer1.LoadFromString(dmGen_Data_Mod.otClientes.FieldByName('html_matriz').AsWideString);
  self.HtmlViewer1.Repaint;
end;

procedure TfShow_Matriz_Cte.FormShow(Sender: TObject);
begin
  self.Muestra_Cte_Riesgo();
end;

procedure TfShow_Matriz_Cte.oBtn_SalirClick(Sender: TObject);
begin
  close;
end;

procedure TfShow_Matriz_Cte.Muestra_Cte_Riesgo();
var
  cSql_Ln: string;
  cCte_Imp_Ran: string;
  cCte_Imp_Des: string;
begin

  cCte_Imp_Ran := trim(dmGen_Data_Mod.otClientes.FieldByName('nivel_riesgo').AsString);
  if (trim(cCte_Imp_Ran) = '') then
    cCte_Imp_Ran := '0';

  cSql_Ln := '';
  cSql_Ln := cSql_Ln + 'SELECT ';
  cSql_Ln := cSql_Ln + '  riez_descripcion ';
  cSql_Ln := cSql_Ln + 'FROM mant_nivel_riezgo ';
  cSql_Ln := cSql_Ln + 'WHERE ' + cCte_Imp_Ran + ' BETWEEN riez_nivel_ini AND riez_nivel_fin';
  cCte_Imp_Des := UtilesV20.Execute_SQL_Result(cSql_Ln);
  self.oNivel_Impacto.Caption := 'NIVEL DE RIESGO DEL CLIENTE/ASOCIADO: ->[' + uppercase(cCte_Imp_Des) + ']';
  self.oNivel_Impacto.Refresh;
end;

end.
