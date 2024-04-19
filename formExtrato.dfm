object formExtratoConta: TformExtratoConta
  Left = 0
  Top = 0
  Caption = 'formExtratoConta'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 264
    Top = 16
    Width = 94
    Height = 37
    Caption = 'Extrato'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object gridExtrato: TDBGrid
    Left = 8
    Top = 64
    Width = 612
    Height = 257
    DataSource = DM.dsExtrato
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'processo'
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor'
        Width = 183
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'horario'
        Width = 359
        Visible = True
      end>
  end
  object btnExportar: TButton
    Left = 280
    Top = 384
    Width = 105
    Height = 41
    Caption = 'Exportar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnExportarClick
  end
  object barraProgresso: TProgressBar
    Left = 96
    Top = 341
    Width = 465
    Height = 21
    TabOrder = 2
  end
end
