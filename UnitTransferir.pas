unit UnitTransferir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.NumberBox, Vcl.Mask,
  Vcl.ExtCtrls;

type
  TformTransferir = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    lblSaldo: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblMsg: TLabel;
    btnTransferir: TButton;
    txtValor: TNumberBox;
    Label5: TLabel;
    txtCelular: TMaskEdit;
    Panel1: TPanel;
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

uses Unit5, formMenu;

procedure TformTransferir.btnTransferirClick(Sender: TObject);
var
saldo,saldoOutraConta: real;
cpf: String;
begin
  DM.qDAdosBancarios.Close;
  DM.qDadosBancarios.SQL.CLear;
  DM.qDadosBancarios.SQL.Add('Select saldo,cpf from dadosBancarios where cpf = '''+DM.qCadastro.FieldByName('cpf').AsString+'''');
  DM.qDadosBancarios.Open;
  if StrtoFloat(txtValor.Text) = 0 then
  begin
    lblMsg.Font.Color := clRed;
    lblMsg.Caption := 'Preencha todos os campos';
  end
  else
  begin
    cpf := DM.qDadosBancarios.FieldByName('cpf').AsString;
    if DM.qDadosBancarios.fieldbyName('saldo').AsFloat < StrToFloat(txtValor.Text) then
    begin
      lblMsg.Font.Color := clRed;
      lblMsg.Caption := 'Erro! Saldo menor do que o valor a ser transferido';
    end
    else
    begin

      saldo := DM.qDadosBancarios.fieldbyName('saldo').asFloat;
      saldo := saldo - StrToFloat(txtValor.Text);



      DM.qDadosBancarios.SQL.Clear;
      DM.qDadosBancarios.SQL.Add('Select saldo from dadosBancarios where celular = '+quotedStr(txtCelular.Text));
      DM.qDadosBancarios.Open;

      if DM.qDadosBancarios.RecordCount = 0 then
      begin
        lblMsg.Font.Color := clRed;
        lblMsg.Caption := 'N�o existe cliente com esse n�mero de telefone';
        exit;
      end
      else
      begin
        DM.qDadosBancarios.Close;
        DM.qDadosBancarios.SQL.Clear;
        DM.qDadosBancarios.SQL.Add('update dadosBancarios set saldo = '+FloatToStr(saldo)+' where cpf = '''+DM.qCadastro.FieldByName('cpf').AsString+'''');
        DM.qDadosBancarios.ExecSQL;


        DM.qDadosBancarios.SQL.Clear;
        DM.qDadosBancarios.SQL.Add('Select saldo from dadosBancarios where celular = '+quotedStr(txtCelular.Text));
        DM.qDadosBancarios.Open;

        saldoOutraConta := DM.qDadosBancarios.fieldbyName('saldo').asFloat;
        saldoOutraConta := saldoOutraConta + StrToFloat(txtValor.Text);

        DM.qDadosBancarios.SQL.Clear;
        DM.qDadosBancarios.SQL.Add('update dadosBancarios set saldo = '+FloatToStr(saldoOutraConta)+' where celular = '+quotedStr(txtCelular.Text));
        DM.qDadosBancarios.ExecSQL;

        lblMsg.Font.Color := clGreen;
        lblMsg.Caption := 'Dinheiro transferido com sucesso';

        DM.qExtrato.Close;
        DM.qExtrato.SQL.Clear;
        DM.qExtrato.SQL.Add('Insert into Extrato (processo,valor,horario,cpf)');
        DM.qExtrato.SQL.Add('Values (''Transferido'','+quotedStr(txtValor.Text)+',:pHorario,'''+cpf+''')');

        DM.qExtrato.ParamByName('pHorario').Value := FormatDateTime('YYYY-MM-DD HH:MM:SS',now);

        DM.qExtrato.ExecSQL;

        DM.qDadosBancarios.Close;
        DM.qDadosBancarios.SQL.Clear;
        DM.qDadosBancarios.SQL.Add('select saldo from dadosBancarios where cpf = '+''''+DM.qCadastro.FieldByName('cpf').AsString+'''');
        DM.qDadosBancarios.Open;
        lblSaldo.Caption := DM.qDadosBancarios.FieldByName('saldo').AsString;
        formMenuInicial.lblSaldo.Caption := DM.qDadosBancarios.FieldByName('saldo').AsString;
        formMenuInicial.Refresh;
      end;
    end;
  end;
end;

procedure TformTransferir.FormShow(Sender: TObject);
begin
  //DM.qDadosBancarios.Close;
  //DM.qDadosBancarios.SQL.Clear;
  //DM.qDadosBancarios.SQL.Add('select saldo from dadosBancarios where cpf = '+''''+DM.qCadastro.FieldByName('cpf').AsString+'''');
  //DM.qDadosBancarios.Open;
  lblSaldo.Caption := DM.qDadosBancarios.FieldByName('saldo').AsString;
end;
end.
