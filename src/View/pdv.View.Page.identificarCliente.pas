unit pdv.View.Page.identificarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TPageIdentificarCliente = class(TForm)
    pnlIdentificarCliente: TPanel;
    pnlTitulo: TPanel;
    shpSeparadorIdCliente: TShape;
    pnlCpfCnpj: TPanel;
    lblCpfCnpj: TLabel;
    shpCpfCnpj: TShape;
    edtCnpjCpf: TEdit;
    pnlNome: TPanel;
    lblNome: TLabel;
    shpNome: TShape;
    edtNome: TEdit;
    pnlBotoes: TPanel;
    pnlPesquisar: TPanel;
    shpPesquisar: TShape;
    pnlSuperiorPesquisar: TPanel;
    lblPesquisar: TLabel;
    pnlImgPesquisar: TPanel;
    imgPesquisar: TImage;
    pnlConfirmar: TPanel;
    Shape1: TShape;
    pnlSuperiorConfirmar: TPanel;
    lblConfirmar: TLabel;
    pnlImgConfirmar: TPanel;
    imgConfirmar: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ClickBtnConfirmar(Sender: TObject);
  private
    FProc: TProc<String, String>;
  public
    procedure ResizeIdCliente;
    function Embed(Value: TWinControl): TPageIdentificarCliente;
    function IdentificaCpf: TPageIdentificarCliente;
    function identificarCliente(Value: TProc<String, String>)
      : TPageIdentificarCliente;
    class function New(AOwner: TComponent): TPageIdentificarCliente;

  end;

var
  PageIdentificarCliente: TPageIdentificarCliente;

implementation

{$R *.dfm}

procedure TPageIdentificarCliente.ClickBtnConfirmar(Sender: TObject);
begin
  if Assigned(FProc) then
    FProc(Trim(edtCnpjCpf.Text), Trim(edtNome.Text));
  Close;
end;

function TPageIdentificarCliente.Embed(Value: TWinControl)
  : TPageIdentificarCliente;
begin
  Self.Parent := Value;
  Result := Self;
end;

procedure TPageIdentificarCliente.FormResize(Sender: TObject);
begin
  ResizeIdCliente;
end;

procedure TPageIdentificarCliente.FormShow(Sender: TObject);
begin
  edtCnpjCpf.SetFocus;
end;

function TPageIdentificarCliente.IdentificaCpf: TPageIdentificarCliente;
begin
  pnlNome.Visible := False;
  pnlIdentificarCliente.Height :=
    (pnlIdentificarCliente.Height - pnlNome.Height);
  Result := Self;
end;

function TPageIdentificarCliente.identificarCliente
  (Value: TProc<String, String>): TPageIdentificarCliente;
begin

  FProc := Value;

  Result := Self;
end;

class function TPageIdentificarCliente.New(AOwner: TComponent)
  : TPageIdentificarCliente;
begin
  Result := Self.Create(AOwner);
end;

procedure TPageIdentificarCliente.ResizeIdCliente;
var
  lHeight, lWidth: Integer;
begin
  lHeight := Round((Self.Height - pnlIdentificarCliente.Height) / 2);
  lWidth := Round((Self.Width - pnlIdentificarCliente.Width) / 2);

  pnlIdentificarCliente.Margins.Left := lWidth;
  pnlIdentificarCliente.Margins.Right := lWidth;
  pnlIdentificarCliente.Margins.Top := lHeight;
  pnlIdentificarCliente.Margins.Bottom := lHeight;
  pnlIdentificarCliente.Align := alClient;

end;

end.
