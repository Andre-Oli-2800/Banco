unit telaTeste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TformCadastro = class(TForm)
    Label1: TLabel;
    btnCadastrar: TButton;
    btnLogin: TButton;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    txtDataNascimento: TDateTimePicker;
    txtConfirSenha: TEdit;
    txtCelular: TMaskEdit;
    txtTelefone: TMaskEdit;
    lblMsg: TLabel;
    txtCpf: TMaskEdit;
    txtSenha: TEdit;
    txtNome: TEdit;
    txtEmail: TEdit;
    txtSobrenome: TEdit;
    cbSexo: TComboBox;
    procedure btnLoginClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadastro: TformCadastro;

implementation

{$R *.dfm}

uses telaLogin, Unit5;

procedure TformCadastro.btnCadastrarClick(Sender: TObject);
var
agencia,banco: integer;
begin
  {DM.sqlCadastro.ParamByName('pDataNasc').Value  := FormatDateTime('YYYY-MM-DD',dtpDataNascimento.Date);
  DM.sqlCadastro.ParamByName('pAltura').Value := strtofloat(txtAltura.Text);
  DM.sqlCadastro.ParamByName('pSaldo').Value := strtofloat(txtSaldo.Text);
  lblMsg.Font.Color := clGreen;}
  if (txtCpf.Text = '') or (txtNome.Text = '') or (txtSobrenome.Text = '') or (txtEmail.Text = '') or (cbSexo.Text = '') or (txtTelefone.Text = '') or (txtCelular.Text = '') or (txtSenha.Text = '') or (txtConfirSenha.text = '') then
  begin
    lblMsg.Font.Color := clRed;
    lblMsg.Caption := 'Preencha todos os campos';
  end
  else
  if txtSenha.Text <> txtConfirSenha.Text then
  begin
    lblMsg.Font.Color := clRed;
    lblMsg.Caption := 'As senhas inseridas s�o diferentes';
  end
  else
  if DM.qCadastro.FieldByName('cpf').AsString = txtCpf.Text then
  begin
    lblMsg.Font.Color := clRed;
    lblMsg.Caption := 'J� existe uma pessoa cadastrada com esse CPF';
  end
  else
  begin
    DM.qCadastro.Close;
    DM.qCadastro.SQL.Clear;
    DM.qCadastro.SQL.Add('Insert into Cadastro (cpf, nome, sobrenome, email, sexo, dataNascimento, telefone, celular, senha)');
    DM.qCadastro.SQL.Add('values ('+QuotedStr(txtCpf.Text)+','+QuotedStr(txtNome.Text)+',' +QuotedStr(txtSobrenome.Text)+','+QuotedStr(txtEmail.Text)+','+QuotedStr(cbSexo.Text)+',:pDataNascimento,'+QuotedStr(txtTelefone.Text)+','+QuotedStr(txtCelular.Text)+','+QuotedStr(txtSenha.Text)+')');
    DM.qCadastro.ParamByName('pDataNascimento').Value := FormatDateTime('YYYY-MM-DD',txtDataNascimento.Date);
    DM.qCadastro.ExecSQL;
    lblMsg.Font.Color := clGreen;
    lblMsg.Caption := 'Cadastro feito com sucesso';

    DM.qDadosBancarios.Close;
    DM.qDadosBancarios.SQL.Clear;
    DM.qDadosBancarios.SQL.Add('Insert into dadosBancarios (agencia,conta,saldo,cpf)');
    Randomize;
    agencia := 1+Random(100);
    banco := 1+Random(100);
    DM.qDadosBancarios.SQL.Add('values ('+InttoStr(agencia)+','+InttoStr(banco)+',0,'+quotedStr(txtCpf.Text)+')');
    DM.qDadosBancarios.ExecSQL;
  end;
end;

procedure TformCadastro.btnLoginClick(Sender: TObject);
begin
formLogin.ShowModal;
end;

end.
