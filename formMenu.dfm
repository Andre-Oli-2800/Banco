object formMenuInicial: TformMenuInicial
  Left = 0
  Top = 0
  Caption = 'formMenuInicial'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 200
    Top = 29
    Width = 157
    Height = 37
    Caption = 'Menu Inicial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 179
    Top = 104
    Width = 144
    Height = 28
    Caption = 'Seja bem vindo, '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 216
    Top = 176
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
    Left = 336
    Top = 176
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
  object lblNome: TLabel
    Left = 329
    Top = 104
    Width = 54
    Height = 28
    Caption = 'Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblAgencia: TLabel
    Left = 336
    Top = 304
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
  object lblConta: TLabel
    Left = 336
    Top = 240
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
    Left = 216
    Top = 304
    Width = 74
    Height = 28
    Caption = 'Ag'#234'ncia:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 216
    Top = 240
    Width = 56
    Height = 28
    Caption = 'Conta:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 24
    object Sacar1: TMenuItem
      Caption = 'Op'#231#245'es'
      object Sacar2: TMenuItem
        Caption = 'Sacar/Depositar'
        OnClick = Sacar2Click
      end
      object Extrato1: TMenuItem
        Caption = 'Transferir'
        OnClick = Extrato1Click
      end
      object Extrato2: TMenuItem
        Caption = 'Extrato'
        OnClick = Extrato2Click
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
      end
    end
  end
end
