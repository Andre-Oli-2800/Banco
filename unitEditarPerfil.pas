unit unitEditarPerfil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  Vcl.DBCtrls, Vcl.ExtCtrls;

type
  TformEditarPerfil = class(TForm)
    Label1: TLabel;
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
    lblMsg: TLabel;
    txtConfirSenha: TEdit;
    Label13: TLabel;
    cbSexo: TDBComboBox;
    txtCpf: TDBEdit;
    txtTelefone: TDBEdit;
    txtSobrenome: TDBEdit;
    txtDataNascimento: TDBEdit;
    txtNome: TDBEdit;
    txtEmail: TDBEdit;
    txtSenha: TDBEdit;
    lblMsg2: TLabel;
    btnCadastrar: TButton;
    cbCartao: TDBComboBox;
    Panel1: TPanel;
    txtCelular: TDBEdit;
    procedure btnCadastrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEditarPerfil: TformEditarPerfil;

implementation

{$R *.dfm}

uses Unit5;

procedure TformEditarPerfil.btnCadastrarClick(Sender: TObject);
begin
   if (txtCpf.Text = '') or (txtNome.Text = '') or (txtSobrenome.Text = '') or (txtEmail.Text = '') or (cbSexo.Text = '') or (txtTelefone.Text = '') or (txtCelular.Text = '') or (txtSenha.Text = '') or (txtConfirSenha.text = '') then
  begin
    lblMsg.Font.Color := clRed;
    lblMsg.Caption := 'Preencha todos os campos';
  end
  else
  if txtSenha.Text <> txtConfirSenha.Text then
  begin
    lblMsg.Font.Color := clRed;
    lblMsg.Caption := 'As senhas inseridas são diferentes';
  end
  else
  begin
    DM.qCadastro.Close;
    DM.qCadastro.SQL.Clear;
    DM.qCadastro.SQL.Add('update Cadastro set nome = '+QuotedStr(txtNome.Text)+', sobrenome =  '+QuotedStr(txtSobrenome.Text)+', email = '+QuotedStr(txtEmail.Text)+' , sexo = '+QuotedStr(cbSexo.Text)+', dataNascimento = :pDataNascimento, telefone = '+QuotedStr(txtTelefone.Text)+', celular = '+QuotedStr(txtCelular.Text)+', cartao = '+QuotedStr(cbCartao.Text)+', senha = '+QuotedStr(txtSenha.Text)+'');
    DM.qCadastro.SQL.Add('where cpf = '+QuotedStr(txtCpf.Text));
    DM.qCadastro.ParamByName('pDataNascimento').Value := txtDataNascimento.Text;
    DM.qCadastro.ExecSQL;
    lblMsg.Font.Color := clGreen;
    lblMsg.Caption := 'Perfil editado com sucesso';
    txtConfirSenha.Text := '';
end;
end;
end.
