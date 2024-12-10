unit pdv.View.Componente.Frame.ItemVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TFrameItemVenda = class(TFrame)
    pnlContainer: TPanel;
    shpSeparador: TShape;
    pnlInfoItem: TPanel;
    pnlNrItem: TPanel;
    pnlCodItem: TPanel;
    pnlSubTotal: TPanel;
    pnlQtd: TPanel;
    pnlValorUnit: TPanel;
    pnlDescricao: TPanel;
    lblDescricao: TLabel;
  private
    FProc: TProc<TObject>;
    FQuantidade: Double;
    FValorUnit: Double;
  public
    function Embed(Value: TWinControl): TFrameItemVenda;
    function Item(Value: Integer): TFrameItemVenda;
    function Codigo(Value: String): TFrameItemVenda;
    function Descricao(Value: String): TFrameItemVenda;
    function Quantidade(Value: Double): TFrameItemVenda;
    function ValorUnitario(Value: Double): TFrameItemVenda;
    function Click(Value: TProc<TObject>): TFrameItemVenda;
    function Alinhamento(Value: TAlign): TFrameItemVenda;
    function Nome(Value: String): TFrameItemVenda;
    function Build: TFrameItemVenda;
    class function New(AOwner: TComponent): TFrameItemVenda;
  end;

implementation

{$R *.dfm}
{ TFrameItemVenda }

function TFrameItemVenda.Alinhamento(Value: TAlign): TFrameItemVenda;
begin
  Self.Align := alBottom;
  Self.Align := Value;
  Result := Self;
end;

function TFrameItemVenda.Build: TFrameItemVenda;
begin
  pnlSubTotal.Caption := FormatFloat('"R$ ", 0.00', (FValorUnit * FQuantidade));
  Result := Self;
end;

function TFrameItemVenda.Click(Value: TProc<TObject>): TFrameItemVenda;
begin
  FProc := Value;
  Result := Self;
end;

function TFrameItemVenda.Codigo(Value: String): TFrameItemVenda;
begin
  pnlCodItem.Caption := Value;
  Result := Self;
end;

function TFrameItemVenda.Descricao(Value: String): TFrameItemVenda;
begin

  if (Length(Value) > 40) then
    pnlDescricao.Padding.Top := 0;

  lblDescricao.Caption := Value;
  Result := Self;
end;

function TFrameItemVenda.Embed(Value: TWinControl): TFrameItemVenda;
begin
  Self.Parent := Value;
  Result := Self;
end;

function TFrameItemVenda.Item(Value: Integer): TFrameItemVenda;
begin
  pnlNrItem.Caption := Value.ToString;
  Result := Self;
end;

class function TFrameItemVenda.New(AOwner: TComponent): TFrameItemVenda;
begin
  Result := Self.Create(AOwner);
end;

function TFrameItemVenda.Nome(Value: String): TFrameItemVenda;
begin
  Self.Name := Value;
  Result := Self;
end;

function TFrameItemVenda.Quantidade(Value: Double): TFrameItemVenda;
begin
  FQuantidade := Value;
  pnlQtd.Caption := FormatFloat(',0.000', FQuantidade);
  Result := Self;
end;

function TFrameItemVenda.ValorUnitario(Value: Double): TFrameItemVenda;
begin
  FValorUnit := Value;
  pnlQtd.Caption := FormatFloat(',0.000', FValorUnit);
  Result := Self;
end;

end.
