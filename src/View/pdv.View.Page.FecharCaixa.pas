unit pdv.View.Page.FecharCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  pdv.Model.cAIXA, pdv.View.Componente.Frame.PgtoCaixa;

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
  private
    FProc: TProc<TCaixa>;
    FIndex: Integer;
    FLista: TFramePgtoFechamentoCaixa;

    procedure Responsive;
    procedure AlimentaComboBox;
    procedure AdicionaPagamento(Sender: TObject);
    procedure RemoveItemLista(Sender: TObject);
    procedure Fechar;
    procedure Confirmar;

  public
    function Embed(Value: TWinControl): TPageFechamentoCaixa;
    function Informacoes(Value: TProc<TCaixa>): TPageFechamentoCaixa;

    destructor Destroy; override;

    class function New(AOwner: TComponent): TPageFechamentoCaixa;

  end;

var
  PageFechamentoCaixa: TPageFechamentoCaixa;

implementation

{$R *.dfm}

uses pdv.Model.Enum;
{ TPageAberturaCaixa }

procedure TPageFechamentoCaixa.AdicionaPagamento(Sender: TObject);
begin
  Inc(FIndex);

  FLista := TFramePgtoFechamentoCaixa.New(Self).TipoPagamento(cbxFormaPgto.Text)
    .Valor(Trim(edtValor.Text)).Embed(lbxPagamentos)
    .Nome('Frame' + FIndex.ToString).Click(RemoveItemLista).Alinhamento(alTop);

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
  AdicionaPagamento(Sender);
end;

procedure TPageFechamentoCaixa.btnCancelarClick(Sender: TObject);
begin
  Fechar;
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

  Fechar;
end;

destructor TPageFechamentoCaixa.Destroy;
begin
  if Assigned(FLista) then
    FLista.Free;
  inherited;

end;

procedure TPageFechamentoCaixa.Fechar;
begin
  Close;
end;

function TPageFechamentoCaixa.Embed(Value: TWinControl): TPageFechamentoCaixa;
begin
  Self.Parent := Value;
  Result := Self;
end;

procedure TPageFechamentoCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      Close;
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
