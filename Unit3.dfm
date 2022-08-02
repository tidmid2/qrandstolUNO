object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 511
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 22
    Top = 58
    Width = 37
    Height = 16
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = False
  end
  object DBGrid1: TDBGrid
    Left = 22
    Top = 80
    Width = 553
    Height = 433
    ParentCustomHint = False
    BiDiMode = bdLeftToRight
    Ctl3D = True
    DataSource = DataSource1
    DrawingStyle = gdsClassic
    FixedColor = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ImeMode = imSAlpha
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgMultiSelect]
    ParentBiDiMode = False
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1057#1090#1072#1085#1094#1080#1080
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME_1'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1079#1072#1083#1072
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID'
        Title.Caption = 'ID-'#1089#1090#1086#1083#1072
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME_2'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1057#1090#1086#1083#1072
        Width = 131
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 22
    Top = 8
    Width = 129
    Height = 41
    Caption = #1057#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' '#1089#1089#1099#1083#1082#1091
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 408
    Top = 8
    Width = 153
    Height = 41
    Caption = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' Qr-'#1082#1086#1076
    TabOrder = 2
    OnClick = Button2Click
  end
  object btncopy: TButton
    Left = 157
    Top = 12
    Width = 81
    Height = 33
    Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 3
    OnClick = btncopyClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\UNO\Database\RDB.AKS'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Port=127.0.0.1'
      'CharacterSet=UTF8'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 392
    Top = 440
  end
  object FDQuery1: TFDQuery
    Active = True
    IndexFieldNames = 'ID;NAME;NAME_1;NAME_2'
    Connection = FDConnection1
    SQL.Strings = (
      'select s.name,h.name,b.id,b.name from tbkoord b'
      'inner join tbhall h on b.idhall=h.id'
      'inner join tbstation s on s.id=h.idstation')
    Left = 472
    Top = 376
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 240
    Top = 408
  end
  object frxReport1: TfrxReport
    Version = '6.9.12'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44420.498738067100000000
    ReportOptions.LastChange = 44658.671566631940000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure Button1OnClick(Sender: TfrxComponent);'
      'begin'
      '                                                              '
      
        '  if (label1.Caption='#39#39') and (label2.Caption='#39#39') then           ' +
        '  '
      '  begin'
      
        '    Showmessage('#39#1042#1074#1077#1076#1080#1090#1077' '#1076#1072#1085#1085#1099#1077#39');                              ' +
        '            '
      '  end'
      '  else'
      '  begin'
      '      Page1.Visible:=True;          '
      
        '      memo2.text:='#39#1057#1090#1086#1083': '#39'+Edit2.Text;                          ' +
        '                        '
      
        '      Barcode2D1.Text:='#39'https://qr-uno.com/mn?id='#39'+Edit1.Text+'#39'&' +
        'idk='#39'+Edit2.Text;            '
      '  end          '
      '    '
      'end;'
      ''
      'begin'
      '  '
      'end.')
    OnReportPrint = 'frxReport1OnReportPrint'
    Left = 296
    Top = 24
    Datasets = <>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'ST'
        Value = Null
      end
      item
        Name = 'ET'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Visible = False
      PaperWidth = 72.000000000000000000
      PaperHeight = 90.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 235.795300000000000000
        Top = 18.897650000000000000
        Width = 196.535560000000000000
        object Memo2: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 196.535560000000000000
          Height = 26.456710000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '<b>'#1057#1090#1086#1083': </b> [ST]')
          ParentFont = False
        end
        object Barcode2D1: TfrxBarcode2DView
          Align = baCenter
          AllowVectorExport = True
          Left = -0.732220000000000000
          Top = 36.574830000000000000
          Width = 198.000000000000000000
          Height = 198.000000000000000000
          StretchMode = smActualHeight
          BarType = bcCodeQR
          BarProperties.Encoding = qrAuto
          BarProperties.QuietZone = 0
          BarProperties.ErrorLevels = ecL
          BarProperties.PixelSize = 4
          BarProperties.CodePage = 0
          Frame.Typ = []
          Rotation = 0
          ShowText = False
          HexData = 
            '680074007400700073003A002F002F00710072002D0075006E006F002E006300' +
            '6F006D002F006D0065006E0075003F00690064003D0031003000260075006900' +
            '64003D00450044003500420046003600330044002D0033004300430042002D00' +
            '34004300460035002D0041003400390037002D00410031003900340042003600' +
            '440032004600380031004500'
          Zoom = 1.500000000000000000
          FontScaled = True
          QuietZone = 0
          ColorBar = clBlack
        end
      end
    end
    object DialogPage1: TfrxDialogPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      DoubleBuffered = False
      Height = 219.000000000000000000
      ClientHeight = 180.000000000000000000
      Left = 484.000000000000000000
      Top = 150.000000000000000000
      Width = 278.000000000000000000
      Scaled = True
      ClientWidth = 262.000000000000000000
      object Edit1: TfrxEditControl
        Left = 120.000000000000000000
        Top = 44.000000000000000000
        Width = 121.000000000000000000
        Height = 21.000000000000000000
        ShowHint = True
        Color = clWindow
        MaxLength = 0
        PasswordChar = #0
      end
      object Button1: TfrxButtonControl
        Left = 164.000000000000000000
        Top = 136.000000000000000000
        Width = 75.000000000000000000
        Height = 25.000000000000000000
        ShowHint = True
        Caption = 'OK'
        ModalResult = 1
        OnClick = 'Button1OnClick'
      end
      object Label1: TfrxLabelControl
        Left = 28.000000000000000000
        Top = 44.000000000000000000
        Width = 73.000000000000000000
        Height = 19.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ShowHint = True
        Caption = 'REGNUM'
        Color = clBtnFace
      end
      object Edit2: TfrxEditControl
        Left = 120.000000000000000000
        Top = 88.000000000000000000
        Width = 121.000000000000000000
        Height = 21.000000000000000000
        ShowHint = True
        Color = clWindow
        MaxLength = 0
        PasswordChar = #0
      end
      object Label2: TfrxLabelControl
        Left = 28.000000000000000000
        Top = 84.000000000000000000
        Width = 67.000000000000000000
        Height = 19.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ShowHint = True
        Caption = 'ID-'#1057#1090#1086#1083#1072
        Color = clBtnFace
      end
    end
  end
end
