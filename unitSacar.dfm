object formSacar: TformSacar
  Left = 0
  Top = 0
  Caption = 'formSacar'
  ClientHeight = 600
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 188
    Top = 315
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
  object Label2: TLabel
    Left = 216
    Top = 208
    Width = 3
    Height = 15
  end
  object Label3: TLabel
    Left = 188
    Top = 195
    Width = 70
    Height = 28
    Caption = 'Ag'#234'ncia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 204
    Top = 139
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
    Left = 364
    Top = 139
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
    Left = 168
    Top = 43
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
    Left = 216
    Top = 264
    Width = 3
    Height = 15
  end
  object Label8: TLabel
    Left = 188
    Top = 251
    Width = 52
    Height = 28
    Caption = 'Conta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblMsg: TLabel
    Left = 168
    Top = 472
    Width = 12
    Height = 28
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object txtValor: TEdit
    Left = 280
    Top = 312
    Width = 201
    Height = 36
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object txtAgencia: TEdit
    Left = 280
    Top = 192
    Width = 201
    Height = 36
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object btnSacar: TButton
    Left = 204
    Top = 384
    Width = 97
    Height = 41
    Caption = 'Sacar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnSacarClick
  end
  object txtConta: TEdit
    Left = 280
    Top = 248
    Width = 201
    Height = 36
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object btnDepositar: TButton
    Left = 360
    Top = 384
    Width = 99
    Height = 41
    Caption = 'Depositar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnDepositarClick
  end
end