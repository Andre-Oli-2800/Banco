unit unitSacar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TformSacar = class(TForm)
    txtValor: TEdit;
    txtAgencia: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnSacar: TButton;
    Label4: TLabel;
    lblSaldo: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    txtConta: TEdit;
    lblMsg: TLabel;
    btnDepositar: TButton;
    procedure btnSacarClick(Sender: TObject);
    procedure btnDepositarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSacar: TformSacar;

implementation

{$R *.dfm}

uses Unit5;

procedure TformSacar.btnDepositarClick(Sender: TObject);
var
saldo: integer;
cpf: String;
begin
  DM.qDadosBancarios.Close;
  DM.qDadosBancarios.SQL.Clear;
  DM.qDadosBancarios.SQL.Add('Select cpf,saldo from dadosBancarios where conta = '+quotedStr(txtConta.Text)+' and agencia = '+quotedStr(txtAgencia.Text));
  DM.qDadosBancarios.Open;
  if (txtConta.Text = '') or (txtAgencia.Text = '') or (txtValor.Text = '') then
  begin
    lblMsg.Font.Color := clRed;
    lblMsg.Caption := 'Preencha todos os campos';
  end
  else
  begin
    saldo := DM.qDadosBancarios.FieldByName('saldo').AsInteger;
    cpf :=  DM.qDadosBancarios.FieldByName('cpf').AsString;
    saldo := saldo + StrToInt(txtValor.Text);

    DM.qDadosBancarios.SQL.Clear;
    DM.qDadosBancarios.SQL.Add('update dadosBancarios set saldo = '+IntToStr(saldo)+ ' where agencia = '+txtAgencia.Text+' and conta = '+txtConta.Text);
    DM.qDadosBancarios.ExecSQL;
    lblMsg.Font.Color := clGreen;
    lblMsg.Caption := 'Dinheiro depositado com sucesso';

    DM.qExtrato.Close;
    DM.qExtrato.SQL.Clear;
    DM.qExtrato.SQL.Add('Insert into Extrato (processo,valor,horario,cpf)');
    DM.qExtrato.SQL.Add('Values (''Deposito'','+quotedStr(txtValor.Text)+',:pHorario,'''+cpf+''')');

    DM.qExtrato.ParamByName('pHorario').Value := FormatDateTime('YYYY-MM-DD HH:MM:SS',now);

    DM.qExtrato.ExecSQL;
  end;
  end;

procedure TformSacar.btnSacarClick(Sender: TObject);
var
saldo: integer;
cpf: String;
begin
  DM.qDAdosBancarios.Close;
  DM.qDadosBancarios.SQL.CLear;
  DM.qDadosBancarios.SQL.Add('Select cpf,saldo from dadosBancarios where conta = '+quotedStr(txtConta.text)+' and agencia = '+quotedStr(txtAgencia.text));
  DM.qDadosBancarios.Open;
  if (txtConta.Text = '') or (txtAgencia.Text = '') or (txtValor.Text = '') then
  begin
    lblMsg.Font.Color := clRed;
    lblMsg.Caption := 'Preencha todos os campos';
  end
  else
  begin
    if DM.qDadosBancarios.fieldbyName('saldo').AsInteger < StrToInt(txtValor.Text) then
    begin
      lblMsg.Font.Color := clRed;
      lblMsg.Caption := 'Erro! Saldo menor do que o valor a ser sacado';
    end
    else
    begin
      saldo := DM.qDadosBancarios.fieldbyName('saldo').asInteger;
      saldo := saldo - StrToInt(txtValor.Text);
      cpf :=  DM.qDadosBancarios.FieldByName('cpf').AsString;
      DM.qDadosBancarios.Open;

      DM.qDadosBancarios.SQL.Clear;
      DM.qDadosBancarios.SQL.Add('update dadosBancarios set saldo = '+IntToStr(saldo)+' where agencia = '+txtAgencia.Text+' and conta = '+txtConta.Text);
      DM.qDadosBancarios.ExecSQL;
      lblMsg.Font.Color := clGreen;
      lblMsg.Caption := 'Dinheiro sacado com sucesso';

      DM.qExtrato.Close;
      DM.qExtrato.SQL.Clear;
      DM.qExtrato.SQL.Add('Insert into Extrato (processo,valor,horario,cpf)');
      DM.qExtrato.SQL.Add('Values (''Sacado'','+quotedStr(txtValor.Text)+',:pHorario,'''+cpf+''')');

      DM.qExtrato.ParamByName('pHorario').Value := FormatDateTime('YYYY-MM-DD HH:MM:SS',now);

      DM.qExtrato.ExecSQL;
    end;
  end;
end;



procedure TformSacar.FormShow(Sender: TObject);
begin
DM.qDadosBancarios.Close;
DM.qDadosBancarios.SQL.Clear;
DM.qDadosBancarios.SQL.Add('select saldo from dadosBancarios where cpf = '+''''+DM.qCadastro.FieldByName('cpf').AsString+'''');
DM.qDadosBancarios.Open;
lblSaldo.Caption := DM.qDadosBancarios.FieldByName('saldo').AsString;
end;

end.