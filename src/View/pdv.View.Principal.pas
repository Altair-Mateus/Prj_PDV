unit pdv.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Imaging.jpeg, pdv.View.Login,
  Vcl.WinXCtrls, pdv.View.Page.Pagamento, pdv.View.Page.identificarCliente,
  pdv.View.Page.ImportarCliente, pdv.View.Page.AbrirCaixa, pdv.Model.cAIXA,
  pdv.View.Page.FecharCaixa, pdv.View.Page.LoginSupervisor,
  pdv.View.Componente.Mensagem;

type
  TfrmPrincipal = class(TForm)
    pnlContainer: TPanel;
    pnlTitle: TPanel;
    pnlMain: TPanel;
    pnlButton: TPanel;
    pnlOperacoes: TPanel;
    pnlInfVenda: TPanel;
    pnlCancelarOp: TPanel;
    shpCancelarOp: TShape;
    btnCancelarOp: TSpeedButton;
    pnlConsultarPreco: TPanel;
    shpConsultarPreco: TShape;
    btnFecharCaixa: TSpeedButton;
    pnlAbrirCaixa: TPanel;
    shpAbrirCaixa: TShape;
    btnAbrirCaixa: TSpeedButton;
    pnlCancelarVenda: TPanel;
    shpCancelarVenda: TShape;
    btnCancelarVenda: TSpeedButton;
    pnlCancelarItem: TPanel;
    shpCancelarItem: TShape;
    btnCancelarItem: TSpeedButton;
    pnlMaisFuncoes: TPanel;
    shpMaisFuncoes: TShape;
    btnMaisFuncoes: TSpeedButton;
    pnlTotalCompra: TPanel;
    lblTitTotalCompa: TLabel;
    shpTotalCompra: TShape;
    pnlEdtTotalCompra: TPanel;
    lblTotalCompra: TLabel;
    pnlSubTotal: TPanel;
    lblTitSubTotal: TLabel;
    pnlEdtSubTotal: TPanel;
    shpSubTotal: TShape;
    lblSubTotal: TLabel;
    pnlQuantidades: TPanel;
    lblTitQuantidade: TLabel;
    pnlEdtQuantidade: TPanel;
    shpQuantidade: TShape;
    edtQuantidade: TEdit;
    pnlPreco: TPanel;
    lblTitPreco: TLabel;
    pnlEdtPreco: TPanel;
    shpPreco: TShape;
    lblPreco: TLabel;
    pnlProduto: TPanel;
    lblTitProduto: TLabel;
    pnlEdtProduto: TPanel;
    shpProduto: TShape;
    edtProduto: TEdit;
    pnlImg: TPanel;
    imgProduto: TImage;
    pnlMaster: TPanel;
    dsItens: TDataSource;
    SplitViewFuncoes: TSplitView;
    pnlSplit: TPanel;
    pnlSupSan: TPanel;
    shpSupSan: TShape;
    pnlDescItem: TPanel;
    shpDescItem: TShape;
    pnlMultiplicar: TPanel;
    shpMultiplicar: TShape;
    pnlFechaVenda: TPanel;
    shpFechaVenda: TShape;
    pnlNovaVenda: TPanel;
    shpNovaVenda: TShape;
    pnlCPF: TPanel;
    shpCpf: TShape;
    SplitViewPagamentos: TSplitView;
    pnlPag: TPanel;
    pnlImportarCliente: TPanel;
    shpInformarCliente: TShape;
    pnlIdCliente: TPanel;
    pnlGrd: TPanel;
    pnlTituloGrd: TPanel;
    pnlTitGrdCodigo: TPanel;
    pnlTitGrdItem: TPanel;
    pnlTitGrdSubTotal: TPanel;
    pnlTitGrdQtd: TPanel;
    pnlTitGrdValorUnit: TPanel;
    pnlTitGrdDescricao: TPanel;
    pnlListaItens: TPanel;
    shpSeparadorListaItens: TShape;
    ltbItens: TListBox;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnMaisFuncoesClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);

  private
    FCaixa: TCaixa;

    procedure MontarBotoes;
    procedure FixarForm;
    procedure SplitViewAction(Value: TSplitView);

    procedure ExibeTelaPagamentos;
    procedure ExibeTelaidCliente;
    procedure ExibeTelaIdCpf;
    procedure ExibeTelaImpCliente;
    procedure ExibeTelaAbrirCaixa;
    procedure ExibeTelaLogin;
    procedure ExibeTelaFecharCaixa;
    procedure ExibeTelaSupervisor;
    procedure DestroyObjetos;

    procedure LimparCampos;
    procedure VerificaStatusCaixa;
    procedure InfoOperador;

    procedure Confirmar(Sender: TObject);

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  pdv.Model.Dados;

procedure TfrmPrincipal.btnMaisFuncoesClick(Sender: TObject);
begin
  SplitViewAction(SplitViewFuncoes);
end;

procedure TfrmPrincipal.ExibeTelaidCliente;
begin
  TPageIdentificarCliente.New(Self).Embed(pnlMaster);

end;

procedure TfrmPrincipal.ExibeTelaIdCpf;
begin

  TPageIdentificarCliente.New(Self).Embed(pnlMaster)
    .IdentificaCpf.identificarCliente(
    procedure(aCpf, aCLiente: String)
    begin

      if (not aCLiente.IsEmpty) then
        aCLiente := 'Cliente: ' + aCLiente;
      if (not aCpf.IsEmpty) then
        aCpf := 'CPF: ' + aCpf;

      if ((not aCLiente.IsEmpty) or (not aCpf.IsEmpty)) then
      begin
        pnlIdCliente.Caption := aCLiente + ' ' + aCpf;
        pnlIdCliente.Visible := True;
      end;
    end);

end;

procedure TfrmPrincipal.ExibeTelaImpCliente;
begin

  TPageImportarCliente.New(Self).Embed(pnlMaster).Titulo('Lista de Clientes');

end;

procedure TfrmPrincipal.ExibeTelaLogin;
begin
  TfrmLogin.New(Self).Embed(pnlMaster).Informacao(
    procedure(Value: String)
    begin
      if not(Assigned(FCaixa)) then
        FCaixa := TCaixa.New;

      FCaixa.Operador := Value;
      VerificaStatusCaixa;
    end);
end;

procedure TfrmPrincipal.Confirmar(Sender: TObject);
var
  lTurno: TTurno;
  lData: TDateTime;
begin
  lData := Now;
  FCaixa.Id := 1;
  FCaixa.cAIXA := 1;
  FCaixa.Turno := lTurno.RetornaTurno(lData);
  FCaixa.Aberto := True;
  FCaixa.DataHoraAbertura := lData;
  VerificaStatusCaixa;
end;

procedure TfrmPrincipal.DestroyObjetos;
begin
  FCaixa.Free;
end;

procedure TfrmPrincipal.edtProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(FCaixa.Aberto) then
  begin
    Key := #0;
    edtProduto.Clear;
    TPageMensagem.New(Self).Embed(pnlMaster).Mensagem('O caixa deve estar aberto!', Informacao)
      .ClickConfirmar(Confirmar);
    Exit;
  end;

  case Key of
    '.', ',':
      begin
        Key := ',';
        if Pos(',', edtProduto.Text) > 0 then
          Key := #0;
      end;

    '*':
      begin
        if Pos('*', edtProduto.Text) > 0 then
          Key := #0;
      end;

    '/':
      begin
        Application.MessageBox('Nenhuma balança configurada!', 'Balança',
          MB_ICONINFORMATION + MB_OK);
      end;

    #13:
      begin
        // realizar implememntação com lista de objetos
      end;

  end;

end;

procedure TfrmPrincipal.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    edtProduto.SetFocus;
  end;
end;

procedure TfrmPrincipal.ExibeTelaPagamentos;
begin
  TPagePagamentos.New(Self).Embed(pnlMaster);
end;

procedure TfrmPrincipal.ExibeTelaSupervisor;
begin
  TPageLoginSupervisor.New(Self).Embed(pnlMaster);
end;

procedure TfrmPrincipal.ExibeTelaAbrirCaixa;
begin

  if not(FCaixa.Aberto) then
  begin

    TPageAberturaCaixa.New(Self).Embed(pnlMaster).Informacoes(
      procedure(Value: TCaixa)
      begin
        if Assigned(FCaixa) then
        begin
          FCaixa.Id := Value.Id;
          FCaixa.cAIXA := Value.cAIXA;
          FCaixa.Turno := Value.Turno;
          FCaixa.Aberto := Value.Aberto;
          FCaixa.DataHoraAbertura := Value.DataHoraAbertura;
          FCaixa.SaldoInicial := Value.SaldoInicial;

          VerificaStatusCaixa;
        end;

      end);
  end;

end;

procedure TfrmPrincipal.ExibeTelaFecharCaixa;
begin

  TPageFechamentoCaixa.New(Self).Embed(pnlMaster).Informacoes(
    procedure(Value: TCaixa)
    begin
      FCaixa.Aberto := Value.Aberto;
      FCaixa.DataHoraFechamento := Value.DataHoraFechamento;

      VerificaStatusCaixa;
    end);
end;

procedure TfrmPrincipal.FixarForm;
begin

  Self.WindowState := TWindowState.wsNormal;
  Self.Position := poScreenCenter;
  Self.Constraints.MaxHeight := Self.ClientHeight;
  Self.Constraints.MinHeight := Self.ClientHeight;
  Self.Constraints.MaxWidth := Self.ClientWidth;
  Self.Constraints.MinWidth := Self.ClientWidth;

end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  DestroyObjetos;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
var
  lKeyEvent: TKeyEvent;
  I: Integer;
  lForm: TForm;
begin

  for I := Pred(pnlMaster.ControlCount) downto 0 do
  begin
    if (pnlMaster.Controls[I] is TForm) and
      (TForm(pnlMaster.Controls[I]).ModalResult = mrOk) then
    begin

      if ((TForm(pnlMaster.Controls[I]).KeyPreview) and (Assigned(lKeyEvent)))
      then
      begin
        lKeyEvent := TForm(pnlMaster.Controls[I]).OnKeyDown;
        lKeyEvent(Sender, Key, Shift);
      end;

      Exit;

    end;
  end;

  if ((Shift = [ssCtrl]) and (Key = VK_MULTIPLY)) then
  begin
    edtQuantidade.Clear;
    edtQuantidade.SetFocus;
  end;

  case Key of

    VK_ESCAPE:
      Close;
    VK_F1:
      ExibeTelaImpCliente;
    VK_F2:
      ExibeTelaAbrirCaixa;
    VK_F4:
      ExibeTelaFecharCaixa;
    VK_F5:
      ShowMessage('Cancelar Item');
    VK_F6:
      ShowMessage('Cancelar Venda');
    VK_F7:
      ExibeTelaPagamentos;
    VK_F9:
      ExibeTelaIdCpf;
    VK_F11:
      ExibeTelaSupervisor;
    VK_F12:
      btnMaisFuncoesClick(Sender);

  end;

end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  ExibeTelaLogin;
  MontarBotoes;
end;

procedure TfrmPrincipal.InfoOperador;
var
  lCaption, lOperador: String;
begin
  lOperador := Format('Caixa %d | Operador: %s | Turno: %s',
    [FCaixa.cAIXA, FCaixa.Operador, FCaixa.Turno.ToString]);

  lCaption := StringOfChar(' ',
    (255 - (Length(Self.Caption) + Length(lOperador))));

  Self.Caption := Self.Caption + lCaption + lOperador;
end;

procedure TfrmPrincipal.LimparCampos;
begin
  edtProduto.Clear;
  lblPreco.Caption := FormatFloat('"R$ ", 0.00', 0);
  edtQuantidade.Text := FormatFloat(',0.000', 0);
  lblSubTotal.Caption := FormatFloat('"R$ ", 0.00', 0);
  lblTotalCompra.Caption := FormatFloat('"R$ ", 0.00', 0);
  dsItens.DataSet.Active := False;
  pnlTitle.Caption := 'Caixa Fechado';
  pnlTitle.SetFocus;
end;

procedure TfrmPrincipal.MontarBotoes;
begin

  btnCancelarOp.Caption := 'Cancelar Operação' + ''#13'' + '(F10)';
  btnFecharCaixa.Caption := 'Fechar Caixa' + ''#13'' + '(F4)';
  btnAbrirCaixa.Caption := 'Abrir Caixa' + ''#13'' + '(F2)';
  btnCancelarVenda.Caption := 'Cancelar Venda' + ''#13'' + '(F6)';
  btnCancelarItem.Caption := 'Cancelar Item' + ''#13'' + '(F5)';
  btnMaisFuncoes.Caption := 'Mais Funções' + ''#13'' + '(F12)';

end;

procedure TfrmPrincipal.SplitViewAction(Value: TSplitView);
begin
  Value.Opened := (not Value.Opened);
end;

procedure TfrmPrincipal.VerificaStatusCaixa;
begin
  LimparCampos;

  if (FCaixa.Aberto) then
    pnlTitle.Caption := 'Caixa Aberto'
  else
    pnlTitle.Caption := 'Caixa Fechado';

  InfoOperador;

end;

end.
