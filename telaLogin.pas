unit telaLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls;

type
  TformLogin = class(TForm)
    btnLogin: TButton;
    Label2: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    btnCadastrar: TButton;
    lblMsg: TLabel;
    txtEmail: TEdit;
    txtSenha: TEdit;
    Panel1: TPanel;
    procedure btnLoginClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLogin: TformLogin;

implementation

{$R *.dfm}

uses telaTeste, Unit5, formMenu;

procedure TformLogin.btnCadastrarClick(Sender: TObject);
begin
  formCadastro.ShowModal;
end;

procedure TformLogin.btnLoginClick(Sender: TObject);
begin
  if (txtEmail.Text = '') or (txtSenha.Text = '') then
  begin
    lblMsg.Font.Color := clRed;
    lblMsg.Caption := 'Preencha todos os campos';
  end
  else
  begin
    DM.qCadastro.Close;
    Dm.qCadastro.SQL.Clear;
    DM.qCadastro.SQL.Add('Select * from cadastro where email = ' +QuotedStr(txtEmail.Text)+' and senha = '+QuotedStr(txtSenha.Text));
    DM.qCadastro.Open;
    if DM.qCadastro.RecordCount > 0 then
    begin
       lblMsg.Caption := '';
       formMenuInicial.showModal;
    end
    else
    begin
      lblMsg.Font.Color := clRed;
      lblMsg.Caption := 'Email/Senha inválido(s)'
    end
  end;
end;

end.
