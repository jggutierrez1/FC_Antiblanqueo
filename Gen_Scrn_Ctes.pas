unit Gen_Scrn_Ctes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvGroupBox, AdvSmoothButton, Vcl.ExtCtrls, Vcl.ComCtrls,
  ResizeKit;

type
  TfGen_Scrn_Ctes = class(TForm)
    ResizeKit1: TResizeKit;
    AdvSmoothButton4: TAdvSmoothButton;
    Label1: TLabel;
    StatusBar1: TStatusBar;
    AdvGroupBox2: TAdvGroupBox;
    oBtn_Cte_Man: TAdvSmoothButton;
    AdvSmoothButton5: TAdvSmoothButton;
    procedure AdvSmoothButton4Click(Sender: TObject);
    procedure oBtn_Cte_ManClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGen_Scrn_Ctes: TfGen_Scrn_Ctes;

implementation

uses UtilesV20, Gen_Mant_Cte;
{$R *.dfm}

procedure TfGen_Scrn_Ctes.FormShow(Sender: TObject);
begin
  self.StatusBar1.Panels[0].Text := 'Usuario: ' + UtilesV20.sUserName;
  self.StatusBar1.Panels[1].Text := 'Fecha: ' + formatDateTime('dd/mm/yyyy', now());
  self.StatusBar1.Panels[2].Text := 'Servidor: ' + fUtilesV20.oPublicCnn.Params.Values['Server'] + '/' + UpperCase(fUtilesV20.oPublicCnn.Params.Values['Database']);
  self.StatusBar1.Panels[3].Text := 'Empresa: ' + UtilesV20.cDe_Empresa;
end;

procedure TfGen_Scrn_Ctes.oBtn_Cte_ManClick(Sender: TObject);
begin
  Application.CreateForm(TfGen_Mant_Cte, fGen_Mant_Cte);
  fGen_Mant_Cte.ShowModal;
  freeandnil(fGen_Mant_Cte);
end;

procedure TfGen_Scrn_Ctes.AdvSmoothButton4Click(Sender: TObject);
begin
  close;
end;

end.
