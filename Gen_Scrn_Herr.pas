unit Gen_Scrn_Herr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvSmoothButton,
  Vcl.ExtCtrls, ResizeKit, AdvGroupBox, Vcl.ComCtrls;

type
  TfGen_Scrn_Herr = class(TForm)
    AdvSmoothButton4: TAdvSmoothButton;
    ResizeKit1: TResizeKit;
    StatusBar1: TStatusBar;
    AdvGroupBox1: TAdvGroupBox;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    oBtn_Opt1: TAdvSmoothButton;
    oBtn_Opt2: TAdvSmoothButton;
    oBtn_Opt3: TAdvSmoothButton;
    oBtn_Opt4: TAdvSmoothButton;
    Label1: TLabel;
    procedure AdvSmoothButton4Click(Sender: TObject);
    procedure oBtn_Opt1Click(Sender: TObject);
    procedure oBtn_Opt3Click(Sender: TObject);
    procedure oBtn_Opt4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGen_Scrn_Herr: TfGen_Scrn_Herr;

implementation

USES UtilesV20, Gen_MantQ_Geo, Gen_MantQ_Act, Gen_MantQ_Emp;
{$R *.dfm}

procedure TfGen_Scrn_Herr.AdvSmoothButton4Click(Sender: TObject);
begin
  close;
end;

procedure TfGen_Scrn_Herr.FormShow(Sender: TObject);
begin
  self.StatusBar1.Panels[0].Text := 'Usuario: ' + UtilesV20.sUserName;
  self.StatusBar1.Panels[1].Text := 'Fecha: ' + formatDateTime('dd/mm/yyyy', now());
  self.StatusBar1.Panels[2].Text := 'Servidor: ' + fUtilesV20.oPublicCnn.Params.Values['Server'] + '/' + UpperCase(fUtilesV20.oPublicCnn.Params.Values['Database']);
  self.StatusBar1.Panels[3].Text := 'Empresa: ' + UtilesV20.cDe_Empresa;
end;

procedure TfGen_Scrn_Herr.oBtn_Opt1Click(Sender: TObject);
begin
  self.oBtn_Opt1.enabled := false;
  self.Visible := false;
  Application.CreateForm(TfGen_ManrQ_Geo, fGen_ManrQ_Geo);
  fGen_ManrQ_Geo.ShowModal;
  freeandnil(fGen_ManrQ_Geo);
  self.Visible := true;
  self.oBtn_Opt1.enabled := true;

end;

procedure TfGen_Scrn_Herr.oBtn_Opt3Click(Sender: TObject);
begin
  self.oBtn_Opt3.enabled := false;
  self.Visible := false;
  Application.CreateForm(TfGen_MantQ_Act, fGen_MantQ_Act);
  fGen_MantQ_Act.ShowModal;
  freeandnil(fGen_MantQ_Act);
  self.Visible := true;
  self.oBtn_Opt3.enabled := true;
end;

procedure TfGen_Scrn_Herr.oBtn_Opt4Click(Sender: TObject);
begin
  self.oBtn_Opt4.enabled := false;
  self.Visible := false;
  Application.CreateForm(TfGen_MantQ_Emp, fGen_MantQ_Emp);
  fGen_MantQ_Emp.ShowModal;
  freeandnil(fGen_MantQ_Emp);
  self.Visible := true;
  self.oBtn_Opt4.enabled := true;
end;

end.
