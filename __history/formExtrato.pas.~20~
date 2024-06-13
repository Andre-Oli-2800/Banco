unit formExtrato;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, System.Win.ComObj, Vcl.ComCtrls;

type
  TformExtratoConta = class(TForm)
    gridExtrato: TDBGrid;
    btnExportar: TButton;
    Label1: TLabel;
    barraProgresso: TProgressBar;
    procedure FormShow(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
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

procedure TformExtratoConta.btnExportarClick(Sender: TObject);
var
planilha: Variant;
linha, contar: integer;
begin
  DM.qExtrato.First;
  contar := DM.qExtrato.RecordCount;
  barraProgresso.Max := contar;
  barraProgresso.Position := 0;
  linha := 2;

  planilha := CreateOleObject('Excel.Application');
  planilha.Caption := 'Exportar dados para Excel via Delphi';
  planilha.workbooks.add(1);

  planilha.cells[1,1] := 'Processo';
  planilha.cells[1,2] := 'Valor';
  planilha.cells[1,3] := 'Horário';

  DM.qExtrato.DisableControls;

  try
    while not DM.qExtrato.Eof do
    begin
      planilha.cells[linha,1] := DM.qExtrato.FieldByName('processo').AsString;
      planilha.cells[linha,2] := DM.qExtrato.FieldByName('valor').AsString;
      planilha.cells[linha,3] := DM.qExtrato.FieldByName('horario').AsString;
      linha := linha + 1;
      DM.qExtrato.Next;
      barraProgresso.Position := barraProgresso.Position + 1;
    end;
    planilha.columns.autofit;
    planilha.visible := True;
  finally
    DM.qExtrato.EnableControls;
    planilha := unassigned;
  end;
end;

procedure TformExtratoConta.FormShow(Sender: TObject);
begin
DM.qExtrato.Close;
DM.qExtrato.SQL.Clear;
DM.qExtrato.SQL.Add('Select * from Extrato where cpf = '+''''+DM.qCadastro.FieldByName('cpf').AsString+'''');
DM.qExtrato.Open;
end;

end.
