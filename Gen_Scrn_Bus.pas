unit Gen_Scrn_Bus;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, dxGDIPlusClasses, cxImage, AdvSmoothButton,
  Vcl.StdCtrls, Vcl.ExtCtrls, ResizeKit, Vcl.ComCtrls,ShellApi;

type
  TfGen_Scrn_Bus = class(TForm)
    Label1: TLabel;
    oBtn_Onu: TcxImage;
    oBtn_Ofac: TcxImage;
    oBtn_Oc: TcxImage;
    oBtn_Osfi: TcxImage;
    oBtn_RUnid: TcxImage;
    oBtn_Uaf: TcxImage;
    oBtn_RPub: TcxImage;
    oBtn_Apc: TcxImage;
    oBtn_Sup: TcxImage;
    AdvSmoothButton4: TAdvSmoothButton;
    ResizeKit1: TResizeKit;
    StatusBar1: TStatusBar;
    procedure oBtn_OfacClick(Sender: TObject);
    procedure oBtn_OcClick(Sender: TObject);
    procedure oBtn_OsfiClick(Sender: TObject);
    procedure oBtn_RUnidClick(Sender: TObject);
    procedure oBtn_UafClick(Sender: TObject);
    procedure oBtn_RPubClick(Sender: TObject);
    procedure oBtn_ApcClick(Sender: TObject);
    procedure oBtn_SupClick(Sender: TObject);
    procedure AdvSmoothButton4Click(Sender: TObject);
    procedure oBtn_OnuClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGen_Scrn_Bus: TfGen_Scrn_Bus;

implementation

uses UtilesV20;
{$R *.dfm}

procedure TfGen_Scrn_Bus.AdvSmoothButton4Click(Sender: TObject);
begin
  close;
end;

procedure TfGen_Scrn_Bus.FormShow(Sender: TObject);
begin
  self.StatusBar1.Panels[0].Text := 'Usuario: ' + UtilesV20.sUserName;
  self.StatusBar1.Panels[1].Text := 'Fecha: ' + formatDateTime('dd/mm/yyyy', now());
  self.StatusBar1.Panels[2].Text := 'Servidor: ' + fUtilesV20.oPublicCnn.Params.Values['Server'] + '/' + UpperCase(fUtilesV20.oPublicCnn.Params.Values['Database']);
  self.StatusBar1.Panels[3].Text := 'Empresa: ' + UtilesV20.cDe_Empresa;
end;

procedure TfGen_Scrn_Bus.oBtn_ApcClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://online.apc.com.pa/Login/tabid/468/Default.aspx?returnurl=%2fdefault.aspx', nil,
    nil, SW_SHOWNORMAL);
end;

procedure TfGen_Scrn_Bus.oBtn_RPubClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.rp.gob.pa/', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Scrn_Bus.oBtn_OcClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.opencorporates.com/', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Scrn_Bus.oBtn_OfacClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://sanctionssearch.ofac.treas.gov/', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Scrn_Bus.oBtn_OnuClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://scsanctions.un.org/search/', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Scrn_Bus.oBtn_OsfiClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.osfi-bsif.gc.ca/Eng/fi-if/amlc-clrpc/atf-fat/Pages/default.aspx', nil, nil,
    SW_SHOWNORMAL);
end;

procedure TfGen_Scrn_Bus.oBtn_RUnidClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open',
    'https://www.gov.uk/government/publications/current-list-of-designated-persons-terrorism-and-terrorist-financing',
    nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Scrn_Bus.oBtn_SupClick(Sender: TObject);
begin
  MessageDlg('Actualmente estamos mejorando el diseño, pronto estará nuevamente en funcionamiento', mtInformation,
    [mbOK], 0);
  // ShellExecute(Handle, 'open', 'http://localhost/antiblanqueo/informe_onu.php', nil, nil, SW_SHOWNORMAL);
end;

procedure TfGen_Scrn_Bus.oBtn_UafClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.uaf.gob.pa/Lista-Nacional', nil, nil, SW_SHOWNORMAL);
end;

end.
