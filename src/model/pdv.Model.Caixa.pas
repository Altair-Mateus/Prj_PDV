unit pdv.Model.cAIXA;

interface

uses
  System.SysUtils, System.TypInfo;

type

  TTurno = (MANHA, TARDE, NOITE);

  TTurnoHelper = record helper for TTurno
    function ToString: String;
    function TEnum(Value: String): TTurno;
    function RetornaTurno(Value: TDateTime): TTurno;
  end;

  TCaixa = class
  private
    FId: Integer;
    FCaixa: Integer;
    FTurno: TTurno;
    FOperador: String;
    FSupervisor: String;
    FAberto: Boolean;
    FDataHoraAbertura: TDateTime;
    FSaldoInicial: Double;
    FDataHoraFechamento: TDateTime;

  public
    property Id: Integer read FId write FId;
    property cAIXA: Integer read FCaixa write FCaixa;
    property Turno: TTurno read FTurno write FTurno;
    property Operador: String read FOperador write FOperador;
    property Supervisor: String read FSupervisor write FSupervisor;
    property Aberto: Boolean read FAberto write FAberto;
    property DataHoraAbertura: TDateTime read FDataHoraAbertura
      write FDataHoraAbertura;
    property SaldoInicial: Double read FSaldoInicial write FSaldoInicial;
    property DataHoraFechamento: TDateTime read FDataHoraFechamento
      write FDataHoraFechamento;

    class function New: TCaixa;
  end;

implementation

{ TCaixa }

class function TCaixa.New: TCaixa;
begin
  Result := Self.Create;
end;

{ TTurnoHelper }

function TTurnoHelper.RetornaTurno(Value: TDateTime): TTurno;
begin
  if (Value >= StrToTime('06:00:00')) and (Value <= StrToTime('11:59:59')) then
    Result := MANHA
  else if (Value >= StrToTime('12:00:00')) and (Value <= StrToTime('17:59:59'))
  then
    Result := TARDE
  else if (Value >= StrToTime('18:00:00')) and (Value <= StrToTime('23:59:59'))
  then
    Result := NOITE;
end;

function TTurnoHelper.TEnum(Value: String): TTurno;
begin
  Result := TTurno(GetEnumValue(TypeInfo(TTurno), Value));
end;

function TTurnoHelper.ToString: String;
begin
  Result := GetEnumName(TypeInfo(TTurno), Integer(Self));
end;

end.
