unit pdv.View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

end.
