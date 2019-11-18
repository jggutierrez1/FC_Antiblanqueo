object fGen_Scrn_Ind: TfGen_Scrn_Ind
  Left = 0
  Top = 0
  Caption = 'TABLERO DE INDICADORES'
  ClientHeight = 837
  ClientWidth = 712
  Color = clWhite
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 108
    Top = 8
    Width = 497
    Height = 48
    Caption = 'TABLEROD E INDICADORES'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 108
    Width = 90
    Height = 29
    Caption = 'Clientes:'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 51
    Top = 228
    Width = 63
    Height = 29
    Caption = 'PEP'#39's:'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 199
    Top = 310
    Width = 400
    Height = 29
    Caption = 'NIVELES DE RIESGO POR PROVINCIA'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object AdvSmoothExpanderPanel1: TAdvSmoothExpanderPanel
    Left = 128
    Top = 81
    Width = 257
    Height = 89
    Cursor = crDefault
    Caption.Text = 'ASOCIADOS NACIONALES'
    Caption.Location = plTopCenter
    Caption.HTMLFont.Charset = DEFAULT_CHARSET
    Caption.HTMLFont.Color = clWindowText
    Caption.HTMLFont.Height = -11
    Caption.HTMLFont.Name = 'Tahoma'
    Caption.HTMLFont.Style = []
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -16
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.TextAlignment = taCenter
    Fill.Color = 16445929
    Fill.ColorTo = 15587527
    Fill.ColorMirror = 15587527
    Fill.ColorMirrorTo = 16773863
    Fill.GradientType = gtVertical
    Fill.GradientMirrorType = gtVertical
    Fill.BorderColor = 14922381
    Fill.Rounding = 10
    Fill.ShadowOffset = 10
    Fill.Glow = gmNone
    Version = '1.1.1.0'
    TabOrder = 0
    ExpanderColor = 16445929
    ExpanderDownColor = 15587527
    ExpanderHoverColor = 11196927
    TMSStyle = 4
    OldHeight = 89.000000000000000000
    object CurvyEdit1: TCurvyEdit
      Left = 16
      Top = 24
      Width = 217
      Height = 49
      Align = alCustom
      TabOrder = 0
      TabStop = False
      Version = '1.2.1.2'
      Alignment = taCenter
      Controls = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -33
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = ''
      ParentFont = False
      Text = '12'
      object HtComboBox1: THtComboBox
        Left = -104
        Top = -48
        Width = 145
        Height = 43
        Style = csOwnerDrawVariable
        DropDownCount = 30
        TabOrder = 1
        Items.Strings = (
          'z')
        DropDownWidth = 145
      end
    end
  end
  object AdvSmoothExpanderPanel2: TAdvSmoothExpanderPanel
    Left = 399
    Top = 81
    Width = 265
    Height = 89
    Cursor = crDefault
    Caption.Text = 'ASOCIADOS EXTRANGEROS'
    Caption.Location = plTopCenter
    Caption.HTMLFont.Charset = DEFAULT_CHARSET
    Caption.HTMLFont.Color = clWindowText
    Caption.HTMLFont.Height = -11
    Caption.HTMLFont.Name = 'Tahoma'
    Caption.HTMLFont.Style = []
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -16
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.TextAlignment = taCenter
    Fill.Color = 16445929
    Fill.ColorTo = 15587527
    Fill.ColorMirror = 15587527
    Fill.ColorMirrorTo = 16773863
    Fill.GradientType = gtVertical
    Fill.GradientMirrorType = gtVertical
    Fill.BorderColor = 14922381
    Fill.Rounding = 10
    Fill.ShadowOffset = 10
    Fill.Glow = gmNone
    Version = '1.1.1.0'
    TabOrder = 1
    ExpanderColor = 16445929
    ExpanderDownColor = 15587527
    ExpanderHoverColor = 11196927
    TMSStyle = 4
    OldHeight = 89.000000000000000000
    object CurvyEdit2: TCurvyEdit
      Left = 16
      Top = 27
      Width = 217
      Height = 49
      Align = alCustom
      TabOrder = 0
      TabStop = False
      Version = '1.2.1.2'
      Alignment = taCenter
      Controls = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -33
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = ''
      ParentFont = False
      Text = '12'
    end
  end
  object AdvSmoothExpanderPanel3: TAdvSmoothExpanderPanel
    Left = 128
    Top = 201
    Width = 265
    Height = 89
    Cursor = crDefault
    Caption.Text = 'ASOCIADOS PEP NACIONALES'
    Caption.Location = plTopCenter
    Caption.HTMLFont.Charset = DEFAULT_CHARSET
    Caption.HTMLFont.Color = clWindowText
    Caption.HTMLFont.Height = -11
    Caption.HTMLFont.Name = 'Tahoma'
    Caption.HTMLFont.Style = []
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -16
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.TextAlignment = taCenter
    Fill.Color = 16445929
    Fill.ColorTo = 15587527
    Fill.ColorMirror = 15587527
    Fill.ColorMirrorTo = 16773863
    Fill.GradientType = gtVertical
    Fill.GradientMirrorType = gtVertical
    Fill.BorderColor = 14922381
    Fill.Rounding = 10
    Fill.ShadowOffset = 10
    Fill.Glow = gmNone
    Version = '1.1.1.0'
    TabOrder = 2
    ExpanderColor = 16445929
    ExpanderDownColor = 15587527
    ExpanderHoverColor = 11196927
    TMSStyle = 4
    OldHeight = 89.000000000000000000
    object CurvyEdit3: TCurvyEdit
      Left = 16
      Top = 27
      Width = 217
      Height = 49
      Align = alCustom
      TabOrder = 0
      TabStop = False
      Version = '1.2.1.2'
      Alignment = taCenter
      Controls = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -33
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = ''
      ParentFont = False
      Text = '12'
    end
  end
  object AdvSmoothExpanderPanel4: TAdvSmoothExpanderPanel
    Left = 399
    Top = 201
    Width = 265
    Height = 89
    Cursor = crDefault
    Caption.Text = 'ASOCIADOS PEP EXTRANJEROS'
    Caption.Location = plTopCenter
    Caption.HTMLFont.Charset = DEFAULT_CHARSET
    Caption.HTMLFont.Color = clWindowText
    Caption.HTMLFont.Height = -11
    Caption.HTMLFont.Name = 'Tahoma'
    Caption.HTMLFont.Style = []
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -16
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.TextAlignment = taCenter
    Fill.Color = 16445929
    Fill.ColorTo = 15587527
    Fill.ColorMirror = 15587527
    Fill.ColorMirrorTo = 16773863
    Fill.GradientType = gtVertical
    Fill.GradientMirrorType = gtVertical
    Fill.BorderColor = 14922381
    Fill.Rounding = 10
    Fill.ShadowOffset = 10
    Fill.Glow = gmNone
    Version = '1.1.1.0'
    TabOrder = 3
    ExpanderColor = 16445929
    ExpanderDownColor = 15587527
    ExpanderHoverColor = 11196927
    TMSStyle = 4
    OldHeight = 89.000000000000000000
    object CurvyEdit4: TCurvyEdit
      Left = 16
      Top = 27
      Width = 217
      Height = 49
      Align = alCustom
      TabOrder = 0
      TabStop = False
      Version = '1.2.1.2'
      Alignment = taCenter
      Controls = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -33
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = ''
      ParentFont = False
      Text = '12'
    end
  end
  object AdvSmoothTileList1: TAdvSmoothTileList
    Left = 88
    Top = 361
    Width = 536
    Height = 450
    AnimationFactor = 4.000000000000000000
    Fill.Color = clWhite
    Fill.ColorMirror = clNone
    Fill.ColorMirrorTo = clNone
    Fill.GradientType = gtSolid
    Fill.GradientMirrorType = gtSolid
    Fill.BorderColor = 6973542
    Fill.Rounding = 0
    Fill.ShadowOffset = 0
    Fill.Glow = gmNone
    Tiles = <
      item
        Content.Text = 'Tile 1xxx'
        ContentMaximized.Text = 'Description for Tile 1'
        DeleteIndicator = 'X'
        SubTiles = <>
        Tag = 0
      end
      item
        Content.Text = 'Tile 2'
        ContentMaximized.Text = 'Description for Tile 2'
        DeleteIndicator = 'X'
        SubTiles = <>
        Tag = 0
      end
      item
        Content.Text = 'Tile 3'
        ContentMaximized.Text = 'Description for Tile 3'
        DeleteIndicator = 'X'
        SubTiles = <>
        Tag = 0
      end>
    Rows = 2
    TileAppearance.LargeViewFill.Color = 12369084
    TileAppearance.LargeViewFill.ColorMirror = clNone
    TileAppearance.LargeViewFill.ColorMirrorTo = clNone
    TileAppearance.LargeViewFill.GradientType = gtSolid
    TileAppearance.LargeViewFill.GradientMirrorType = gtNone
    TileAppearance.LargeViewFill.Opacity = 180
    TileAppearance.LargeViewFill.BorderColor = 10987431
    TileAppearance.LargeViewFill.Rounding = 0
    TileAppearance.LargeViewFill.ShadowOffset = 0
    TileAppearance.LargeViewFill.Glow = gmNone
    TileAppearance.SmallViewFill.Color = 12369084
    TileAppearance.SmallViewFill.ColorMirror = clNone
    TileAppearance.SmallViewFill.ColorMirrorTo = clNone
    TileAppearance.SmallViewFill.GradientType = gtSolid
    TileAppearance.SmallViewFill.GradientMirrorType = gtNone
    TileAppearance.SmallViewFill.Opacity = 180
    TileAppearance.SmallViewFill.BorderColor = 10987431
    TileAppearance.SmallViewFill.Rounding = 0
    TileAppearance.SmallViewFill.ShadowOffset = 0
    TileAppearance.SmallViewFill.Glow = gmNone
    TileAppearance.SmallViewFillSelected.Color = 10655892
    TileAppearance.SmallViewFillSelected.ColorTo = 8749179
    TileAppearance.SmallViewFillSelected.ColorMirror = 8156785
    TileAppearance.SmallViewFillSelected.ColorMirrorTo = 6775131
    TileAppearance.SmallViewFillSelected.GradientType = gtVertical
    TileAppearance.SmallViewFillSelected.GradientMirrorType = gtVertical
    TileAppearance.SmallViewFillSelected.BorderColor = 6973542
    TileAppearance.SmallViewFillSelected.Rounding = 0
    TileAppearance.SmallViewFillSelected.ShadowOffset = 0
    TileAppearance.SmallViewFillSelected.Glow = gmNone
    TileAppearance.SmallViewFillDisabled.Color = clGray
    TileAppearance.SmallViewFillDisabled.ColorMirror = clNone
    TileAppearance.SmallViewFillDisabled.ColorMirrorTo = clNone
    TileAppearance.SmallViewFillDisabled.GradientType = gtSolid
    TileAppearance.SmallViewFillDisabled.GradientMirrorType = gtSolid
    TileAppearance.SmallViewFillDisabled.BorderColor = 10987431
    TileAppearance.SmallViewFillDisabled.Rounding = 0
    TileAppearance.SmallViewFillDisabled.ShadowOffset = 0
    TileAppearance.SmallViewFillDisabled.Glow = gmNone
    TileAppearance.SmallViewFillHover.Color = 12369084
    TileAppearance.SmallViewFillHover.ColorMirror = clNone
    TileAppearance.SmallViewFillHover.ColorMirrorTo = clNone
    TileAppearance.SmallViewFillHover.GradientType = gtSolid
    TileAppearance.SmallViewFillHover.GradientMirrorType = gtNone
    TileAppearance.SmallViewFillHover.Opacity = 220
    TileAppearance.SmallViewFillHover.BorderColor = 10987431
    TileAppearance.SmallViewFillHover.Rounding = 0
    TileAppearance.SmallViewFillHover.ShadowOffset = 0
    TileAppearance.SmallViewFillHover.Glow = gmNone
    TileAppearance.LargeViewFont.Charset = DEFAULT_CHARSET
    TileAppearance.LargeViewFont.Color = clWindowText
    TileAppearance.LargeViewFont.Height = -11
    TileAppearance.LargeViewFont.Name = 'Tahoma'
    TileAppearance.LargeViewFont.Style = []
    TileAppearance.SmallViewFont.Charset = DEFAULT_CHARSET
    TileAppearance.SmallViewFont.Color = clWindowText
    TileAppearance.SmallViewFont.Height = -11
    TileAppearance.SmallViewFont.Name = 'Tahoma'
    TileAppearance.SmallViewFont.Style = []
    TileAppearance.SmallViewFontSelected.Charset = DEFAULT_CHARSET
    TileAppearance.SmallViewFontSelected.Color = clWindowText
    TileAppearance.SmallViewFontSelected.Height = -11
    TileAppearance.SmallViewFontSelected.Name = 'Tahoma'
    TileAppearance.SmallViewFontSelected.Style = []
    TileAppearance.SmallViewFontDisabled.Charset = DEFAULT_CHARSET
    TileAppearance.SmallViewFontDisabled.Color = clWindowText
    TileAppearance.SmallViewFontDisabled.Height = -11
    TileAppearance.SmallViewFontDisabled.Name = 'Tahoma'
    TileAppearance.SmallViewFontDisabled.Style = []
    TileAppearance.SmallViewFontHover.Charset = DEFAULT_CHARSET
    TileAppearance.SmallViewFontHover.Color = clWindowText
    TileAppearance.SmallViewFontHover.Height = -11
    TileAppearance.SmallViewFontHover.Name = 'Tahoma'
    TileAppearance.SmallViewFontHover.Style = []
    TileAppearance.StatusIndicatorAppearance.Fill.Color = clRed
    TileAppearance.StatusIndicatorAppearance.Fill.ColorMirror = clNone
    TileAppearance.StatusIndicatorAppearance.Fill.ColorMirrorTo = clNone
    TileAppearance.StatusIndicatorAppearance.Fill.GradientType = gtSolid
    TileAppearance.StatusIndicatorAppearance.Fill.GradientMirrorType = gtSolid
    TileAppearance.StatusIndicatorAppearance.Fill.BorderColor = clGray
    TileAppearance.StatusIndicatorAppearance.Fill.Rounding = 0
    TileAppearance.StatusIndicatorAppearance.Fill.ShadowOffset = 0
    TileAppearance.StatusIndicatorAppearance.Fill.Glow = gmNone
    TileAppearance.StatusIndicatorAppearance.Font.Charset = DEFAULT_CHARSET
    TileAppearance.StatusIndicatorAppearance.Font.Color = clWhite
    TileAppearance.StatusIndicatorAppearance.Font.Height = -11
    TileAppearance.StatusIndicatorAppearance.Font.Name = 'Tahoma'
    TileAppearance.StatusIndicatorAppearance.Font.Style = []
    TileAppearance.DeleteIndicatorAppearance.Fill.Color = clBlack
    TileAppearance.DeleteIndicatorAppearance.Fill.ColorMirror = clNone
    TileAppearance.DeleteIndicatorAppearance.Fill.ColorMirrorTo = clNone
    TileAppearance.DeleteIndicatorAppearance.Fill.GradientType = gtSolid
    TileAppearance.DeleteIndicatorAppearance.Fill.GradientMirrorType = gtSolid
    TileAppearance.DeleteIndicatorAppearance.Fill.BorderColor = clWhite
    TileAppearance.DeleteIndicatorAppearance.Fill.Rounding = 0
    TileAppearance.DeleteIndicatorAppearance.Fill.ShadowOffset = 0
    TileAppearance.DeleteIndicatorAppearance.Fill.Glow = gmNone
    TileAppearance.DeleteIndicatorAppearance.Font.Charset = DEFAULT_CHARSET
    TileAppearance.DeleteIndicatorAppearance.Font.Color = clWhite
    TileAppearance.DeleteIndicatorAppearance.Font.Height = -11
    TileAppearance.DeleteIndicatorAppearance.Font.Name = 'Tahoma'
    TileAppearance.DeleteIndicatorAppearance.Font.Style = []
    Header.Fill.Color = 10655892
    Header.Fill.ColorTo = 8749179
    Header.Fill.ColorMirror = 8156785
    Header.Fill.ColorMirrorTo = 6775131
    Header.Fill.GradientType = gtVertical
    Header.Fill.GradientMirrorType = gtVertical
    Header.Fill.BorderColor = 6973542
    Header.Fill.Rounding = 0
    Header.Fill.ShadowOffset = 0
    Header.Fill.Glow = gmNone
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'Tahoma'
    Header.Font.Style = []
    Footer.Fill.Color = 10655892
    Footer.Fill.ColorTo = 8749179
    Footer.Fill.ColorMirror = 8156785
    Footer.Fill.ColorMirrorTo = 6775131
    Footer.Fill.GradientType = gtVertical
    Footer.Fill.GradientMirrorType = gtVertical
    Footer.Fill.BorderColor = 6973542
    Footer.Fill.Rounding = 0
    Footer.Fill.ShadowOffset = 0
    Footer.Fill.Glow = gmNone
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -11
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    TabOrder = 4
    DoubleBuffered = True
    TMSStyle = 0
  end
  object HtTableBorderCombo1: THtTableBorderCombo
    Left = 64
    Top = 160
    Width = 60
    Height = 21
    Style = csOwnerDrawVariable
    DropDownCount = 30
    ItemHeight = 192
    TabOrder = 5
    TabStop = False
    Items.Strings = (
      'z')
    HTML.Strings = (
      
        '<style>body {min-height: 192px; font-size: 13px } .x {border: do' +
        'tted silver 1px; width:20px; color: gray; height: 20px; position' +
        ': absolute;}.x:hover, .lt:hover, .ma:hover, table:hover td, .mx:' +
        'hover {background: #ffea70; border-color: darkorange; color: dar' +
        'korange!important}.x:active, .lt:active, .ma:active table:active' +
        ' {background: #ffef90; }.ma {position: absolute; border: solid s' +
        'ilver 1px; color: gray}.mx {position: absolute; color: gray; bac' +
        'kground: #eee} .mx div {padding: 1px}.b {border: solid silver 1p' +
        'x; background: white;}.lt {width: 60px; height: 10px; position: ' +
        'absolute; border-left: none; border-top: none; border-right: non' +
        'e; border-color: silver; border-width: 1px;}.s  {box-shadow: 0 0' +
        ' 1 #ccc}.w {height: 14px; font-size: 10px; border: solid silver ' +
        '1px; text-align: center; padding: 2px 0px 0px 0px}.x, .ma {backg' +
        'round: linear-gradient(to bottom, #fff, #f5f5fe 50%, e0e0ef 100%' +
        '); }#all td {border: solid silver 1px; width: 12px; height: 10px' +
        ';}#none td {border: dotted silver 1px;width: 12px; height: 10px;' +
        '}table {boder-collapse: collapse; position: absolute; }#left {bo' +
        'rder-left: solid silver 2px;}#top {border-top: solid silver 2px;' +
        '}#right {border-right: solid silver 2px;}#bottom {border-bottom:' +
        ' solid silver 2px;}#all:checked {border: solid darkorange 2px}#n' +
        'one:checked {border: dotted darkorange 1px}#left:checked {border' +
        '-left: solid darkorange 2px;}#top:checked {border-top: solid dar' +
        'korange 2px;}#right:checked {border-right: solid darkorange 2px;' +
        '}#bottom:checked {border-bottom: solid darkorange 2px;}.lt:check' +
        'ed {border-color: darkorange}.ma:checked, .mx:checked, .mx:check' +
        'ed div, .w:checked {border-color: darkorange; color: darkorange}' +
        '.colors div {float: left; border: solid silver 1px; width: 12px;' +
        ' height: 12px; margin: 0px 2px;}'
      
        ' .colors div:hover {z-index: 2; border-color: orange; aborder-wi' +
        'dth: 2px; box-shadow: 0px 0px 2px orange; }'
      ' .colors2 div {margin-top: -1px; margin-bottom: -1px}'
      ' .colors2 {clear: both}'
      
        ' .title {clear: both; background: #dde7ee; color: navy; font-siz' +
        'e: 13px; font-family: '#39'Arial'#39'; padding: 2px 3px; margin: 2px 0px' +
        '}'
      
        ' .auto {color: navy; font-size: 13px; font-family: '#39'Arial'#39'; padd' +
        'ing: 3px 3px}'
      
        ' .auto:hover {background: linear-gradient(to bottom, #fff6d4, #f' +
        'fe08c)}'
      
        ' </style><div id="s0" ls="2" w="0" class="lt" style="border-bott' +
        'om-style: dotted; left: 122px; top: 5px;" ></div><div id="s1" ls' +
        '="2" w="1" class="lt" style="border-bottom-style: solid; left: 1' +
        '22px; top: 20px;" ></div><div id="s2" ls="2" w="2" class="lt" st' +
        'yle="border-bottom-style: solid; border-width: 2px; left: 122px;' +
        ' top: 35px;" ></div><div id="s3" ls="2" w="3" class="lt" style="' +
        'border-bottom-style: solid; border-width: 3px; left: 122px; top:' +
        ' 50px;" ></div><div id="s4" ls="2" w="4" class="lt" style="borde' +
        'r-bottom-style: solid; border-width: 4px; left: 122px; top: 65px' +
        ';" ></div><div id="s5" ls="2" w="5" class="lt" style="border-bot' +
        'tom-style: solid; border-width: 5px; left: 122px; top: 80px;" ><' +
        '/div><div id=w50 ww="50" class="x s w" style="width: 50px; left:' +
        ' 10px; top: 10px;">50%</div><div id=w75 ww="75" class="x s w" st' +
        'yle="width: 75px; left: 10px; top: 35px;">75%</div><div id=w100 ' +
        'ww="100" class="x s w" style="width: 100px; left: 10px; top: 60p' +
        'x;">100%</div><div id=wauto ww="0" class="x s w" style="width: 7' +
        '0px; left: 10px; top: 85px;">Auto</div><div id="m1" p=0 class="m' +
        'a" style="padding: -2px 2px; left: 11px; top: 126px;" >A</div><d' +
        'iv id="m2" p=2 class="ma" style="padding: -1px 3px; left: 34px; ' +
        'top: 124px;" >A</div><div id="m3" p=5 class="ma" style="padding:' +
        ' 1px 5px; left: 60px; top: 120px;" >A</div><div id="m4" p=8 clas' +
        's="ma" style="padding: 3px 6px; left: 90px; top: 116px;" >A</div' +
        '><div id="m5" p=12 class="ma" style="padding: 6px 8px; left: 122' +
        'px; top: 110px;" >A</div><div id="pp" class="ma s" style="color:' +
        ' gray; padding: 0px 5px; left: 159px; top: 112px;border: none; b' +
        'order-radius: 9px;font-size: 18px" >+</div><div id="r1" m=0 clas' +
        's="mx" style="left: 11px; top: 155px;" ><div class="b" style="ma' +
        'rgin: 0px;">M</div></div><div id="r2" m=2 class="mx" style="left' +
        ': 34px; top: 153px; " ><div class="b" style="margin: 2px">M</div' +
        '></div><div id="r2" m=4 class="mx" style="left: 60px; top: 151px' +
        '; " ><div class="b" style="margin: 4px">M</div></div><div id="r2' +
        '" m=6 class="mx" style="left: 89px; top: 149px; " ><div class="b' +
        '" style="margin: 6px">M</div></div><div id="r2" m=8 class="mx" s' +
        'tyle="left: 121px; top: 147px; " ><div class="b" style="margin: ' +
        '8px">M</div></div><div id="mp" class="ma s" style="color: gray; ' +
        'padding: 0px 5px; left: 159px; top: 153px;border: none; border-r' +
        'adius: 9px;font-size: 18px" >+</div><div style="border-left: sol' +
        'id silver 1px; padding-left: 10px; position: absolute; left: 190' +
        'px; top:0; width: 200px; height: 190px;"><div class="colors auto' +
        '" id="auto"><div style="width: 14px; height: 14px; background-co' +
        'lor: #000"/>Auto</div>'
      '<div class="title">Theme colors</div>'
      '<div class="colors colors2">'
      ' <div style="background-color: #FFFFFF" id="c"></div>'
      ' <div style="background-color: #000000" id="c"></div>'
      ' <div style="background-color: #EEECE1" id="c"></div>'
      ' <div style="background-color: #1F497D" id="c"></div>'
      ' <div style="background-color: #4F81BD" id="c"></div>'
      ' <div style="background-color: #C0504D" id="c"></div>'
      ' <div style="background-color: #9BBB59" id="c"></div>'
      ' <div style="background-color: #8064A2" id="c"></div>'
      ' <div style="background-color: #4BACC6" id="c"></div>'
      ' <div style="background-color: #F79646" id="c"></div>'
      ' </div>'
      '<div class="colors colors2">'
      ' <div style="background-color: #F2F2F2" id="c"/>'
      ' <div style="background-color: #7F7F7F" id="c"/>'
      ' <div style="background-color: #DDD9C3" id="c"/>'
      ' <div style="background-color: #C6D9F0" id="c"/>'
      ' <div style="background-color: #DBE5F1" id="c"/>'
      ' <div style="background-color: #F2DCDB" id="c"/>'
      ' <div style="background-color: #EBF1DD" id="c"/>'
      ' <div style="background-color: #E5E0EC" id="c"/>'
      ' <div style="background-color: #DBEEF3" id="c"/>'
      ' <div style="background-color: #FDEADA" id="c"/>'
      '</div>'
      '<div class="colors colors2">'
      ' <div style="background-color: #D8D8D8" id="c"/>'
      ' <div style="background-color: #595959" id="c"/>'
      ' <div style="background-color: #C4BD97" id="c"/>'
      ' <div style="background-color: #8DB3E2" id="c"/>'
      ' <div style="background-color: #B8CCE4" id="c"/>'
      ' <div style="background-color: #E5B9B7" id="c"/>'
      ' <div style="background-color: #D7E3BC" id="c"/>'
      ' <div style="background-color: #CCC1D9" id="c"/>'
      ' <div style="background-color: #B7DDE8" id="c"/>'
      ' <div style="background-color: #FBD5B5" id="c"/>'
      '</div>'
      '<div class="colors colors2">'
      ' <div style="background-color: #BFBFBF" id="c"/>'
      ' <div style="background-color: #3F3F3F" id="c"/>'
      ' <div style="background-color: #938953" id="c"/>'
      ' <div style="background-color: #548DD4" id="c"/>'
      ' <div style="background-color: #95B3D7" id="c"/>'
      ' <div style="background-color: #D99694" id="c"/>'
      ' <div style="background-color: #C3D69B" id="c"/>'
      ' <div style="background-color: #B2A2C7" id="c"/>'
      ' <div style="background-color: #92CDDC" id="c"/>'
      ' <div style="background-color: #FAC08F" id="c"/>'
      '</div>'
      '<div class="colors colors2">'
      ' <div style="background-color: #A5A5A5" id="c"/>'
      ' <div style="background-color: #262626" id="c"/>'
      ' <div style="background-color: #494429" id="c"/>'
      ' <div style="background-color: #17365D" id="c"/>'
      ' <div style="background-color: #366092" id="c"/>'
      ' <div style="background-color: #953734" id="c"/>'
      ' <div style="background-color: #76923C" id="c"/>'
      ' <div style="background-color: #5F497A" id="c"/>'
      ' <div style="background-color: #31859B" id="c"/>'
      ' <div style="background-color: #E36C09" id="c"/>'
      '</div>'
      '<div class="colors colors2">'
      ' <div style="background-color: #7F7F7F" id="c"/>'
      ' <div style="background-color: #0C0C0C" id="c"/>'
      ' <div style="background-color: #1D1B10" id="c"/>'
      ' <div style="background-color: #0F243E" id="c"/>'
      ' <div style="background-color: #244061" id="c"/>'
      ' <div style="background-color: #632423" id="c"/>'
      ' <div style="background-color: #4F6128" id="c"/>'
      ' <div style="background-color: #3F3151" id="c"/>'
      ' <div style="background-color: #205867" id="c"/>'
      ' <div style="background-color: #974806" id="c"/>'
      '</div>'
      '<div class="title">Standard colors</div>'
      '<div class="colors colors2">'
      ' <div style="background-color: #C00000" id="c"/>'
      ' <div style="background-color: #FF0000" id="c"/>'
      ' <div style="background-color: #FFC000" id="c"/>'
      ' <div style="background-color: #FFFF00" id="c"/>'
      ' <div style="background-color: #92D050" id="c"/>'
      ' <div style="background-color: #00B050" id="c"/>'
      ' <div style="background-color: #00B0F0" id="c"/>'
      ' <div style="background-color: #0070C0" id="c"/>'
      ' <div style="background-color: #002060" id="c"/>'
      ' <div style="background-color: #7030C0" id="c"/>'
      ' <br/></div>'
      
        '<div class="auto colors2" id="other" style="border: solid #eee 1' +
        'px; border-radius: 3px">Other colors...</div></div>')
    ComboHTML.Strings = (
      
        '<style>table {border-collapse: collapse; margin: 3px 3px;} td {b' +
        'order-color: gray}</style><table border="1" cellpadding="2"><tr>' +
        '<td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><' +
        '/tr></table>')
    DropDownWidth = 400
    LivePreview = False
  end
end
