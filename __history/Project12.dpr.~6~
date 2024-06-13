program Project12;

uses
  Vcl.Forms,
  telaTeste in 'telaTeste.pas' {formCadastro},
  telaLogin in 'telaLogin.pas' {formLogin},
  Unit5 in 'Unit5.pas' {DM: TDataModule},
  formMenu in 'formMenu.pas' {formMenuInicial},
  unitSacar in 'unitSacar.pas' {formSacar},
  formExtrato in 'formExtrato.pas' {formExtratoConta},
  UnitTransferir in 'UnitTransferir.pas' {formTransferir};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformCadastro, formCadastro);
  Application.CreateForm(TformLogin, formLogin);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TformMenuInicial, formMenuInicial);
  Application.CreateForm(TformSacar, formSacar);
  Application.CreateForm(TformExtratoConta, formExtratoConta);
  Application.CreateForm(TformTransferir, formTransferir);
  Application.Run;
end.
