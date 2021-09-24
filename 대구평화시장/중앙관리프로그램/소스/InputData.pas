unit InputData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, AdvDateTimePicker, ExtCtrls, Grids, BaseGrid,
  AdvGrid, DBAdvGrid, DB, ADODB, Buttons;

type
  TfrmInputData = class(TForm)
    qryInputData: TADOQuery;
    dsInputData: TDataSource;
    qryInputDataParkNo: TSmallintField;
    qryInputDataProcDate: TStringField;
    qryInputDataYoill: TWordField;
    qryInputDataCondition1: TWordField;
    qryInputDataCondition2: TStringField;
    qryInputDataCondition3: TStringField;
    qryInputDataCondition4: TStringField;
    qryInputDataReserve1: TStringField;
    qryInputDataReserve2: TStringField;
    qryInputDataReserve3: TStringField;
    qryInputDataReserve4: TStringField;
    qryInputDataReserve5: TStringField;
    dg1: TDBAdvGrid;
    Panel2: TPanel;
    Bevel2: TBevel;
    Label8: TLabel;
    Bevel3: TBevel;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Bevel4: TBevel;
    Label3: TLabel;
    edtDate: TAdvDateTimePicker;
    edt4: TEdit;
    cmb1: TComboBox;
    edt2: TEdit;
    Bevel5: TBevel;
    Label4: TLabel;
    edt3: TEdit;
    btnSeek: TBitBtn;
    btnSave: TBitBtn;
    btnClose: TBitBtn;
    qryTemp: TADOQuery;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSeekClick(Sender: TObject);
    procedure dg1Click(Sender: TObject);
    procedure qryInputDataCondition1GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDateChange(Sender: TObject);
  private
    { Private declarations }
    procedure frmClear;
  public
    { Public declarations }
  end;

var
  frmInputData: TfrmInputData;
  nSelect: Byte = 0; //0:Add, 1:Modify

implementation
uses
  Global, Tables;

{$R *.dfm}

procedure TfrmInputData.frmClear;
var
  sSDate, sEDate: aString;
begin
  sSDate:= MG_AddDate(FormatDateTime('YYYY-MM-DD', Now), -7);
  sEDate:= MG_AddDate(FormatDateTime('YYYY-MM-DD', Now), 7);

  with qryInputData do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from AnalysisData where ProcDate >= :N1 and ProcDate <= :N2 Order By ProcDate');
    Parameters.ParamByName('N1').Value:= sSDate;
    Parameters.ParamByName('N2').Value:= sEDate;
    Open;
  end;
  cmb1.ItemIndex:= 0;
  edt2.Text:= '';
  edt3.Text:= '';
  edt4.Text:= '';
  nSelect:= 0;
end;

procedure TfrmInputData.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmInputData.btnSaveClick(Sender: TObject);
begin
  try
    case nSelect of
      0: begin
           with qryTemp do
           begin
             Close;
             SQL.Clear;
             SQL.Add('Insert Into AnalysisData ');
             SQL.Add('(ParkNo, ProcDate, Yoill, Condition1, Condition2, Condition3, Condition4) ');
             SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7)');
             Parameters.ParamByName('N1').Value:= nCurrParkNo;
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtDate.Date);
             Parameters.ParamByName('N3').Value:= DayOfWeek(edtDate.Date);
             Parameters.ParamByName('N4').Value:= cmb1.ItemIndex;
             Parameters.ParamByName('N5').Value:= edt2.Text;
             Parameters.ParamByName('N6').Value:= edt3.Text;
             Parameters.ParamByName('N7').Value:= edt4.Text;
             ExecSQL;
           end;
      end;

      1: begin
           with qryTemp do
           begin
             Close;
             SQL.Clear;
             SQL.Add('Update AnalysisData ');
             SQL.Add('Set Condition1 = :N1, Condition2 = :N2, Condition3 = :N3, Condition4 = :N4 ');
             SQL.Add('where ProcDate = :N5');
             Parameters.ParamByName('N1').Value:= cmb1.ItemIndex;
             Parameters.ParamByName('N2').Value:= edt2.Text;
             Parameters.ParamByName('N3').Value:= edt3.Text;
             Parameters.ParamByName('N4').Value:= edt4.Text;
             Parameters.ParamByName('N5').Value:= FormatDateTime('YYYY-MM-DD', edtDate.Date);
             ExecSQL;
           end;
      end;
    end;
    ShowMessage('자료를 저장하였습니다.');
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmInputData.btnSaveClick: ' + aString(E.Message));
  end;
end;

procedure TfrmInputData.btnSeekClick(Sender: TObject);
var
  sSDate, sEDate: aString;
begin
  sSDate:= MG_AddDate(FormatDateTime('YYYY-MM-DD', edtDate.Date), -7);
  sEDate:= MG_AddDate(FormatDateTime('YYYY-MM-DD', edtDate.Date), 7);

  with qryInputData do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from AnalysisData where ProcDate >= :N1 and ProcDate <= :N2 Order By ProcDate');
    Parameters.ParamByName('N1').Value:= sSDate;
    Parameters.ParamByName('N2').Value:= sEDate;
    Open;
  end;
end;

procedure TfrmInputData.dg1Click(Sender: TObject);
begin
  try
    if qryInputData.RecordCount <= 0 then
      Exit;

    with qryInputData do
    begin
      edtDate.Date:= StrToDate(FieldByName('ProcDate').AsString);
      cmb1.ItemIndex:= FieldByName('Condition1').AsInteger;
      edt2.Text:= FieldByName('Condition2').AsString;
      edt3.Text:= FieldByName('Condition3').AsString;
      edt4.Text:= FieldByName('Condition4').AsString;
    end;
    nSelect:= 1;
  except
    on E: Exception do ExceptLogging('TfrmInputData.dg1Click: ' + aString(E.Message));
  end;
end;

procedure TfrmInputData.edtDateChange(Sender: TObject);
begin
  frmClear;
end;

procedure TfrmInputData.FormShow(Sender: TObject);
begin
  edtDate.Date:= Now;
  frmClear;
end;

procedure TfrmInputData.qryInputDataCondition1GetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryInputDataCondition1.Value of
    0: Text:= '영업';
    1: Text:= '휴점';
  end;
end;

end.
