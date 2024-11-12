program prjPDV;

uses
  Vcl.Forms,
  pdv.View.Principal in 'src\View\pdv.View.Principal.pas' {frmPrincipal},
  pdv.View.Login in 'src\View\pdv.View.Login.pas' {frmLogin},
  pdv.View.Componente.Transparencia in 'src\View\componente\pdv.View.Componente.Transparencia.pas' {frmComponenteTransparencia},
  pdv.Model.Dados in 'src\model\pdv.Model.Dados.pas' {dmDados: TDataModule},
  pdv.View.Page.Pagamento in 'src\View\pdv.View.Page.Pagamento.pas' {PagePagamentos},
  pdv.View.Page.Pix in 'src\View\pdv.View.Page.Pix.pas' {FramePix: TFrame},
  pdv.View.Page.Dinheiro in 'src\View\pdv.View.Page.Dinheiro.pas' {FrameDinheiro: TFrame},
  pdv.View.Page.Cartao in 'src\View\pdv.View.Page.Cartao.pas' {FrameCartao: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
