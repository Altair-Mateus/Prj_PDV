unit pdv.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Imaging.jpeg;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

end.
