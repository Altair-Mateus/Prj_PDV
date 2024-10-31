unit pdv.View.Page.Pagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TPagePagamentos = class(TForm)
    pnlContainer: TPanel;
    pnlInformacoes: TPanel;
    pnlFormasPagamento: TPanel;
    pnlResumo: TPanel;
    pnlInfoVenda: TPanel;
    pnlBottom: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    lblEditar: TLabel;
    Panel3: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagePagamentos: TPagePagamentos;

implementation

{$R *.dfm}

end.
