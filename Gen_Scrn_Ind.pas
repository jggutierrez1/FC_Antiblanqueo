unit Gen_Scrn_Ind;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, HTMLUn2, HtmlView, CurvyControls,
  AdvSmoothPanel, AdvSmoothExpanderPanel, AdvSmoothLabel, Vcl.StdCtrls,
  HTMLabel, dbhtmlab, htmlcomp, htmledit, AdvSmoothTileList;

type
  TfGen_Scrn_Ind = class(TForm)
    AdvSmoothExpanderPanel1: TAdvSmoothExpanderPanel;
    CurvyEdit1: TCurvyEdit;
    AdvSmoothExpanderPanel2: TAdvSmoothExpanderPanel;
    CurvyEdit2: TCurvyEdit;
    AdvSmoothExpanderPanel3: TAdvSmoothExpanderPanel;
    CurvyEdit3: TCurvyEdit;
    AdvSmoothExpanderPanel4: TAdvSmoothExpanderPanel;
    CurvyEdit4: TCurvyEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    AdvSmoothTileList1: TAdvSmoothTileList;
    HtComboBox1: THtComboBox;
    HtTableBorderCombo1: THtTableBorderCombo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    cNom_Modulo: STRING;
    { Public declarations }
  end;

var
  fGen_Scrn_Ind: TfGen_Scrn_Ind;

implementation

USES utilesv20;
{$R *.dfm}

procedure TfGen_Scrn_Ind.FormCreate(Sender: TObject);
begin
  self.cNom_Modulo := 'REPORTE DE INDICADORES DE RIESGO';
end;

end.
