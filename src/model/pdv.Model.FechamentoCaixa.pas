unit pdv.Model.FechamentoCaixa;

interface

uses pdv.Model.cAIXA;

type

  TFechamentoCaixa = class
  private
    FId: Integer;
    FCaixa: TCaixa;
    FDinheiro: Double;
    FCartaoDebito: Double;
    FCartaCredito: Double;
    FPix: Double;
    FTotal: Double;

  public
    property Id: Integer read FId write FId;
    property cAIXA: TCaixa read FCaixa write FCaixa;
    property Dinheiro: Double read FDinheiro write FDinheiro;
    property CartaoDebito: Double read FCartaoDebito write FCartaoDebito;
    property CartaCredito: Double read FCartaCredito write FCartaCredito;
    property Pix: Double read FPix write FPix;
    property Total: Double read FTotal write FTotal;


    class function New: TFechamentoCaixa;
  end;

implementation

{ TFechamentoCaixa }

class function TFechamentoCaixa.New: TFechamentoCaixa;
begin
  Result := Self.Create;
end;

end.
