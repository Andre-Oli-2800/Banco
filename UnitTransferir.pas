unit UnitTransferir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TformTransferir = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblSaldo: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblMsg: TLabel;
    txtValor: TEdit;
    txtAgencia: TEdit;
    txtConta: TEdit;
    btnTransferir: TButton;
    procedure btnTransferirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formTransferir: TformTransferir;

implementation

{$R *.dfm}

uses Unit5;

procedure TformTransferir.btnTransferirClick(Sender: TObject);
var
saldo,saldoOutraConta: integer;
cpf: String;
begin
  DM.qDAdosBancarios.Close;
  DM.qDadosBancarios.SQL.CLear;
  DM.qDadosBancarios.SQL.Add('Select saldo,cpf from dadosBancarios where cpf = '''+DM.qCadastro.FieldByName('cpf').AsString+'''');
  DM.qDadosBancarios.Open;
  if (txtConta.Text = '') or (txtAgencia.Text = '') or (txtValor.Text = '') then
  begin
    lblMsg.Font.Color := clRed;
    lblMsg.Caption := 'Preencha todos os campos';
  end
  else
  begin
    cpf := DM.qDadosBancarios.FieldByName('cpf').AsString;
    if DM.qDadosBancarios.fieldbyName('saldo').AsInteger < StrToInt(txtValor.Text) then
    begin
      lblMsg.Font.Color := clRed;
      lblMsg.Caption := 'Erro! Saldo menor do que o valor a ser transferido';
    end
    else
    begin

      saldo := DM.qDadosBancarios.fieldbyName('saldo').asInteger;
      saldo := saldo - StrToInt(txtValor.Text);

      DM.qDadosBancarios.Close;
      DM.qDadosBancarios.SQL.Clear;
      DM.qDadosBancarios.SQL.Add('update dadosBancarios set saldo = '+IntToStr(saldo)+' where cpf = '''+DM.qCadastro.FieldByName('cpf').AsString+'''');
      DM.qDadosBancarios.ExecSQL;


      DM.qDadosBancarios.SQL.Clear;
      DM.qDadosBancarios.SQL.Add('Select saldo from dadosBancarios where conta = '+quotedStr(txtConta.text)+' and agencia = '+quotedStr(txtAgencia.text));
      DM.qDadosBancarios.Open;

      saldoOutraConta := DM.qDadosBancarios.fieldbyName('saldo').asInteger;
      saldoOutraConta := saldoOutraConta + StrToInt(txtValor.Text);

      DM.qDadosBancarios.SQL.Clear;
      DM.qDadosBancarios.SQL.Add('update dadosBancarios set saldo = '+IntToStr(saldoOutraConta)+' where agencia = '+txtAgencia.Text+' and conta = '+ txtConta.Text);
      DM.qDadosBancarios.ExecSQL;

      lblMsg.Font.Color := clGreen;
      lblMsg.Caption := 'Dinheiro transferido com sucesso';

      DM.qExtrato.Close;
      DM.qExtrato.SQL.Clear;
      DM.qExtrato.SQL.Add('Insert into Extrato (processo,valor,horario,cpf)');
      DM.qExtrato.SQL.Add('Values (''Transferido'','+quotedStr(txtValor.Text)+',:pHorario,'''+cpf+''')');

      DM.qExtrato.ParamByName('pHorario').Value := FormatDateTime('YYYY-MM-DD HH:MM:SS',now);

      DM.qExtrato.ExecSQL;
    end;
  end;

end;

procedure TformTransferir.FormShow(Sender: TObject);
begin
DM.qDadosBancarios.Close;
DM.qDadosBancarios.SQL.Clear;
DM.qDadosBancarios.SQL.Add('select saldo from dadosBancarios where cpf = '+''''+DM.qCadastro.FieldByName('cpf').AsString+'''');
DM.qDadosBancarios.Open;
lblSaldo.Caption := DM.qDadosBancarios.FieldByName('saldo').AsString;
end;

end.