object DM: TDM
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object qLogin: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from banco')
    Left = 72
    Top = 224
  end
  object dsCadastro: TDataSource
    DataSet = tbCadastro
    Left = 304
    Top = 104
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=banco'
      'User_Name=root'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 200
    Top = 16
  end
  object tbCadastro: TFDTable
    IndexFieldNames = 'cpf'
    Connection = Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'banco.cadastro'
    Left = 200
    Top = 104
    object tbCadastrocpf: TIntegerField
      FieldName = 'cpf'
      Origin = 'cpf'
      Required = True
    end
    object tbCadastronome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
    end
    object tbCadastrosobrenome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sobrenome'
      Origin = 'sobrenome'
    end
    object tbCadastroemail: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'email'
      Origin = 'email'
      Size = 50
    end
    object tbCadastrosexo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sexo'
      Origin = 'sexo'
    end
    object tbCadastrodataNascimento: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dataNascimento'
      Origin = 'dataNascimento'
    end
    object tbCadastrotelefone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'telefone'
      Origin = 'telefone'
    end
    object tbCadastrocelular: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'celular'
      Origin = 'celular'
    end
    object tbCadastrosenha: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'senha'
      Origin = 'senha'
      Size = 100
    end
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\Andre\OneDrive\'#193'rea de Trabalho\SistemaClinica\MySQL\bi' +
      'n\libmysql.dll'
    Left = 72
    Top = 16
  end
  object dsLogin: TDataSource
    DataSet = qLogin
    Left = 200
    Top = 224
  end
  object qCadastro: TFDQuery
    MasterSource = dsCadastro
    Connection = Conexao
    SQL.Strings = (
      'select * from cadastro')
    Left = 72
    Top = 104
  end
  object qDadosBancarios: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'select * from dadosBancarios')
    Left = 72
    Top = 336
  end
  object dsDadosBancarios: TDataSource
    DataSet = qDadosBancarios
    Left = 200
    Top = 336
  end
  object dsExtrato: TDataSource
    DataSet = qExtrato
    Left = 200
    Top = 448
  end
  object qExtrato: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'select * from extrato')
    Left = 72
    Top = 448
    ParamData = <
      item
        Name = 'pData'
        ParamType = ptInput
      end>
  end
  object tbExtrato: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'banco.extrato'
    Left = 312
    Top = 456
  end
  object dsExtratoTB: TDataSource
    DataSet = tbExtrato
    Left = 408
    Top = 456
  end
end
