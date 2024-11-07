unit pdv.View.Page.Pagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, pdv.View.Page.Pix;

type
  TPagePagamentos = class(TForm)
    pnlContainer: TPanel;
    pnlResumoVenda: TPanel;
    pnlFormasPagamento: TPanel;
    pnlResumo: TPanel;
    pnlInfoVenda: TPanel;
    pnlBottom: TPanel;
    pnlEditar: TPanel;
    pnlTituloEditar: TPanel;
    imgEditar: TImage;
    lblEditar: TLabel;
    pnlTotalVenda: TPanel;
    lblTotalVenda: TLabel;
    lblValorVenda: TLabel;
    pnlDesconto: TPanel;
    Label1: TLabel;
    edtDesconto: TEdit;
    pnlAcrescimo: TPanel;
    lblAcrescimo: TLabel;
    edtAcrescimo: TEdit;
    pnlTotalReceber: TPanel;
    lblTotalReceber: TLabel;
    lblValorReceber: TLabel;
    shpSeparador: TShape;
    pnlaaaaa: TPanel;
    pnlTotalRecebido: TPanel;
    lblTotalRecebido: TLabel;
    edtValorTotalRecebido: TEdit;
    pnlSaldoRestante: TPanel;
    lblSaldoRestante: TLabel;
    lblValorSaldoRestante: TLabel;
    pnlTroco: TPanel;
    lblTroco: TLabel;
    lblValorTroco: TLabel;
    pnlSuperiorFormaPgto: TPanel;
    pnlShpSeparadorSuperior: TPanel;
    shpSeparadorSuperior: TShape;
    pnlTituloFormaPagamento: TPanel;
    pnlInfoFormas: TPanel;
    pnlEscolhaFormaPgto: TPanel;
    pnlFormas: TPanel;
    pnlCartao: TPanel;
    pnlSuperiorCartao: TPanel;
    pnlImgCartao: TPanel;
    pnlTituloCartao: TPanel;
    imgCartao: TImage;
    pnlPix: TPanel;
    shpPix: TShape;
    pnlSuperiorPix: TPanel;
    pnlImgPix: TPanel;
    imgPix: TImage;
    pnlTituloPix: TPanel;
    pnlDinheiro: TPanel;
    shpDinheiro: TShape;
    pnlSuperiorDinheiro: TPanel;
    pnlImgDinheiro: TPanel;
    imgDinheiro: TImage;
    pnlTituloDinheiro: TPanel;
    pnlFramePix: TPanel;
    pnlSeparadorFramePix: TPanel;
    shpSeparadorPix: TShape;
    shpCartao: TShape;
    procedure FormShow(Sender: TObject);
  private
    procedure ExibeFramePix;
  public
    { Public declarations }
  end;

var
  PagePagamentos: TPagePagamentos;

implementation

{$R *.dfm}

procedure TPagePagamentos.ExibeFramePix;
var
  lFrame: TFramePix;
begin
  lFrame := TFramePix.Create(nil);
  lFrame.Align := alClient;
  lFrame.Parent := pnlFramePix;
  lFrame.Show;
end;

procedure TPagePagamentos.FormShow(Sender: TObject);
begin
  ExibeFramePix;
end;

end.
