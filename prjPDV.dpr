program prjPDV;

uses
  Vcl.Forms,
  pdv.View.Principal in 'src\View\pdv.View.Principal.pas' {frmPrincipal},
  pdv.View.Login in 'src\View\pdv.View.Login.pas' {frmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
