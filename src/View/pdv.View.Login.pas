unit pdv.View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, pdv.View.Componente.Transparencia;

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
  public
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnLogarClick(Sender: TObject);
begin

  if not((edtUsuario.Text = 'Altair') and (edtSenha.Text = '123')) then
  begin
    ShowMessage('Logins e senha inválido!');
    exit
  end;
  close;

end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FFundo.Free;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  FFundo := TfrmComponenteTransparencia.Create(nil);
  FFundo.Parent := pnlImage;
  FFundo.Show;
end;

end.
