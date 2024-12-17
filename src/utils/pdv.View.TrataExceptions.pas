unit pdv.View.TrataExceptions;

interface

uses
  System.SysUtils,
  Vcl.Forms, System.Classes, Vcl.Graphics, Vcl.Imaging.jpeg,
  pdv.View.Componente.Mensagem, Vcl.ExtCtrls;

type

  TException = class
  private
    FlogFile: String;
    FApplicationPath: String;
    FLogPath: String;
    FLogImages: String;

    procedure TrataException(Sender: TObject; E: Exception);
    procedure GravarLog(aInfo, aMensagem: String);
    procedure GravarImagemFOrmulario(const aNomeArquivo: String;
      aFormulario: TForm);
    procedure TrataMensagem(Owner: TComponent; E: Exception);

  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TException }

constructor TException.Create;
begin

  FApplicationPath := IncludeTrailingPathDelimiter
    (ExtractFilePath(ParamStr(0)));
  FLogPath := IncludeTrailingPathDelimiter(FApplicationPath + 'LOGS');
  FLogImages := IncludeTrailingPathDelimiter(FLogPath + 'IMAGES');
  FlogFile := FLogPath + ExtractFileName(ChangeFileExt(ParamStr(0), '')
    ) + '.log';

  ForceDirectories(FLogPath);
  ForceDirectories(FLogImages);

  Application.OnException := TrataException;
end;

destructor TException.Destroy;
begin

  inherited;
end;

procedure TException.GravarImagemFOrmulario(const aNomeArquivo: String;
  aFormulario: TForm);
var
  lBitMap: TBitmap;
  lJpg: TjpegImage;
begin
  lBitMap := TBitmap.Create;
  lJpg := TjpegImage.Create;
  try

    lBitMap.Assign(aFormulario.GetFormImage);
    lJpg.Assign(lBitMap);

    lJpg.SaveToFile(Format('%s\%s.jpg', [FLogImages, aNomeArquivo]));

  finally
    lBitMap.Free;
    lJpg.Free;
  end;
end;

procedure TException.GravarLog(aInfo, aMensagem: String);
var
  lArq: TextFile;
begin

  AssignFile(lArq, FlogFile);

  if not(FileExists(FlogFile)) then
    Rewrite(lArq)
  else
    Append(lArq);

  Writeln(lArq, aInfo + aMensagem);
  CloseFile(lArq);

end;

procedure TException.TrataException(Sender: TObject; E: Exception);
var
  lDataHora: String;
begin

  lDataHora := FormatDateTime('ddmmyyyyhhmmss', Now);

  GravarLog('[Data/Hora........]', FormatDateTime('dd/mm/yyyy hh:mm:ss', Now));
  GravarLog('[Mensagem.........]', E.Message);
  GravarLog('[Classe Exceção...]', E.ClassName);

  if (TComponent(Sender) is TForm) then
    GravarLog('[Formulário.......]', TForm(Sender).Name)
  else
    GravarLog('[Formulário.......]', TForm(TComponent(Sender).Owner).Name);

  GravarLog('[Unit.............]', Sender.UnitName);
  GravarLog('[Component Visual.]', Screen.ActiveControl.Name);
  GravarLog('', StringOfChar('-', 70));
  GravarLog('', '');

  GravarImagemFOrmulario(lDataHora, Screen.ActiveForm);
  TrataMensagem(TComponent(Sender).Owner, E);
end;

procedure TException.TrataMensagem(Owner: TComponent; E: Exception);
var
  lmensagem: TPageMensagem;
  lPanel: TPanel;
  I: Integer;
begin

  lmensagem := TPageMensagem.New(Owner);

  if (TForm(Owner).Parent <> nil) then
  begin
    lmensagem.Embed(TPanel(TForm(Owner).Parent));
  end
  else
  begin

    lPanel := TPanel(TForm(Owner).Controls[0]);

    for I := Pred(lPanel.ControlCount) downto 0 do
    begin
      if ((lPanel.Controls[I] is TPanel) and (lPanel.Controls[I].Name = 'pnlMaster'))
      then
      begin
        lmensagem.Embed(TPanel(lPanel.Controls[I]));
      end;
    end;
  end;

  if E is EConvertError then
    lmensagem.Mensagem('Erro na conversão dos dados', ERRO).ClickOk(
      procedure(Sender: TObject)
      begin
        //
      end);

  if E is EInvalidPointer then
    lmensagem.Mensagem
      ('Encontramos um erro na aplicação, já foi enviado um chamado para o suporte',
      ERRO).ClickOk(
      procedure(Sender: TObject)
      begin
        //
      end);

  if E is EAccessViolation then
    lmensagem.Mensagem
      ('Encontramos um erro na aplicação, por favor entre em contato com o suporte',
      ERRO).ClickOk(
      procedure(Sender: TObject)
      begin
        //
      end);

end;

var
  MinhaExcecao: TException;

initialization

MinhaExcecao := TException.Create;

finalization

FreeAndNil(MinhaExcecao);

end.
