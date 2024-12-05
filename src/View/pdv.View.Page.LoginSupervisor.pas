unit pdv.View.Page.LoginSupervisor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  pdv.View.Utils;

type
  TPageLoginSupervisor = class(TForm)
    pnlContainer: TPanel;
    pnlLogar: TPanel;
    pnlTitLogin: TPanel;
    pnlUsuario: TPanel;
    lblUsuario: TLabel;
    shpLogin: TShape;
    edtUsuario: TEdit;
    pnlSenha: TPanel;
    lblSenha: TLabel;
    shpSenha: TShape;
    edtSenha: TEdit;
    pnlBtns: TPanel;
    pnlBtnCancelar: TPanel;
    shpBtnCancelar: TShape;
    btnCancelar: TSpeedButton;
    pnlBtnConfirmar: TPanel;
    shpBtnConfirmar: TShape;
    btnConfirmar: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    procedure Responsive;
  public
    function Embed(Value: TPanel): TPageLoginSupervisor;

    class function New(AOwner: TComponent): TPageLoginSupervisor;
  end;

var
  PageLoginSupervisor: TPageLoginSupervisor;

implementation

{$R *.dfm}
{ TPageLoginSupervisor }

function TPageLoginSupervisor.Embed(Value: TPanel): TPageLoginSupervisor;
begin
  Self.AddObject(Value);
  Result := Self;
end;

procedure TPageLoginSupervisor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TPageLoginSupervisor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        Self.RemoveObject;
      end;
  end;
end;

procedure TPageLoginSupervisor.FormShow(Sender: TObject);
begin
  Responsive;
end;

class function TPageLoginSupervisor.New(AOwner: TComponent)
  : TPageLoginSupervisor;
begin
  Result := Self.Create(AOwner);
end;

procedure TPageLoginSupervisor.Responsive;
var
  lHeight, lWidth: Integer;
begin
  lHeight := Round((Self.Height - pnlContainer.Height) / 2);
  lWidth := Round((Self.Width - pnlContainer.Width) / 2);

  pnlContainer.Margins.Left := lWidth;
  pnlContainer.Margins.Right := lWidth;
  pnlContainer.Margins.Top := lHeight;
  pnlContainer.Margins.Bottom := lHeight;
  pnlContainer.Align := alClient;

end;

end.
