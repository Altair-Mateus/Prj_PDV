unit pdv.View.Page.FecharCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  pdv.Model.cAIXA;

type
  TPageFechamentoCaixa = class(TForm)
    pnlContainerFechamento: TPanel;
    pnlTitulo: TPanel;
    pnlAviso: TPanel;
    pnlInfo: TPanel;
    pnlFuncoes: TPanel;
    pnlBtnAdicionar: TPanel;
    shpBtnAdicionar: TShape;
    btnAdicionar: TSpeedButton;
    pnlFormaPgto: TPanel;
    Panel4: TPanel;
    cbxFormaPgto: TComboBox;
    pnlEdtValor: TPanel;
    edtValor: TEdit;
    pnlBtns: TPanel;
    pnlBtnCancelar: TPanel;
    pnlBtnConfirmar: TPanel;
    shpBtnCancelar: TShape;
    shpBtnConfirmar: TShape;
    btnConfirmar: TSpeedButton;
    btnCancelar: TSpeedButton;
    pnlFormasPgto: TPanel;
    ListBox1: TListBox;
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FProc: TProc<TCaixa>;
    procedure Responsive;
  public
    function Embed(Value: TWinControl): TPageFechamentoCaixa;
    function Informacoes(Value: TProc<TCaixa>): TPageFechamentoCaixa;
    class function New(AOwner: TComponent): TPageFechamentoCaixa;

  end;

var
  PageFechamentoCaixa: TPageFechamentoCaixa;

implementation

{$R *.dfm}
{ TPageAberturaCaixa }



function TPageFechamentoCaixa.Embed(Value: TWinControl): TPageFechamentoCaixa;
begin
  Self.Parent := Value;
  Result := Self;
end;

procedure TPageFechamentoCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      Close;
  end;
end;

procedure TPageFechamentoCaixa.FormResize(Sender: TObject);
begin
  Responsive;
end;

function TPageFechamentoCaixa.Informacoes(Value: TProc<TCaixa>)
  : TPageFechamentoCaixa;
begin
  FProc := Value;
  Result := Self;
end;

class function TPageFechamentoCaixa.New(AOwner: TComponent): TPageFechamentoCaixa;
begin
  Result := Self.Create(AOwner);
end;

procedure TPageFechamentoCaixa.Responsive;
var
  lHeight, lWidth: Integer;
begin
  lHeight := Round((Self.Height - pnlContainerFechamento.Height) / 2);
  lWidth := Round((Self.Width - pnlContainerFechamento.Width) / 2);

  pnlContainerFechamento.Margins.Left := lWidth;
  pnlContainerFechamento.Margins.Right := lWidth;
  pnlContainerFechamento.Margins.Top := lHeight;
  pnlContainerFechamento.Margins.Bottom := lHeight;
  pnlContainerFechamento.Align := alClient;

end;

end.
