unit BuscarGenM5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids,
  DB, ComCtrls,
  Mask, DBCtrlsEh, DBGridEhGrouping, GridsEh, DBGridEh, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, DBAxisGridsEh, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, EhLibVCL,
  DBLookupEh;

type
  TfBuscarGenM5 = class(TForm)
    BitBtn9: TBitBtn;
    oSql1: TMemo;
    oDs_Qry: TDataSource;
    oSqlTmp: TMemo;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    oFilter: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    oTot_Regs: TDBNumberEditEh;
    Shape1: TShape;
    oGrid: TDBGridEh;
    oConection: TFDConnection;
    oQry_Fnd: TFDQuery;
    oLabel_List1: TLabel;
    oLst_campos: TDBComboBoxEh;
    oLst_List1: TDBLookupComboboxEh;
    oDs_Lst1: TDataSource;
    oQry_Lst1: TFDQuery;
    oLabel_List2: TLabel;
    oLst_List2: TDBLookupComboboxEh;
    oDs_Lst2: TDataSource;
    oQry_Lst2: TFDQuery;
    oLabel_List3: TLabel;
    oLst_List3: TDBLookupComboboxEh;
    oDs_Lst3: TDataSource;
    oQry_Lst3: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure oFilterKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Grid_Show;
    procedure SetGridColumnWidths(Grid: TDBGridEh);
    procedure oGridTitleClick(Column: TColumnEh);
    procedure oGridDblClick(Sender: TObject);
    procedure Cargar_Lst1();
    procedure Cargar_Lst2();
    procedure Cargar_Lst3();
    procedure oLst_List1CloseUp(Sender: TObject; Accept: Boolean);
    procedure oLst_List2CloseUp(Sender: TObject; Accept: Boolean);
  private
    cLst2_Valu: string;
    cLst3_Valu: string;
  public
    cLst1_Key_Fld: string;
    cLst1_Lst_Fld: string;
    cLst1_Sql_Cmd: Widestring;
    cLst1_Val_Def: string;
    cLst1_Where_Fld: string;

    cLst2_Key_Fld: string;
    cLst2_Lst_Fld: string;
    cLst2_Sql_Cmd: Widestring;
    cLst2_Val_Def: string;
    cLst2_Where_Fld: string;
    cLst2_Fld_Mas: string;

    cLst3_Key_Fld: string;
    cLst3_Lst_Fld: string;
    cLst3_Sql_Cmd: Widestring;
    cLst3_Val_Def: string;
    cLst3_Where_Fld: string;
    cLst3_Fld_Mas: string;
  end;

type
  oLista = object
    Campo: string;
    Texto: string;
    LLave: Boolean;
  end;

var
  fBuscarGenM5: TfBuscarGenM5;
  vFindResult: string;
  cCampoLLave: variant;
  oListData: array [1 .. 10] of oLista;
  nLimit: Integer;
  DEFBORDER: Integer;
  cMasterTable: string;

implementation

uses utilesV20, AdjustGrid, TecladoGen1;
{$R *.dfm}

procedure TfBuscarGenM5.BitBtn1Click(Sender: TObject);
var
  nIndex: Integer;
begin
  oGrid.Visible := false;
  Shape1.Visible := true;

  oSqlTmp.Clear;
  oSqlTmp.Text := oSql1.Text;
  oSqlTmp.Lines.Add(' AND ' + self.cLst1_Where_Fld + '= " ' + trim(self.oLst_List1.KeyValue) + ' " ');
  oSqlTmp.Lines.Add(' AND ' + self.cLst2_Where_Fld + '= " ' + trim(self.oLst_List2.KeyValue) + ' " ');
  oSqlTmp.Lines.Add(' AND ' + self.cLst3_Where_Fld + '= " ' + trim(self.oLst_List3.KeyValue) + ' " ');

  // for nIndex := 1 to self.oLst_campos.Items.Count do
  // begin
  if not fUtilesV20.isEmpty(self.oFilter.Text) then
  begin

    if fUtilesV20.isEmpty(cMasterTable) = true then
      oSqlTmp.Lines.Add(' AND ' + trim(self.oLst_campos.VALUE) + ' LIKE "%' + trim(self.oFilter.Text) + '%" ')
    else
      oSqlTmp.Lines.Add(' AND ' + trim(cMasterTable) + '.' + trim(self.oLst_campos.VALUE) + ' LIKE "%' + trim(self.oFilter.Text) + '%" ');
  end;

  if fUtilesV20.isEmpty(cMasterTable) = true then
    oSqlTmp.Lines.Add(' ORDER BY ' + trim(self.oLst_campos.VALUE))
  else
    oSqlTmp.Lines.Add(' ORDER BY ' + trim(cMasterTable) + '.' + trim(self.oLst_campos.VALUE));

  fUtilesV20.ConnectServer(utilesV20.sSlectedHost);
  self.oQry_Fnd.Connection := fUtilesV20.oPublicCnn;
  self.oQry_Fnd.SQL.Clear;
  self.oQry_Fnd.SQL.Text := oSqlTmp.Text;
  self.oQry_Fnd.Open;
  if self.oQry_Fnd.RecordCount > 0 then
    self.oGrid.enabled := true
  else
    self.oGrid.enabled := false;
  self.SetGridColumnWidths(oGrid);
  oGrid.Visible := true;
  Shape1.Visible := false;

  self.oTot_Regs.VALUE := self.oQry_Fnd.RecordCount;
  self.oGrid.Refresh;
  self.oGrid.AutoFitColWidths := true;
  self.oGrid.Repaint;
end;

procedure TfBuscarGenM5.BitBtn9Click(Sender: TObject);
begin
  vFindResult := '';
  self.close;
end;

procedure TfBuscarGenM5.oFilterKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    self.BitBtn1Click(self);
  end;
end;

procedure TfBuscarGenM5.oGridDblClick(Sender: TObject);
begin
  vFindResult := self.oGrid.SelectedField.DataSet.FieldByName(cCampoLLave).AsString;
  close;
end;

procedure TfBuscarGenM5.oGridTitleClick(Column: TColumnEh);
{$J+}
const
  PreviousColumnIndex: Integer = 1;
{$J-}
begin
  try
    oGrid.Columns[PreviousColumnIndex].title.Font.Style := oGrid.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
  except
  end;

  Column.title.Font.Style := Column.title.Font.Style + [fsBold];
  PreviousColumnIndex := Column.Index;

  if (Pos(Column.Field.FieldName, self.oQry_Fnd.IndexFieldNames) = 1) and (Pos(' DESC', uppercase(self.oQry_Fnd.IndexFieldNames)) = 0) then
    self.oQry_Fnd.IndexFieldNames := Column.Field.FieldName + ':D'
  else
    self.oQry_Fnd.IndexFieldNames := Column.Field.FieldName + ':A';

  self.oQry_Fnd.First;
end;

procedure TfBuscarGenM5.oLst_List1CloseUp(Sender: TObject; Accept: Boolean);
begin
  if (self.oLst_List1.KeyValue <> null) then
  begin
    self.cLst2_Valu := self.oLst_List1.KeyValue;
    self.Cargar_Lst2();
  end;
end;

procedure TfBuscarGenM5.oLst_List2CloseUp(Sender: TObject; Accept: Boolean);
begin
  if (self.oLst_List2.KeyValue <> null) then
  begin
    self.cLst3_Valu := self.oLst_List2.KeyValue;
    self.Cargar_Lst3();
  end;
end;

procedure TfBuscarGenM5.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  self.oQry_Lst1.Connection := self.oConection;
  self.oQry_Lst2.Connection := self.oConection;

  self.oLst_List1.ListSource := nil;
  self.oLst_List1.ListField := '';
  self.oLst_List1.KeyField := '';
  self.oLst_List1.Clear;

  self.oLst_List2.ListSource := nil;
  self.oLst_List2.ListField := '';
  self.oLst_List2.KeyField := '';
  self.oLst_List2.Clear;

  self.oLst_List3.ListSource := nil;
  self.oLst_List3.ListField := '';
  self.oLst_List3.KeyField := '';
  self.oLst_List3.Clear;

  cMasterTable := '';
  Shape1.Width := oGrid.Width;
  Shape1.Top := oGrid.Top;
  Shape1.Left := oGrid.Left;
  Shape1.Height := oGrid.Height;
  Shape1.Visible := false;
  DEFBORDER := 40;
  // self.ResizeKit1.enabled := utiles.Ctrl_Resize;
  nLimit := 10;
  for I := 1 to 10 do
  begin
    oListData[I].Campo := '';
    oListData[I].Texto := '';
    oListData[I].LLave := false;
  end;
end;

procedure TfBuscarGenM5.FormShow(Sender: TObject);
var
  nIndex: Integer;
begin
  self.Cargar_Lst1();
  self.Cargar_Lst2();
  self.Cargar_Lst3();

  for nIndex := 1 to nLimit do
  begin
    if oListData[nIndex].Texto = '' then
      Continue
    else
    begin
      oLst_campos.Items.Add(oListData[nIndex].Texto);
      oLst_campos.KeyItems.Add(oListData[nIndex].Campo);
      if oListData[nIndex].LLave = true then
        cCampoLLave := oListData[nIndex].Campo;
    end;
  end;
  oLst_campos.ItemIndex := 1;
  self.Grid_Show;
end;

procedure TfBuscarGenM5.Grid_Show;
var
  nIndex: Integer;
  oColumnX: TColumnEh;
begin
  oDs_Qry.DataSet := self.oQry_Fnd;
  oGrid.DataSource := oDs_Qry;
  oGrid.Columns.Clear;
  for nIndex := 1 to nLimit do
  begin
    if oListData[nIndex].Texto = '' then
      Continue
    else
    begin
      if nIndex = 1 then
        oGrid.Columns.Add
      else
        oGrid.Columns.Insert(oGrid.Columns.Count);
      oColumnX := oGrid.Columns.Items[oGrid.Columns.Count - 1];
      oColumnX.Alignment := taLeftJustify;
      oColumnX.FieldName := oListData[nIndex].Campo;
      oColumnX.title.Caption := oListData[nIndex].Texto;

    end;
  end;
  // AdjustColumnWidths(oGrid);
  if self.oQry_Fnd.isEmpty then
    self.oTot_Regs.VALUE := 0
  else
    self.oTot_Regs.VALUE := self.oQry_Fnd.RecordCount;
  self.oFilter.SETFOCUS;
end;

procedure TfBuscarGenM5.SetGridColumnWidths(Grid: TDBGridEh);
{
  const
  DEFBORDER = 10;
}
var
  temp, n: Integer;
  lmax: array [0 .. 30] of Integer;
begin
  with Grid do
  begin
    Canvas.Font := Font;
    for n := 0 to Columns.Count - 1 do
      lmax[n] := Canvas.TextWidth(Grid.Columns[n].title.Caption) + DEFBORDER;
    // fields[n].FieldName
    Grid.DataSource.DataSet.First;
    while not Grid.DataSource.DataSet.Eof do
    begin
      for n := 0 to Columns.Count - 1 do
      begin
        temp := Canvas.TextWidth(trim(Columns[n].Field.DisplayText)) + DEFBORDER;
        if temp > lmax[n] then
          lmax[n] := temp;
      end; { for }
      Grid.DataSource.DataSet.Next;
    end;
    Grid.DataSource.DataSet.First;
    for n := 0 to Columns.Count - 1 do
      if lmax[n] > 0 then
        Columns[n].Width := lmax[n];
  end;
end;
{ SetGridColumnWidths }

procedure TfBuscarGenM5.Cargar_Lst1();
begin
  self.oQry_Lst1.close();
  self.oQry_Lst1.Connection := fUtilesV20.oPublicCnn;
  self.oQry_Lst1.SQL.Clear;
  self.oQry_Lst1.SQL.Text := self.cLst1_Sql_Cmd;
  self.oQry_Lst1.Open();
  self.oDs_Lst1.DataSet := self.oQry_Lst1;
  self.oDs_Lst1.enabled := true;

  self.oLst_List1.ListSource := self.oDs_Lst1;
  self.oLst_List1.ListField := self.cLst1_Lst_Fld;
  self.oLst_List1.KeyField := self.cLst1_Key_Fld;
  self.oLst_List1.Refresh;
  self.oLst_List1.KeyValue := self.cLst1_Val_Def;

  self.cLst2_Valu := self.oQry_Lst1.FieldByName(self.cLst1_Key_Fld).AsString;
end;

procedure TfBuscarGenM5.Cargar_Lst2();
begin
  self.oQry_Lst2.close();
  self.oQry_Lst2.Filter := '';
  self.oQry_Lst2.Filtered := false;
  self.oQry_Lst2.Connection := fUtilesV20.oPublicCnn;
  self.oQry_Lst2.SQL.Clear;
  self.oQry_Lst2.SQL.Text := self.cLst2_Sql_Cmd;
  self.oQry_Lst2.Open();
  self.oDs_Lst2.DataSet := self.oQry_Lst2;
  self.oDs_Lst2.enabled := true;

  if (trim(self.cLst2_Fld_Mas) <> '') then
  begin
    self.oQry_Lst2.Filter := self.cLst2_Fld_Mas + '=' + QuotedStr(self.cLst2_Valu);
    self.oQry_Lst2.Filtered := true;
  end;

  self.oLst_List2.ListSource := self.oDs_Lst2;
  self.oLst_List2.ListField := self.cLst2_Lst_Fld;
  self.oLst_List2.KeyField := self.cLst2_Key_Fld;
  self.oLst_List2.Refresh;
  self.oLst_List2.KeyValue := self.cLst2_Val_Def;

  self.cLst3_Valu := self.oQry_Lst2.FieldByName(self.cLst2_Key_Fld).AsString;
end;

procedure TfBuscarGenM5.Cargar_Lst3();
begin
  self.oQry_Lst3.close();
  self.oQry_Lst3.Filter := '';
  self.oQry_Lst3.Filtered := false;
  self.oQry_Lst3.Connection := fUtilesV20.oPublicCnn;
  self.oQry_Lst3.SQL.Clear;
  self.oQry_Lst3.SQL.Text := self.cLst3_Sql_Cmd;
  self.oQry_Lst3.Open();
  self.oDs_Lst3.DataSet := self.oQry_Lst3;
  self.oDs_Lst3.enabled := true;

  if (trim(self.cLst3_Fld_Mas) <> '') then
  begin
    self.oQry_Lst3.Filter := self.cLst3_Fld_Mas + '=' + QuotedStr(self.cLst3_Valu);
    self.oQry_Lst3.Filtered := true;
  end;

  self.oLst_List3.ListSource := self.oDs_Lst3;
  self.oLst_List3.ListField := self.cLst3_Lst_Fld;
  self.oLst_List3.KeyField := self.cLst3_Key_Fld;
  self.oLst_List3.Refresh;
  self.oLst_List3.KeyValue := self.cLst3_Val_Def;
end;

end.
