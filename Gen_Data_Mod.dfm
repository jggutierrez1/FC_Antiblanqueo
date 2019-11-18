object dmGen_Data_Mod: TdmGen_Data_Mod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 850
  Width = 566
  object odPais: TDataSource
    DataSet = otPais
    Left = 421
    Top = 730
  end
  object otPais: TFDTable
    IndexFieldNames = 'autoin'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'mant_paises'
    TableName = 'mant_paises'
    Left = 474
    Top = 731
  end
  object odProv: TDataSource
    DataSet = otProv
    Left = 421
    Top = 679
  end
  object otProv: TFDTable
    IndexName = 'prov_id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'mant_provincias'
    TableName = 'mant_provincias'
    Left = 474
    Top = 680
  end
  object odDist: TDataSource
    DataSet = otDist
    Left = 421
    Top = 629
  end
  object otDist: TFDTable
    IndexName = 'dist_prov_id'
    MasterSource = odProv
    MasterFields = 'prov_id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'mant_distritos'
    TableName = 'mant_distritos'
    Left = 474
    Top = 630
  end
  object odCorr: TDataSource
    DataSet = otCorr
    Left = 421
    Top = 579
  end
  object otCorr: TFDTable
    IndexName = 'mantc_distr_id'
    MasterSource = odDist
    MasterFields = 'dist_id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'mant_corregimientos'
    TableName = 'mant_corregimientos'
    Left = 474
    Top = 580
  end
  object odTipEmp: TDataSource
    DataSet = otTipEmp
    Left = 421
    Top = 528
  end
  object otTipEmp: TFDTable
    IndexFieldNames = 'tipem_autoin'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'mant_tipos_empleados'
    TableName = 'mant_tipos_empleados'
    Left = 474
    Top = 530
  end
  object odActvEco: TDataSource
    DataSet = otActvEco
    Left = 421
    Top = 478
  end
  object otActvEco: TFDTable
    IndexFieldNames = 'activ_autoin'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'mant_actividad_econ'
    TableName = 'mant_actividad_econ'
    Left = 474
    Top = 480
  end
  object odTipVivi: TDataSource
    DataSet = otTipVivi
    Left = 421
    Top = 428
  end
  object otTipVivi: TFDTable
    IndexFieldNames = 'tipv_autoin'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'mant_tipos_viviendas'
    TableName = 'mant_tipos_viviendas'
    Left = 474
    Top = 430
  end
  object odEstLab: TDataSource
    DataSet = otEstLab
    Left = 421
    Top = 377
  end
  object otEstLab: TFDTable
    IndexFieldNames = 'cteest_autoin'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'mant_clientes_estados_laboral'
    TableName = 'mant_clientes_estados_laboral'
    Left = 474
    Top = 379
  end
  object odTipPla: TDataSource
    DataSet = otTipPla
    Left = 421
    Top = 327
  end
  object otTipPla: TFDTable
    IndexFieldNames = 'tplan_autoin'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'mant_tipo_planillas'
    TableName = 'mant_tipo_planillas'
    Left = 474
    Top = 329
  end
  object odConcI: TDataSource
    DataSet = otConcI
    Left = 421
    Top = 277
  end
  object otConcI: TFDTable
    IndexFieldNames = 'conci_autoin'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'mant_conceptos_ingresos'
    TableName = 'mant_conceptos_ingresos'
    Left = 474
    Top = 279
  end
  object odFormP: TDataSource
    DataSet = otFormP
    Left = 421
    Top = 226
  end
  object otFormP: TFDTable
    IndexFieldNames = 'autoinc'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'mant_forma_pag'
    TableName = 'mant_forma_pag'
    Left = 474
    Top = 229
  end
  object odCte_OIng: TDataSource
    DataSet = oQry_Cte_OIng
    Left = 226
    Top = 371
  end
  object oQry_Cte_OIng: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      'cliente_origen_ingresos.`id_origen_ingresos`,'
      'cliente_origen_ingresos.`id_cliente`,'
      'cliente_origen_ingresos.`concepto` '#9#9#9'AS Conc_Cod,'
      'mant_conceptos_ingresos.conci_descripcion'#9'AS Conc_Des,'
      'cliente_origen_ingresos.`cod_forma` '#9#9'AS Formap_Cod,'
      'mant_forma_pag.`fpag_nombre`'#9#9#9#9#9'AS Formap_Des,'
      'cliente_origen_ingresos.`cod_freq`'#9#9#9'AS Freqpa_Cod,'
      'mant_frec_pagos.`fpnombre` '#9#9#9#9#9'AS Freqpa_Des,'
      'cliente_origen_ingresos.`monto_fijo`,'
      'cliente_origen_ingresos.`monto_variable`,'
      'cliente_origen_ingresos.`origen_fondo`'
      'FROM cliente_origen_ingresos'
      
        'LEFT JOIN mant_forma_pag  ON (cliente_origen_ingresos.`cod_forma' +
        '` = mant_forma_pag.`fpag_codigo`)'
      
        'LEFT JOIN mant_frec_pagos ON (cliente_origen_ingresos.`cod_freq`' +
        '  = mant_frec_pagos.`fpcodigo`)'
      
        'LEFT JOIN mant_conceptos_ingresos ON (cliente_origen_ingresos.`c' +
        'oncepto`  = mant_conceptos_ingresos.`conci_id`)'
      
        'WHERE id_cliente="05971" ORDER BY id_cliente, concepto, ultima_f' +
        'echa_actualizacion'
      '')
    Left = 306
    Top = 370
  end
  object odCte_Tran: TDataSource
    DataSet = oQry_Cte_Tran
    Left = 226
    Top = 427
  end
  object oQry_Cte_Tran: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      #9'cliente_transacciones.`id_cliente_transacciones`,'
      #9'cliente_transacciones.`id_cliente`,'
      #9'cliente_transacciones.`monto_transaccion`,'
      ' '#9'cliente_transacciones.`monto_transaccion_retiro`,'
      #9'cliente_transacciones.`numero_transaccion`,'
      #9'cliente_transacciones.`cod_tipo_tran`,'
      #9'mant_tipo_trans.`ttnombre` AS Des_tipo_tran,'
      #9'cliente_transacciones.`cod_forma`,'
      #9'mant_forma_pag.`fpag_nombre`  AS Des_forma,'
      #9'cliente_transacciones.`monto_retiro`,'
      #9'cliente_transacciones.`clasificacion_patrimonio`,'
      #9'cliente_transacciones.`ultima_fecha_actualizacion`,'
      #9'cliente_transacciones.`ultimo_usuario_que_actualizo`,'
      #9'cliente_transacciones.`cod_freq`,'
      #9'mant_frec_pagos.`fpnombre` AS Des_freq,'
      #9'cliente_transacciones.`flag_tmp`,'
      #9'cliente_transacciones.`flag_tmp_chg`'
      'FROM cliente_transacciones'
      
        'LEFT JOIN mant_forma_pag   ON (cliente_transacciones.`cod_forma`' +
        ' = mant_forma_pag.`fpag_codigo`)'
      
        'LEFT JOIN mant_frec_pagos  ON (cliente_transacciones.`cod_freq` ' +
        ' = mant_frec_pagos.`fpcodigo`)'
      
        'LEFT JOIN mant_tipo_trans  ON (cliente_transacciones.`cod_tipo_t' +
        'ran`  = mant_tipo_trans.`ttcodigo`)'
      
        'WHERE id_cliente="05971" ORDER BY id_cliente, tipo_transaccion, ' +
        'ultima_fecha_actualizacion')
    Left = 306
    Top = 426
  end
  object odCte_InfL: TDataSource
    DataSet = oQry_Cte_InfL
    Left = 226
    Top = 483
  end
  object oQry_Cte_InfL: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM cliente_info_laboral ORDER BY id_cliente LIMIT 10')
    Left = 306
    Top = 481
  end
  object odCte_Depe: TDataSource
    DataSet = oQry_Cte_Depe
    Left = 226
    Top = 539
  end
  object oQry_Cte_Depe: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT * FROM cliente_dependientes ORDER BY apellido,nombre LIMI' +
        'T 10')
    Left = 306
    Top = 537
  end
  object odCte_Resid: TDataSource
    DataSet = oQry_Cte_Resid
    Left = 226
    Top = 595
  end
  object oQry_Cte_Resid: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM cliente_residencia ORDER BY id_cliente LIMIT 10')
    Left = 306
    Top = 592
  end
  object oDClientes: TDataSource
    DataSet = otClientes
    Left = 226
    Top = 651
  end
  object otClientes: TFDTable
    Filtered = True
    Filter = 'id_cliente='#39'00017'#39
    IndexFieldNames = 'autoin'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'clientes'
    TableName = 'clientes'
    Left = 306
    Top = 648
  end
  object oD_Ultimos: TDataSource
    DataSet = oQry_Ultimos
    Left = 226
    Top = 707
  end
  object oQry_Ultimos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      'id_cliente, '
      'UCASE(nombre)      AS nombre   , '
      ' UCASE(apellido)    AS apellido  , '
      'UCASE(identificacion)  AS identificacion, '
      'UCASE(seguro_social) AS seguro_social,'
      'fecha_ingreso_cooperativa, '
      'ultima_fecha_actualizacion'
      'FROM clientes '
      'ORDER BY ultima_fecha_actualizacion DESC'
      'LIMIT 50')
    Left = 306
    Top = 704
  end
  object oDbf_Qry: TFDQuery
    SQL.Strings = (
      'SELECT * FROM numetran')
    Left = 306
    Top = 763
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'CharacterSet=utf8mb4'
      'Database=fc_anti_bl'
      'Server=localhost'
      'User_Name=root')
    FetchOptions.AssignedValues = [evCursorKind]
    FormatOptions.AssignedValues = [fvSE2Null, fvStrsTrim2Len]
    FormatOptions.StrsEmpty2Null = True
    FormatOptions.StrsTrim2Len = True
    LoginPrompt = False
    Left = 50
    Top = 482
  end
  object odFrecP: TDataSource
    DataSet = otFrecP
    Left = 421
    Top = 176
  end
  object otFrecP: TFDTable
    IndexFieldNames = 'fpautoin'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'mant_frec_pagos'
    TableName = 'mant_frec_pagos'
    Left = 474
    Top = 179
  end
  object oDbf_Cnn: TFDConnection
    Params.Strings = (
      'DataSource=COMPUCAS_DBF'
      'DriverID=ODBC')
    LoginPrompt = False
    Left = 48
    Top = 400
  end
  object odConcIng: TDataSource
    DataSet = otConcIng
    Left = 421
    Top = 126
  end
  object otConcIng: TFDTable
    IndexFieldNames = 'conci_autoin'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'mant_conceptos_ingresos'
    TableName = 'mant_conceptos_ingresos'
    Left = 474
    Top = 129
  end
  object odCte_OFon: TDataSource
    DataSet = oQry_Cte_OFon
    Left = 226
    Top = 315
  end
  object oQry_Cte_OFon: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT * FROM cliente_origen_fondos WHERE ofon_id_cliente="05971' +
        '" ORDER BY ofon_id_cliente')
    Left = 306
    Top = 315
  end
  object odTipTr: TDataSource
    DataSet = otTipTr
    Left = 421
    Top = 70
  end
  object otTipTr: TFDTable
    Filtered = True
    Filter = 'ttinactivo=0'
    IndexFieldNames = 'ttautoin'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'mant_tipo_trans'
    TableName = 'mant_tipo_trans'
    Left = 474
    Top = 73
  end
  object oD_Cte_Ref1: TDataSource
    DataSet = oQry_Cte_Ref1
    Left = 226
    Top = 267
  end
  object oQry_Cte_Ref1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      '  cliente_referencias.*,'
      '  mant_actividad_econ.activ_descripcion AS activ_des'
      'FROM cliente_referencias'
      
        'LEFT JOIN mant_actividad_econ  ON (cliente_referencias.actividad' +
        '_comercial = mant_actividad_econ.activ_id)'
      'WHERE cliente_referencias.id_cliente="05971"'
      
        'ORDER BY cliente_referencias.id_cliente, cliente_referencias.tip' +
        'o')
    Left = 306
    Top = 267
  end
  object oD_Cte_RefB: TDataSource
    DataSet = oQry_Cte_RefB
    Left = 226
    Top = 211
  end
  object oQry_Cte_RefB: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      'cliente_referencias_bancarias.*,'
      'mant_bancos.banc_descripcion AS Des_banco'
      'FROM cliente_referencias_bancarias'
      
        'LEFT JOIN mant_bancos  ON (cliente_referencias_bancarias.`id_ban' +
        'co`    = mant_bancos.`banc_id`)'
      '  WHERE cliente_referencias_bancarias.id_cliente="2527-1" '
      '')
    Left = 306
    Top = 211
  end
  object odBanc: TDataSource
    DataSet = otBanc
    Left = 421
    Top = 22
  end
  object otBanc: TFDTable
    Filtered = True
    Filter = 'banc_inactivo=0'
    IndexName = 'banc_descripcion'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'mant_bancos'
    TableName = 'mant_bancos'
    Left = 474
    Top = 25
  end
  object otTipo_refe: TMemTableEh
    Active = True
    FieldDefs = <
      item
        Name = 'id_Tipo'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'Nombre'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 16
    Top = 176
    object otTipo_refeid_Tipo: TIntegerField
      FieldName = 'id_Tipo'
    end
    object otTipo_refeNombre: TStringField
      FieldName = 'Nombre'
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object id_Tipo: TMTNumericDataFieldEh
          FieldName = 'id_Tipo'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
        object Nombre: TMTStringDataFieldEh
          FieldName = 'Nombre'
          StringDataType = fdtStringEh
        end
      end
      object RecordsList: TRecordsListEh
        Data = (
          (
            2
            'Personal')
          (
            1
            'Comercial'))
      end
    end
  end
  object oD_Cte_FR: TDataSource
    DataSet = oQry_Cte_FR
    Left = 226
    Top = 155
  end
  object oQry_Cte_FR: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      'cliente_factores_riesgo.*,'
      'mant_factores_riesgos_v2.descripcion'
      'FROM cliente_factores_riesgo'
      
        'INNER JOIN mant_factores_riesgos_v2 ON cliente_factores_riesgo.c' +
        'odigo_factores_riesgo=mant_factores_riesgos_v2.codigo'
      
        'WHERE (mant_factores_riesgos_v2.selecion_automatica=0) AND clien' +
        'te_factores_riesgo.id_cliente='#39'2527-1'#39
      'ORDER BY cliente_factores_riesgo.codigo_factores_riesgo')
    Left = 306
    Top = 155
  end
  object otFacR: TFDTable
    Filtered = True
    Filter = 'selecion_automatica=0'
    IndexFieldNames = 'autoin'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'mant_factores_riesgos_v2'
    TableName = 'mant_factores_riesgos_v2'
    Left = 474
    Top = 787
  end
  object odFacR: TDataSource
    DataSet = otFacR
    Left = 413
    Top = 786
  end
  object odTipDe: TDataSource
    DataSet = otTipDe
    Left = 37
    Top = 30
  end
  object otTipDe: TFDTable
    Filtered = True
    Filter = 'desc_inactivo=0'
    IndexName = 'desc_nombre'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'mant_tipo_descuento'
    TableName = 'mant_tipo_descuento'
    Left = 90
    Top = 33
  end
  object oD_Cte_De: TDataSource
    DataSet = oQry_Cte_De
    Left = 226
    Top = 107
  end
  object oQry_Cte_De: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      'cd.*,'
      'td.desc_nombre AS Nom_Tipo_Desc,'
      'fp.fpnombre'#9#9'AS Nom_Freq_Desc'
      'FROM cliente_descuentos cd'
      'LEFT JOIN mant_frec_pagos '#9#9'fp ON cd.freq_descuento= fp.fpcodigo'
      
        'LEFT JOIN mant_tipo_descuento td ON cd.tipo_descuento= td.desc_c' +
        'odigo'
      'ORDER BY cd.autoin'
      ''
      ''
      ''
      '')
    Left = 306
    Top = 107
  end
  object odCte_Cat: TDataSource
    DataSet = otCte_Cat
    Left = 37
    Top = 94
  end
  object otCte_Cat: TFDTable
    Filtered = True
    Filter = 'cat_inactiva=0'
    IndexName = 'cat_nombre'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'clientes_categoria'
    TableName = 'clientes_categoria'
    Left = 98
    Top = 97
  end
end
