object fGen_Add_Depend: TfGen_Add_Depend
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'COMPUCAS SOFTWARE'
  ClientHeight = 496
  ClientWidth = 450
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
  DesignSize = (
    450
    496)
  PixelsPerInch = 96
  TextHeight = 17
  object Shape2: TShape
    Left = -13
    Top = -14
    Width = 474
    Height = 70
    Brush.Color = 15508822
    Pen.Style = psClear
  end
  object Label2: TLabel
    Left = 30
    Top = 146
    Width = 52
    Height = 17
    Caption = 'Nombre:'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label7: TLabel
    Left = 30
    Top = 294
    Width = 67
    Height = 17
    Caption = 'Parentezco:'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label1: TLabel
    Left = 30
    Top = 183
    Width = 51
    Height = 17
    Caption = 'Apellido:'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 30
    Top = 220
    Width = 122
    Height = 17
    Caption = 'Fecha de nacimiento:'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 30
    Top = 257
    Width = 33
    Height = 17
    Caption = 'Edad:'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label5: TLabel
    Left = 30
    Top = 331
    Width = 89
    Height = 17
    Caption = 'Es Beneficiaria?'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label6: TLabel
    Left = 54
    Top = 16
    Width = 333
    Height = 25
    Caption = 'MANTENIMIENTO DE DEPENDIENTES'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape1: TShape
    Left = -11
    Top = 404
    Width = 474
    Height = 94
    Brush.Color = 15508822
    Pen.Style = psClear
  end
  object Label8: TLabel
    Left = 30
    Top = 109
    Width = 164
    Height = 17
    Caption = 'N'#250'mero de Socio/Ahorrista:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 30
    Top = 72
    Width = 111
    Height = 17
    Caption = 'Id de Dependiente:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 30
    Top = 369
    Width = 64
    Height = 17
    Caption = 'Porcentaje:'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object oFecha_nacimiento: TDBDateTimeEditEh
    Left = 277
    Top = 217
    Width = 137
    Height = 25
    DataField = 'fecha_nacimiento'
    DataSource = oDs_De
    DynProps = <>
    EditButtons = <>
    Kind = dtkDateEh
    ShowHint = True
    TabOrder = 4
    Visible = True
    OnExit = oFecha_nacimientoExit
  end
  object oNombre: TDBEdit
    Left = 114
    Top = 143
    Width = 300
    Height = 25
    Hint = 'Ingrese el nombre de la persona'
    CharCase = ecUpperCase
    DataField = 'nombre'
    DataSource = oDs_De
    TabOrder = 2
  end
  object oApellido: TDBEdit
    Left = 114
    Top = 180
    Width = 300
    Height = 25
    Hint = 'Ingrese el apellido de la persona'
    CharCase = ecUpperCase
    DataField = 'apellido'
    DataSource = oDs_De
    TabOrder = 3
  end
  object oParentezco: TDBEdit
    Left = 114
    Top = 291
    Width = 300
    Height = 25
    Hint = 'Ingrese el parentezco del la persona'
    CharCase = ecUpperCase
    DataField = 'parentezco'
    DataSource = oDs_De
    TabOrder = 6
  end
  object oEdad: TDBNumberEditEh
    Left = 293
    Top = 254
    Width = 121
    Height = 25
    Hint = 'Ingrese la edad de a persona'
    DataField = 'edad'
    DataSource = oDs_De
    DisplayFormat = '###,##0.00'
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 5
    Visible = True
    OnExit = oEdadExit
  end
  object oEs_beneficiario: TDBCheckBoxEh
    Left = 372
    Top = 328
    Width = 42
    Height = 17
    Caption = 'SI'
    DataField = 'es_beneficiario'
    DataSource = oDs_De
    DynProps = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = oEs_beneficiarioClick
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object oId_cliente: TDBEdit
    Left = 293
    Top = 106
    Width = 121
    Height = 25
    DataField = 'id_cliente'
    DataSource = oDs_De
    Enabled = False
    TabOrder = 1
  end
  object oId_cliente_dependientes: TDBEdit
    Left = 293
    Top = 75
    Width = 121
    Height = 25
    DataField = 'id_cliente_dependientes'
    DataSource = oDs_De
    Enabled = False
    ReadOnly = True
    TabOrder = 0
  end
  object oPorcentaje: TDBNumberEditEh
    Left = 312
    Top = 366
    Width = 102
    Height = 25
    Hint = 'Ingrese la edad de a persona'
    DataField = 'porcentaje'
    DataSource = oDs_De
    DisplayFormat = '###,##0.00%'
    DynProps = <>
    Enabled = False
    EditButtons = <>
    ShowHint = True
    TabOrder = 8
    Visible = True
    OnExit = oEdadExit
  end
  object oBtn_Save_Dep: TAdvSmoothButton
    Left = 28
    Top = 416
    Width = 172
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
    Caption = 'Guardar y Regresar'
    Color = 15784647
    ParentFont = False
    Picture.Data = {
      89504E470D0A1A0A0000000D49484452000000280000002808060000008CFEB8
      6D00000006624B474400FF00FF00FFA0BDA793000007D6494441545809DD5879
      6C54C719FFDEDBB7F7AE4F7C810FBC8031B68154724CC84108A1C607602EE750
      42FF2051DAA890044549A1B491959414E3603B26226A22454155A43488B61852
      026E046948B26B3B41C876D7187BB177B1CDFA5AB3C7DBE35D9D7974D79BB0AC
      DFDA6E1565F566DEF7BE6FE69BDFCE37F3CD7C1FC08FFC47CC145FC59BA63C9E
      E22BF54AEA11016005CB0A097E8ED75004C110248052261B2149A1D7E567CF72
      9CECDCB97D255D33192B2680E535C63842433CA392932FAA1444D27D8B93A8A2
      4CBD7A41921A92B472885353106079E01162FB2D3FD826BCD06573F94D7D8E00
      1DE0261956381A00D5B1F3AFACF448052B0960754D97C2A773ED2308E2956243
      22B9FDDE744DC102BDD431C4765787DDF0D7D661AFC9E26008205EB769C9A66F
      7F59CC88C228D5B4002B0E7DBD5CA9A49A97A46B53F6962FD2A6C72BA3A89B5E
      34E4F0C1D1F3D7BD3DC39E118F5FA89CA9E9C591CA0E9BAAAB8E98E84F2FDFE4
      8539FE9DEF18E1AB8EB4BACB6B4D5BC4C162AD2A0F1B776D6B68A57B86DD730C
      6D4A5DAFDD2D5437B579361F31EE8A095F459DB16A7B63ABB77F949ED2F63FA2
      90C985C79ADA3D1BEB5A374902B9BEF69B659BD1D49B075D7302E916CD08074E
      988581287F16CBB636B43ACB6A2F2DFD2148329C8177AB5E2E3BF5DCBA6C75FE
      7C5DB868C6F4C1BFF7809F05D8F717330C8C7923EAC99EA78697CA0C3A8D4271
      7A6DCD052ABCD1F7007A35EE970CA99AF915F7A47D8F1FDE2156FADA4D1AB6AD
      CA861DABB361FFC76640CB26A28A35F9C9049A94F971719ABDE10D4240D61F6A
      8F4727C06B7B3618B4D3FA9E700D5168E4AF214E4341FD693364A5E860C70339
      B01FCDA465848ED86B7769AE9610E0F79B6B2FE9830D4200D524FB7CB1219EC8
      41D31D14CEF6DDD2390A40C8A0C8900A7F3CD90119096A78EA6103FC1681EC1E
      72DFA13E234105AB9724513C217F3E280C0194C9C93DD525F33541C16CDF7D76
      0FFCE99F03B0AE38174A9665C23D8B33A0EE541724EB94B073AD016A4E5E8548
      20B714A7ABE5726277707C1160599D71858A92C52D8BF1F80A2AF9E17BC2CDC0
      6B277B60CDCA1C4889D78AE27B972D808285A970A4D90CC97A256423931FFFD2
      26CAC2ABA5193A50C96589E56F1A0B305F04487050FAE0D2443966CCB658D14E
      7DF1CF9DC8AC6990973D2FA4AE7F78122C430E64662532772710020707AA9684
      E4E1C4AA45099440091B304FDCD23AB5ACB430334E891952CB17E671F8E8EB41
      70B803806F33BF7A34076E7919A8FBD4020F1465417E4E4A48555BF720F45AC7
      E077558B40CA25A3282B4E75A9C7B10E29681001F23CE46525ABD0B7B4E74364
      9A4B571DF0D49A5C64421558EC2E3870A21BE414091BEF5F0A6989B7CD8AB57D
      796500BC340DEFEE5A0E5AA50CB3A62D0BD146157861396E48E2CACFF2292968
      5D605A4AC1F73E6F8003BD460E3A15052B7212E1375B0B011D3DE0704D39E3CB
      3DC33031E982438FE74B0687C74FD22980E1F8244C8B00395E50A815228979D3
      966DC519B0BD241D1A9ACD30E6F28BED53E355F0F2A602307659C16C1D85A131
      177CD7330435DBF3402997AE1B2BD3A33FCDF0BC06D3FFED29A0BB686CEE3922
      48E4C744909D366869EF83BDE50698C9FD11DDED0001E24300D1DAF1D27E0E7F
      C75430C88A95A9D074A61B26E980D83715817CA1321FFC01560C0344668C155E
      3E144988A61167502E2327C6D16E8C518FD87C71BA06DC68F7369C3287406626
      6BE0E98773E1BD0B56B14DAC95DD190084C98EFB916245121D773BC4B1FC6E05
      054350FF0F0B1C7C2C1FD617CD83C6E6A9992CCC4A80EBA391CFDCBBE90BF26D
      E35E2009B88ABF4580B48FBDD889A22FCC905A30B8C6B316F843753EE01368E7
      8399F068417208A46DDC0369B1B9D6D0D057AC4E9FDBC7B560860850E0F973DF
      F43A18CC90525AFB2601837B7D473EA0602AD465E7430864E16D901F7DD10F4F
      DEBF2024934AE01B90B17782070ECE4FF51104626B43DB60F7D0F4B76853AF43
      78E268BB102D5639FE2FABF0FE8501E416637F3A6D4E01C542B620387106D19E
      1638967BA7F95BFB94970DB6087BE3996B38DB076F20B386CF5C581391FCC543
      59F0ECDA6C918EB53A611AA4BD01BE31D8EF3640F44573D4B1AF7AC6599C1140
      9F773C97FB6FC1DBE72C22B8C5695347D91D0D67C1C01BF5F280939703FB5E44
      359BDE6ADDB7FFE37F478C33D12553C0D31FBBD1A4F540CE5978E17887BBE2B0
      29F2951F2376B93D6FA11485FDF3AE31BC56312B54B02B29CCD487BEE79A38FD
      DD4DDE3AEEBD618F97BD13AE3B6462CCBC58F308EB0C701B8FB55CA7B12FC2BC
      FF4741212E7C70D1E6F531812A29F91AA8AA376D7DFC68BB6778D227CD3EB368
      6519F1083849804CBB31A6C9D8546F7A0647FCD79182598C1FB52B5ED3185C65
      9DF1E998C0051B971D3656209FE4FCBC7314AFE1A883C522C4CAFED63ECC6DA9
      37392B6A8D3F0F8E17E93DED1DABB4CE94AB971367F2D275397B36E46A716818
      4991541E8EF61A3FB3D02827738DF6715B3EDBBFBA1FA2FCA60588FB567FF289
      8CB9B1703780F0C6AA4549D4B6920C755EBA745F885DC29501279C6C1BA23BAC
      4E06E939F033D7AA776B6A081EEB8F5624010C2A4079139D5EABF9358E5B350A
      597C8921515998A55764A114701A4A6CEA510A98412960979785710F8362150F
      74DC70F9DA2C0E9EE705BB8FE19B1850BF3FE729E020C0F077E9C1AF8A280559
      8A92E8E59C004BFC013E25C0F16A922458A58CA4298A9844698C2BAE007B9103
      E24CCBABF75D0BEFFF93A1FF03EF2863D317CF73490000000049454E44AE4260
      82}
    Shadow = True
    TabOrder = 9
    Version = '2.1.1.9'
    OnClick = oBtn_Save_DepClick
    TMSStyle = 13
  end
  object oBtn_Ign_Dep: TAdvSmoothButton
    Left = 254
    Top = 416
    Width = 172
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
    Caption = 'Ignorar y Regresar'
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
    TabOrder = 10
    Version = '2.1.1.9'
    OnClick = oBtn_Ign_DepClick
    TMSStyle = 13
  end
  object oConn: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'CharacterSet=utf8mb4'
      'Database=fc_anti_bl'
      'Server=localhost'
      'User_Name=root')
    LoginPrompt = False
    Left = 137
    Top = 68
  end
  object oQry_De: TFDQuery
    Connection = oConn
    SQL.Strings = (
      'SELECT '
      
        ' activ_id, UCASE(activ_descripcion) AS activ_descripcion, activ_' +
        'riesgo, activ_riesgo_chg '
      'FROM mant_actividad_econ'
      ''
      '')
    Left = 189
    Top = 68
  end
  object oDs_De: TDataSource
    DataSet = oQry_De
    Left = 241
    Top = 68
  end
end
