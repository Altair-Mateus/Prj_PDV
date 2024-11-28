unit pdv.View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, pdv.View.Componente.Transparencia, pdv.View.Utils;

type
  TfrmLogin = class(TForm)
    pnlContainer: TPanel;
    pnlLogin: TPanel;
    pnlImage: TPanel;
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
    pnlLoginClient: TPanel;
    pnlBtnLogin: TPanel;
    shpBtnLogin: TShape;
    btnLogar: TSpeedButton;
    imgLogin: TImage;
    procedure btnLogarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FFundo: TfrmComponenteTransparencia;
    FProc: TProc<String>;
  public
    function Embed(Value: TPanel): TfrmLogin;
    function Informacao(Value: TProc<String>): TfrmLogin;
    class function New(AOwner: TComponent): TfrmLogin;

  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnLogarClick(Sender: TObject);
begin

  if not((edtUsuario.Text = 'altair') and (edtSenha.Text = '123')) then
  begin
    ShowMessage('Logins e senha inválido!');
    exit
  end;
  FProc(edtUsuario.Text);
  Self.RemoveObject;

end;

function TfrmLogin.Embed(Value: TPanel): TfrmLogin;
begin
  Self.AddObject(Value);
  Result := Self;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FFundo.Free;
  Action := caFree;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  FFundo := TfrmComponenteTransparencia.Create(nil);
  FFundo.Parent := pnlImage;
  FFundo.Show;
end;

function TfrmLogin.Informacao(Value: TProc<String>): TfrmLogin;
begin
  FProc := Value;
  Result := Self;
end;

class function TfrmLogin.New(AOwner: TComponent): TfrmLogin;
begin
  Result := Self.Create(AOwner);
end;

end.
