object formSacar: TformSacar
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'formSacar'
  ClientHeight = 365
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 100
    Top = 163
    Width = 45
    Height = 28
    Caption = 'Valor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 100
    Top = 115
    Width = 54
    Height = 28
    Caption = 'Saldo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblSaldo: TLabel
    Left = 276
    Top = 115
    Width = 11
    Height = 28
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 80
    Top = 35
    Width = 325
    Height = 37
    Caption = 'Sacar/Depositar Dinheiro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 128
    Top = 240
    Width = 3
    Height = 15
  end
  object lblMsg: TLabel
    Left = 92
    Top = 312
    Width = 5
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object btnSacar: TButton
    Left = 116
    Top = 232
    Width = 97
    Height = 41
    Caption = 'Sacar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnSacarClick
  end
  object btnDepositar: TButton
    Left = 272
    Top = 232
    Width = 99
    Height = 41
    Caption = 'Depositar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnDepositarClick
  end
  object txtValor: TNumberBox
    Left = 192
    Top = 160
    Width = 201
    Height = 36
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    Mode = nbmFloat
    ParentFont = False
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 72
    Top = 31
    Width = 345
    Height = 50
    TabOrder = 3
  end
end
