unit Rep_IndR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, htmlcomp, htmledit,
  htdbhtmledit, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, PngBitBtn, HTMLUn2, HtmlView, HtPreviewFrame,
  ResizeKit, Vcl.Menus,
  SynPDF;

type
  TfRep_IndR = class(TForm)
    oHtmlViewer: THtmlViewer;
    oBtnPrint: TPngBitBtn;
    ohtml_matriz2: TDBMemo;
    oConection: TFDConnection;
    otEmpresa: TFDTable;
    oDS_Empresa: TDataSource;
    ohtml_matriz1: TDBMemo;
    ResizeKit1: TResizeKit;
    oBtn_Reca_Matriz1: TPngBitBtn;
    MainMenu1: TMainMenu;
    Imprimir1: TMenuItem;
    Recalcular1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure oBtnPrintClick(Sender: TObject);
    procedure oBtn_Reca_Matriz1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure Recalcular1Click(Sender: TObject);
  private
    { Private declarations }
    cNom_Modulo: STRING;
  public
    { Public declarations }
  end;

var
  fRep_IndR: TfRep_IndR;

implementation

USES utilesv20;
{$R *.dfm}

procedure TfRep_IndR.FormCreate(Sender: TObject);
begin
  self.cNom_Modulo := 'REPORTE DE MATRIZ GLOBAL';

  self.otEmpresa.Connection := futilesv20.oPublicCnn;
  self.otEmpresa.Active := true;
  self.oDS_Empresa.Enabled := true;
end;

procedure TfRep_IndR.FormResize(Sender: TObject);
begin
  oHtmlViewer.Align := alLeft;
end;

procedure TfRep_IndR.FormShow(Sender: TObject);
VAR
  cString: Widestring;
begin
  cString := '';
  cString := cString + '<h2 style="text-align:center;">REPORTE DE MATRIZ GLOBAL</h2>';
  cString := cString + '<h2 style="text-align:center;">' + trim(self.otEmpresa.FieldByName('emp_descripcion').AsString) + '</h2>';
  cString := cString + '<br/>' + trim(self.ohtml_matriz1.text) + '<br/>';
  cString := cString + trim(self.ohtml_matriz2.text);

  self.oHtmlViewer.LoadFromString(cString);
  self.oHtmlViewer.Repaint;
end;

procedure TfRep_IndR.Imprimir1Click(Sender: TObject);
begin
  ShowHtPrintPreview(oHtmlViewer.text);
end;

procedure TfRep_IndR.oBtnPrintClick(Sender: TObject);
begin
  ShowHtPrintPreview(oHtmlViewer.text);
end;

procedure TfRep_IndR.oBtn_Reca_Matriz1Click(Sender: TObject);
var
  cSql_Ln: string;
  cString: Widestring;
begin
  cSql_Ln := 'CALL App_Calc_Cte_Matriz_All("' + IntToStr(utilesv20.iUserID) + '","' + utilesv20.sUserName + '","' + trim(self.cNom_Modulo) + '/RECALCULO DE MATRIZ GENERAL",0)';
  utilesv20.Execute_SQL_Command(cSql_Ln);

  cSql_Ln := 'CALL App_Calc_Emp_Matriz_Disp("' + IntToStr(utilesv20.iUserID) + '","' + utilesv20.sUserName + '","' + trim(self.cNom_Modulo) +
    '/RECALCULO DE MATRIZ DE DISPERSION GENERAL",0)';
  utilesv20.Execute_SQL_Command(cSql_Ln);

  self.otEmpresa.Refresh;

  cString := '';
  cString := cString + '<h2 style="text-align:center;">REPORTE DE MATRIZ GLOBAL</h2>';
  cString := cString + '<h2 style="text-align:center;">' + trim(self.otEmpresa.FieldByName('emp_descripcion').AsString) + '</h2>';
  cString := cString + '<br/>' + trim(self.ohtml_matriz1.text) + '<br/>';
  cString := cString + trim(self.ohtml_matriz2.text);

  self.oHtmlViewer.LoadFromString(cString);
  self.oHtmlViewer.Repaint;
  MessageDlg('PROCESO FINALIZADO', mtInformation, [mbOk], 0);
end;

procedure TfRep_IndR.Recalcular1Click(Sender: TObject);
begin
  self.oBtn_Reca_Matriz1Click(self);
end;

end.
