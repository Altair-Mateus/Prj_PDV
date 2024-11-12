unit pdv.View.Page.Pagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, pdv.View.Page.Pix, pdv.View.Page.Dinheiro,
  pdv.View.Page.Cartao;

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
    imgCartao: TImage;
    pnlPix: TPanel;
    shpPix: TShape;
    pnlSuperiorPix: TPanel;
    pnlImgPix: TPanel;
    imgPix: TImage;
    pnlDinheiro: TPanel;
    shpDinheiro: TShape;
    pnlSuperiorDinheiro: TPanel;
    pnlImgDinheiro: TPanel;
    imgDinheiro: TImage;
    pnlFrame: TPanel;
    pnlSeparadorFramePix: TPanel;
    shpSeparadorPix: TShape;
    shpCartao: TShape;
    lblCartao: TLabel;
    lblPix: TLabel;
    lblDinheiro: TLabel;
    procedure ClickPix(Sender: TObject);
    procedure ClickCartao(Sender: TObject);
    procedure ClickDinheiro(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FFramePix: TFramePix;
    FFrameDinheiro: TFrameDinheiro;
    FFrameCartao: TFrameCartao;

    procedure InicializaFrames;
    procedure DestroyFrames;
    procedure CriaFramePix;
    procedure CriaFrameDinheiro;
    procedure CriaFrameCartao;
    procedure SetClick(pShape: TShape);

    procedure ExibirFrame(const pFrame: TFrame);

  public
    { Public declarations }
  end;

var
  PagePagamentos: TPagePagamentos;

implementation

{$R *.dfm}

procedure TPagePagamentos.ClickCartao(Sender: TObject);
begin
  SetClick(shpCartao);
  ExibirFrame(FFrameCartao);
end;

procedure TPagePagamentos.ClickDinheiro(Sender: TObject);
begin
  SetClick(shpDinheiro);
  ExibirFrame(FFrameDinheiro);
end;

procedure TPagePagamentos.ClickPix(Sender: TObject);
begin
  SetClick(shpPix);
  ExibirFrame(FFramePix);
end;

procedure TPagePagamentos.CriaFrameCartao;
begin
  FFrameCartao := TFrameCartao.Create(nil);
  FFrameCartao.Align := alClient;
  FFrameCartao.Parent := pnlFrame;
  FFrameCartao.Visible := False;
end;

procedure TPagePagamentos.CriaFrameDinheiro;
begin
  FFrameDinheiro := TFrameDinheiro.Create(nil);
  FFrameDinheiro.Align := alClient;
  FFrameDinheiro.Parent := pnlFrame;
  FFrameDinheiro.Visible := False;
end;

procedure TPagePagamentos.CriaFramePix;
begin
  FFramePix := TFramePix.Create(nil);
  FFramePix.Align := alClient;
  FFramePix.Parent := pnlFrame;
  FFramePix.Visible := False;
end;

procedure TPagePagamentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DestroyFrames;
end;

procedure TPagePagamentos.FormCreate(Sender: TObject);
begin
  InicializaFrames;
end;

procedure TPagePagamentos.InicializaFrames;
begin
  CriaFramePix;
  CriaFrameDinheiro;
  CriaFrameCartao;
end;

procedure TPagePagamentos.SetClick(pShape: TShape);
begin
  shpPix.Pen.Style := psClear;
  shpDinheiro.Pen.Style := psClear;
  shpCartao.Pen.Style := psClear;

  pShape.Pen.Style := psSolid;
  pnlFormas.Visible := False;
  pnlFormas.Visible := True;
end;

procedure TPagePagamentos.DestroyFrames;
begin
  FFramePix.Free;
  FFrameDinheiro.Free;
  FFrameCartao.Free;
end;

procedure TPagePagamentos.ExibirFrame(const pFrame: TFrame);
begin
  FFramePix.Visible := False;
  FFrameDinheiro.Visible := False;
  FFrameCartao.Visible := False;

  pFrame.Visible := True;

  if (pFrame = FFrameDinheiro) then
    FFrameDinheiro.edtRecebido.SetFocus;
end;

end.
