program prjPDV;

{$R *.dres}

uses
  Vcl.Forms,
  pdv.View.Principal in 'src\View\pdv.View.Principal.pas' {frmPrincipal},
  pdv.View.Login in 'src\View\pdv.View.Login.pas' {frmLogin},
  pdv.View.Componente.Transparencia in 'src\View\componente\pdv.View.Componente.Transparencia.pas' {frmComponenteTransparencia},
  pdv.Model.Dados in 'src\model\pdv.Model.Dados.pas' {dmDados: TDataModule},
  pdv.View.Page.Pagamento in 'src\View\pdv.View.Page.Pagamento.pas' {PagePagamentos},
  pdv.View.Page.Pix in 'src\View\pdv.View.Page.Pix.pas' {FramePix: TFrame},
  pdv.View.Page.Dinheiro in 'src\View\pdv.View.Page.Dinheiro.pas' {FrameDinheiro: TFrame},
  pdv.View.Page.Cartao in 'src\View\pdv.View.Page.Cartao.pas' {FrameCartao: TFrame},
  pdv.View.Page.identificarCliente in 'src\View\pdv.View.Page.identificarCliente.pas' {PageIdentificarCliente},
  pdv.View.Page.ImportarCliente in 'src\View\pdv.View.Page.ImportarCliente.pas' {PageImportarCliente},
  pdv.View.Page.AbrirCaixa in 'src\View\pdv.View.Page.AbrirCaixa.pas' {PageAberturaCaixa},
  pdv.Model.cAIXA in 'src\model\pdv.Model.cAIXA.pas',
  pdv.View.Page.FecharCaixa in 'src\View\pdv.View.Page.FecharCaixa.pas' {PageFechamentoCaixa},
  pdv.View.Componente.Frame.PgtoCaixa in 'src\View\componente\pdv.View.Componente.Frame.PgtoCaixa.pas' {FramePgtoFechamentoCaixa: TFrame},
  pdv.Model.FechamentoCaixa in 'src\model\pdv.Model.FechamentoCaixa.pas',
  pdv.Model.Enum in 'src\model\pdv.Model.Enum.pas',
  pdv.View.Utils in 'src\utils\pdv.View.Utils.pas',
  pdv.View.Page.LoginSupervisor in 'src\View\pdv.View.Page.LoginSupervisor.pas' {PageLoginSupervisor},
  pdv.View.Componente.Frame.ItemVenda in 'src\View\componente\pdv.View.Componente.Frame.ItemVenda.pas' {FrameItemVenda: TFrame},
  pdv.View.Componente.Mensagem in 'src\View\componente\pdv.View.Componente.Mensagem.pas' {PageMensagem},
  pdv.Utils.Interfaces in 'src\utils\pdv.Utils.Interfaces.pas',
  pdv.Utils.Forms.Impl.ResourcesImages in 'src\utils\impl\pdv.Utils.Forms.Impl.ResourcesImages.pas',
  pdv.View.TrataExceptions in 'src\utils\pdv.View.TrataExceptions.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
