unit pdv.View.Page.Cartao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls;

type
  TFrameCartao = class(TFrame)
    pnlContainer: TPanel;
    pnlFormas: TPanel;
    pnlCredito: TPanel;
    shpCartao: TShape;
    pnlSuperiorCredito: TPanel;
    lblCredito: TLabel;
    pnlImgCredito: TPanel;
    imgCredito: TImage;
    pnlDebito: TPanel;
    shpDebito: TShape;
    pnlSuperiorDebito: TPanel;
    lblDebito: TLabel;
    pnlImgDebito: TPanel;
    imgDebito: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    Shape1: TShape;
    Panel3: TPanel;
    Panel4: TPanel;
    Image1: TImage;
    Panel5: TPanel;
    Shape2: TShape;
    Panel6: TPanel;
    Panel7: TPanel;
    Image2: TImage;
    Panel8: TPanel;
    Shape3: TShape;
    Panel9: TPanel;
    Panel10: TPanel;
    Image3: TImage;
    Panel11: TPanel;
    Shape4: TShape;
    Panel12: TPanel;
    Panel13: TPanel;
    Image4: TImage;
  private
    { Private declarations }
  public
    class function New(AOwner: TComponent): TFrameCartao;
    function Embed(Value: TWinControl): TFrameCartao;
    function Align(Value: TAlign): TFrameCartao;
  end;

implementation

{$R *.dfm}
{ TFrameCartao }

function TFrameCartao.Align(Value: TAlign): TFrameCartao;
begin
  Result := Self;
  Self.Align(Value);
end;

function TFrameCartao.Embed(Value: TWinControl): TFrameCartao;
begin
  Result := Self;
  Self.Parent := Value;
end;

class function TFrameCartao.New(AOwner: TComponent): TFrameCartao;
begin
  Result := Self.Create(AOwner);
end;

end.
