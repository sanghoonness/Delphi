unit CouponList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, BaseGrid, AdvGrid, DBAdvGrid, ExtCtrls,
  tmsAdvGridExcel, StdCtrls, Buttons, ComCtrls, AdvDateTimePicker;

type
  TfrmCouponList = class(TForm)
    qryCouponSale: TADOQuery;
    qryCouponSaleParkNo: TSmallintField;
    qryCouponSaleSaleDate: TStringField;
    qryCouponSaleSaleTime: TStringField;
    qryCouponSaleMNo: TSmallintField;
    qryCouponSaleCompName: TStringField;
    qryCouponSaleCouponUnit: TIntegerField;
    qryCouponSaleCouponCnt: TIntegerField;
    qryCouponSaleCouponAmt: TIntegerField;
    qryCouponSaleReserve1: TStringField;
    qryCouponSaleReserve2: TStringField;
    qryCouponSaleReserve3: TStringField;
    qryCouponSaleReserve4: TStringField;
    qryCouponSaleReserve5: TStringField;
    SaveDialog1: TSaveDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    Panel1: TPanel;
    dg1: TDBAdvGrid;
    dsCouponSale: TDataSource;
    qryManager: TADOQuery;
    qryManagerParkNo: TSmallintField;
    qryManagerMNo: TSmallintField;
    qryManagerPasswd: TStringField;
    qryManagerMName: TStringField;
    qryManagerAuthority: TWordField;
    qryManagerReserve1: TStringField;
    qryManagerReserve2: TStringField;
    qryManagerReserve3: TStringField;
    qryManagerReserve4: TStringField;
    qryManagerReserve5: TStringField;
    qryCouponSaleMName: TStringField;
    Panel2: TPanel;
    Bevel2: TBevel;
    Label4: TLabel;
    Label3: TLabel;
    edtSDate: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    btnSearch: TBitBtn;
    btnExcel: TBitBtn;
    btnClose: TBitBtn;
    Bevel3: TBevel;
    Label1: TLabel;
    edtNo: TEdit;
    procedure qryCouponSaleReserve4GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure edtNoExit(Sender: TObject);
    procedure qryCouponSaleReserve3GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCouponList: TfrmCouponList;

implementation
uses
  Global, Tables;

{$R *.dfm}

procedure TfrmCouponList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCouponList.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('엑셀파일로 저장완료!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmCouponList.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmCouponList.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate: String;
begin
  sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
  sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);

  with qryCouponSale do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from CouponSale where SaleDate >= :N1 and SaleDate <= :N2 ');

    if edtNo.Text <> '' then
      SQL.Add('and Reserve1 <= :N3 and Reserve2 >= :N4');

    Parameters.ParamByName('N1').Value:= sSDate;
    Parameters.ParamByName('N2').Value:= sEDate;

    if edtNo.Text <> '' then
    begin
      Parameters.ParamByName('N3').Value:= edtNo.Text;
      Parameters.ParamByName('N4').Value:= edtNo.Text;
    end;
    Open;

    if RecordCount > 0 then
      btnExcel.Enabled:= True
    else
      btnExcel.Enabled:= False;
  end;
end;

procedure TfrmCouponList.edtNoExit(Sender: TObject);
begin
  if edtNo.Text <> '' then
    edtNo.Text:= MG_InsZero(edtNo.Text, 7);
end;

procedure TfrmCouponList.FormShow(Sender: TObject);
begin
  edtSDate.Date:= Now;
  edtEDate.Date:= Now;
  qryManager.Active:= True;
end;

procedure TfrmCouponList.qryCouponSaleReserve3GetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if qryCouponSaleReserve3.Value = '0' then
    Text:= '금액할인'
  else
  if qryCouponSaleReserve3.Value = '1' then
    Text:= '시간할인'
  else
  if qryCouponSaleReserve3.Value = '2' then
    Text:= '%할인';
end;

procedure TfrmCouponList.qryCouponSaleReserve4GetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if qryCouponSaleReserve3.Value = '0' then
    Text:= qryCouponSaleReserve4.Value + '원'
  else
  if qryCouponSaleReserve3.Value = '1' then
    Text:= qryCouponSaleReserve4.Value + '분'
  else
  if qryCouponSaleReserve3.Value = '2' then
    Text:= qryCouponSaleReserve4.Value + '%';
end;

end.
