object fGen_Mant_Cte2_Sel: TfGen_Mant_Cte2_Sel
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'COMPUCAS SOFTWARE [MANTENIMIENTO DE CLIENTES].'
  ClientHeight = 171
  ClientWidth = 522
  Color = 15984090
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object Label5: TLabel
    Left = 39
    Top = 45
    Width = 110
    Height = 17
    Caption = 'Tipo de persona*:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object oLst_tipo_persona: TDBComboBoxEh
    Left = 163
    Top = 42
    Width = 310
    Height = 25
    DynProps = <>
    EditButtons = <>
    Items.Strings = (
      'Persona Natural'
      'Persona Juridica')
    KeyItems.Strings = (
      '1'
      '2'
      '')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Visible = True
  end
  object Button1: TButton
    Left = 188
    Top = 96
    Width = 145
    Height = 57
    Caption = 'Continuar'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
end
