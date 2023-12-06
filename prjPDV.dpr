program prjPDV;

uses
  Vcl.Forms,
  pdv.View.Principal in 'src\View\pdv.View.Principal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
