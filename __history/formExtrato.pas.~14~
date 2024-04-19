unit formExtrato;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, System.Win.ComObj;

type
  TformExtratoConta = class(TForm)
    DBGrid1: TDBGrid;
    btnExportar: TButton;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formExtratoConta: TformExtratoConta;

implementation

{$R *.dfm}

uses Unit5;

procedure TformExtratoConta.FormShow(Sender: TObject);
begin
DM.qExtrato.Close;
DM.qExtrato.SQL.Clear;
DM.qExtrato.SQL.Add('Select * from Extrato where cpf = '+''''+DM.qCadastro.FieldByName('cpf').AsString+'''');
DM.qExtrato.Open;
end;

end.
