unit Gen_Mant_Cte2_Sel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh;

type
  TfGen_Mant_Cte2_Sel = class(TForm)
    Label5: TLabel;
    oLst_tipo_persona: TDBComboBoxEh;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGen_Mant_Cte2_Sel: TfGen_Mant_Cte2_Sel;

implementation

uses UtilesV20, Gen_Data_Mod;

{$R *.dfm}

procedure TfGen_Mant_Cte2_Sel.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfGen_Mant_Cte2_Sel.FormShow(Sender: TObject);
begin
  self.oLst_tipo_persona.Value := 1;
end;

end.
