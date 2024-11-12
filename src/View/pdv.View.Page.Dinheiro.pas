unit pdv.View.Page.Dinheiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrameDinheiro = class(TFrame)
    pnlContainerDinheiro: TPanel;
    pnlRecebido: TPanel;
    lblTotRec: TLabel;
    edtRecebido: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
