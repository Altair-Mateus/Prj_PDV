unit pdv.View.Page.Dinheiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TFrameDinheiro = class(TFrame)
    pnlContainerDinheiro: TPanel;
    pnlRecebido: TPanel;
    lblTotRec: TLabel;
    edtRecebido: TEdit;
  private
    { Private declarations }
  public
    class function New(AOwner: TComponent): TFrameDinheiro;
    function Embed(Value: TWinControl): TFrameDinheiro;
    function Alignment(Value: TAlign): TFrameDinheiro;
  end;

implementation

{$R *.dfm}
{ TFrameDinheiro }

function TFrameDinheiro.Alignment(Value: TAlign): TFrameDinheiro;
begin
  Self.Align := Value;
  Result := Self;
end;

function TFrameDinheiro.Embed(Value: TWinControl): TFrameDinheiro;
begin
  Self.Parent := Value;
  Result := Self;
end;

class function TFrameDinheiro.New(AOwner: TComponent): TFrameDinheiro;
begin
  Result := Self.Create(AOwner);
end;

end.
