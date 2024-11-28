unit pdv.View.Page.ImportarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.WinXCtrls, pdv.View.Utils;

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
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FProc: TProc<TObject>;
  public
    function Titulo(Value: String): TPageImportarCliente;
    function Image(Value: String): TPageImportarCliente;
    function Click(Value: TProc<TObject>): TPageImportarCliente;
    function Embed(Value: TPanel): TPageImportarCliente;
    class function New(AOwner: TComponent): TPageImportarCliente;
  end;

var
  PageImportarCliente: TPageImportarCliente;

implementation

{$R *.dfm}
{ TPageImportarCliente }

procedure TPageImportarCliente.btnSairClick(Sender: TObject);
begin
  Self.RemoveObject;
end;

function TPageImportarCliente.Click(Value: TProc<TObject>)
  : TPageImportarCliente;
begin
  FProc := Value;
  Result := Self;
end;

function TPageImportarCliente.Embed(Value: TPanel): TPageImportarCliente;
begin
  Self.AddObject(Value);
  Result := Self;
end;

procedure TPageImportarCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TPageImportarCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        Self.RemoveObject;
      end;
  end;
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
