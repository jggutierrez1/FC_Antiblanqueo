object fGen_Mant_Cte2: TfGen_Mant_Cte2
  Left = 0
  Top = 0
  Caption = 
    'COMPUCAS SOFTWARE (SISTEMA ANTI-BLANQUEO), MANTENIMIENTO DE CLIE' +
    'NTES.'
  ClientHeight = 830
  ClientWidth = 1290
  Color = clWhite
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object Label6: TLabel
    Left = 83
    Top = 275
    Width = 94
    Height = 17
    Caption = 'Primer Nombre:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object GridPanel1: TGridPanel
    Left = 0
    Top = 0
    Width = 1290
    Height = 811
    Align = alClient
    Caption = 'GridPanel1'
    ColumnCollection = <
      item
        Value = 100.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = AdvSmoothTabPager1
        Row = 1
      end
      item
        Column = 0
        Control = oTitulo
        Row = 0
      end
      item
        Column = 0
        Control = AdvGroupBox1
        Row = 2
      end>
    RowCollection = <
      item
        Value = 5.128349623226175000
      end
      item
        Value = 85.125465572452580000
      end
      item
        Value = 9.746184804321244000
      end>
    TabOrder = 0
    object AdvSmoothTabPager1: TAdvSmoothTabPager
      Left = 1
      Top = 42
      Width = 1288
      Height = 688
      Fill.Color = 16773091
      Fill.ColorTo = 16768452
      Fill.ColorMirror = 16765357
      Fill.ColorMirrorTo = 16767936
      Fill.GradientType = gtVertical
      Fill.GradientMirrorType = gtVertical
      Fill.BorderColor = 16765357
      Fill.Rounding = 0
      Fill.ShadowOffset = 0
      Fill.Glow = gmNone
      Transparent = False
      Align = alClient
      ActivePage = oTab_Eva
      TabSettings.StartMargin = 4
      TabSettings.Height = 35
      TabReorder = False
      TabOrder = 0
      object oTab_Gen_Nat: TAdvSmoothTabPage
        Left = 1
        Top = 35
        Width = 1286
        Height = 651
        Caption = 'Datos [Personales Natural]'
        PageAppearance.Color = clWhite
        PageAppearance.ColorTo = 15785680
        PageAppearance.ColorMirror = 15587784
        PageAppearance.ColorMirrorTo = 16774371
        PageAppearance.GradientType = gtVertical
        PageAppearance.GradientMirrorType = gtVertical
        PageAppearance.PicturePosition = ppTiled
        PageAppearance.BorderColor = 16765357
        PageAppearance.BorderWidth = 2
        PageAppearance.Rounding = 0
        PageAppearance.ShadowOffset = 0
        PageAppearance.Glow = gmNone
        TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Appearance.Font.Color = clBlack
        TabAppearance.Appearance.Font.Height = -13
        TabAppearance.Appearance.Font.Name = 'Segoe UI'
        TabAppearance.Appearance.Font.Style = []
        TabAppearance.Status.Caption = '0'
        TabAppearance.Status.Appearance.Fill.Color = clRed
        TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
        TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
        TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
        TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
        TabAppearance.Status.Appearance.Fill.BorderColor = clGray
        TabAppearance.Status.Appearance.Fill.Rounding = 0
        TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
        TabAppearance.Status.Appearance.Fill.Glow = gmNone
        TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Status.Appearance.Font.Color = clWhite
        TabAppearance.Status.Appearance.Font.Height = -11
        TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
        TabAppearance.Status.Appearance.Font.Style = []
        TabAppearance.BevelColor = 16765357
        TabAppearance.BevelColorDown = 16640730
        TabAppearance.BevelColorSelected = 16640730
        TabAppearance.BevelColorHot = 16640730
        TabAppearance.BevelColorDisabled = 16640730
        TabAppearance.Color = 16773091
        TabAppearance.ColorDown = 11196927
        TabAppearance.ColorDisabled = 16765357
        TMSStyle = 4
        object oNivel_Impacto: TLabel
          Left = 684
          Top = 13
          Width = 544
          Height = 17
          AutoSize = False
          Caption = 'NIVEL DE IMPACTO DEL ASOCIADO:'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object oGrp_Info_Nat: TAdvGroupBox
          Left = 58
          Top = 18
          Width = 1170
          Height = 614
          Caption = 'Persona Natural'
          ParentCtl3D = True
          TabOrder = 0
          object Label7: TLabel
            Left = 14
            Top = 83
            Width = 116
            Height = 17
            Caption = 'N'#250'mero de cliente*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label8: TLabel
            Left = 14
            Top = 124
            Width = 99
            Height = 17
            Caption = 'Primer Nombre*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label9: TLabel
            Left = 14
            Top = 206
            Width = 105
            Height = 17
            Caption = 'Apellido Paterno*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label10: TLabel
            Left = 14
            Top = 289
            Width = 130
            Height = 17
            Caption = 'Apellido de Casada/o:'
          end
          object Label11: TLabel
            Left = 14
            Top = 330
            Width = 51
            Height = 17
            Caption = 'G'#233'nero*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label12: TLabel
            Left = 14
            Top = 371
            Width = 84
            Height = 17
            Caption = 'Identificaci'#243'n*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label14: TLabel
            Left = 628
            Top = 42
            Width = 70
            Height = 17
            Caption = 'Estado Civil:'
          end
          object Label16: TLabel
            Left = 628
            Top = 83
            Width = 80
            Height = 17
            Caption = 'Nacionalidad:'
          end
          object Label18: TLabel
            Left = 14
            Top = 412
            Width = 127
            Height = 17
            Caption = 'Fecha de nacimiento*:'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label19: TLabel
            Left = 14
            Top = 453
            Width = 120
            Height = 17
            Caption = 'Pa'#237's de Nacimiento*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label23: TLabel
            Left = 628
            Top = 124
            Width = 160
            Height = 17
            Caption = 'N'#250'mero de Tel'#233'fono Movil:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label24: TLabel
            Left = 628
            Top = 165
            Width = 117
            Height = 17
            Caption = 'Correo electr'#243'nico*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label25: TLabel
            Left = 628
            Top = 206
            Width = 98
            Height = 17
            Caption = 'Apartado postal:'
          end
          object Label32: TLabel
            Left = 14
            Top = 165
            Width = 108
            Height = 17
            Caption = 'Segundo Nombre:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label13: TLabel
            Left = 14
            Top = 247
            Width = 110
            Height = 17
            Caption = 'Apellido Materno*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label5: TLabel
            Left = 14
            Top = 42
            Width = 105
            Height = 17
            Caption = 'Tipo de persona*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label30: TLabel
            Left = 14
            Top = 532
            Width = 235
            Height = 17
            Caption = 'Procedencia del efectivo o cuasiefectivo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label31: TLabel
            Left = 14
            Top = 574
            Width = 114
            Height = 17
            Caption = 'Nombre Comercial:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label35: TLabel
            Left = 628
            Top = 247
            Width = 106
            Height = 17
            Caption = 'Tipo de Relaci'#243'n*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object oid_cliente_n: TDBEdit
            Left = 254
            Top = 75
            Width = 310
            Height = 25
            CharCase = ecUpperCase
            DataField = 'id_cliente'
            DataSource = odClientes_v2
            MaxLength = 5
            ReadOnly = True
            TabOrder = 1
            OnExit = oid_cliente_nExit
          end
          object onombre_primero: TDBEdit
            Left = 254
            Top = 121
            Width = 310
            Height = 25
            CharCase = ecUpperCase
            DataField = 'nombre_primero'
            DataSource = odClientes_v2
            TabOrder = 2
          end
          object oapellido_paterno: TDBEdit
            Left = 254
            Top = 204
            Width = 310
            Height = 25
            CharCase = ecUpperCase
            DataField = 'apellido_paterno'
            DataSource = odClientes_v2
            TabOrder = 4
          end
          object oapellido_casada: TDBEdit
            Left = 254
            Top = 286
            Width = 310
            Height = 25
            CharCase = ecUpperCase
            DataField = 'apellido_casada'
            DataSource = odClientes_v2
            TabOrder = 6
          end
          object ogenero: TDBComboBoxEh
            Left = 254
            Top = 327
            Width = 310
            Height = 25
            DataField = 'genero'
            DataSource = odClientes_v2
            DynProps = <>
            EditButtons = <>
            Items.Strings = (
              'Masculino'
              'Femenino'
              'Otro'
              'S/N (Sin asignaci'#243'n)')
            KeyItems.Strings = (
              'M'
              'F'
              'O'
              'N')
            ShowHint = True
            TabOrder = 7
            Visible = True
          end
          object onip: TcxDBMaskEdit
            Left = 254
            Top = 368
            Hint = 
              'PATRONES ACEPTADOS'#13#10'--------------------------------------------' +
              '---------------------------'#13#10'Regular: 1-1234-12345'#13#10'Paname'#241'o nac' +
              'ido en el extranjero: PE-1234-12345'#13#10'Extranjero con c'#233'dula: E-12' +
              '34-123456'#13#10'Naturalizado: N-1234-1234'#13#10'Paname'#241'os nacidos antes de' +
              ' la vigencia: 1AV-1234-12345'#13#10'Poblaci'#243'n indigena: 1PI-1234-12345' +
              #13#10'N'#250'mero de pasaporte: '#13#10'---------------------------------------' +
              '--------------------------------'
            DataBinding.DataField = 'nip'
            DataBinding.DataSource = odClientes_v2
            Properties.AlwaysShowBlanksAndLiterals = True
            Properties.CharCase = ecUpperCase
            Properties.IgnoreMaskBlank = True
            Properties.ValidateOnEnter = False
            Properties.ValidationOptions = []
            TabOrder = 8
            OnExit = onipExit
            Width = 310
          end
          object oestado_civil: TDBComboBoxEh
            Left = 886
            Top = 34
            Width = 251
            Height = 25
            CharCase = ecUpperCase
            DataField = 'estado_civil'
            DataSource = odClientes_v2
            DynProps = <>
            EditButtons = <>
            Items.Strings = (
              'Soltero'
              'Casado'
              'Viudo'
              'Uni'#243'n Libre'
              'S/N (Sin asignaci'#243'n)')
            KeyItems.Strings = (
              '1'
              '2'
              '3'
              '4'
              '0')
            ShowHint = True
            TabOrder = 14
            Visible = True
          end
          object onacionalidad: TDBEdit
            Left = 886
            Top = 75
            Width = 251
            Height = 25
            CharCase = ecUpperCase
            DataField = 'nacionalidad'
            DataSource = odClientes_v2
            TabOrder = 15
          end
          object ofecha_nacimiento: TDBDateTimeEditEh
            Left = 254
            Top = 409
            Width = 161
            Height = 25
            DataField = 'fecha_nacimiento'
            DataSource = odClientes_v2
            DynProps = <>
            EditButtons = <>
            Kind = dtkDateEh
            ShowHint = True
            TabOrder = 9
            Visible = True
          end
          object opais_nacimiento: TDBLookupComboboxEh
            Left = 254
            Top = 450
            Width = 310
            Height = 25
            DynProps = <>
            DataField = 'pais_nacimiento'
            DataSource = odClientes_v2
            EditButtons = <>
            KeyField = 'pais_id_pais'
            ListField = 'pais_descripcion'
            ListSource = dmGen_Data_Mod.odPais
            ShowHint = True
            TabOrder = 10
            Visible = True
          end
          object otelefono_movil: TDBEdit
            Left = 886
            Top = 121
            Width = 250
            Height = 25
            CharCase = ecUpperCase
            DataField = 'telefono_movil'
            DataSource = odClientes_v2
            TabOrder = 16
          end
          object ocorreo_electronico: TDBEdit
            Left = 781
            Top = 162
            Width = 355
            Height = 25
            CharCase = ecLowerCase
            DataField = 'correo_electronico'
            DataSource = odClientes_v2
            TabOrder = 17
          end
          object oapartado_postal: TDBEdit
            Left = 779
            Top = 204
            Width = 357
            Height = 25
            CharCase = ecUpperCase
            DataField = 'apartado_postal'
            DataSource = odClientes_v2
            TabOrder = 18
          end
          object oapellido_materno: TDBEdit
            Left = 254
            Top = 244
            Width = 310
            Height = 25
            CharCase = ecUpperCase
            DataField = 'apellido_materno'
            DataSource = odClientes_v2
            TabOrder = 5
          end
          object AdvSmoothTabPager2: TAdvSmoothTabPager
            Left = 597
            Top = 283
            Width = 546
            Height = 327
            Fill.Color = 16773091
            Fill.ColorTo = 16768452
            Fill.ColorMirror = 16765357
            Fill.ColorMirrorTo = 16767936
            Fill.GradientType = gtVertical
            Fill.GradientMirrorType = gtVertical
            Fill.BorderColor = 16765357
            Fill.Rounding = 0
            Fill.ShadowOffset = 0
            Fill.Glow = gmNone
            Transparent = False
            ActivePage = oTab_Cte_Pep
            TabSettings.StartMargin = 4
            TabReorder = False
            TabOrder = 20
            object oTab_Cte_Res: TAdvSmoothTabPage
              Left = 1
              Top = 26
              Width = 544
              Height = 299
              Caption = 'Datos residencia'
              PageAppearance.Color = 15984090
              PageAppearance.ColorTo = 15785680
              PageAppearance.ColorMirror = 15587784
              PageAppearance.ColorMirrorTo = 16774371
              PageAppearance.GradientType = gtVertical
              PageAppearance.GradientMirrorType = gtVertical
              PageAppearance.BorderColor = 16765357
              PageAppearance.Rounding = 0
              PageAppearance.ShadowOffset = 0
              PageAppearance.Glow = gmNone
              TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
              TabAppearance.Appearance.Font.Color = clBlack
              TabAppearance.Appearance.Font.Height = -11
              TabAppearance.Appearance.Font.Name = 'Tahoma'
              TabAppearance.Appearance.Font.Style = []
              TabAppearance.Status.Caption = '0'
              TabAppearance.Status.Appearance.Fill.Color = clRed
              TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
              TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
              TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
              TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
              TabAppearance.Status.Appearance.Fill.BorderColor = clGray
              TabAppearance.Status.Appearance.Fill.Rounding = 0
              TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
              TabAppearance.Status.Appearance.Fill.Glow = gmNone
              TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
              TabAppearance.Status.Appearance.Font.Color = clWhite
              TabAppearance.Status.Appearance.Font.Height = -11
              TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
              TabAppearance.Status.Appearance.Font.Style = []
              TabAppearance.BevelColor = 16765357
              TabAppearance.BevelColorDown = 16640730
              TabAppearance.BevelColorSelected = 16640730
              TabAppearance.BevelColorHot = 16640730
              TabAppearance.BevelColorDisabled = 16640730
              TabAppearance.Color = 16773091
              TabAppearance.ColorDown = 11196927
              TabAppearance.ColorDisabled = 16765357
              TMSStyle = 4
              object Label20: TLabel
                Left = 29
                Top = 37
                Width = 116
                Height = 17
                Caption = 'Pa'#237's de Residencia*:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -13
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label21: TLabel
                Left = 87
                Top = 136
                Width = 58
                Height = 17
                Caption = 'Tel'#233'fono*:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label2: TLabel
                Left = 83
                Top = 177
                Width = 62
                Height = 17
                Caption = 'Direcci'#243'n*:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label33: TLabel
                Left = 85
                Top = 70
                Width = 60
                Height = 17
                Caption = 'Provincia*:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -13
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label34: TLabel
                Left = 95
                Top = 103
                Width = 50
                Height = 17
                Caption = 'Distrito*:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -13
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object opais_recidencia: TDBLookupComboboxEh
                Left = 177
                Top = 34
                Width = 310
                Height = 25
                DynProps = <>
                DataField = 'pais_recidencia'
                DataSource = odClientes_v2
                EditButtons = <>
                KeyField = 'pais_id_pais'
                ListField = 'pais_descripcion'
                ListSource = dmGen_Data_Mod.odPais
                ShowHint = True
                TabOrder = 0
                Visible = True
              end
              object otelefono: TDBEdit
                Left = 177
                Top = 133
                Width = 250
                Height = 25
                CharCase = ecUpperCase
                DataField = 'telefono'
                DataSource = odClientes_v2
                TabOrder = 3
              end
              object odireccion: TDBMemo
                Left = 177
                Top = 174
                Width = 250
                Height = 66
                DataField = 'direccion'
                DataSource = odClientes_v2
                TabOrder = 4
              end
              object oprov_residencia: TDBLookupComboboxEh
                Left = 178
                Top = 67
                Width = 310
                Height = 25
                DynProps = <>
                DataField = 'prov_residencia'
                DataSource = odClientes_v2
                EditButtons = <>
                KeyField = 'prov_id'
                ListField = 'prov_descripcion'
                ListSource = dmGen_Data_Mod.odProv
                ShowHint = True
                TabOrder = 1
                CaseInsensitiveTextSearch = False
                Visible = True
              end
              object odist_residencia: TDBLookupComboboxEh
                Left = 178
                Top = 100
                Width = 310
                Height = 25
                DynProps = <>
                DataField = 'dist_residencia'
                DataSource = odClientes_v2
                EditButtons = <>
                KeyField = 'dist_id'
                ListField = 'dist_descripcion'
                ListSource = dmGen_Data_Mod.odDist
                ShowHint = True
                TabOrder = 2
                CaseInsensitiveTextSearch = False
                Visible = True
              end
            end
            object oTab_Cte_Lab: TAdvSmoothTabPage
              Left = 1
              Top = 26
              Width = 544
              Height = 299
              Caption = 'Datos laborales'
              PageAppearance.Color = 15984090
              PageAppearance.ColorTo = 15785680
              PageAppearance.ColorMirror = 15587784
              PageAppearance.ColorMirrorTo = 16774371
              PageAppearance.GradientType = gtVertical
              PageAppearance.GradientMirrorType = gtVertical
              PageAppearance.BorderColor = 16765357
              PageAppearance.Rounding = 0
              PageAppearance.ShadowOffset = 0
              PageAppearance.Glow = gmNone
              TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
              TabAppearance.Appearance.Font.Color = clBlack
              TabAppearance.Appearance.Font.Height = -11
              TabAppearance.Appearance.Font.Name = 'Tahoma'
              TabAppearance.Appearance.Font.Style = []
              TabAppearance.Status.Caption = '0'
              TabAppearance.Status.Appearance.Fill.Color = clRed
              TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
              TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
              TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
              TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
              TabAppearance.Status.Appearance.Fill.BorderColor = clGray
              TabAppearance.Status.Appearance.Fill.Rounding = 0
              TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
              TabAppearance.Status.Appearance.Fill.Glow = gmNone
              TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
              TabAppearance.Status.Appearance.Font.Color = clWhite
              TabAppearance.Status.Appearance.Font.Height = -11
              TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
              TabAppearance.Status.Appearance.Font.Style = []
              TabAppearance.BevelColor = 16765357
              TabAppearance.BevelColorDown = 16640730
              TabAppearance.BevelColorSelected = 16640730
              TabAppearance.BevelColorHot = 16640730
              TabAppearance.BevelColorDisabled = 16640730
              TabAppearance.Color = 16773091
              TabAppearance.ColorDown = 11196927
              TabAppearance.ColorDisabled = 16765357
              TMSStyle = 4
              object Label17: TLabel
                Left = 35
                Top = 26
                Width = 126
                Height = 17
                Caption = 'Nombre de Empresa:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label3: TLabel
                Left = 103
                Top = 68
                Width = 58
                Height = 17
                Caption = 'Tel'#233'fono*:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label4: TLabel
                Left = 99
                Top = 111
                Width = 62
                Height = 17
                Caption = 'Direcci'#243'n*:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label15: TLabel
                Left = 36
                Top = 193
                Width = 125
                Height = 17
                Caption = 'Ocupasi'#243'n/Profesi'#243'n:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object otelefono_trabajo: TDBEdit
                Left = 166
                Top = 65
                Width = 250
                Height = 25
                CharCase = ecUpperCase
                DataField = 'telefono_trabajo'
                DataSource = odClientes_v2
                TabOrder = 1
              end
              object odireccion_trabajo: TDBMemo
                Left = 166
                Top = 108
                Width = 250
                Height = 66
                DataField = 'direccion_trabajo'
                DataSource = odClientes_v2
                TabOrder = 2
              end
              object oocupacion: TDBEdit
                Left = 166
                Top = 190
                Width = 250
                Height = 25
                CharCase = ecUpperCase
                DataField = 'ocupacion'
                DataSource = odClientes_v2
                TabOrder = 3
              end
              object onombre_empresa: TDBEdit
                Left = 166
                Top = 23
                Width = 250
                Height = 25
                CharCase = ecUpperCase
                DataField = 'nombre_empresa'
                DataSource = odClientes_v2
                TabOrder = 0
              end
            end
            object oTab_Cte_Pep: TAdvSmoothTabPage
              Left = 1
              Top = 26
              Width = 544
              Height = 299
              Caption = 'Info. P.E.P.'
              PageAppearance.Color = 15984090
              PageAppearance.ColorTo = 15785680
              PageAppearance.ColorMirror = 15587784
              PageAppearance.ColorMirrorTo = 16774371
              PageAppearance.GradientType = gtVertical
              PageAppearance.GradientMirrorType = gtVertical
              PageAppearance.BorderColor = 16765357
              PageAppearance.Rounding = 0
              PageAppearance.ShadowOffset = 0
              PageAppearance.Glow = gmNone
              TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
              TabAppearance.Appearance.Font.Color = clBlack
              TabAppearance.Appearance.Font.Height = -11
              TabAppearance.Appearance.Font.Name = 'Tahoma'
              TabAppearance.Appearance.Font.Style = []
              TabAppearance.Status.Caption = '0'
              TabAppearance.Status.Appearance.Fill.Color = clRed
              TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
              TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
              TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
              TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
              TabAppearance.Status.Appearance.Fill.BorderColor = clGray
              TabAppearance.Status.Appearance.Fill.Rounding = 0
              TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
              TabAppearance.Status.Appearance.Fill.Glow = gmNone
              TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
              TabAppearance.Status.Appearance.Font.Color = clWhite
              TabAppearance.Status.Appearance.Font.Height = -11
              TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
              TabAppearance.Status.Appearance.Font.Style = []
              TabAppearance.BevelColor = 16765357
              TabAppearance.BevelColorDown = 16640730
              TabAppearance.BevelColorSelected = 16640730
              TabAppearance.BevelColorHot = 16640730
              TabAppearance.BevelColorDisabled = 16640730
              TabAppearance.Color = 16773091
              TabAppearance.ColorDown = 11196927
              TabAppearance.ColorDisabled = 16765357
              TMSStyle = 4
              object Label1: TLabel
                Left = 25
                Top = 48
                Width = 224
                Height = 17
                Caption = 'Si lo ES actualmente (Indique el cargo)'
              end
              object Label22: TLabel
                Left = 281
                Top = 49
                Width = 106
                Height = 17
                Caption = 'Fecha Finalizaci'#243'n:'
              end
              object Label27: TLabel
                Left = 22
                Top = 102
                Width = 158
                Height = 17
                Caption = 'Si lo FUE (Indique el cargo)'
              end
              object Label29: TLabel
                Left = 281
                Top = 103
                Width = 106
                Height = 17
                Caption = 'Fecha Finalizaci'#243'n:'
              end
              object Label28: TLabel
                Left = 25
                Top = 203
                Width = 188
                Height = 17
                Caption = 'Si su respuesta es s'#237', seleccione:'
              end
              object Label26: TLabel
                Left = 25
                Top = 232
                Width = 217
                Height = 17
                Caption = 'Nombre del PEP relacionado y cargo'
              end
              object ock_pep_sujeto: TDBCheckBox
                Left = 25
                Top = 18
                Width = 472
                Height = 25
                Caption = #191'Es o ha sido una persona pol'#237'ticamente expuesta?'
                Color = 15984090
                DataField = 'pep_sujeto'
                DataSource = odClientes_v2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                TabOrder = 0
                ValueChecked = '1'
                ValueUnchecked = '0'
                OnClick = ock_pep_sujetoClick
              end
              object opep_cargo_act: TDBEdit
                Left = 25
                Top = 68
                Width = 197
                Height = 25
                CharCase = ecUpperCase
                DataField = 'pep_cargo_act'
                DataSource = odClientes_v2
                TabOrder = 1
              end
              object opep_cargo_act_ffin: TDBDateTimeEditEh
                Left = 284
                Top = 68
                Width = 118
                Height = 25
                DataField = 'pep_cargo_act_ffin'
                DataSource = odClientes_v2
                DynProps = <>
                EditButtons = <>
                Kind = dtkDateEh
                ShowHint = True
                TabOrder = 2
                Visible = True
              end
              object opep_cargo_ant: TDBEdit
                Left = 25
                Top = 122
                Width = 197
                Height = 25
                CharCase = ecUpperCase
                DataField = 'pep_cargo_ant'
                DataSource = odClientes_v2
                TabOrder = 3
              end
              object opep_cargo_ant_ffin: TDBDateTimeEditEh
                Left = 284
                Top = 122
                Width = 118
                Height = 25
                DataField = 'pep_cargo_ant_ffin'
                DataSource = odClientes_v2
                DynProps = <>
                EditButtons = <>
                Kind = dtkDateEh
                ShowHint = True
                TabOrder = 4
                Visible = True
              end
              object ock_pep_relacion: TDBCheckBox
                Left = 25
                Top = 168
                Width = 472
                Height = 25
                Caption = #191'Tiene o tuvo relaci'#243'n con una Persona Pol'#237'ticamente Expuesta?'
                Color = 15984090
                DataField = 'pep_relacion'
                DataSource = odClientes_v2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                TabOrder = 5
                ValueChecked = '1'
                ValueUnchecked = '0'
                OnClick = ock_pep_relacionClick
              end
              object opep_relacion_tipo: TDBComboBoxEh
                Left = 237
                Top = 201
                Width = 251
                Height = 25
                DataField = 'pep_relacion_tipo'
                DataSource = odClientes_v2
                DynProps = <>
                EditButtons = <>
                Items.Strings = (
                  'C'#243'nyugue'
                  'Padre'
                  'Madre'
                  'Hermano/a'
                  'Hijo/a'
                  'Estrecho Colaborador'
                  'S/N (Sin asignaci'#243'n)')
                KeyItems.Strings = (
                  'C'#243'nyugue'
                  'Padre'
                  'Madre'
                  'Hermano/a'
                  'Hijo/a'
                  'Estrecho Colaborador'
                  ' ')
                ShowHint = True
                TabOrder = 6
                Visible = True
              end
              object opep_relacion_cargo: TDBEdit
                Left = 25
                Top = 255
                Width = 472
                Height = 25
                CharCase = ecUpperCase
                DataField = 'pep_relacion_cargo'
                DataSource = odClientes_v2
                TabOrder = 7
              end
            end
          end
          object onombre_segundo: TDBEdit
            Left = 254
            Top = 162
            Width = 310
            Height = 25
            CharCase = ecUpperCase
            DataField = 'nombre_segundo'
            DataSource = odClientes_v2
            TabOrder = 3
          end
          object odoble_nacionalidad: TDBCheckBox
            Left = 254
            Top = 495
            Width = 222
            Height = 17
            Caption = 'Posee doble nacionalidad?'
            DataField = 'doble_nacionalidad'
            DataSource = odClientes_v2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object oLst_tipo_persona_n: TDBComboBoxEh
            Tag = 2
            Left = 254
            Top = 34
            Width = 310
            Height = 25
            DataField = 'tipo_persona'
            DataSource = odClientes_v2
            DynProps = <>
            EditButtons = <>
            Items.Strings = (
              'Persona Natural'
              'Persona Juridica')
            KeyItems.Strings = (
              '1'
              '2')
            ShowHint = True
            TabOrder = 0
            Visible = True
          end
          object oProcedencia_efectigo: TDBEdit
            Left = 254
            Top = 529
            Width = 310
            Height = 25
            CharCase = ecUpperCase
            DataField = 'procedencia_efectigo'
            DataSource = odClientes_v2
            TabOrder = 12
          end
          object onombre_comercial_pn: TDBEdit
            Left = 254
            Top = 571
            Width = 310
            Height = 25
            CharCase = ecUpperCase
            DataField = 'nombre_comercial'
            DataSource = odClientes_v2
            TabOrder = 13
          end
          object oLst_id_clasificasionN: TDBLookupComboboxEh
            Left = 779
            Top = 244
            Width = 357
            Height = 25
            DynProps = <>
            DataField = 'id_clasificasion'
            DataSource = odClientes_v2
            EditButtons = <>
            KeyField = 'id_clase'
            ListField = 'nombre'
            ListSource = dmGen_Data_Mod.odClase
            ShowHint = True
            TabOrder = 19
            Visible = True
          end
        end
      end
      object oTab_Gen_Jur: TAdvSmoothTabPage
        Left = 1
        Top = 35
        Width = 1286
        Height = 651
        Caption = 'Datos [Persona Jur'#237'dica]'
        PageAppearance.Color = 15984090
        PageAppearance.ColorTo = 15785680
        PageAppearance.ColorMirror = 15587784
        PageAppearance.ColorMirrorTo = 16774371
        PageAppearance.GradientType = gtVertical
        PageAppearance.GradientMirrorType = gtVertical
        PageAppearance.BorderColor = 16765357
        PageAppearance.Rounding = 0
        PageAppearance.ShadowOffset = 0
        PageAppearance.Glow = gmNone
        TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Appearance.Font.Color = clBlack
        TabAppearance.Appearance.Font.Height = -13
        TabAppearance.Appearance.Font.Name = 'Segoe UI'
        TabAppearance.Appearance.Font.Style = []
        TabAppearance.Status.Caption = '0'
        TabAppearance.Status.Appearance.Fill.Color = clRed
        TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
        TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
        TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
        TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
        TabAppearance.Status.Appearance.Fill.BorderColor = clGray
        TabAppearance.Status.Appearance.Fill.Rounding = 0
        TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
        TabAppearance.Status.Appearance.Fill.Glow = gmNone
        TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Status.Appearance.Font.Color = clWhite
        TabAppearance.Status.Appearance.Font.Height = -11
        TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
        TabAppearance.Status.Appearance.Font.Style = []
        TabAppearance.BevelColor = 16765357
        TabAppearance.BevelColorDown = 16640730
        TabAppearance.BevelColorSelected = 16640730
        TabAppearance.BevelColorHot = 16640730
        TabAppearance.BevelColorDisabled = 16640730
        TabAppearance.Color = 16773091
        TabAppearance.ColorDown = 11196927
        TabAppearance.ColorDisabled = 16765357
        TMSStyle = 4
        object oGrp_Info_Jur: TAdvGroupBox
          Left = 58
          Top = 18
          Width = 1170
          Height = 614
          Align = alCustom
          Caption = 'Persona Jur'#237'dica'
          ParentCtl3D = True
          TabOrder = 0
          object Label67: TLabel
            Left = 23
            Top = 129
            Width = 153
            Height = 17
            Caption = 'Nombre Legal Completo*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label68: TLabel
            Left = 23
            Top = 172
            Width = 180
            Height = 17
            Caption = 'Nombre Comercial Completo*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label69: TLabel
            Left = 23
            Top = 215
            Width = 89
            Height = 17
            Caption = 'Tipo Empresa*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label77: TLabel
            Left = 23
            Top = 260
            Width = 42
            Height = 17
            Caption = 'R.U.C.*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object Label78: TLabel
            Left = 23
            Top = 304
            Width = 172
            Height = 17
            Caption = 'N'#250'mero de aviso operaci'#243'n*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label79: TLabel
            Left = 23
            Top = 344
            Width = 127
            Height = 17
            Caption = 'Datos de inscripci'#243'n*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label80: TLabel
            Left = 23
            Top = 387
            Width = 123
            Height = 17
            Caption = 'Pa'#237's de constituci'#243'n*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label81: TLabel
            Left = 23
            Top = 430
            Width = 133
            Height = 17
            Caption = 'Fecha de constituci'#243'n*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label82: TLabel
            Left = 23
            Top = 473
            Width = 185
            Height = 17
            Caption = 'Direcci'#243'n F'#237'sica de la Empresa*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label83: TLabel
            Left = 581
            Top = 43
            Width = 183
            Height = 17
            Caption = 'Empresa Actividad Econ'#243'mica*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label84: TLabel
            Left = 581
            Top = 86
            Width = 82
            Height = 17
            Caption = 'Empresa Fax*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label85: TLabel
            Left = 581
            Top = 129
            Width = 58
            Height = 17
            Caption = 'Tel'#233'fono*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label86: TLabel
            Left = 581
            Top = 172
            Width = 112
            Height = 17
            Caption = 'Correo Electr'#243'nico:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label87: TLabel
            Left = 581
            Top = 215
            Width = 97
            Height = 17
            Caption = 'Apartado Postal:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label98: TLabel
            Left = 23
            Top = 43
            Width = 105
            Height = 17
            Caption = 'Tipo de persona*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label99: TLabel
            Left = 23
            Top = 86
            Width = 97
            Height = 17
            Caption = 'N'#250'mero cliente*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label36: TLabel
            Left = 581
            Top = 260
            Width = 106
            Height = 17
            Caption = 'Tipo de Relaci'#243'n*:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object onombre_legal: TDBEdit
            Left = 215
            Top = 126
            Width = 280
            Height = 25
            CharCase = ecUpperCase
            DataField = 'nombre_legal'
            DataSource = odClientes_v2
            TabOrder = 2
          end
          object onombre_comercial: TDBEdit
            Left = 215
            Top = 169
            Width = 280
            Height = 25
            CharCase = ecUpperCase
            DataField = 'nombre_comercial'
            DataSource = odClientes_v2
            TabOrder = 3
          end
          object otipo_empresa: TDBEdit
            Left = 215
            Top = 213
            Width = 280
            Height = 25
            CharCase = ecUpperCase
            DataField = 'tipo_empresa'
            DataSource = odClientes_v2
            TabOrder = 4
          end
          object onip2: TDBEdit
            Left = 215
            Top = 255
            Width = 280
            Height = 25
            Hint = 'El Registro '#218'nico de Contribuyentes'
            CharCase = ecUpperCase
            DataField = 'nip'
            DataSource = odClientes_v2
            TabOrder = 5
            OnExit = onip2Exit
          end
          object onumero_aviso_operacion: TDBEdit
            Left = 215
            Top = 299
            Width = 280
            Height = 25
            CharCase = ecUpperCase
            DataField = 'numero_aviso_operacion'
            DataSource = odClientes_v2
            TabOrder = 6
          end
          object odatos_inscripcion: TDBEdit
            Left = 215
            Top = 341
            Width = 280
            Height = 25
            CharCase = ecUpperCase
            DataField = 'datos_inscripcion'
            DataSource = odClientes_v2
            TabOrder = 7
          end
          object oid_pais_constitucion: TDBLookupComboboxEh
            Left = 215
            Top = 384
            Width = 280
            Height = 25
            DynProps = <>
            DataField = 'id_pais_constitucion'
            DataSource = odClientes_v2
            EditButtons = <>
            KeyField = 'pais_id_pais'
            ListField = 'pais_descripcion'
            ListSource = dmGen_Data_Mod.odPais
            ShowHint = True
            TabOrder = 8
            Visible = True
          end
          object ofecha_constitucion: TDBDateTimeEditEh
            Left = 361
            Top = 427
            Width = 134
            Height = 25
            DataField = 'fecha_constitucion'
            DataSource = odClientes_v2
            DynProps = <>
            EditButtons = <>
            Kind = dtkDateEh
            ShowHint = True
            TabOrder = 9
            Visible = True
          end
          object oid_actividad_economica_e: TDBLookupComboboxEh
            Left = 806
            Top = 40
            Width = 315
            Height = 25
            DynProps = <>
            DataField = 'id_actividad_economica'
            DataSource = odClientes_v2
            EditButtons = <>
            KeyField = 'activ_id'
            ListField = 'activ_descripcion'
            ListSource = dmGen_Data_Mod.odActvEco
            ShowHint = True
            TabOrder = 11
            Visible = True
          end
          object ofax: TDBEdit
            Left = 806
            Top = 83
            Width = 315
            Height = 25
            CharCase = ecUpperCase
            DataField = 'fax'
            DataSource = odClientes_v2
            TabOrder = 12
          end
          object otelefono2: TDBEdit
            Left = 806
            Top = 125
            Width = 315
            Height = 25
            CharCase = ecUpperCase
            DataField = 'telefono'
            DataSource = odClientes_v2
            TabOrder = 13
          end
          object ocorreo_electronico_e: TDBEdit
            Left = 806
            Top = 169
            Width = 315
            Height = 25
            CharCase = ecLowerCase
            DataField = 'correo_electronico'
            DataSource = odClientes_v2
            TabOrder = 14
          end
          object oapartado_postal2: TDBEdit
            Left = 806
            Top = 212
            Width = 315
            Height = 25
            CharCase = ecUpperCase
            DataField = 'apartado_postal'
            DataSource = odClientes_v2
            TabOrder = 15
          end
          object oLst_tipo_persona_j: TDBComboBoxEh
            Tag = 2
            Left = 215
            Top = 40
            Width = 251
            Height = 25
            DataField = 'tipo_persona'
            DataSource = odClientes_v2
            DynProps = <>
            EditButtons = <>
            Items.Strings = (
              'Persona Natural'
              'Persona Juridica')
            KeyItems.Strings = (
              '1'
              '2')
            ShowHint = True
            TabOrder = 0
            Visible = True
          end
          object oid_cliente_j: TDBEdit
            Left = 215
            Top = 83
            Width = 280
            Height = 25
            CharCase = ecUpperCase
            DataField = 'id_cliente'
            DataSource = odClientes_v2
            TabOrder = 1
            OnExit = oid_cliente_jExit
          end
          object AdvSmoothTabPager3: TAdvSmoothTabPager
            Left = 536
            Top = 310
            Width = 561
            Height = 291
            Fill.Color = 16773091
            Fill.ColorTo = 16768452
            Fill.ColorMirror = 16765357
            Fill.ColorMirrorTo = 16767936
            Fill.GradientType = gtVertical
            Fill.GradientMirrorType = gtVertical
            Fill.BorderColor = 16765357
            Fill.Rounding = 0
            Fill.ShadowOffset = 0
            Fill.Glow = gmNone
            Transparent = False
            ActivePage = oTab_Repre
            TabPosition = tpTopLeft
            TabTextOrientation = toHorizontal
            TabSettings.StartMargin = 4
            TabReorder = False
            TabOrder = 17
            object oTab_Repre: TAdvSmoothTabPage
              Left = 1
              Top = 26
              Width = 559
              Height = 263
              Caption = 'Representante Legal.'
              PageAppearance.Color = 15984090
              PageAppearance.ColorTo = 15785680
              PageAppearance.ColorMirror = 15587784
              PageAppearance.ColorMirrorTo = 16774371
              PageAppearance.GradientType = gtVertical
              PageAppearance.GradientMirrorType = gtVertical
              PageAppearance.BorderColor = 16765357
              PageAppearance.Rounding = 0
              PageAppearance.ShadowOffset = 0
              PageAppearance.Glow = gmNone
              TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
              TabAppearance.Appearance.Font.Color = clBlack
              TabAppearance.Appearance.Font.Height = -13
              TabAppearance.Appearance.Font.Name = 'Segoe UI'
              TabAppearance.Appearance.Font.Style = []
              TabAppearance.Status.Caption = '0'
              TabAppearance.Status.Appearance.Fill.Color = clRed
              TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
              TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
              TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
              TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
              TabAppearance.Status.Appearance.Fill.BorderColor = clGray
              TabAppearance.Status.Appearance.Fill.Rounding = 0
              TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
              TabAppearance.Status.Appearance.Fill.Glow = gmNone
              TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
              TabAppearance.Status.Appearance.Font.Color = clWhite
              TabAppearance.Status.Appearance.Font.Height = -11
              TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
              TabAppearance.Status.Appearance.Font.Style = []
              TabAppearance.BevelColor = 16765357
              TabAppearance.BevelColorDown = 16640730
              TabAppearance.BevelColorSelected = 16640730
              TabAppearance.BevelColorHot = 16640730
              TabAppearance.BevelColorDisabled = 16640730
              TabAppearance.Color = 16773091
              TabAppearance.ColorDown = 11196927
              TabAppearance.ColorDisabled = 16765357
              TMSStyle = 4
              object Label92: TLabel
                Left = 48
                Top = 210
                Width = 162
                Height = 17
                Caption = 'Representante Legal Email*:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label91: TLabel
                Left = 48
                Top = 170
                Width = 181
                Height = 17
                Caption = 'Representante Legal Telefono*:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label90: TLabel
                Left = 48
                Top = 130
                Width = 207
                Height = 17
                Caption = 'Direcci'#243'n del Representante Legal*:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label89: TLabel
                Left = 48
                Top = 90
                Width = 229
                Height = 17
                Caption = 'Identificaci'#243'n del Representante Legal*:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label88: TLabel
                Left = 48
                Top = 50
                Width = 202
                Height = 17
                Caption = 'Nombre del Representante Legal*:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object orepresentante_legal_email: TDBEdit
                Left = 286
                Top = 205
                Width = 250
                Height = 25
                CharCase = ecUpperCase
                DataField = 'representante_legal_email'
                DataSource = odClientes_v2
                TabOrder = 4
              end
              object orepresentante_legal_telefono: TDBEdit
                Left = 286
                Top = 165
                Width = 250
                Height = 25
                CharCase = ecUpperCase
                DataField = 'representante_legal_telefono'
                DataSource = odClientes_v2
                TabOrder = 3
              end
              object orepresentante_legal_direccion: TDBEdit
                Left = 286
                Top = 126
                Width = 250
                Height = 25
                CharCase = ecUpperCase
                DataField = 'representante_legal_direccion'
                DataSource = odClientes_v2
                TabOrder = 2
              end
              object orepresentante_legal_nip: TDBEdit
                Left = 286
                Top = 88
                Width = 250
                Height = 25
                CharCase = ecUpperCase
                DataField = 'representante_legal_nip'
                DataSource = odClientes_v2
                TabOrder = 1
              end
              object orepresentante_legal_nombre: TDBEdit
                Left = 286
                Top = 48
                Width = 250
                Height = 25
                CharCase = ecUpperCase
                DataField = 'representante_legal_nombre'
                DataSource = odClientes_v2
                TabOrder = 0
              end
            end
            object oTab_Benefic: TAdvSmoothTabPage
              Left = 1
              Top = 26
              Width = 559
              Height = 263
              Caption = 'Beneficiario.'
              PageAppearance.Color = 15984090
              PageAppearance.ColorTo = 15785680
              PageAppearance.ColorMirror = 15587784
              PageAppearance.ColorMirrorTo = 16774371
              PageAppearance.GradientType = gtVertical
              PageAppearance.GradientMirrorType = gtVertical
              PageAppearance.BorderColor = 16765357
              PageAppearance.Rounding = 0
              PageAppearance.ShadowOffset = 0
              PageAppearance.Glow = gmNone
              TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
              TabAppearance.Appearance.Font.Color = clBlack
              TabAppearance.Appearance.Font.Height = -13
              TabAppearance.Appearance.Font.Name = 'Segoe UI'
              TabAppearance.Appearance.Font.Style = []
              TabAppearance.Status.Caption = '0'
              TabAppearance.Status.Appearance.Fill.Color = clRed
              TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
              TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
              TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
              TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
              TabAppearance.Status.Appearance.Fill.BorderColor = clGray
              TabAppearance.Status.Appearance.Fill.Rounding = 0
              TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
              TabAppearance.Status.Appearance.Fill.Glow = gmNone
              TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
              TabAppearance.Status.Appearance.Font.Color = clWhite
              TabAppearance.Status.Appearance.Font.Height = -11
              TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
              TabAppearance.Status.Appearance.Font.Style = []
              TabAppearance.BevelColor = 16765357
              TabAppearance.BevelColorDown = 16640730
              TabAppearance.BevelColorSelected = 16640730
              TabAppearance.BevelColorHot = 16640730
              TabAppearance.BevelColorDisabled = 16640730
              TabAppearance.Color = 16773091
              TabAppearance.ColorDown = 11196927
              TabAppearance.ColorDisabled = 16765357
              TMSStyle = 4
              object Label93: TLabel
                Left = 60
                Top = 40
                Width = 180
                Height = 17
                Caption = 'Nombre del Beneficiario Final*:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label96: TLabel
                Left = 60
                Top = 83
                Width = 207
                Height = 17
                Caption = 'Identificaci'#243'n del Beneficiario Final*:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label94: TLabel
                Left = 60
                Top = 169
                Width = 185
                Height = 17
                Caption = 'Direccion del Beneficiario Final*:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label95: TLabel
                Left = 60
                Top = 126
                Width = 181
                Height = 17
                Caption = 'Telefono del Beneficiario Final*:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label97: TLabel
                Left = 60
                Top = 212
                Width = 160
                Height = 17
                Caption = 'Email del Beneficiario final*:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object obeneficiario_final_nombre: TDBEdit
                Left = 285
                Top = 31
                Width = 250
                Height = 25
                CharCase = ecUpperCase
                DataField = 'beneficiario_final_nombre'
                DataSource = odClientes_v2
                TabOrder = 0
              end
              object obeneficiario_final_nip: TDBEdit
                Left = 285
                Top = 75
                Width = 250
                Height = 25
                CharCase = ecUpperCase
                DataField = 'beneficiario_final_nip'
                DataSource = odClientes_v2
                TabOrder = 1
              end
              object obeneficiario_final_direccion: TDBEdit
                Left = 285
                Top = 164
                Width = 250
                Height = 25
                CharCase = ecUpperCase
                DataField = 'beneficiario_final_direccion'
                DataSource = odClientes_v2
                TabOrder = 2
              end
              object obeneficiario_final_telefono: TDBEdit
                Left = 285
                Top = 120
                Width = 250
                Height = 25
                CharCase = ecUpperCase
                DataField = 'beneficiario_final_telefono'
                DataSource = odClientes_v2
                TabOrder = 3
              end
              object obeneficiario_final_email: TDBEdit
                Left = 285
                Top = 209
                Width = 250
                Height = 25
                CharCase = ecUpperCase
                DataField = 'beneficiario_final_email'
                DataSource = odClientes_v2
                TabOrder = 4
              end
            end
          end
          object odireccion2: TDBMemo
            Left = 214
            Top = 470
            Width = 281
            Height = 66
            DataField = 'direccion'
            DataSource = odClientes_v2
            TabOrder = 10
          end
          object oLst_id_clasificasionJ: TDBLookupComboboxEh
            Left = 806
            Top = 255
            Width = 315
            Height = 25
            DynProps = <>
            DataField = 'id_clasificasion'
            DataSource = odClientes_v2
            EditButtons = <>
            KeyField = 'id_clase'
            ListField = 'nombre'
            ListSource = dmGen_Data_Mod.odClase
            ShowHint = True
            TabOrder = 16
            Visible = True
          end
        end
      end
      object oTab_Ref: TAdvSmoothTabPage
        Left = 1
        Top = 35
        Width = 1286
        Height = 651
        Caption = 'Referencias'
        PageAppearance.Color = 15984090
        PageAppearance.ColorTo = 15785680
        PageAppearance.ColorMirror = 15587784
        PageAppearance.ColorMirrorTo = 16774371
        PageAppearance.GradientType = gtVertical
        PageAppearance.GradientMirrorType = gtVertical
        PageAppearance.BorderColor = 16765357
        PageAppearance.Rounding = 0
        PageAppearance.ShadowOffset = 0
        PageAppearance.Glow = gmNone
        TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Appearance.Font.Color = clBlack
        TabAppearance.Appearance.Font.Height = -13
        TabAppearance.Appearance.Font.Name = 'Segoe UI'
        TabAppearance.Appearance.Font.Style = []
        TabAppearance.Status.Caption = '0'
        TabAppearance.Status.Appearance.Fill.Color = clRed
        TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
        TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
        TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
        TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
        TabAppearance.Status.Appearance.Fill.BorderColor = clGray
        TabAppearance.Status.Appearance.Fill.Rounding = 0
        TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
        TabAppearance.Status.Appearance.Fill.Glow = gmNone
        TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Status.Appearance.Font.Color = clWhite
        TabAppearance.Status.Appearance.Font.Height = -11
        TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
        TabAppearance.Status.Appearance.Font.Style = []
        TabAppearance.BevelColor = 16765357
        TabAppearance.BevelColorDown = 16640730
        TabAppearance.BevelColorSelected = 16640730
        TabAppearance.BevelColorHot = 16640730
        TabAppearance.BevelColorDisabled = 16640730
        TabAppearance.Color = 16773091
        TabAppearance.ColorDown = 11196927
        TabAppearance.ColorDisabled = 16765357
        TMSStyle = 4
        object Label70: TLabel
          Left = 18
          Top = 16
          Width = 305
          Height = 21
          Caption = 'REFERENCIAS PERSONALES/COMERCIALES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label71: TLabel
          Left = 22
          Top = 322
          Width = 185
          Height = 21
          Caption = 'REFERENCIAS BANCARIAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object oGrid_Ref: TDBGridEh
          Left = 18
          Top = 43
          Width = 1250
          Height = 217
          AutoFitColWidths = True
          DataSource = dmGen_Data_Mod.oD_Cte_Ref1
          DynProps = <>
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          Columns = <
            item
              Alignment = taCenter
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'tipo'
              Footers = <>
              KeyList.Strings = (
                '1'
                '2')
              MaxWidth = 140
              MinWidth = 140
              PickList.Strings = (
                '<COMERCIAL>'
                '<PERSONAL>')
              Title.Alignment = taCenter
              Title.Caption = 'Tipo Referecia'
              Width = 140
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'nombre'
              Footers = <>
              MaxWidth = 250
              MinWidth = 250
              Title.Alignment = taCenter
              Title.Caption = 'Nombre'
              Width = 250
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'relacion'
              Footers = <>
              MaxWidth = 250
              MinWidth = 250
              Title.Alignment = taCenter
              Title.Caption = 'Relaci'#243'n'
              Width = 250
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'telefono'
              Footers = <>
              MaxWidth = 200
              MinWidth = 200
              Title.Alignment = taCenter
              Title.Caption = 'Tel'#233'fono'
              Width = 200
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'lugar_trabajo'
              Footers = <>
              MaxWidth = 350
              MinWidth = 350
              Title.Alignment = taCenter
              Title.Caption = 'Lugar de Trabajo'
              Width = 350
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object oBtn_Add_RefG: TPngBitBtn
          Left = 861
          Top = 264
          Width = 123
          Height = 69
          Caption = 'Agregar'
          TabOrder = 1
          OnClick = oBtn_Add_RefGClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D49484452000000280000002808060000008CFEB8
            6D00000006624B474400FF00FF00FFA0BDA793000002DE4944415478DA636418
            E48071A01D307C1CE8DE71FCFF403B0619ECACB064C47060A08BD940BB0B0CD6
            EF3935EAC051070E4E07EE28B71868B7818147E78951078E3A70D48123CB81B5
            6B6E30348768C0F98933CF333CFFF0932247C80A7332CC4ED11F212138EA404A
            1D48691AC497DE86640826CFBAC0302FDD90FE0E3C7BFF03C3BEAB6F192E3FF9
            CCF0F5C71FB01837070B839E2C1F83A3963083B1223F5C2D2310D0CD810FDF7C
            67E8DE7A97E1FDB7BF0C5212A20C62C2FC0C1C6CAC60B91F3F7F31BC7EF789E1
            C98BD70C22DC2C0C25DE4A0C72C024419203494D83C869EEF2E34F0C0DEB6E33
            A82A483128C888012DC4DE91FC0F840F9EBC62B8FDE0194343902A839E1C3FED
            43F0C9BBEF0C054BAE31E86B2A338809F111A5E7D5DB8F0C976EDC63F8FCED97
            EACE4AAB3B347560FEE2AB0C5CFCC20C0AD2621872E9C64C607AE6D97F1872F7
            9FBE62B87AFBF1E92D2566663473E0B9071F197A773C64B033D1C13A3C80CF81
            A0E8DE75F4D297AFDF7EFB53350D22A7BDCE2D7719DEFDE562509211C76A263E
            0782C09D472FFF5FBBFB6439CD42306EC605063D2D55065E6E4EB21CF8E9CB37
            864367AF3FA59903FDFB4E33B8591B30B0B030A33888108039F8CFDFBF0C5B0F
            9EFF493307FAF59E6270B735626061661A9C0EA4388ABF7E673874E61AEDA2B8
            6FFB3D86E73F381854E424C872E0ED872FFEDDBCF774216D8B99ED0F186CCD74
            B0D61E788B99FFC062E61809C50CB9005450B3F30A3228CB6286223E07DE7EF4
            8201187A980535351C855C1682AABAFCC5D7180C3495C00D0462C0CB371F192E
            5CBFF7FFDB8F5F6A28551DAD8067D7317B4606E6CD3AAAB2DC8AB2624CF81A0B
            F71EBDFA77F5EEE32F7FFF33F8EC2C333F0C12A7CB18B54BFB6925765686656C
            ACCCDAC09A855B42989F918B8B1D2CF7F5FB4F5003E1DFDDC72FBFFDFEFDE7F2
            AFFFFFA377959ADF87E9A5EB20BA6BFB09373666C684FF8CFF9DFFFD65100289
            31B330BE65FCCFB8F7D7BF7F0B76955BEC46D7030082D4EDA1DA405769000000
            0049454E44AE426082}
        end
        object oBtn_Edit_RefG: TPngBitBtn
          Left = 1003
          Top = 265
          Width = 123
          Height = 69
          Caption = 'Editar'
          TabOrder = 2
          OnClick = oBtn_Edit_RefGClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D49484452000000280000002808060000008CFEB8
            6D00000006624B474400FF00FF00FFA0BDA793000002D04944415478DAEDD85D
            4853611807F0FF36ADFCC872565E541741A5591012D49616099116951F295137
            1215DD17B9054945176A693789964182125D64CDB2FC980ED1152E33B4C26D96
            4E970B97CE8F8D39CFD9CE47678B44344AAB6D87DC73771E38CFF9F13FEF7BCE
            E108C0F312F81BF0FF0093F3DB587F636656835C2A98034CDFBFD3DF2E4F299A
            DA03C000909FC07A99C4DF364FA5146802C00030005C5CC0DC2A3DAE67C64E1F
            9FBADB89A109F2AF10EBA34270EFCCF64592600038AB4E9775E1FEB978FEAE41
            0F8C2BDE26C85B60E78015C58D039870B8E0A25915C9B84EF20658F172108A37
            66A4ECDA84359161D068079D7AE368332FD6A0A6771C45B57D085D1284E85511
            488ADF00D245A3ACE62DE1F7044B94FD68D25A7021350EE2F0A5B859DD8DC888
            706C5C2B46DDEBDE7EBF025F7D1CC38DE77D085B26822C6D1B5684056392A090
            F7F803AC0E8A7231EC01BF01555C6A779A8C38921803D3B00D5D9FCCB8981607
            9BC389DBB53D2441D2850D97A4977DB60667AFB9C217061CDEBD19D1E2704FAF
            5D67826E60180E9266489A3DAE9449AADC7D9F27D8CC2557E24E2E2116AB5786
            4EF7BF586CA856F7707795CDABCB915CF9D1F729B059378A529511A989B1102F
            0F99EE9BC7EC78D2AA9F74D24C3A975CE3CC737C06746F88E24623775B63208E
            981FCE67C0F2D6CFA87F67C1517772B3700AB5CE4E526CC6CF703E0156A84D50
            749891B92F6EC138AF030DC30E9CAFEC4614B71932F66E8150F8FD7223130E54
            B56827B9B7C509A55C5AF3AB195E0596B70C629C6061F86A876D8A4256D25658
            ED041EB5685D84933EF63BDC1CE0BF40CD7CDE659776E26CF266AC8B0AC5AD67
            7A703B0123D62990147D5529935E9BCF3CAFFD024EC953670983821F1665EF10
            8DD80874F48DD1AAF7432CF70D90AF944B72E73BC76BC043059A569A65F78844
            023A4828B0300C1E302C55599B93D0B590395E031ECC6F33711FC5069A455183
            5CF2F44FE77C03F241023CDE99EC430000000049454E44AE426082}
        end
        object oBtn_Del_RefG: TPngBitBtn
          Left = 1146
          Top = 265
          Width = 123
          Height = 69
          Caption = 'Eliminar'
          TabOrder = 3
          OnClick = oBtn_Del_RefGClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D49484452000000280000002808060000008CFEB8
            6D00000006624B474400FF00FF00FFA0BDA793000001684944415478DA636418
            E48071A01D307C1CE8DE71FCFF403B0619ECACB064C47060A08BD940BB0B0CD6
            EF3935EAC051070E4E07EE28B71868B7818147E78951078E3A70D48123CB81B5
            6B6E30348768C0F98933CF333CFFF0932247C80A7332CC4ED11F212138EA404A
            1D48691A444E6F730F3C62D878F605C3AF3FFFE0F26C2C4C0C0126120C49F672
            607EF2AC0B0CF3D20D0726047D7A4E32ACCE3361E06463868B7DFDF9972162F2
            5986CD2588C60A23100C880341D187CD1E7471BA38B070E93586EB4F3E91AD9F
            9585F914D5D320727A03850A256D4C50BB90A62138241C4829A0792621371461
            CD7E9AA641BA39905A21B8F7F86506674B5DB81C3EFE80381064297268E2E38F
            3A70D481A30E24C781D47214AEFA78F7B14B0CAE567A7075F8F8180EA4152077
            508A6E0EF4EA3EF9CEDA505D50588097683D6FDE7F62387EE1D6DBADA5E62234
            77A067F7715FC6FF4C0BFFFEFB2748AC1E6666A6778C7F19E2B656986F05009A
            59A862CE3B38480000000049454E44AE426082}
        end
        object DBGridEh2: TDBGridEh
          Left = 18
          Top = 346
          Width = 1250
          Height = 217
          AutoFitColWidths = True
          DataSource = dmGen_Data_Mod.oD_Cte_RefB
          DynProps = <>
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 4
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'num_cuenta'
              Footers = <>
              MaxWidth = 350
              MinWidth = 350
              Title.Alignment = taCenter
              Title.Caption = 'N'#250'mero de cuenta'
              Width = 350
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'Des_banco'
              Footers = <>
              Title.Caption = 'Nombre del Banco'
              Width = 400
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'tipo_cuenta'
              Footers = <>
              MaxWidth = 350
              MinWidth = 350
              Title.Alignment = taCenter
              Title.Caption = 'Tipo de Cuenta'
              Width = 350
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object oBtn_Add_RefB: TPngBitBtn
          Left = 860
          Top = 573
          Width = 123
          Height = 69
          Caption = 'Agregar'
          TabOrder = 5
          OnClick = oBtn_Add_RefBClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D49484452000000280000002808060000008CFEB8
            6D00000006624B474400FF00FF00FFA0BDA793000002DE4944415478DA636418
            E48071A01D307C1CE8DE71FCFF403B0619ECACB064C47060A08BD940BB0B0CD6
            EF3935EAC051070E4E07EE28B71868B7818147E78951078E3A70D48123CB81B5
            6B6E30348768C0F98933CF333CFFF0932247C80A7332CC4ED11F212138EA404A
            1D48691AC497DE86640826CFBAC0302FDD90FE0E3C7BFF03C3BEAB6F192E3FF9
            CCF0F5C71FB01837070B839E2C1F83A3963083B1223F5C2D2310D0CD810FDF7C
            67E8DE7A97E1FDB7BF0C5212A20C62C2FC0C1C6CAC60B91F3F7F31BC7EF789E1
            C98BD70C22DC2C0C25DE4A0C72C024419203494D83C869EEF2E34F0C0DEB6E33
            A82A483128C888012DC4DE91FC0F840F9EBC62B8FDE0194343902A839E1C3FED
            43F0C9BBEF0C054BAE31E86B2A338809F111A5E7D5DB8F0C976EDC63F8FCED97
            EACE4AAB3B347560FEE2AB0C5CFCC20C0AD2621872E9C64C607AE6D97F1872F7
            9FBE62B87AFBF1E92D2566663473E0B9071F197A773C64B033D1C13A3C80CF81
            A0E8DE75F4D297AFDF7EFB53350D22A7BDCE2D7719DEFDE562509211C76A263E
            0782C09D472FFF5FBBFB6439CD42306EC605063D2D55065E6E4EB21CF8E9CB37
            864367AF3FA59903FDFB4E33B8591B30B0B030A33888108039F8CFDFBF0C5B0F
            9EFF493307FAF59E6270B735626061661A9C0EA4388ABF7E673874E61AEDA2B8
            6FFB3D86E73F381854E424C872E0ED872FFEDDBCF774216D8B99ED0F186CCD74
            B0D61E788B99FFC062E61809C50CB9005450B3F30A3228CB6286223E07DE7EF4
            8201187A980535351C855C1682AABAFCC5D7180C3495C00D0462C0CB371F192E
            5CBFF7FFDB8F5F6A28551DAD8067D7317B4606E6CD3AAAB2DC8AB2624CF81A0B
            F71EBDFA77F5EEE32F7FFF33F8EC2C333F0C12A7CB18B54BFB6925765686656C
            ACCCDAC09A855B42989F918B8B1D2CF7F5FB4F5003E1DFDDC72FBFFDFEFDE7F2
            AFFFFFA377959ADF87E9A5EB20BA6BFB09373666C684FF8CFF9DFFFD65100289
            31B330BE65FCCFB8F7D7BF7F0B76955BEC46D7030082D4EDA1DA405769000000
            0049454E44AE426082}
        end
        object oBtn_Edit_RefB: TPngBitBtn
          Left = 1003
          Top = 573
          Width = 123
          Height = 69
          Caption = 'Editar'
          TabOrder = 6
          OnClick = oBtn_Edit_RefBClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D49484452000000280000002808060000008CFEB8
            6D00000006624B474400FF00FF00FFA0BDA793000002D04944415478DAEDD85D
            4853611807F0FF36ADFCC872565E541741A5591012D49616099116951F295137
            1215DD17B9054945176A693789964182125D64CDB2FC980ED1152E33B4C26D96
            4E970B97CE8F8D39CFD9CE47678B44344AAB6D87DC73771E38CFF9F13FEF7BCE
            E108C0F312F81BF0FF0093F3DB587F636656835C2A98034CDFBFD3DF2E4F299A
            DA03C000909FC07A99C4DF364FA5146802C00030005C5CC0DC2A3DAE67C64E1F
            9FBADB89A109F2AF10EBA34270EFCCF64592600038AB4E9775E1FEB978FEAE41
            0F8C2BDE26C85B60E78015C58D039870B8E0A25915C9B84EF20658F172108A37
            66A4ECDA84359161D068079D7AE368332FD6A0A6771C45B57D085D1284E85511
            488ADF00D245A3ACE62DE1F7044B94FD68D25A7021350EE2F0A5B859DD8DC888
            706C5C2B46DDEBDE7EBF025F7D1CC38DE77D085B26822C6D1B5684056392A090
            F7F803AC0E8A7231EC01BF01555C6A779A8C38921803D3B00D5D9FCCB8981607
            9BC389DBB53D2441D2850D97A4977DB60667AFB9C217061CDEBD19D1E2704FAF
            5D67826E60180E9266489A3DAE9449AADC7D9F27D8CC2557E24E2E2116AB5786
            4EF7BF586CA856F7707795CDABCB915CF9D1F729B059378A529511A989B1102F
            0F99EE9BC7EC78D2AA9F74D24C3A975CE3CC737C06746F88E24623775B63208E
            981FCE67C0F2D6CFA87F67C1517772B3700AB5CE4E526CC6CF703E0156A84D50
            749891B92F6EC138AF030DC30E9CAFEC4614B71932F66E8150F8FD7223130E54
            B56827B9B7C509A55C5AF3AB195E0596B70C629C6061F86A876D8A4256D25658
            ED041EB5685D84933EF63BDC1CE0BF40CD7CDE659776E26CF266AC8B0AC5AD67
            7A703B0123D62990147D5529935E9BCF3CAFFD024EC953670983821F1665EF10
            8DD80874F48DD1AAF7432CF70D90AF944B72E73BC76BC043059A569A65F78844
            023A4828B0300C1E302C55599B93D0B590395E031ECC6F33711FC5069A455183
            5CF2F44FE77C03F241023CDE99EC430000000049454E44AE426082}
        end
        object oBtn_Del_RefB: TPngBitBtn
          Left = 1145
          Top = 573
          Width = 123
          Height = 69
          Caption = 'Eliminar'
          TabOrder = 7
          OnClick = oBtn_Del_RefBClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D49484452000000280000002808060000008CFEB8
            6D00000006624B474400FF00FF00FFA0BDA793000001684944415478DA636418
            E48071A01D307C1CE8DE71FCFF403B0619ECACB064C47060A08BD940BB0B0CD6
            EF3935EAC051070E4E07EE28B71868B7818147E78951078E3A70D48123CB81B5
            6B6E30348768C0F98933CF333CFFF0932247C80A7332CC4ED11F212138EA404A
            1D48691A444E6F730F3C62D878F605C3AF3FFFE0F26C2C4C0C0126120C49F672
            607EF2AC0B0CF3D20D0726047D7A4E32ACCE3361E06463868B7DFDF9972162F2
            5986CD2588C60A23100C880341D187CD1E7471BA38B070E93586EB4F3E91AD9F
            9585F914D5D320727A03850A256D4C50BB90A62138241C4829A0792621371461
            CD7E9AA641BA39905A21B8F7F86506674B5DB81C3EFE80381064297268E2E38F
            3A70D481A30E24C781D47214AEFA78F7B14B0CAE567A7075F8F8180EA4152077
            508A6E0EF4EA3EF9CEDA505D50588097683D6FDE7F62387EE1D6DBADA5E62234
            77A067F7715FC6FF4C0BFFFEFB2748AC1E6666A6778C7F19E2B656986F05009A
            59A862CE3B38480000000049454E44AE426082}
        end
      end
      object oTab_Eva: TAdvSmoothTabPage
        Left = 1
        Top = 35
        Width = 1286
        Height = 651
        Caption = 'Pre-Evaluaci'#243'n'
        PageAppearance.Color = 15984090
        PageAppearance.ColorTo = 15785680
        PageAppearance.ColorMirror = 15587784
        PageAppearance.ColorMirrorTo = 16774371
        PageAppearance.GradientType = gtVertical
        PageAppearance.GradientMirrorType = gtVertical
        PageAppearance.BorderColor = 16765357
        PageAppearance.Rounding = 0
        PageAppearance.ShadowOffset = 0
        PageAppearance.Glow = gmNone
        TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Appearance.Font.Color = clBlack
        TabAppearance.Appearance.Font.Height = -13
        TabAppearance.Appearance.Font.Name = 'Segoe UI'
        TabAppearance.Appearance.Font.Style = []
        TabAppearance.Status.Caption = '0'
        TabAppearance.Status.Appearance.Fill.Color = clRed
        TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
        TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
        TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
        TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
        TabAppearance.Status.Appearance.Fill.BorderColor = clGray
        TabAppearance.Status.Appearance.Fill.Rounding = 0
        TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
        TabAppearance.Status.Appearance.Fill.Glow = gmNone
        TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Status.Appearance.Font.Color = clWhite
        TabAppearance.Status.Appearance.Font.Height = -11
        TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
        TabAppearance.Status.Appearance.Font.Style = []
        TabAppearance.BevelColor = 16765357
        TabAppearance.BevelColorDown = 16640730
        TabAppearance.BevelColorSelected = 16640730
        TabAppearance.BevelColorHot = 16640730
        TabAppearance.BevelColorDisabled = 16640730
        TabAppearance.Color = 16773091
        TabAppearance.ColorDown = 11196927
        TabAppearance.ColorDisabled = 16765357
        TMSStyle = 4
        object Label72: TLabel
          Left = 17
          Top = 5
          Width = 572
          Height = 42
          Caption = 
            'LISTADO DE FACTORES DE RIEZGO DISPONIBLES PARA LA EVALUACION DEL' +
            ' CLUIENTE/SOCIO:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label73: TLabel
          Left = 685
          Top = 5
          Width = 502
          Height = 21
          Caption = 'LISTADO DE FACTORES DE RIEZGO ASIGNADOS AL CLIENTE/SOCIO:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label74: TLabel
          Left = 608
          Top = 280
          Width = 56
          Height = 21
          Caption = 'Agregar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Label75: TLabel
          Left = 608
          Top = 459
          Width = 57
          Height = 21
          Caption = 'Eliminar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Label37: TLabel
          Left = 24
          Top = 604
          Width = 148
          Height = 21
          Caption = 'Check Lists de Tareas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Label38: TLabel
          Left = 312
          Top = 604
          Width = 189
          Height = 21
          Caption = 'Matriz de riesgo del cliente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object oGrid_Rzg_Lst: TDBGridEh
          Left = 17
          Top = 53
          Width = 572
          Height = 519
          AutoFitColWidths = True
          DataSource = dmGen_Data_Mod.odFacR
          DynProps = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3155860
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
          ParentFont = False
          PopupMenu = oPop_Buscadores
          ReadOnly = True
          RowHeight = 30
          RowLines = 1
          TabOrder = 0
          TitleParams.MultiTitle = True
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'descripcion'
              Footers = <>
              MaxWidth = 550
              MinWidth = 550
              Title.Alignment = taLeftJustify
              Title.Caption = 'Descripci'#243'n del Factor'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = 3155860
              Title.Font.Height = -19
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 550
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'codigo'
              Footers = <>
              MaxWidth = 1
              MinWidth = 1
              Width = 1
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object oGrid_Rzg_Cte: TDBGridEh
          Left = 685
          Top = 50
          Width = 584
          Height = 519
          AutoFitColWidths = True
          DataSource = dmGen_Data_Mod.oD_Cte_FR
          DynProps = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          RowHeight = 30
          RowLines = 1
          TabOrder = 1
          TitleParams.MultiTitle = True
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'descripcion'
              Footers = <>
              Title.Alignment = taLeftJustify
              Title.Caption = 'Descripci'#243'n del Factor'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -19
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 550
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'id_cliente_factores_riesgo'
              Footers = <>
              MaxWidth = 1
              MinWidth = 1
              Width = 1
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object oBtn_Rzg_Add: TPngBitBtn
          Left = 597
          Top = 205
          Width = 82
          Height = 69
          TabOrder = 2
          OnClick = oBtn_Rzg_AddClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D4948445200000040000000400806000000AA6971
            DE00000006624B474400FF00FF00FFA0BDA793000007274944415478DAED9B7B
            5054551CC77FE72EAF04144DEB0FC9E7EE6AED2EA8A058E938540ABBEA98FD41
            9A6335E94C524E7F348D53538382E94CA3D59439EAA8CD9859C8345956ECD243
            CD082351631FC83E504405E4A10828B0ECDED3EFAE2CC2F2BA775F7751BF33CC
            DE65EF3DE7FC3EF7FCCEF9FDCE3D97C07D2E12E80A26FCAC1F1D2191CC6708AB
            6401A611A0D380328F02A1714021AEAB154D40491310F61A05626600CC2C4B0C
            76962DAC5A927063D8019017E8A703CBBC4281AAF1AB0AFF182F8B62B1857ACA
            42BE84B05F99D589E6900590545212DE5217B592129A895FE7FABBA15D3A4509
            EC1A35B623F74C727267480050E49922EC23D94CBC576F6369130264782F5180
            4B0CA1DB63C7DAF7F80AC22700D27CC3228277040FA704C3F07E5481CE95694D
            53FD165400F179450F45C5C66C2340DEF0B60C3F0AC756D8D91915B3A1327572
            7BC0014875A5B3804ABEC5D15C2EB2E19E3253CAACB46914E702064056605888
            BC8FE061B4D8D60EA05602ECF31675E21F7E0720D71AB9696D3F1E4AC4B67208
            75120AAB2D1AD561BF0190EAF4CB0825DFE16198D8D6F1948352F2824DA3FCC9
            670052AD310DFD9D2B285C6CAB04CA8E33C492A1668841014CFFE53FB9532229
            EE0E598799D0B81B2C85D9368DAA42300069BE7524908ED32138DA0B1305E32D
            67474AF5D2E4DB8200C8B5867D1871AD11BBFD7E82B0DBAA5165F2063055674A
            6728AB15BBDDFE144BC83315E9CAE34302C0AE1F49A0DD80BFC8C46EB47F454D
            23C7D9677AE60E7D00C8748675D8657689DDDC802000586B53ABF60F08C075F7
            49BB0D0FE3C56E6C80085445B432325386C23E0000C36B98DDED175EB2771A21
            6160CE9868B0B4B643759B5FD2FB218509DCAB16B5F240BF00B0FB9F434A3382
            05E0C0EC49F0E4C331D08993F5BE8B0DB0EB423DB43BD90003803316B52AB90F
            80695A4302565D1A2CE3391917292082B97B0F2EDFB643F6F91A3859DF12D07A
            296194B67485A91700A9D6B015BFBC174C00260410CEF49D894F20809CB21AB8
            D266F7A2545E04365B35CA2C4F007A7267015374009C3857D88B6EB107DDC28E
            2EE2679DB5AA5549DD00A4F967C711127E0D82BCBA331800B72AD12D3699AAA1
            A8B1D59F55B392F0B047CA9F7BBCD1553B86BDCB91F1F7C1349E2F00B7B4B537
            5D6ED16877F8A56E0ACC329B5A71F40E009D319B529A15CA003835773A6187AD
            0E0E563582AF5E81F66EB4691272EEB880CE904B28BC18EA00DC3236B74116BA
            85F1669B0F04C8373810AE72D52ED31ACEE0C72C3ED7493052E28297B870DF57
            C63E498C7795E78D9C94C2A1AAEBF0A9F51ADC7278153B9CC681708E1BC065E0
            19FE7EA48A87E5E343677DA4AEC301DB2DB5F0C3D526611762588C29F2443700
            EEEA517CAE2B982F83C9D19162DBDD47BADA66D85876156ED89DBCCEE7568B30
            221CE306C00DADBCFAF4AF0860520802E074ACAE05D69DBDC4F77407BA4038C1
            E190C874C6CE7B01C0C98656585B52291000DC1B2E5088C6BF6BB8E21A13F8C8
            D305780F821F2AC643C663A3C5B6B75B5CBEB01903A4E3021328EE09B34DAD9A
            E4D53438336E44AF2CCE5BED4B9E08615E4E835C7EC0E5095CBEE0650ADD631A
            CC371E02425FF2D92281F23610FA1BF3826C0C84B83CC15B61AD07D1055EEE4A
            86F4598490EC5007D0807900D7DDB9BCC06751F800E3802DC3221972477D9F63
            1EC0E503FE50AF6468D2917371E151610D10E427BF7C009436B5B9029CB266C1
            7B1F0693C319D631F6C2C2E49BDDB50B19088301A009EFF4D6F21A385ADDE473
            E6D78FFEC50130853B08B92531CED61FD1E86DE65AA8E739A70B158E77399674
            E5C65E00A6EA4C5286B21608E2AA900101447A2C8AE69CAF813F03BB284A25E0
            9852AE9E59D90B00277483BFF0635EB000EC4D9A080BC6C5BAE6746E597C7710
            96C5D1E293D674D582BB5F7B08A7C355D83DBE0E1600EEC148CA986830B7B443
            757BD01E8CACB4A895B9FD0280BC3C8934F689B261BF2760405193B55895009B
            487737EBFB7054AB7F1DFFBD5BECA606C47C0A6B6C1AD5973DFFD777C0DB4419
            D95C43115092227683FDAC53D662E5BC9E77BF7F00A8A905FA248625C510FA5B
            E2F8AA53C2D2A4F2C50906CF1F069CF27046F80C3FDE12BBE5FE1076FD8FB1EB
            BFD3DF6F0302706D7FAF8F3C8181C953621BE0A30AC74735A49E484DED37AA1A
            34E8710547C09E1EAEDBE450D719864D36A7255E1CE88421A33EB9CE34875296
            DB7B1B23B63502D5CAB0906A5EAC2A19ECA4075B65F99628D7963E8B3934B753
            3C566CEB8650334399E5668DE2189F9305253E72AD09F304F6280E8CA1B32ADA
            5BD759069656A4A98AF85E20FC8589FCD278204C2E5EF8B4D8D67AA890389C2B
            2C4B675C15729157A96FD776BA6D78F82678FF4A9CBFC4E22CB523A295D9D073
            FB5B4001B825D71913594A778AD81B7EC7697ABD2FEF13FABEF881B9833CC5B4
            9A52FA7E10B7D79A29812DB67F94873C63FBE003708B4BA563A6AF2084AC8700
            BE3809847E616D2E3F0C19197E591E7EF0EA6C2000F4D47DF9F2F470D2FFE249
            076E471392B90000000049454E44AE426082}
        end
        object oBtn_Rzg_Del: TPngBitBtn
          Left = 597
          Top = 384
          Width = 82
          Height = 69
          TabOrder = 3
          OnClick = oBtn_Rzg_DelClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D4948445200000040000000400806000000AA6971
            DE00000006624B474400FF00FF00FFA0BDA7930000072A4944415478DAED9B7F
            4C535714C7CF7DA5A54C40544004A6286D41DA820A1333350E3785569DBA3F9C
            CE3997E9E670CE64C699B84DFCB1B8FDE1F6C7B219DD3296EC871B926D266EA3
            753FCD343A0474B474A13F98A8D3C4A9C8148C40FBEECE2B82A550786D5FFB4A
            F49B34EFBDF6F5BE7B3EEFDE73CFB9EF3E02F7B848A82F30FE7BD3289944329B
            21AC8605C82240B380326381D004A09070A716AD40492B10F63205626500AC2C
            4BCC9D2C7BFCFCC2DCEBC30E80EA88291B58663505AAC3432D7E98008B62B186
            26CA429584B09F597579D68805905F5B2BBDF9AF7C0525B4140F67085DD13B3A
            4909EC1B99D851515750D0151100D4951659673C5B8AF76A1396363E4486F711
            0538C710FA4E5C62E787C182080A80A2CA3C9FE01DC1DD49E1307C003561E72A
            B5176B7F0A2B80F4CA1331F2B8D83D04C8FA40CB1050E85B616F973C764B73D1
            C4DB2107A030D64F032AF90ABDB94A64C3BD65A59459E1D0ABCF840C80F28879
            1EF23E84BB23C4B6D687DA08B04B6CBABC5F0407A0323470C35A39EE4AC4B672
            0875110AAB6C7AED41C100288CA6C58492AF71374A6CEB78CA492979C2A1D77C
            17340085A1A118FB3B5790546CABFC54278E100B871A21060590FDC39F2A9744
            52DD1BB20E33A171D7590A0F39F4DA26BF0128AAECF1403A6A22D0DBFB270A0D
            EDAE8EC24B8B0A6EF9054065307F8C11D71AB1EB2F1084FD76BDB69437804CA3
            A584A1AC41EC7A0B299690B94D259ADF8604804D3F9AC06D33FEA214BBD2C28A
            5AE2933AA77AE70EFD00288DE617B1C9EC13BBBA214100B0D6A1D396FB04E0BE
            FBE4B60377D3C5AE6C88089C97B5314ACB3275A70F00E6E730BB2BF7BF64FF95
            162303656C349C6A69875B2E366C0C30817BD6A6D37C3A20006CFE6790D29450
            56402E61607D6612ACC948042943E0E4B536585DD31C46005067D3690BFA01C8
            329873F13ED487F2E27392E2A06CF23878F00159EF779D18A9687EB4840D0027
            4A188DA3446DE903406130BF85075B4371C1746CEE6539E3E01104E0AD2E04A0
            0E330024F0A65DAF29F3066022DD13988249864D7CDDA424787E62A2BBE90F24
            5100009CB6EBB4F9BD001455A79308915E06016777668E8985EDEA54C8F068EE
            1104809548A3921B1F9B7CCD6D3086BD4B718CFC568892C7C8A2DCCD5D973292
            D7F92201405FCF2C76E8D487BB01181B76524ACB82295082E3E7D3E347C3CB8A
            648897F29F33110D00A5DB1DFADC5DDD5DC068AE20149E0CB430EDC818D889CD
            5D131FE3F77FC502808EF04B74842BDD009406731D6EA6F95BC68828065E518E
            859578E7B91610885C94C2A6FA7F82B6A7B5CBE50EAAB8F278AA061DE1F41E00
            17C0CFF077495A026C56A5407274E4CC927D73F13A6C355FE4773286C598224F
            E801D08A1B5E5E6B343AB91D39A95092122FB6BDFD74B6BD038A8FD9799DCBCD
            16614438BA07801378CEF67E943F61C0802612D48C00E6F30480726217901274
            8744696CE8E20BA0BC20036627C68A6DAB8000C0BF2E30562E85B73569302B02
            2104D305FC76827393E3601B26365C5A1B29AAB8D00265964BBCCEE59E303B74
            DA8CA086412EBEE7E27C2EDEE7E2FE40E4C4616B6DEDB9A08DE7B2CAD3ADEDC0
            F21E053D87C1AA860340E853815E9C8BF7B9B89F8BFFFD955881101AFE397681
            67EE2443A63242C8CE600BE5E2FF6D980724CAF8C706E24582F006C601BB054F
            86B83C6023E6037CA3C3884886320E9D4990CAA3AE82804F7E73E2E5B033270D
            F21206CF0F4402E074457524FE3DAFE0BFDE5B14A8231C4C9C5F7C3C35015ECB
            1E07093E324491009C420758C8ED84654A2C09F38557B3526031C2F0EE146200
            407FB7CB56A2D9DE0740A6D1A260286B8310AEF9E142686EB224DD2376E84000
            DAF002A012704E6AD44D6DEE038013768363B89915CAAB73B14329C60D6B2776
            4F8B1FBD72135EA80B3E0EE02D02BFDB4BB473EE1E7A0887C395D83CBE08473D
            5263A4A08A958BF16064854DA7A918100054564A1471397F0DFB35013E452DF6
            6A6D2EEC20BDC4FB3F1C3598D6E1D7FBC5AE6A48CCA7B0C6A1D77EE2F95D7F87
            B78332CA19E6134049A1D815165827EDD59A599E777F6000A8CC23A67C8625D5
            10F94BE2F8AA4BC2D2FCC605B966EF1F7C0E793822BC879B8D62D75C0861D37F
            179BFEE6817EF309C0BDFCFD4AF451CC111E16DB8020753C4D7EB5E8685191D3
            2F009CDCC111B035C375991CAA8561D8026B71DE595F270C19F5A98C96E994B2
            DCDADBC89B031B5C6D0C0B45D605DADAC14EBABF54966F892A43FDA39843732B
            C523734EFCAE6E3094596AD5AB7FE573B25F898FCA60C13C813D8C8E7194D856
            FA500BCBC0A2A662ED09BE7FF0FF8589AAFA74204C05FE71A6D8D67AE93871BA
            96DB164DE1F96C2C4000DD10DCCBE9F6E0EE4B10F82B714289C551EA7D591BB3
            C573F95B4801F448656CC86329DD2B626BF81987E90DC1BC4F18FCE407E60EAA
            42CB2A4AE9EB615C5E6BA504763BFED01CF08EEDC30FA0475C2A1D9BBD9C10B2
            0142F8E22410FA81FD46E34158B6CC254481F75F9D0D05004FDD932F4F0F27FD
            0F0C31BF5F108341230000000049454E44AE426082}
        end
        object oBtn_ChekList: TPngBitBtn
          Tag = 1
          Left = 192
          Top = 578
          Width = 82
          Height = 69
          TabOrder = 4
          OnClick = oBtn_ChekListClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
            F400000006624B474400FF00FF00FFA0BDA793000001A94944415478DADD963D
            2845611880DF1B2662315C4448B29014252C4AFEC2A048323019FD24CA649051
            28299BD14806965B4A5D45122993DC2C58FC0DCA0DCFD7776EE9F4DD5374BE73
            F1D6339CF3BD9DEFE97C3FEF1B12911B2890E411857AB11421F8801938368CB7
            413F14DA166885BD2FEFB3600D4E602C08816E28851548836DA88065187709E4
            40994FF33F2704D424F3B003AFD0098DA2D77ECE25D0055B3E0944BE2EC183F3
            E16C68810318310864885E223F22EEDE0325500EBB4E8249C0D748082CC18561
            BC019A6D0B1C42AE47CE39F4D8144869FC0A815928F2C83985559B026A13EEC3
            AD615C9D8AB0A4E02A565103D512D0315402AAEA3D39EF076003166038088129
            D115B10FD245D702F5FC68F8034DB0E8D3FC47098176E8805178135D0927C57C
            13AA42D4EB9340CCBD0754E9AD8521789700AF62D32694A004E2A27B8064710D
            C53605EA4497E064712FFA32B22690D25002AA230E7BE4C49CBF604DE005323D
            722E45F787D604D42950E73A62181F8469F9EFC7F0BB02F9A25B353FE2EE2702
            AA475CF74920FA2797C08AC0265C19C6ABA0D2B6806A3CF23C72CE60C296C027
            89C567E75FEB53F00000000049454E44AE426082}
        end
        object oBtn_MatrizR: TPngBitBtn
          Tag = 1
          Left = 507
          Top = 578
          Width = 82
          Height = 69
          TabOrder = 5
          OnClick = oBtn_MatrizRClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
            8700000006624B474400FF00FF00FFA0BDA7930000022F4944415478DA636418
            E28071A01D30EA818176C0A807903909B5DDFF07DA41C48005CDA570778F7A60
            D403D4F400089CBF7167507BC2504305C5CDA31E18F5C060F08044D84486BFE2
            FC0C3FCC5518BEFA1831FC13E01A5A1E90726B87B3FF73B232BC2FF466F8E1A0
            8955EDC133974832DBDE448F7A1EF8FFFE2BC3EF8DA718FE9CB8CDF0EFE50706
            9EF565181E8098CAC8F0AE2E90E187B5FAE0F1C0EF3D97187EF66C62F8FFE337
            5C8CF74023760F00C13F1E0E86570B3218FEF17192E46042802C0FFC397095E1
            7BE36A6014A04AE1F300087C8EB50162DB81F5C0FF0F5F19BE444F6460F8FA13
            C330421EF8AD22CEF07A5A128A18B149083DE990ED819FF3F631FC5A7410AB61
            843CF09F938DE1F9C6E281F5C0D7E4E90CFFEEBEC0EB017A02923DF0C5B395E1
            FFF75FC3D303B80023171B03CFB66AAC72742F46F125215C80595592816B76C6
            E0F000BE4C8C0BB0273830B0253892A4875840D562141B60045660DCCB0A1818
            A95C8191ED0110C0559161BA9E9181A3298C81D5560BA712BA17A33080AD2981
            6210B0CC672FF5676075D2C1EBB001F300082037E6FEDE7F05166356146360B1
            546360F537656014E026CA719480D10ECD4083510F0C34C0EB81213FB035E43D
            406D60EEEE0F0E90933B37D2CC9E510F0C5B0F24D674F9FCFAF57333A8F9C4C6
            CEEEBDA0A56CDB90F200B0407804A464A1DC87C08CA730D43CF004484943B98F
            811E901B521E0025A1FF8C8C3381CCFFC06678DA904B42F402A31E186830EA81
            810643DE0300A13D47407BD8525E0000000049454E44AE426082}
        end
      end
    end
    object oTitulo: TLabel
      Left = 1
      Top = 1
      Width = 1288
      Height = 41
      Align = alClient
      Alignment = taCenter
      AutoSize = False
      Caption = 'Maestro de Clientes.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExplicitLeft = 87
      ExplicitTop = -2
      ExplicitWidth = 491
    end
    object AdvGroupBox1: TAdvGroupBox
      Left = 1
      Top = 730
      Width = 1288
      Height = 80
      Align = alClient
      ParentCtl3D = True
      TabOrder = 1
      DesignSize = (
        1288
        80)
      object olFnd_Cte: TLabel
        Left = 692
        Top = 13
        Width = 160
        Height = 17
        Caption = 'B'#250'squeda R'#225'pida (C'#243'digo):'
      end
      object oFnd_Cte: TEdit
        Tag = 1
        Left = 858
        Top = 10
        Width = 137
        Height = 25
        Color = 12582911
        TabOrder = 0
        Text = 'oFnd_Cte'
        OnKeyPress = oFnd_CteKeyPress
      end
      object oBtnNew: TAdvSmoothButton
        Left = 8
        Top = 3
        Width = 135
        Height = 70
        Anchors = []
        Appearance.Font.Charset = DEFAULT_CHARSET
        Appearance.Font.Color = clBlack
        Appearance.Font.Height = -13
        Appearance.Font.Name = 'Segoe UI'
        Appearance.Font.Style = []
        Status.Caption = '0'
        Status.Appearance.Fill.Color = clRed
        Status.Appearance.Fill.ColorMirror = clNone
        Status.Appearance.Fill.ColorMirrorTo = clNone
        Status.Appearance.Fill.GradientType = gtSolid
        Status.Appearance.Fill.GradientMirrorType = gtSolid
        Status.Appearance.Fill.BorderColor = clGray
        Status.Appearance.Fill.Rounding = 0
        Status.Appearance.Fill.ShadowOffset = 0
        Status.Appearance.Fill.Glow = gmNone
        Status.Appearance.Font.Charset = DEFAULT_CHARSET
        Status.Appearance.Font.Color = clWhite
        Status.Appearance.Font.Height = -11
        Status.Appearance.Font.Name = 'Tahoma'
        Status.Appearance.Font.Style = []
        Caption = 'Nuevo'
        Color = 15784647
        ParentFont = False
        Picture.Data = {
          89504E470D0A1A0A0000000D49484452000000280000002808060000008CFEB8
          6D00000006624B474400FF00FF00FFA0BDA793000003CC494441545809ED974D
          4C13411480DFB6BB2DEDB60529948A451BE80534F52FE147A3C63F3451A378C4
          8B118CDE4C8C5AB97A01A31E4D347A30F1E76A6262A245B9187FD06862B06262
          0B4A1BB55250100A14BAEBBC8556FE96EDD46E35D176DF76F6BD37F3BEBC373B
          3305F8FFF9BD0C3072DD77B43C15E56CB47A3DAB6DBB73A2722B6DBF05FD1150
          CCC007C73970F1955877E145DB8201658C1A197D46D5A7F72F07DEC06EDE7BFE
          F913DA81B302683270E0A9AB00B391ABA185CC0A20662D5DC8AC01A60B9955C0
          7420B30E380392D7552BCDC93F029884DC57CE9815205974565B8E5E6A5F2804
          6E1635720EAA03DEF354CBC54EEA779E7D966CCF6EFCB112CF06917BFE0F2897
          9954F5D473B0F1CA6B08F58FA43AFE0CBF12AB01AE34AE9CA1537AA006BC7A98
          2E80128092FDAF9F83D419A42971AA255DB22847299173ED78D0CCC07935E521
          E6124C6AFEED12630E5C453C78F6B800CBFDB2FB3BB4F9FAA023F403864727D0
          0C7C0E0BEE120B6C6F7E56DBDA54ED9594D36EB80F4E7BFCD5C412A7B24DFDEA
          21DFFA181981737703F02D1A87627B21D8ACB990A3E3A40EA36331E8ED1F047F
          303C148B4DF8C78478FD034F4DA7642437D54BDC111C84E337DF8229CF0A1B2A
          57806BA91D2CBC01741C2B89C5648432A2AB5DEF36559439DC9C46F3BCB6E5F1
          46C2265DAABCC53A5603971B56425C10E0CCEDF7B0AAA20C6CF91629A0DC8D01
          86801669CC7C8EA9BDE3FDDD1DCD4F56DF6F5AE7A706A459A88F5DF781CBB964
          5EB8236B278B77F9A5308319CBBFC2B5D4E8F3076F1143E5A4176965FA7AF561
          0022C3717016DBA887763A0A351CC796D736B76FA1CEA0D242ED2C34C2A5436E
          687D1301C7E2422095A30694CA5D62E7DF06420DD480A996D847961277859D1A
          2ED1C1966F66DE75C3266AC0C4004ABF03D17130E87549B7C49C4B2AA61AB3F5
          89396934E8211E170B549B83648F23E5955D66A7F0947F54CB601EAF8391D131
          3093350F311299C1364A2273B3F56843898EC640AB6522AA6570F5320B84FB06
          30565A128E0C0820805735C04DE556F8F4A51744F2A525C4E9D1150A476313E2
          0DD500D73873A1C0C44257304CCB07FE9EB0303E3ED1E96DAA6A530D10A94EEE
          2A85C0C7CFF0759E52E3DC4341BFE9424A0B9D81D03001AC47BDEC6B86A71974
          4847F06895F873848705DC8FCB961583D36123EBF6FC21712A74F57C157C81E0
          505C84DDF74F553DC2D8F37BA32583B2ADF945A99E835B3A4EBBBCD451C4DBAD
          B98CD1A897220C8F8C61868540301C2559EB8889E201EFC9AA6EC9486E590124
          71A40B0FA53A2D735064C4AD421CF251A965993E46641EC604E19AD753DD8ABA
          E9F21333D8F59FEB7171150000000049454E44AE426082}
        Shadow = True
        TabOrder = 1
        Version = '2.1.1.9'
        OnClick = oBtnNewClick
        TMSStyle = 13
      end
      object oBtnEdit: TAdvSmoothButton
        Left = 141
        Top = 3
        Width = 135
        Height = 70
        Anchors = []
        Appearance.Font.Charset = DEFAULT_CHARSET
        Appearance.Font.Color = clBlack
        Appearance.Font.Height = -13
        Appearance.Font.Name = 'Segoe UI'
        Appearance.Font.Style = []
        Status.Caption = '0'
        Status.Appearance.Fill.Color = clRed
        Status.Appearance.Fill.ColorMirror = clNone
        Status.Appearance.Fill.ColorMirrorTo = clNone
        Status.Appearance.Fill.GradientType = gtSolid
        Status.Appearance.Fill.GradientMirrorType = gtSolid
        Status.Appearance.Fill.BorderColor = clGray
        Status.Appearance.Fill.Rounding = 0
        Status.Appearance.Fill.ShadowOffset = 0
        Status.Appearance.Fill.Glow = gmNone
        Status.Appearance.Font.Charset = DEFAULT_CHARSET
        Status.Appearance.Font.Color = clWhite
        Status.Appearance.Font.Height = -11
        Status.Appearance.Font.Name = 'Tahoma'
        Status.Appearance.Font.Style = []
        Caption = 'Modificar'
        Color = 15784647
        ParentFont = False
        Picture.Data = {
          89504E470D0A1A0A0000000D49484452000000280000002808060000008CFEB8
          6D00000006624B474400FF00FF00FFA0BDA79300000357494441545809ED984B
          4C13411CC6BF76DB62697915110CD14803069044E3B315418D262831BCBC2937
          8DF16A40AB67354A94C48B6234C644E3C1880638545EB642D1567C44232F4121
          A211D4B63E02D5DAEEAE3B252182DDA505BAE5D04DFF9B9D6FFE33F3CB37339D
          EC02916B6E0E48F89A179CB5B27C75C1EA5132CAD450B97147B0ED04F309203B
          0F17E967FFC5176C69F55393E0803C95521E7D5EE5E365ABA052CAB6179FEF7C
          1C6CC7A200AA9572184AB311132DD7070B290A20716DB690A201CE165254C0D9
          408A0E380552A5D0CDB426C3023809599225899901524692431D872F3F111A82
          1C167ABE849003361A747C634FEABBAA6C93CFD31FC236C5D341F8CA11403E67
          02D5230E06EA145F5EC4413E6702D5230E06EA145F5EC84F12BE81FFD5531316
          F98A0567AC3B150AEA1ACDB08994546273339E7D0B02F0DAA135F8F8CD7A927B
          B93214EA32E44B1254B0F57CC8EB7BEFB8B120D6A0EDED37442BA863712AB9FC
          DD2727162964D0AF5AAEF0D0CCD6B03B78A97908AD3D765496642B34EA289CAB
          EB46EBB341A4A76A20934A47C2EAE0A37E279ABAEC9C6314D451722815142A8A
          B2F1D9F10346DB80F70FCD1C081BE003CEB50B8D43D8BB2D0B39DA149CBEDB85
          AF3FDD18FDFE0B636EDAEDF132554D069D392C534CD65C4DCB7BECD9BC124971
          2A5F78BC34AAEBBBE172D38C9B66CB9B4FE86BC9D616DD4133E75CB57110455B
          3291AC5113065FA426C562EC37CD19C79E6A36E86A7D227713D54173AF0335A6
          6194E4674113A3E4869FF88D3AC750DFD13FEE61D8520EAE65429DB88BE620D9
          105738B8E2DCCCFFE0EE5BFBC16D88FFE008A2280E5E6F1F46E32BBB6F5A35B1
          539D337270278AD2B12E2D7E8A73048E44C81DBC61F98886E75F04E1D6AE8823
          2C7E23A480835F5CB8D73902E25ABC7AE2BC25145FBFBBD0681B4045A1164270
          2437A4806DDCA6C8CF4986522EC16D5317BC3403C70F17EA3AFA7064771A74E9
          09844130420AF890FB4BD9989188CAE22CC447CB5167E9C59DB61E94AD4F0908
          8E900B6E12A1176AD2D85F2C4B54E2EAC1D5B0BC71C0E9F260714C143ED8C7A1
          4D51C1FC7A14651B96A23C37D55F53BF1AF9ECE0B762AE626195AD9D66D93C8A
          92D032A9C4CE30B8C5B0DE9BC663B92F83E95BD0C1603A9A9ECB7DDED6521289
          85E64E30E3D14DF5D3EB032DFF0541436DC89DF2AC180000000049454E44AE42
          6082D5254A4B9BEA69904AE88BFB4E573D1AEBFFDBF73F00EB0971A7C745F22F
          0000000049454E44AE426082}
        Shadow = True
        TabOrder = 2
        Version = '2.1.1.9'
        OnClick = oBtnEditClick
        TMSStyle = 13
      end
      object oBtnDelete: TAdvSmoothButton
        Left = 275
        Top = 3
        Width = 135
        Height = 70
        Anchors = []
        Appearance.Font.Charset = DEFAULT_CHARSET
        Appearance.Font.Color = clBlack
        Appearance.Font.Height = -13
        Appearance.Font.Name = 'Segoe UI'
        Appearance.Font.Style = []
        Status.Caption = '0'
        Status.Appearance.Fill.Color = clRed
        Status.Appearance.Fill.ColorMirror = clNone
        Status.Appearance.Fill.ColorMirrorTo = clNone
        Status.Appearance.Fill.GradientType = gtSolid
        Status.Appearance.Fill.GradientMirrorType = gtSolid
        Status.Appearance.Fill.BorderColor = clGray
        Status.Appearance.Fill.Rounding = 0
        Status.Appearance.Fill.ShadowOffset = 0
        Status.Appearance.Fill.Glow = gmNone
        Status.Appearance.Font.Charset = DEFAULT_CHARSET
        Status.Appearance.Font.Color = clWhite
        Status.Appearance.Font.Height = -11
        Status.Appearance.Font.Name = 'Tahoma'
        Status.Appearance.Font.Style = []
        Caption = 'Eliminar'
        Color = 15784647
        ParentFont = False
        Picture.Data = {
          89504E470D0A1A0A0000000D49484452000000280000002808060000008CFEB8
          6D00000006624B474400FF00FF00FFA0BDA79300000259494441545809636018
          E4809112F779B59D54FBCBF4EF263E33FE3131AAED2EB3B88D4F0D3E39167C92
          84E4FE31FEF56760609CBEB3C2320B9B5AF78EE3D398FFFE0B00CA7503315988
          892C5D504DFF18198318FE33AC83723129A01C580DA60CD12278A3D8ADFB2237
          3BE38F7C3626A6949F7FFF89FFFEFB8F8B6893F128646566FAC6C6CCF4F2CFDF
          BFB3FF7F6599B8B9C1E41B2EE5381DE8D6764C83839D659FBEBCA0A0AB810487
          081F0703271B332E734812FFFEEB2FC3EB4F3F18765F78F1E3D283F7EF7EFDFD
          E5B4A3DC066B5AC6EA40F7BE63426CFF58AE865ACB8BD96A8A52940C08B9FCD0
          B597FFD61E7FFCF2EFAF9FDA5B2B6DDFA3AB4771A067F7715F6074CEF9F1FB9F
          18BA427AF03958995EFDF9CD90B4B5C27C2BCC3E945C0C4C1BF3B33CD485D5A4
          F860F274A56F3CFD24366DFBAD050C0C0CA2400C4628D1F7F3D7BF01731CC835
          1AD27C0CBFFEFC1501B161182504418219334E82A8418351D220B2AB8085ECFF
          1919E6C842346383020558D863750B4A14D3CC0514183C3C1CD8B4F212D630C0
          258EAC18971A5CE2C87A416CA242F0D9FBEF20B518189738B2425C6A708923EB
          05B189722048E140E15107521AF2A321381A82948600A5FA47D3E06808521A02
          94EA1F4D83A32148690850AA7F340DD22504C5F839B0DA834B1C59312E35B8C4
          91F582D858BB7A208941DFED646561FAF4E1EB2F905B698ADF7FF9C5C0CEC2F4
          1197253833090B23E3BC05FBEE7EFBF08D768E0405C082FD77BF313032CDC5E5
          408CA10F98C2C73C4C65FF5F7FF95FBBEC62CAEF3FFF7861E2D4A481B1F49999
          8961CE531EE60A6A9A3B6A1672080000995AB29B8C3484530000000049454E44
          AE426082}
        Shadow = True
        TabOrder = 3
        Version = '2.1.1.9'
        OnClick = oBtnDeleteClick
        TMSStyle = 13
      end
      object oBtnFind: TAdvSmoothButton
        Left = 409
        Top = 3
        Width = 135
        Height = 70
        Anchors = []
        Appearance.Font.Charset = DEFAULT_CHARSET
        Appearance.Font.Color = clBlack
        Appearance.Font.Height = -13
        Appearance.Font.Name = 'Segoe UI'
        Appearance.Font.Style = []
        Status.Caption = '0'
        Status.Appearance.Fill.Color = clRed
        Status.Appearance.Fill.ColorMirror = clNone
        Status.Appearance.Fill.ColorMirrorTo = clNone
        Status.Appearance.Fill.GradientType = gtSolid
        Status.Appearance.Fill.GradientMirrorType = gtSolid
        Status.Appearance.Fill.BorderColor = clGray
        Status.Appearance.Fill.Rounding = 0
        Status.Appearance.Fill.ShadowOffset = 0
        Status.Appearance.Fill.Glow = gmNone
        Status.Appearance.Font.Charset = DEFAULT_CHARSET
        Status.Appearance.Font.Color = clWhite
        Status.Appearance.Font.Height = -11
        Status.Appearance.Font.Name = 'Tahoma'
        Status.Appearance.Font.Style = []
        Caption = 'Buscar'
        Color = 15784647
        ParentFont = False
        Picture.Data = {
          89504E470D0A1A0A0000000D49484452000000280000002808060000008CFEB8
          6D00000006624B474400FF00FF00FFA0BDA793000005DD494441545809E5987B
          4C53571CC7CF7DF5F6D2F29052A6C863140414030AF2B05D9C4B5444882E4E66
          E69F73AF646E7FB8C974F10F962C3235D1656E1AF7F09FED1F215BE63615D40C
          A75006158145AB225005E6569E52EF6DE9ED7DEC9CCA25CD641D5C5A5DB2A6BF
          FC6ECF39BFEFF9DC73EE3DE7770AC07FFC8385836FFDFEC64C1C232A3424B145
          06205E94E428D40F81632ED8A19317C46F8180D79C79BFA80B950733D83E58F5
          ECEA4AABADCB699AFC0C6020373FD580E5A5C532F3F41A10C5507E2197C707C6
          582FB8DA33E669EB1D8665583B27F8DE3C5F69E9803FA6FD8604707555031915
          A93B4A11F8B64D858911E62C2306476BDA0E954238AAA0F1C690F4A3ADDF2308
          E0EB71967DEB62D5738252AFF83903AE3EDC10130BF475A6F99139AFAC4D6768
          1257B467E4BD3E117C71BEC7E3187475BA26F0F51776AF180F0C9C1360FEF12B
          54122B35AECC32E656585268B562327C504F36DDF136DF1A6EFF5D8FAF6A7B7D
          854F819CDDED2A51933E8913BF32CDD72FAD30AB87435218BCB3AD96A769D353
          FADC4456FA1C9529A61AB064BFB510C3F1175E5BB7280275A008AAF548036A31
          388EBDB8AEFAD77C454735A05E4B7D5AB13285A12942D19AB3673404D85C9CCC
          E819E28822A60A70C3BE960C20634B8A320C707214A9D07873561C1ACC9C926A
          6B3A5254058851F2D6827403892329A41242439A79690682C0F10A24AB0A9026
          898D4B93A36924100ECB498ED16A35C4F3485B15205C64138DD15A141F1633C2
          7B97004844E2AA0005499E171DF170FB4222A1B6189D06F03EC980745501A2C0
          B0DBE4EBA70A9022B1D1716E6AB10F39EB18CB030D898F206155800486DD1B72
          4DA0F8B0D890CB0B20D80012871EB9D9999B976ADA1D639ED945CDBC75BB63D4
          EDF60A2751842A404C00DF5F758CCAF06D461A2135A40901812CCB3F20615580
          28139644B9A3E9E6205C0D904CE8ACD13E28C2ECA6AD7E8FB91BA9AA0244813C
          2FEC38D532E041F91CFA1D0AF3F02238651BF07A456987A2A71AF0EC1E73BB57
          903B8ED6DF86B3A1C8A9F770D4C0F1BADB0F0441FCB26E57F16F8A926AC00D07
          5A775324BEFCBE5BC26AAD7D00E69C8AE6AC3D824309EBDD11AE539BD2B73350
          6072390C2CFAF7EBB283AD87690DF5EAB3058B75388E83D6CE2E60D0E3F21B25
          19989A94FF787DF70387D3D5C9FA88F2BFA7FCB34BE664192B8B2A3FA2A3E9ED
          AB0A17EB688A0213BC0FDCBC73CF7D9FE59B2F5E731A614E47251A2230949504
          BB55F4B65EB60F49C7EABADC232EFE9B7196DBFAF35ECB234BD78C47B0AA4AC6
          6D7ADB093D436F79267FB18E2209E0F1F2E0628B9DE37DBEBD67DF2BFE78BA63
          274A2AE6E91EEEDB6370F7191AF784FED8898E957ABDBE363A92596B5E96A983
          C99A7FE41A5AAF733E9F70F0CCAEA20F0247ABF440531A86E19B188ADC2CCA20
          D5CB8BF1A85E4BE14E98E739DCBCF81D2FE2A72EEC29E845E5C10C0B5689EA4A
          3F3943137CDC4FB1317A7371CEA208F4CCF1F020FB4BCB750EAEF6C7CE5616EE
          42EDC26541012B0E59990999AC331A620A0AB24D0C0633684114C1259B9DE326
          BC274EBF5BF476B8C014DD7F04DCB8BF3152C4E98684F8982579D9A90C06FFCF
          1044095CBE62E7588FA7F6F43B452F030C9BCBEAA23004F5D3AE832587ACB110
          AE2525212E3B0F8D1C8493240934B7DFE458B7F75C015BB4FD71C021F24746B0
          74DF2523AEA1AD19C909C999A6040D6A84B68AE68E2EF7F018DBE48CC6CB024F
          FEA83E9C46068A977F685D0828D2BA2865C182CCD484876B039CC4D66BDDDCC8
          7DD6A673EBCADB2AB3C397A906C24C5E4F01AEA9B699644AB22E4D4F32A426C6
          FBCB211BB86AEFF538875D7682C3CB6AABB2F9C9B8C7E6FC53BCE6A3C6642DA5
          69CD4E4B3242B8A9E7F27A77BFA7A7DFD92712A2B97EA779F4B1510574E41F29
          86A46BB24C0BE302E16E39EEF1BD7D83430226AC3AB7D3F244E010A71F5090A4
          652909C6A97DB9BBCFE98380A3F0E5B09CABB40CA2864FCAFCD30977870E3895
          225A4ABAFBFE14ED3DFDE3702BB2C0FD75E0498129FD92E8C2EB03DB6EDFFDA3
          F6464F7F2E41901D3E597E6926FB248AFDDFDB5FCD2247F5BE04362A00000000
          49454E44AE426082}
        Shadow = True
        TabOrder = 4
        Version = '2.1.1.9'
        OnClick = oBtnFindClick
        TMSStyle = 13
      end
      object oBtnPrint: TAdvSmoothButton
        Left = 543
        Top = 3
        Width = 135
        Height = 70
        Anchors = []
        Appearance.Font.Charset = DEFAULT_CHARSET
        Appearance.Font.Color = clBlack
        Appearance.Font.Height = -13
        Appearance.Font.Name = 'Segoe UI'
        Appearance.Font.Style = []
        Status.Caption = '0'
        Status.Appearance.Fill.Color = clRed
        Status.Appearance.Fill.ColorMirror = clNone
        Status.Appearance.Fill.ColorMirrorTo = clNone
        Status.Appearance.Fill.GradientType = gtSolid
        Status.Appearance.Fill.GradientMirrorType = gtSolid
        Status.Appearance.Fill.BorderColor = clGray
        Status.Appearance.Fill.Rounding = 0
        Status.Appearance.Fill.ShadowOffset = 0
        Status.Appearance.Fill.Glow = gmNone
        Status.Appearance.Font.Charset = DEFAULT_CHARSET
        Status.Appearance.Font.Color = clWhite
        Status.Appearance.Font.Height = -11
        Status.Appearance.Font.Name = 'Tahoma'
        Status.Appearance.Font.Style = []
        Caption = 'Imprimir'
        Color = 15784647
        ParentFont = False
        Picture.Data = {
          89504E470D0A1A0A0000000D49484452000000280000002808060000008CFEB8
          6D00000006624B474400FF00FF00FFA0BDA793000002AA494441545809636018
          E4809190FBDC3B8EFF27A48612F99D159678DDC0428CE13BCA2D885146B21A8F
          CE1304F530115431C00A461D4869048C86204D4390D6450CC8F184EC18F4510C
          2E248D679E6195FAFCB793818131EED79FBFC2209F0D146663617ECBC0F07FD1
          335EE6F2B3E926BFC105B5D4977F5DE2423C69CE264A5CFC5CEC286E9BB8E624
          C38C0C7314316A7132669C64C80F4135FBE3D79FC27BCFDE4BFFFFF61BA8062B
          0647F1FFFF0C09AE26CA188EA396434831879F9B9DC11518500C8CFF9340FA98
          40C4EF3F7F0578B9D840CC41817981B1087213C83160078218038DCDA51819CC
          8018DD1D83C6818CC0EC0A44E8EE630067120CD1011038F1149427302D1E3421
          88E93488084107F270B0327CF8FA0BA29A8AE4FB2FBF18783859099A48D0815A
          0AA20C8B0FDE67F8F08D7A8E047978F1A1FB0C9AF262041D48300D9A69CB309C
          BAFA84A169D515866F3F7E13349018055CC058D1017ADC4C5B9AA072820E6406
          662F4B1D59061026681A0D14108C621AD8499291A30E2429B8B028C699068F5C
          7ECC70F1CE0B863F7FFF61D1463D2116662606035509066B603AC7662A4E075E
          BEFB12EE385A36B7400170F1CE4B9C0EC499067595C519988039189BAFA82906
          B2435F451CA791381D68A32BCB901B6C865323B5244076E08A5E901DE02806A6
          834F5FBFFFE2E3E6C4DE2654E0476D6724CE3CCFF0FCC34F907EA2B1AC3027C3
          EC147DA2D47F06D65A2C2C4C1F418AC10E6462629CB7F3F4DD343733652E1E0E
          EC8E042986E1F9E9863026D569604031EC3E73F71BE37FA6B920C3C10E7CC6C3
          54C6F0EECBFF85DB2FA600132D2F48825E18D4E741B60B189B9F991819E63CE7
          63AE4016C7C906F55BFFD30880CCC6693154021C825036D114ADD320B243C872
          202DD320B2E3406C9CC50C487230E05107521A0B44A54162C6922975C890D50F
          00653A03B74EFEC5980000000049454E44AE426082}
        Shadow = True
        TabOrder = 5
        Version = '2.1.1.9'
        OnClick = oBtnPrintClick
        TMSStyle = 13
      end
      object oBtnSave: TAdvSmoothButton
        Left = 855
        Top = -45
        Width = 131
        Height = 70
        Anchors = []
        Appearance.Font.Charset = DEFAULT_CHARSET
        Appearance.Font.Color = clBlack
        Appearance.Font.Height = -13
        Appearance.Font.Name = 'Segoe UI'
        Appearance.Font.Style = []
        Status.Caption = '0'
        Status.Appearance.Fill.Color = clRed
        Status.Appearance.Fill.ColorMirror = clNone
        Status.Appearance.Fill.ColorMirrorTo = clNone
        Status.Appearance.Fill.GradientType = gtSolid
        Status.Appearance.Fill.GradientMirrorType = gtSolid
        Status.Appearance.Fill.BorderColor = clGray
        Status.Appearance.Fill.Rounding = 0
        Status.Appearance.Fill.ShadowOffset = 0
        Status.Appearance.Fill.Glow = gmNone
        Status.Appearance.Font.Charset = DEFAULT_CHARSET
        Status.Appearance.Font.Color = clWhite
        Status.Appearance.Font.Height = -11
        Status.Appearance.Font.Name = 'Tahoma'
        Status.Appearance.Font.Style = []
        Caption = 'Guardar'
        Color = 15784647
        ParentFont = False
        Picture.Data = {
          89504E470D0A1A0A0000000D49484452000000280000002808060000008CFEB8
          6D00000006624B474400FF00FF00FFA0BDA79300000204494441545809636018
          05948500234CBB7BC7F1FF30362E1AA498859989E1F7DF7FB8941025CEC2C4F8
          FDF79FFF8EBBAA2C4F12D200B213AC06E4C01919E66036362263C64906561626
          063F6B750619513E6C4A88129BB8E624438E973AC3ECDD77BEFDFEF3CF797BB9
          C5097C1A99F049A2CB010DA4C87130F374E4041872BDD5B9D85899F6B8B59F74
          828963A399B009524B0C145A208CCD3C15095E865C2F756E4E76C64DF81C4953
          07627318B29832DC910C9B3D3A8F3923CBC1D803EA409023408ECCF1D4E06267
          65DE84CD9103EE409023552441D10D71A47BFB711790180C0F0A07821C030AC9
          5C2F0D2E0E76A68DC88E1C340E843932DB539D8B99997133880FC22C20825638
          3F0477B98ACB4E55493E86BFFFFE73C0E4890E41016E3606166041FDECCD6798
          5E92E9A76F3E3180CC214523D121186DA7C0B070DF3D86F5876F30FC21B3AAE3
          037A32CE4E9114F73110ED405D7941869E4463920CA78662A2A3981A969163C6
          A803C90935643D833E0471661250FB0FD927B466E36A8BE27420C8413BCA2D40
          14CDB147E7099C760CFA281E7520CEB82352026F1A44362365F6458627EFBE23
          0B91CD9615E664989DA24F947EA21D382795380389B2950445A3699084C0C2AA
          94E8281E4D8358C38F8161340DE20818A28547D320D1418543E1681AC4113044
          0B0FFA106484790534C20A630F067A678525DC6D83C13D43D70D004A0A72A1A7
          30203F0000000049454E44AE426082}
        Shadow = True
        TabOrder = 6
        Visible = False
        Version = '2.1.1.9'
        OnClick = oBtnSaveClick
        TMSStyle = 13
      end
      object oBtnAbort: TAdvSmoothButton
        Left = 988
        Top = -45
        Width = 135
        Height = 70
        Anchors = []
        Appearance.Font.Charset = DEFAULT_CHARSET
        Appearance.Font.Color = clBlack
        Appearance.Font.Height = -13
        Appearance.Font.Name = 'Segoe UI'
        Appearance.Font.Style = []
        Status.Caption = '0'
        Status.Appearance.Fill.Color = clRed
        Status.Appearance.Fill.ColorMirror = clNone
        Status.Appearance.Fill.ColorMirrorTo = clNone
        Status.Appearance.Fill.GradientType = gtSolid
        Status.Appearance.Fill.GradientMirrorType = gtSolid
        Status.Appearance.Fill.BorderColor = clGray
        Status.Appearance.Fill.Rounding = 0
        Status.Appearance.Fill.ShadowOffset = 0
        Status.Appearance.Fill.Glow = gmNone
        Status.Appearance.Font.Charset = DEFAULT_CHARSET
        Status.Appearance.Font.Color = clWhite
        Status.Appearance.Font.Height = -11
        Status.Appearance.Font.Name = 'Tahoma'
        Status.Appearance.Font.Style = []
        Caption = 'Cancel'
        Color = 15784647
        ParentFont = False
        Picture.Data = {
          89504E470D0A1A0A0000000D49484452000000280000002808060000008CFEB8
          6D00000006624B474400FF00FF00FFA0BDA793000006AD494441545809CD5859
          6C5455183E779976B64E7768552A2580D8420C8AD2623488068A8941231412E2
          832F628C51A2610926D02784E0834288C1471E4864514213282882264011A871
          610AC5422984D2BD9DE5CE94B98BFF77CB196FA7B3DC026D98DC7FCE39FFF9BE
          FF7C39DBBDE730F698FF8407D5B7F8CBC61704C178DD21C9AF33813DA3EB7A31
          C5E2F10C5114BB1933AEA831F5A42109278FAFAF6EA2FA313F3CA02DE2C2BA53
          DE6C976B8D2C896B2551282C29CE178AF37DCE1C8F93B99DD9A473388C418912
          19624125CABA7A07A3777B060CFAF5A8AAF6B52EB9F79C58F75C9820B61E5B02
          4998EC72BBD68A82B0A5B8C0274E7FBAC45D94EB637145999A22C5DD0341D6DA
          DE11EEEE1B340C41D8AC84945DA7EB5E533351330A5CB2EDF74A59348EE4F9DC
          25732BCADD5EB72B53CCB4F5C170845DF2DF5042A1E81D2DA62D3BB6A9CA9F8E
          9056E0D2ED8DCB0541D83B7B665976F95393C4B4E074AD24D45187B2EBB73AF5
          CBD76E0DD13C7DEFE8FAAA4309907831659B4BB637BE9F258BBB5F9E3BCB95E7
          F3C4098F32D3371862679AAE44758DAD39B671FEDE64B1930AACD971F61D5990
          F7BDFA6285D3E779B8214DD6A8D5170829ECD70BCD514DD756366CA83E62AD43
          7E94C037B69F7B364B102FBE326F963BDFE70566DCAD7730C8CE5CBAAA3095CD
          3DBA697E8BB541D15A5858774A768AF2119A73CE891287F60B737358E5F4294E
          C121D4AFD8BF5F828FDB08811EA767AD2F27FBC969B4203860A2D2696593459A
          4E53C26D651F5BDB8C0FF1E21D7F7A1C2CDAB1F0A5CA9C9C719E775601D63CE6
          E3E90BFE8014964AEBEBE629A88BF7A0C89435930B73C54CE26462AC9E23B255
          B3454659C4486BC0000B0EB8E9C03EAF9B4D2EC8155597FA01C7814F5B912148
          82F4F98CA94FA4DD4F4442D7568ACC9BC5586E3663EF569083474A912E270CB0
          E0808B1829A0A67BC6D4522F89F9CC2CD09FD942CD57E7E7C892E4CBCFB0DFE9
          3A6351CBCBA9807620F48E198482591FF850974F18EE0717317839599A9FEB65
          0E51CA5FBAB5B102F588C304CDA8292DCE93E1C8643F34EBACDB9C1DC348F44E
          6DC27023287CA81B463193032E2FA74AB1284A8AF32443346A80412CE690A545
          4579394E38EC181AEA4921120113C5010B8E9DD8C014E5F95C8E2C7911F266AF
          D1C855645A1C005B0D0D627E6198E1476FADA0F9C9F348617D11C68045DEAEE5
          789D4CD78D4AE045FCE99A51E872D2CC47C1A6E1857FC0AF33F40EA7E4D118C0
          781975C000CB7D7652577616D30DBD08D861814CCFA64582F298ED10CD490849
          24C287BA44BF9D324D3966E886B9BC4C812609B3D3CC8CED0FB464FB1B7CA81B
          5B342B5A303BDE14485BEE107D8E5B6B6DE5415E492BD83AAC9C081FEA80E13E
          BB694CD59820B228F0269F36C6AE4894BE1DE1B169E81D2C0A2C0E4EC1B0F626
          AC6E6080E5183BA912BDC72451EC02D614489F0F57836153307C190D24F40E7A
          89833BE91884397790E66417E5B91F1860C1E1BE4C6988B4D0977C337026EF9E
          AE1DEFEA0F44E0C8642024EE731077F80A6D56F7C93F521EBEFB45F3B5080EB8
          DC972EA593A0722F166B0066982308273B7B06357356C29BC2004643D6618510
          AB384E850F75BC0C0EB888C17DC95268E8EA1BD4454DFC05F526BE615DD55FAA
          A6F6F6D1D110CE944668EBC9099B3084A4C2A3AEDF322E269762A4C2C3DF3B10
          609AA675F3D35E1CAE19FACE6B6D1D96290EF848C38B7EDFDF3AEBA546D13BD8
          8447224697F6D3660E2C38E022C668D4FF9E96B68EB0A61B3BB9C77CD5A1A033
          F79EEEBE401DCEAD995E7B07A95170EC1A7AD20E161FAC3DFD414D8EC8DF717C
          BC07711DA131B6E58FE61B415E399129E65E93BF2D60E8DA17FC6B1AEDC705A2
          1055945D83C148C7F5DB5DA4159E89B3D69B77351ABD3BDEF2DBDF5A5B1D2110
          772543BAF6F63F2DED43FD81901537AE791C3BFDADB7868C98B1EC406DED88CE
          1921102A7EDE50DDAC1ADA6A9C5303748F02DF781AE6DDD9A61645D58D558967
          62B43B4A209C27362C384C848F7EBBE857060296D7022A1FA1E1EA83DA88A8BA
          FEE1898DD5F5C942A77D4D2EDE766EA94312BFAF9C51E6A2CB23392D3859F414
          3E2C88EBED9DAABFB53DA269FA8A868D0B8EA78066BEE17B73EBF9994216ABCF
          F5B84B9FAF2CCFF13E82EBB78B976F0483A1C89D18D3DFFA697DD5B554E2E0B7
          D529E69588D3F989280A7593E8EC4C17989E07B9C0FCF76647A8BB3FA033C3D8
          AC2891DD58941091CE6C09E40148A879054CC3FE297D6D149414E50924D8CDAF
          801D8EE17D3F165399E50A38DCD133C0E81BBE57D5B46FC6E50A980BB4A6FC12
          5DA613217DFBCED40C63125DA47B08830B7445125897C184164D551FEA129DE2
          3DDECF7F69478FD674EA351E0000000049454E44AE426082}
        Shadow = True
        TabOrder = 7
        Visible = False
        Version = '2.1.1.9'
        OnClick = oBtnAbortClick
        TMSStyle = 13
      end
      object oBtnExit: TAdvSmoothButton
        Left = 1152
        Top = 3
        Width = 135
        Height = 70
        Anchors = []
        Appearance.Font.Charset = DEFAULT_CHARSET
        Appearance.Font.Color = clBlack
        Appearance.Font.Height = -13
        Appearance.Font.Name = 'Segoe UI'
        Appearance.Font.Style = []
        Status.Caption = '0'
        Status.Appearance.Fill.Color = clRed
        Status.Appearance.Fill.ColorMirror = clNone
        Status.Appearance.Fill.ColorMirrorTo = clNone
        Status.Appearance.Fill.GradientType = gtSolid
        Status.Appearance.Fill.GradientMirrorType = gtSolid
        Status.Appearance.Fill.BorderColor = clGray
        Status.Appearance.Fill.Rounding = 0
        Status.Appearance.Fill.ShadowOffset = 0
        Status.Appearance.Fill.Glow = gmNone
        Status.Appearance.Font.Charset = DEFAULT_CHARSET
        Status.Appearance.Font.Color = clWhite
        Status.Appearance.Font.Height = -11
        Status.Appearance.Font.Name = 'Tahoma'
        Status.Appearance.Font.Style = []
        Caption = 'Salir'
        Color = 15784647
        ParentFont = False
        Picture.Data = {
          89504E470D0A1A0A0000000D49484452000000280000002808060000008CFEB8
          6D00000006624B474400FF00FF00FFA0BDA7930000021D494441545809636018
          E4801197FBDC3B8EFFC725470BF19D159658DDC282CFB21919E6F8A4A9269731
          E3244EB39870CA0C12895107521A11A321381A829486004CFFCEF3CF604C9268
          BAA5C1F5271F336C3EFD8424C78114D3CD8120CB8EDE7CC7B0FD1C66484A0872
          82A4B162BA3AD0CA4883E1D0F5B71821D910AE87D5712041BA3A909D8D95C1D2
          509DE1D8ADF7188E0439061BA6AB03410E20D591747720A98E64016918080C0F
          C9F337F15A4FB403F13589F0DA804712E448730335862340477A759DAAD95666
          D682AE9C055D001F3FD0C50C9F3459729CEC6CE08C73E8F4F52AEFEE538C5B4B
          CD9A910D1A903488EC00101BE44807332D4E7676D672AFEE536D2031181E140E
          04398691919181890184FFB383F8304C5214C334519BFEFEF317C3C1D3D7BEFD
          FEFDA77D6BA9792BB2F9243970FD9E53C87A4966634BC33F7FFD663879E116C3
          AFDF7FA66E43731CC802A21D4869070A5B290072DCF10B37192C5405190ADCE4
          CA400E42C70396067FFCF8C570F4DC7506072D11067F33197477C1F94487205C
          07151820C71DBB7083C159478CC1CD4012AF89747720CC71AEBA620C2EFAF81D
          0772395DA318945B8F9DBFC140ACE3E8EEC093C00CE1A02D821172B5CB2E82DC
          8215D32D8A41032F4EBAA20CAE7A98D1FAFAD30FAC8E0309D22D8A03CC65B13A
          0EE4087C986E0E743794C2E70E9C727473204E171090187520810022283D1A82
          0483888082411F82780B6A6C4D24021E1E79D20013548D450F1B1B6100000000
          49454E44AE426082}
        Shadow = True
        TabOrder = 8
        Version = '2.1.1.9'
        OnClick = oBtnExitClick
        TMSStyle = 13
      end
      object oDBNavigator: TDBNavigator
        Tag = 1
        Left = 813
        Top = 39
        Width = 225
        Height = 32
        DataSource = odClientes_v2
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        TabOrder = 9
        OnClick = oDBNavigatorClick
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 811
    Width = 1290
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 150
      end
      item
        Width = 250
      end
      item
        Width = 150
      end>
  end
  object ResizeKit1: TResizeKit
    FormPos = rpDefault
    FormWidth = 0
    FormHeight = 0
    FormMaxWidth = 0
    FormMaxHeight = 0
    FormMinWidth = 0
    FormMinHeight = 0
    ResizeFont = True
    Enabled = True
    ValidTaskbar = True
    Left = 976
    Top = 880
    DesignFrmW = 1290
    DesignFrmH = 830
    DesignDpiW = 96
    DesignDpiH = 96
  end
  object oPop_Buscadores: TPopupMenu
    Left = 546
    Top = 219
    object ONU1: TMenuItem
      Caption = 'BUSCADOR -> ONU'
      OnClick = ONU1Click
    end
    object OFAC1: TMenuItem
      Caption = 'BUSCADOR -> OFAC'
      OnClick = OFAC1Click
    end
    object OC1: TMenuItem
      Caption = 'BUSCADOR -> OC'
      OnClick = OC1Click
    end
    object OSFI1: TMenuItem
      Caption = 'BUSCADOR ->OSFI'
      OnClick = OSFI1Click
    end
    object BUSCADORUK1: TMenuItem
      Caption = 'BUSCADOR -> UK'
      OnClick = BUSCADORUK1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object BUSCADORUAF1: TMenuItem
      Caption = 'BUSCADOR -> UAF'
      OnClick = BUSCADORUAF1Click
    end
    object BUSCADORMP1: TMenuItem
      Caption = 'BUSCADOR -> MP'
      OnClick = BUSCADORMP1Click
    end
    object BUSCADORAPC1: TMenuItem
      Caption = 'BUSCADOR -> APC'
      OnClick = BUSCADORAPC1Click
    end
  end
  object odClientes_v2: TDataSource
    DataSet = otClientes_v2
    Left = 303
    Top = 688
  end
  object otClientes_v2: TFDTable
    Filtered = True
    IndexFieldNames = 'autoin'
    Connection = oConn
    UpdateOptions.UpdateTableName = 'clientes_v2'
    TableName = 'clientes_v2'
    Left = 228
    Top = 688
  end
  object oConn: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'CharacterSet=utf8mb4'
      'Database=fc_anti_bl'
      'Server=localhost'
      'User_Name=root')
    LoginPrompt = False
    Left = 378
    Top = 688
  end
  object oFnd_Qry_Gen: TFDQuery
    Connection = fUtilesV20.oPublicCnn
    Left = 713
    Top = 754
  end
end
