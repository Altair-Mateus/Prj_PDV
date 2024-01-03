program prjPDV;

uses
  Vcl.Forms,
  pdv.View.Principal in 'src\View\pdv.View.Principal.pas' {frmPrincipal},
  pdv.View.Login in 'src\View\pdv.View.Login.pas' {frmLogin},
  pdv.View.Componente.Transparencia in 'src\View\componente\pdv.View.Componente.Transparencia.pas' {Form1},
  pdv.Model.Dados in 'src\model\pdv.Model.Dados.pas' {dmDados: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmDados, dmDados);
  Application.Run;
end.
