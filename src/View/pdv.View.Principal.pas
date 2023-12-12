unit pdv.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Imaging.jpeg, pdv.View.Login;

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
    DBGrid1: TDBGrid;
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
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FLogin: TfrmLogin;
    procedure MontarBotoes;

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation
{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

  MontarBotoes;

end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin

  FLogin := TfrmLogin.Create(nil);
  FLogin.Parent := pnlMaster;
  Flogin.Show;


end;

procedure TfrmPrincipal.MontarBotoes;
begin

  btnCancelarOp.Caption     := 'Cancelar Operação' + ''#13'' + '(ESC)';
  btnConsultarPreco.Caption := 'Consultar Preço' + ''#13'' + '(F4)';
  btnAbrirCaixa.Caption     := 'Abrir Caixa' + ''#13'' + '(F2)';
  btnCancelarVenda.Caption  := 'Cancelar Venda' + ''#13'' + '(F6)';
  btnCancelarItem.Caption   := 'Cancelar Item' + ''#13'' + '(F5)';
  btnMaisFuncoes.Caption    := 'Mais Funções' + ''#13'' + '(F12)';

end;

end.
