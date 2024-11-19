unit pdv.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Imaging.jpeg, pdv.View.Login,
  Vcl.WinXCtrls, pdv.View.Page.Pagamento, pdv.View.Page.identificarCliente,
  pdv.View.Page.ImportarCliente;

type
  TfrmPrincipal = class(TForm)
    pnlContainer: TPanel;
    pnlTitle: TPanel;
    pnlMain: TPanel;
    pnlButton: TPanel;
    pnlOperacoes: TPanel;
    pnlGrid: TPanel;
    pnlCancelarOp: TPanel;
    shpCancelarOp: TShape;
    btnCancelarOp: TSpeedButton;
    pnlConsultarPreco: TPanel;
    shpConsultarPreco: TShape;
    btnConsultarPreco: TSpeedButton;
    pnlAbrirCaixa: TPanel;
    shpAbrirCaixa: TShape;
    btnAbrirCaixa: TSpeedButton;
    pnlCancelarVenda: TPanel;
    shpCancelarVenda: TShape;
    btnCancelarVenda: TSpeedButton;
    pnlCancelarItem: TPanel;
    shpCancelarItem: TShape;
    btnCancelarItem: TSpeedButton;
    pnlMaisFuncoes: TPanel;
    shpMaisFuncoes: TShape;
    btnMaisFuncoes: TSpeedButton;
    gridProdutos: TDBGrid;
    pnlTotalCompra: TPanel;
    lblTitTotalCompa: TLabel;
    shpTotalCompra: TShape;
    pnlEdtTotalCompra: TPanel;
    lblTotalCompra: TLabel;
    pnlSubTotal: TPanel;
    lblTitSubTotal: TLabel;
    pnlEdtSubTotal: TPanel;
    shpSubTotal: TShape;
    lblSubTotal: TLabel;
    pnlQuantidades: TPanel;
    lblTitQuantidade: TLabel;
    pnlEdtQuantidade: TPanel;
    shpQuantidade: TShape;
    edtQuantidade: TEdit;
    pnlPreco: TPanel;
    lblTitPreco: TLabel;
    pnlEdtPreco: TPanel;
    shpPreco: TShape;
    lblPreco: TLabel;
    pnlProduto: TPanel;
    lblTitProduto: TLabel;
    pnlEdtProduto: TPanel;
    shpProduto: TShape;
    edtProduto: TEdit;
    pnlImg: TPanel;
    imgProduto: TImage;
    pnlMaster: TPanel;
    dsItens: TDataSource;
    SplitViewFuncoes: TSplitView;
    pnlSplit: TPanel;
    pnlSupSan: TPanel;
    shpSupSan: TShape;
    pnlDescItem: TPanel;
    shpDescItem: TShape;
    pnlMultiplicar: TPanel;
    shpMultiplicar: TShape;
    pnlFechaVenda: TPanel;
    shpFechaVenda: TShape;
    pnlNovaVenda: TPanel;
    shpNovaVenda: TShape;
    pnlCPF: TPanel;
    shpCpf: TShape;
    SplitViewPagamentos: TSplitView;
    pnlPag: TPanel;
    pnlImportarCliente: TPanel;
    shpInformarCliente: TShape;
    pnlIdCliente: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnMaisFuncoesClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    FLogin: TfrmLogin;
    FIdentCliente, FIdentCpf: TPageIdentificarCliente;
    FImportarCliente: TPageImportarCliente;
    procedure MontarBotoes;
    procedure FixarForm;
    procedure SplitViewAction(Value: TSplitView);

    procedure ExibirTelaPagamentos;
    procedure ExibeTelaidCliente;
    procedure ExibeTelaIdCpf;
    procedure ExibeTelaImpCliente;
    procedure DestroyTelas;

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  pdv.Model.Dados;

procedure TfrmPrincipal.btnMaisFuncoesClick(Sender: TObject);
begin
  SplitViewAction(SplitViewFuncoes);
end;

procedure TfrmPrincipal.ExibeTelaidCliente;
begin
  if not(Assigned(FIdentCliente)) then
    FIdentCliente := TPageIdentificarCliente.New(Self).Embed(pnlMaster);

  FIdentCliente.Show;
end;

procedure TfrmPrincipal.ExibeTelaIdCpf;
begin
  if not(Assigned(FIdentCpf)) then
    FIdentCpf := TPageIdentificarCliente.New(Self).Embed(pnlMaster)
      .IdentificaCpf.identificarCliente(
      procedure(aCpf, aCLiente: String)
      begin

        if (not aCLiente.IsEmpty) then
          aCLiente := 'Cliente: ' + aCLiente;
        if (not aCpf.IsEmpty) then
          aCpf := 'CPF: ' + aCpf;

        if ((not aCLiente.IsEmpty) or (not aCpf.IsEmpty)) then
        begin
          pnlIdCliente.Caption := aCLiente + ' ' + aCpf;
          pnlIdCliente.Visible := True;
        end;
      end);

  FIdentCpf.Show;
end;

procedure TfrmPrincipal.ExibeTelaImpCliente;
begin
  if not(Assigned(FImportarCliente)) then
  begin
    FImportarCliente := TPageImportarCliente.New(Self).Embed(pnlMaster)
      .Titulo('Lista de Clientes');
  end;

  FImportarCliente.Show;
end;

procedure TfrmPrincipal.DestroyTelas;
begin
  if (Assigned(FIdentCliente)) then
    FIdentCliente.Release;

  if (Assigned(FIdentCpf)) then
    FIdentCpf.Release;

  if Assigned(FLogin) then
    FLogin.Release;

  if Assigned(FImportarCliente) then
    FImportarCliente.Release;
end;

procedure TfrmPrincipal.ExibirTelaPagamentos;
var
  lFormulario: TPagePagamentos;
begin

  lFormulario := TPagePagamentos.Create(nil);
  try
    lFormulario.Parent := pnlPag;
    lFormulario.Show;
    SplitViewAction(SplitViewPagamentos);
  finally
  end;
end;

procedure TfrmPrincipal.FixarForm;
begin

  Self.WindowState := TWindowState.wsNormal;
  Self.Position := poScreenCenter;
  Self.Constraints.MaxHeight := Self.ClientHeight;
  Self.Constraints.MinHeight := Self.ClientHeight;
  Self.Constraints.MaxWidth := Self.ClientWidth;
  Self.Constraints.MinWidth := Self.ClientWidth;

end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

  MontarBotoes;

end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  DestroyTelas;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin

  case Key of

    VK_ESCAPE:
      ShowMessage('Cancelar Operação');
    VK_F2:
      ShowMessage('Abrir Caixa');
    VK_F4:
      ShowMessage('Consultar Preço');
    VK_F5:
      ShowMessage('Cancelar Item');
    VK_F6:
      ShowMessage('Cancelar Venda');
    VK_F7:
      ExibirTelaPagamentos;
    VK_F9:
      ExibeTelaIdCpf;
    VK_F12:
      btnMaisFuncoesClick(Sender);
    VK_CONTROL:
      ExibeTelaImpCliente;
  end;

end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin

  // FLogin := TfrmLogin.Create(nil);
  // FLogin.Parent := pnlMaster;
  // Flogin.Show;
  //
  // FixarForm;

end;

procedure TfrmPrincipal.MontarBotoes;
begin

  btnCancelarOp.Caption := 'Cancelar Operação' + ''#13'' + '(ESC)';
  btnConsultarPreco.Caption := 'Consultar Preço' + ''#13'' + '(F4)';
  btnAbrirCaixa.Caption := 'Abrir Caixa' + ''#13'' + '(F2)';
  btnCancelarVenda.Caption := 'Cancelar Venda' + ''#13'' + '(F6)';
  btnCancelarItem.Caption := 'Cancelar Item' + ''#13'' + '(F5)';
  btnMaisFuncoes.Caption := 'Mais Funções' + ''#13'' + '(F12)';

end;

procedure TfrmPrincipal.SplitViewAction(Value: TSplitView);
begin
  Value.Opened := (not Value.Opened);
end;

end.
