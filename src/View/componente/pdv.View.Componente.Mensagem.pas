unit pdv.View.Componente.Mensagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type

  TTipoMensagem = (INFORMACAO, ERRO, ALERTA);

  TPageMensagem = class(TForm)
    pnlContainer: TPanel;
    pnlTitulo: TPanel;
    imgMensagem: TImage;
    pnlBtns: TPanel;
    pnlBtnCancelar: TPanel;
    shpBtnCancelar: TShape;
    btnCancelar: TSpeedButton;
    pnlBtnConfirmar: TPanel;
    shpBtnConfirmar: TShape;
    btnConfirmar: TSpeedButton;
    pnlBtnOk: TPanel;
    shpBtnOk: TShape;
    btnOk: TSpeedButton;
    pnlMensagem: TPanel;
    memMensagem: TMemo;
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    FProc: TProc<TObject>;
    procedure Responsive;
    procedure ModelarMensagem(const aMensagem: String; aTipo: TTipoMensagem);
    procedure TipoMensagem(aTipo: TTipoMensagem);
  public
    function Mensagem(const aMensagem: String; aTipo: TTipoMensagem)
      : TPageMensagem;
    function Embed(AParent: TPanel): TPageMensagem;
    function ClickOk(Proc: TProc<TObject>): TPageMensagem;
    function ClickConfirmar(Proc: TProc<TObject>): TPageMensagem;
    function ClickCancelar(Proc: TProc<TObject>): TPageMensagem;
    class function New(AOwner: TComponent): TPageMensagem;
  end;

var
  PageMensagem: TPageMensagem;

implementation

{$R *.dfm}

uses pdv.Utils.Forms.Impl.ResourcesImages, pdv.View.Utils;
{ TForm1 }

procedure TPageMensagem.btnCancelarClick(Sender: TObject);
begin
  Self.RemoveObject;
end;

procedure TPageMensagem.btnConfirmarClick(Sender: TObject);
begin
  Self.RemoveObject;
end;

procedure TPageMensagem.btnOkClick(Sender: TObject);
begin
  Self.RemoveObject;
end;

function TPageMensagem.ClickCancelar(Proc: TProc<TObject>): TPageMensagem;
begin
  FProc := Proc;
  Result := Self;
end;

function TPageMensagem.ClickConfirmar(Proc: TProc<TObject>): TPageMensagem;
begin
  FProc := Proc;
  Result := Self;
end;

function TPageMensagem.ClickOk(Proc: TProc<TObject>): TPageMensagem;
begin
  FProc := Proc;
  Result := Self;
end;

function TPageMensagem.Embed(AParent: TPanel): TPageMensagem;
begin
  Self.AddObject(AParent);
  Result := Self;
end;

procedure TPageMensagem.FormShow(Sender: TObject);
begin
  Responsive;
end;

function TPageMensagem.Mensagem(const aMensagem: String; aTipo: TTipoMensagem)
  : TPageMensagem;
begin
  ModelarMensagem(aMensagem, aTipo);
  Result := Self;
end;

procedure TPageMensagem.ModelarMensagem(const aMensagem: String;
  aTipo: TTipoMensagem);
begin
  memMensagem.Text := aMensagem;
  TipoMensagem(aTipo);
end;

class function TPageMensagem.New(AOwner: TComponent): TPageMensagem;
begin
  Result := Self.Create(AOwner);
end;

procedure TPageMensagem.Responsive;
var
  lHeight, lWidth: Integer;
begin
  lHeight := Round((Self.Height - pnlContainer.Height) / 2);
  lWidth := Round((Self.Width - pnlContainer.Width) / 2);

  pnlContainer.Margins.Left := lWidth;
  pnlContainer.Margins.Right := lWidth;
  pnlContainer.Margins.Top := lHeight;
  pnlContainer.Margins.Bottom := lHeight;
  pnlContainer.Align := alClient;

end;

procedure TPageMensagem.TipoMensagem(aTipo: TTipoMensagem);
begin
  case aTipo of
    INFORMACAO:
      begin
        pnlTitulo.Caption := 'Informação';
        pnlBtnCancelar.Visible := True;
        pnlBtnConfirmar.Visible := True;
        btnCancelar.Caption := 'Cancelar';
        btnConfirmar.Caption := 'Confirmar';
        TResourceImage.New.ResourceImage(imgMensagem, 'informacoes');
      end;
    ERRO:
      begin
        pnlTitulo.Caption := 'Erro!';
        pnlBtnOk.Visible := True;
        btnOk.Caption := 'OK';
        TResourceImage.New.ResourceImage(imgMensagem, 'erro');
      end;
    ALERTA:
      begin
        pnlTitulo.Caption := 'Alerta';
        pnlBtnOk.Visible := True;
        btnOk.Caption := 'OK';
        TResourceImage.New.ResourceImage(imgMensagem, 'alerta');
      end;
  end;
end;

end.
