unit pdv.View.Page.ImportarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.WinXCtrls;

type
  TPageImportarCliente = class(TForm)
    pnlContainer: TPanel;
    pnlTitulo: TPanel;
    pnlInfo: TPanel;
    pnlSair: TPanel;
    imgSair: TImage;
    btnSair: TSpeedButton;
    pnlLista: TPanel;
    imgLista: TImage;
    pnlPesquisa: TPanel;
    pnlGrdConsulta: TPanel;
    grdConsulta: TDBGrid;
    btnPesquisar: TButton;
    shpPesquisar: TShape;
    edtPesquisar: TSearchBox;
    procedure btnSairClick(Sender: TObject);
  private
    FProc: TProc<TObject>;
  public
    function Titulo(Value: String): TPageImportarCliente;
    function Image(Value: String): TPageImportarCliente;
    function Click(Value: TProc<TObject>): TPageImportarCliente;
    function Embed(Value: TWinControl): TPageImportarCliente;
    class function New(AOwner: TComponent): TPageImportarCliente;
  end;

var
  PageImportarCliente: TPageImportarCliente;

implementation

{$R *.dfm}
{ TPageImportarCliente }

procedure TPageImportarCliente.btnSairClick(Sender: TObject);
begin
  Close;
end;

function TPageImportarCliente.Click(Value: TProc<TObject>)
  : TPageImportarCliente;
begin
  FProc := Value;
  Result := Self;
end;

function TPageImportarCliente.Embed(Value: TWinControl): TPageImportarCliente;
begin
  Self.Parent := Value;
  Result := Self;
end;

function TPageImportarCliente.Image(Value: String): TPageImportarCliente;
begin
  imgLista.Picture.LoadFromFile(Value);
  Result := Self;
end;

class function TPageImportarCliente.New(AOwner: TComponent)
  : TPageImportarCliente;
begin
  Result := Self.Create(AOwner);
end;

function TPageImportarCliente.Titulo(Value: String): TPageImportarCliente;
begin
  pnlLista.Caption := Value;
  Result := Self;
end;

end.
