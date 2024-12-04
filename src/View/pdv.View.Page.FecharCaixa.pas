unit pdv.View.Page.FecharCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  pdv.Model.cAIXA, pdv.View.Componente.Frame.PgtoCaixa, pdv.View.Utils,
  System.Generics.Collections;

type
  TPageFechamentoCaixa = class(TForm)
    pnlContainerFechamento: TPanel;
    pnlTitulo: TPanel;
    pnlAviso: TPanel;
    pnlInfo: TPanel;
    pnlFuncoes: TPanel;
    pnlBtnAdicionar: TPanel;
    shpBtnAdicionar: TShape;
    btnAdicionar: TSpeedButton;
    pnlFormaPgto: TPanel;
    Panel4: TPanel;
    cbxFormaPgto: TComboBox;
    pnlEdtValor: TPanel;
    edtValor: TEdit;
    pnlBtns: TPanel;
    pnlBtnCancelar: TPanel;
    pnlBtnConfirmar: TPanel;
    shpBtnCancelar: TShape;
    shpBtnConfirmar: TShape;
    btnConfirmar: TSpeedButton;
    btnCancelar: TSpeedButton;
    pnlFormasPgto: TPanel;
    lbxPagamentos: TListBox;
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbxFormaPgtoClick(Sender: TObject);
  private
    FProc: TProc<TCaixa>;
    FIndex: Integer;
    FLista: TObjectList<TFramePgtoFechamentoCaixa>;

    procedure Responsive;
    procedure AlimentaComboBox;
    procedure AdicionaPagamento;
    procedure RemoveItemLista(Sender: TObject);
    procedure Confirmar;

    procedure RemoverFrameLista(Sender: TObject);

  public
    function Embed(Value: TPanel): TPageFechamentoCaixa;
    function Informacoes(Value: TProc<TCaixa>): TPageFechamentoCaixa;

    class function New(AOwner: TComponent): TPageFechamentoCaixa;

  end;

var
  PageFechamentoCaixa: TPageFechamentoCaixa;

implementation

{$R *.dfm}

uses pdv.Model.Enum;
{ TPageAberturaCaixa }

procedure TPageFechamentoCaixa.AdicionaPagamento;
var
  lFrame: TFramePgtoFechamentoCaixa;
begin

  Inc(FIndex);

  // Criando o frame
  lFrame := TFramePgtoFechamentoCaixa.New(Self).TipoPagamento(cbxFormaPgto.Text)
    .Valor(Trim(edtValor.Text)).Embed(lbxPagamentos)
    .Nome('Frame' + FIndex.ToString).Alinhamento(alTop);

  // Aribuindo o evento ao TNotifyEvent de exclusão do Frame
  lFrame.EventExcluir := RemoverFrameLista;

  // Adicionando na lista de Frames
  FLista.Add(lFrame);

  cbxFormaPgto.ItemIndex := -1;
end;

procedure TPageFechamentoCaixa.AlimentaComboBox;
var
  I: TTipoPagamento;
begin

  cbxFormaPgto.Items.Clear;
  for I := Low(TTipoPagamento) to High(TTipoPagamento) do
  begin
    cbxFormaPgto.Items.Add(I.ToString);
  end;

end;

procedure TPageFechamentoCaixa.btnAdicionarClick(Sender: TObject);
begin
  AdicionaPagamento;
end;

procedure TPageFechamentoCaixa.btnCancelarClick(Sender: TObject);
begin
  Self.RemoveObject;
end;

procedure TPageFechamentoCaixa.cbxFormaPgtoClick(Sender: TObject);
begin
  edtValor.SetFocus;
end;

procedure TPageFechamentoCaixa.Confirmar;
var
  lCaixa: TCaixa;
  lData: TDateTime;
begin

  lData := Now;
  lCaixa := TCaixa.New;
  try
    lCaixa.Aberto := False;
    lCaixa.DataHoraFechamento := lData;
    FProc(lCaixa);
  finally
    lCaixa.Free;
  end;

  Self.RemoveObject;
end;

function TPageFechamentoCaixa.Embed(Value: TPanel): TPageFechamentoCaixa;
begin
  Self.AddObject(Value);
  Result := Self;
end;

procedure TPageFechamentoCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TPageFechamentoCaixa.FormCreate(Sender: TObject);
begin
  FLista := TObjectList<TFramePgtoFechamentoCaixa>.Create;
end;

procedure TPageFechamentoCaixa.FormDestroy(Sender: TObject);
begin
  if Assigned(FLista) then
    FLista.Free;
end;

procedure TPageFechamentoCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      Self.RemoveObject;
  end;
end;

procedure TPageFechamentoCaixa.FormResize(Sender: TObject);
begin
  Responsive;
end;

procedure TPageFechamentoCaixa.FormShow(Sender: TObject);
begin
  AlimentaComboBox;
end;

function TPageFechamentoCaixa.Informacoes(Value: TProc<TCaixa>)
  : TPageFechamentoCaixa;
begin
  FProc := Value;
  Result := Self;
end;

class function TPageFechamentoCaixa.New(AOwner: TComponent)
  : TPageFechamentoCaixa;
begin
  Result := Self.Create(AOwner);
end;

procedure TPageFechamentoCaixa.RemoveItemLista(Sender: TObject);
begin

  lbxPagamentos.DeleteSelected;
  // FLista.DisposeOf;
  Dec(FIndex);
end;

procedure TPageFechamentoCaixa.RemoverFrameLista(Sender: TObject);
var
  lFrame: TFramePgtoFechamentoCaixa;
  lIndice: Integer;
begin

  // Verificação do Sender recebido
  if (Sender is TFramePgtoFechamentoCaixa) then
  begin

    // Descobrindo o índice do Frame selecionado para exclusão
    lFrame := TFramePgtoFechamentoCaixa(Sender);
    lIndice := FLista.IndexOf(lFrame);

    // Removendo o Frame da lista
    if (lIndice >= 0) then
    begin
      FLista.Delete(lIndice);
      Dec(FIndex);
    end;

  end;
end;

procedure TPageFechamentoCaixa.Responsive;
var
  lHeight, lWidth: Integer;
begin
  lHeight := Round((Self.Height - pnlContainerFechamento.Height) / 2);
  lWidth := Round((Self.Width - pnlContainerFechamento.Width) / 2);

  pnlContainerFechamento.Margins.Left := lWidth;
  pnlContainerFechamento.Margins.Right := lWidth;
  pnlContainerFechamento.Margins.Top := lHeight;
  pnlContainerFechamento.Margins.Bottom := lHeight;
  pnlContainerFechamento.Align := alClient;

end;

end.
