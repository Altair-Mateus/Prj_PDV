unit pdv.View.Page.AbrirCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  pdv.Model.cAIXA, pdv.View.Utils;

type
  TPageAberturaCaixa = class(TForm)
    pnlContainerAbertura: TPanel;
    pnlTitulo: TPanel;
    pnlAviso: TPanel;
    pnlInfo: TPanel;
    pnlInfoCaixa: TPanel;
    pnlBtnAbrirCaixa: TPanel;
    pnlDispCaixa: TPanel;
    pnlTituloDispCaixa: TPanel;
    pnlEdtDispCaixa: TPanel;
    shpEdtDispCaixa: TShape;
    edtValorSuprimento: TEdit;
    shpBtnAbrirCaixa: TShape;
    btnAbrirCaixa: TSpeedButton;
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAbrirCaixaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FProc: TProc<TCaixa>;
    procedure Responsive;
    procedure AbrirCaixa;
  public
    function Embed(Value: TPanel): TPageAberturaCaixa;
    function Informacoes(Value: TProc<TCaixa>): TPageAberturaCaixa;
    class function New(AOwner: TComponent): TPageAberturaCaixa;

  end;

var
  PageAberturaCaixa: TPageAberturaCaixa;

implementation

{$R *.dfm}
{ TPageAberturaCaixa }

procedure TPageAberturaCaixa.AbrirCaixa;
var
  lCaixa: TCaixa;
  lData: TDateTime;
  lTurno: TTurno;
begin
  lData := Now;
  lCaixa := TCaixa.New;
  try
    lCaixa.Id := 1;
    lCaixa.cAIXA := 1;
    lCaixa.Turno := lTurno.RetornaTurno(lData);
    lCaixa.Aberto := True;
    lCaixa.DataHoraAbertura := lData;
    lCaixa.SaldoInicial := StrToFloat(StringReplace(edtValorSuprimento.Text,
      'R$ ', '', [rfReplaceAll, rfIgnoreCase]));
    FProc(lCaixa);
  finally
    lCaixa.Free;
    Self.RemoveObject;
  end;
end;

procedure TPageAberturaCaixa.btnAbrirCaixaClick(Sender: TObject);
begin
  AbrirCaixa;
  Self.RemoveObject;
end;

function TPageAberturaCaixa.Embed(Value: TPanel): TPageAberturaCaixa;
begin
  Self.AddObject(Value);
  Result := Self;
end;

procedure TPageAberturaCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TPageAberturaCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      Self.RemoveObject;
  end;
end;

procedure TPageAberturaCaixa.FormResize(Sender: TObject);
begin
  Responsive;
end;

function TPageAberturaCaixa.Informacoes(Value: TProc<TCaixa>)
  : TPageAberturaCaixa;
begin
  FProc := Value;
  Result := Self;
end;

class function TPageAberturaCaixa.New(AOwner: TComponent): TPageAberturaCaixa;
begin
  Result := Self.Create(AOwner);
end;

procedure TPageAberturaCaixa.Responsive;
var
  lHeight, lWidth: Integer;
begin
  lHeight := Round((Self.Height - pnlContainerAbertura.Height) / 2);
  lWidth := Round((Self.Width - pnlContainerAbertura.Width) / 2);

  pnlContainerAbertura.Margins.Left := lWidth;
  pnlContainerAbertura.Margins.Right := lWidth;
  pnlContainerAbertura.Margins.Top := lHeight;
  pnlContainerAbertura.Margins.Bottom := lHeight;
  pnlContainerAbertura.Align := alClient;

end;

end.
