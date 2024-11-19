unit pdv.View.Page.AbrirCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

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
  private
    procedure Responsive;
  public
    function Embed(Value: TWinControl): TPageAberturaCaixa;
    class function New(AOwner: TComponent): TPageAberturaCaixa;
  end;

var
  PageAberturaCaixa: TPageAberturaCaixa;

implementation

{$R *.dfm}
{ TPageAberturaCaixa }

function TPageAberturaCaixa.Embed(Value: TWinControl): TPageAberturaCaixa;
begin
  Self.Parent := Value;
  Result := Self;
end;

procedure TPageAberturaCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      Close;
  end;
end;

procedure TPageAberturaCaixa.FormResize(Sender: TObject);
begin
  Responsive;
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
