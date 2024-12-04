unit pdv.View.Componente.Frame.PgtoCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFramePgtoFechamentoCaixa = class(TFrame)
    shpSeparador: TShape;
    pnlContainer: TPanel;
    pnlBtnRemover: TPanel;
    btnRemover: TSpeedButton;
    pnlTipoPgto: TPanel;
    pnlValor: TPanel;
    procedure btnRemoverClick(Sender: TObject);
  private
    FProc: TProc<TObject>;
    FEventExcluir: TNotifyEvent;
  public
    function Embed(Value: TWinControl): TFramePgtoFechamentoCaixa;
    function Nome(Value: String): TFramePgtoFechamentoCaixa;
    function TipoPagamento(Value: String): TFramePgtoFechamentoCaixa;
    function Valor(Value: String): TFramePgtoFechamentoCaixa;
    function Click(Value: TProc<TObject>): TFramePgtoFechamentoCaixa;
    function Alinhamento(Value: TAlign): TFramePgtoFechamentoCaixa;

    // Propriedade para disparar eventos de exclusão
    property EventExcluir: TNotifyEvent read FEventExcluir write FEventExcluir;

    class function New(AOwner: TComponent): TFramePgtoFechamentoCaixa;
  end;

implementation

{$R *.dfm}
{ TFramePgtoFechamentoCaixa }

procedure TFramePgtoFechamentoCaixa.btnRemoverClick(Sender: TObject);
begin

  // Dispara o evento atribuído ao Frame quando criado
  if (Assigned(FEventExcluir)) then
    FEventExcluir(Self);
end;

function TFramePgtoFechamentoCaixa.Alinhamento(Value: TAlign)
  : TFramePgtoFechamentoCaixa;
begin
  Self.Align := alBottom;
  Self.Align := Value;
  Result := Self;
end;

function TFramePgtoFechamentoCaixa.Click(Value: TProc<TObject>)
  : TFramePgtoFechamentoCaixa;
begin
  FProc := Value;
  Result := Self;
end;

function TFramePgtoFechamentoCaixa.Embed(Value: TWinControl)
  : TFramePgtoFechamentoCaixa;
begin
  Self.Parent := Value;
  Result := Self;
end;

class function TFramePgtoFechamentoCaixa.New(AOwner: TComponent)
  : TFramePgtoFechamentoCaixa;
begin
  Result := Self.Create(AOwner);
end;

function TFramePgtoFechamentoCaixa.Nome(Value: String)
  : TFramePgtoFechamentoCaixa;
begin
  Self.Name := Value;
  Result := Self;
end;

function TFramePgtoFechamentoCaixa.TipoPagamento(Value: String)
  : TFramePgtoFechamentoCaixa;
begin
  pnlTipoPgto.Caption := Value;
  Result := Self;
end;

function TFramePgtoFechamentoCaixa.Valor(Value: String)
  : TFramePgtoFechamentoCaixa;
begin
  pnlValor.Caption := Format('%s', [Value]);
  Result := Self;
end;

end.
