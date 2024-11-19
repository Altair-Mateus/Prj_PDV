unit pdv.View.Page.Pix;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TFramePix = class(TFrame)
    pnlImg: TPanel;
    Image1: TImage;
  private
    { Private declarations }
  public
    class function New(AOwner: TComponent): TFramePix;
    function Embed(Value: TWinControl): TFramePix;
    function Alignment(Value: TAlign): TFramePix;

  end;

implementation

{$R *.dfm}
{ TFramePix }

function TFramePix.Alignment(Value: TAlign): TFramePix;
begin
  Self.Align := Value;
  Result := Self;
end;

function TFramePix.Embed(Value: TWinControl): TFramePix;
begin
  Self.Parent := Value;
  Result := Self;
end;

class function TFramePix.New(AOwner: TComponent): TFramePix;
begin
  Result := Self.Create(AOwner);
end;

end.
