unit CustInfo_WP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, Data.DB, Data.Win.ADODB, ComObj,
  tmsAdvGridExcel;

type
  TFrmCustInfo_WP = class(TForm)
    tdg2: TDBAdvGrid;
    Panel2: TPanel;
    Bevel1: TBevel;
    Label3: TLabel;
    Bevel2: TBevel;
    Label1: TLabel;
    Bevel3: TBevel;
    Label2: TLabel;
    Bevel4: TBevel;
    Bevel6: TBevel;
    Label4: TLabel;
    Bevel7: TBevel;
    Label7: TLabel;
    Label6: TLabel;
    edtdong: TEdit;
    edtho: TEdit;
    edtallotmenttime: TEdit;
    edtUseTime: TEdit;
    edtRemainTime: TEdit;
    edtaccumulatedPoint: TEdit;
    Panel1: TPanel;
    btnClose: TBitBtn;
    btnAllAdd: TBitBtn;
    btnSave: TBitBtn;
    btnSearch: TBitBtn;
    btnCancel: TBitBtn;
    dsCustInfo_WP: TDataSource;
    qryCustInfo_WP: TADOQuery;
    qryCustInfo_WPdong: TStringField;
    qryCustInfo_WPho: TStringField;
    qryCustInfo_WPUpdateTime: TStringField;
    qryCustInfo_WPRemainTime: TStringField;
    qryCustInfo_WPUseTime: TStringField;
    qryTemp: TADOQuery;
    qryCustInfo_WPYogum: TIntegerField;
    qryCustInfo_WPallotmenttime: TStringField;
    btnExcel: TBitBtn;
    SaveDialog1: TSaveDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    procedure btnSearchClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure tdg2Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnAllAddClick(Sender: TObject);
    procedure getExcelData(szFileName: String; var vList: Variant; var nRow: Integer; nStartRow: Integer);
    procedure btnCancelClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCustInfo_WP: TFrmCustInfo_WP;
  bExcelSaving : Boolean = False;
implementation

uses
  Global, Tables;

{$R *.dfm}

procedure TFrmCustInfo_WP.btnAllAddClick(Sender: TObject);
var
  OpenDialog1             : TOpenDialog;
  vList                   : Variant;
  i,j                     : Integer;
  SelectCount,ResultCount : Integer;
  Error                   : String;
  szMsg                   : String;
  nCnt, nTotCnt           : Integer;
begin
  //## ???????????? ???? ???? ##//
  try
    if MessageDlg('???????? ?? ???? ?????? ?????????? ?????? ?????? ?????? ?????????????', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin

      OpenDialog1 := TOpenDialog.Create(Application);
      with OpenDialog1 do
      begin
        btnselect := 1;
        Title := '??????????  ???????? ????????';
        Filter :='???? ????(*.xlsx)|*.xlsx;*.xls';
        Options:= [ofOverwritePrompt, ofFileMustExist, ofHideReadOnly ];
        if Execute then
        begin
          //#### ?????????? ?????? vList?????? ???? ####//
          try
            VarClear(vList);
            //# ?????? ?????????? ????????. #//
            getExcelData(FileName, vList, gnRow, 1);

          except

            szMsg := '';
            szMsg := szMsg + '???? ?????????? ???????? ????';
            szMsg := szMsg + #13#10#13#10;
            szMsg := szMsg + '?? ????????';
            szMsg := szMsg + #13#10#13#10;
            szMsg := szMsg + '1. ?????? ???????? ''Sheet1''???? ????';
            szMsg := szMsg + #13#10;
            szMsg := szMsg + '2. ???? ?????????? ???????????? ????';
            showmessage(szMsg);
            exit;
          end;

          //# ?????? null?????? ???? #//
          if VarIsNull(vList) then begin
            Screen.Cursor := crDefault;
            Exit;
          end;
          //#### ?????????? ?????? vList?????? ???? ####//
          StartProgress('??????????...', '????????????????.  ???? ????????????!', gnRow - 1);
          //#### ??????????1?? ???? ???? ???????? ???? ####//
          if gnRow > 0 then begin
            with tdg2 do begin
              RowCount  :=  gnRow;
              for i := 0  to gnRow - 1  do begin
                Cells[1, i]  :=  VartoStr(vList[i, 0]);          //# ??
                Cells[2, i]  :=  VartoStr(vList[i, 1]);         //# ??
                Cells[3, i]  :=  VartoStr(vList[i, 2]);         //# ????????
                Cells[5, i]  :=  VartoStr(vList[i, 3]);         //# ????????

                if VartoStr(vList[i, 0]) = '' then
                begin
                  ShowMessage(IntToStr(i)+' ???? ?????? ????????.');
                  EndProgress;
                  Exit;
                end;

                if i > 0 then
                begin
                  if StrToInt(VartoStr(vList[i, 2])) < StrToInt(Cells[5, i]) then
                  begin
                    ShowMessage(IntToStr(i)+' ???? ???????????? ???????? ????????.');
                    EndProgress;
                    Exit;
                  end;
                end;
              end;
              //for i := 1  to gnRow - 1 do begin
              for i := 1  to gnRow do begin
                //?????? ????
                with dmTables.qryTemp do
                begin
                  SetProgress(1);
                  nTotCnt:= nTotCnt + 1;

                  Close;
                  SQL.Clear;
                  SQL.Add('Select * from CustInfo_WP where dong = :N1 and ho = :N2');
                  Parameters.ParamByName('N1').Value:= VartoStr(vList[i, 0]);
                  Parameters.ParamByName('N2').Value:= VartoStr(vList[i, 1]);
                  Open;
                  ExceptLogging(' ??'+VartoStr(vList[i, 0])+' ??'+VartoStr(vList[i, 1]));
                  if RecordCount <= 0 then
                  begin
                     Close;
                     SQL.Clear;
                     SQL.Add('Insert into CustInfo_WP (dong, ho, AllotmentTime, UseTime, RemainTime, UpdateTime) ' +
                              'values(:pDong, :pHo, :pAllotmentTime, :pUseTime, :pRemainTime, :pUpdateTime)');
                     Parameters.ParamByName('pDong').Value := VartoStr(vList[i, 0]);
                     Parameters.ParamByName('pHo').Value := VartoStr(vList[i, 1]);
                     Parameters.ParamByName('pAllotmentTime').Value := StrToInt(VartoStr(vList[i, 2]));
                     Parameters.ParamByName('pUseTime').Value := 0;
                     Parameters.ParamByName('pRemainTime').Value := StrToInt(VartoStr(vList[i, 3]));
                     Parameters.ParamByName('pUpdateTime').Value := FormatDateTime('yyyy-mm-dd hh:mm:ss', now);
                     ExecSQL;
                     ExceptLogging(' ?????? ???????? ???????? ????');
                  end
                  else
                  begin
                    {Close;
                    SQL.Clear;
                    SQL.Add('Update CustInfo_WP set AllotmentTime = :pAllotmentTime, UseTime = :pUseTime, RemainTime = :pRemainTime, UpdateTime = :pUpdateTime');
                    SQL.Add('where  dong = :pDong and ho = :pHo ');
                    Parameters.ParamByName('pDong').Value := VartoStr(vList[i, 0]);
                    Parameters.ParamByName('pHo').Value := VartoStr(vList[i, 1]);
                    Parameters.ParamByName('pAllotmentTime').Value := StrToInt(VartoStr(vList[i, 2]));
                    Parameters.ParamByName('pUseTime').Value := 0;
                    Parameters.ParamByName('pRemainTime').Value :=  StrToInt(VartoStr(vList[i, 3]));
                    Parameters.ParamByName('pUpdateTime').Value := FormatDateTime('yyyy-mm-dd hh:mm:ss', now);;
                    ExecSQL;
                    ExceptLogging(' ?????? ???????? ???????? ????');}
                  end;
                end;
              end;
            end;
            EndProgress;
            ShowMessage('??' + IntToStr(nTotCnt) + '???? ?????? ???????? ??????????????.');
            btnSearchClick(Self);
          end
          else
          begin
            tdg2.Clear;
          end;
        end;//# if Execute then
      end;//# with OpenDialog1 do
    end;
  except
      EndProgress;
  end;
end;

procedure TFrmCustInfo_WP.btnCancelClick(Sender: TObject);
begin
    edtdong.Text := '';
    edtho.Text   := '';
    edtUseTime.Text :='0';
    edtRemainTime.Text :='0';
end;

procedure TFrmCustInfo_WP.btnCloseClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TFrmCustInfo_WP.btnExcelClick(Sender: TObject);
begin
  try
    bExcelSaving := True;
    if savedialog1.Execute then
    begin
      tdg2.PageMode := false;      //??????
      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('?????????? ????????!');
    end;
    bExcelSaving := False;
  except
    on E: Exception do ExceptLogging('TFrmCustInfo_WP.btnExcelClick: ' + E.Message);
  end;
end;

procedure TFrmCustInfo_WP.btnSaveClick(Sender: TObject);
var
  j : Integer;
begin
  //with qryCustInfo_WP do
  with qryTemp do
  begin
    if TryStrToInt(edtallotmenttime.Text, j) and TryStrToInt(edtUseTime.Text, j) and
       TryStrToInt(edtRemainTime.Text, j) then
    begin
      if StrToInt(edtallotmenttime.Text) < StrToInt(edtRemainTime.Text) then
      begin
          ShowMessage('???????????? ???? ?????? ?? ????????.');
          Exit;
      end;

      if StrToInt(edtallotmenttime.Text) < StrToInt(edtUseTime.Text) then
      begin
          ShowMessage('???????????? ???? ?????? ?? ????????.');
          Exit;
      end;

      if StrToInt(edtUseTime.Text) < 0 then
      begin
         ShowMessage('???? ?????? 0 ?????????? ?????? ??????????.');
         Exit;
      end;

      if StrToInt(edtRemainTime.Text) < 0 then
      begin
         ShowMessage('???? ?????? 0 ?????????? ?????? ??????????.');
         Exit;
      end;

      Close;
      SQL.Clear;
      SQL.Add('select * from CustInfo_WP ');
      SQL.Add('where dong = :N1 and ho = :N2 ');
      Parameters.ParamByName('N1').Value:= edtdong.Text;
      Parameters.ParamByName('N2').Value:= edtho.Text;
      Open;

      if RecordCount > 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('update CustInfo_WP  ');
        SQL.Add('set AllotmentTime = :pAllotmentTime, ');
        SQL.Add('    UseTime = :pUseTime,  ');
        SQL.Add('    RemainTime = :pRemainTime,  ');
        SQL.Add('    UpdateTime = :pUpdateTime  ');
        SQL.Add('where  dong = :N1 and ho = :N2 ');
        Parameters.ParamByName('pAllotmentTime').Value:= StrToInt(edtallotmenttime.Text);
        Parameters.ParamByName('pUseTime').Value:=  StrToInt(edtUseTime.Text);
        Parameters.ParamByName('pRemainTime').Value:= StrToInt(edtallotmenttime.Text) - StrToInt(edtUseTime.Text);
        Parameters.ParamByName('pUpdateTime').Value:= FormatDateTime('yyyy-mm-dd hh:mm:ss', now);
        Parameters.ParamByName('N1').Value:= edtdong.Text;
        Parameters.ParamByName('N2').Value:= edtho.Text;
        ExecSQL;
        ExceptLogging('???????? ???????? ???? : '+edtdong.Text+'??'+edtho.Text+'?? ????????:'+edtallotmenttime.Text +' ????????:'+edtUseTime.Text);
      end
      else
      begin
         Close;
         SQL.Clear;
         SQL.Add('Insert into CustInfo_WP (dong, ho, AllotmentTime, UseTime, RemainTime, UpdateTime) ' +
                  'values(:pDong, :pHo, :pAllotmentTime, :pUseTime, :pRemainTime, :pUpdateTime)');
         Parameters.ParamByName('pDong').Value := edtdong.Text;
         Parameters.ParamByName('pHo').Value := edtho.Text;
         Parameters.ParamByName('pAllotmentTime').Value := StrToInt(edtallotmenttime.Text);
         Parameters.ParamByName('pUseTime').Value := StrToInt(edtUseTime.Text);
         Parameters.ParamByName('pRemainTime').Value := StrToInt(edtallotmenttime.Text) - StrToInt(edtUseTime.Text);
         Parameters.ParamByName('pUpdateTime').Value := FormatDateTime('yyyy-mm-dd hh:mm:ss', now);
         ExecSQL;
         ExceptLogging('???????? ???????? ???? : '+edtdong.Text+'??'+edtho.Text+'?? ????????:'+edtallotmenttime.Text +' ????????:'+edtUseTime.Text);
      end;
      btnSearchClick(Self);
    end
    else
    begin
       ShowMessage('?????? ?????? ??????????.');
    end;
  end;
end;

procedure TFrmCustInfo_WP.btnSearchClick(Sender: TObject);
var
 CarNo, PatrolCode, InCarNo1 : string;
 li_CNT : Integer;
begin
  with qryCustInfo_WP do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select dong, ho,  ');
    SQL.Add('CONVERT(VARCHAR(50), (AllotmentTime))+''?? ('' + CONVERT(VARCHAR(50),ISNULL((AllotmentTime)/60,0)) +''????)'' as AllotmentTime, ');
	  SQL.Add('CONVERT(VARCHAR(50), (UseTime))+''?? ('' + CONVERT(VARCHAR(50),ISNULL((UseTime)/60,0)) +''????)'' as UseTime,                   ');
	  SQL.Add('CONVERT(VARCHAR(50), (RemainTime))+''?? ('' + CONVERT(VARCHAR(50),ISNULL((RemainTime)/60,0)) +''????)'' as RemainTime,          ');
    SQL.Add('Case when UseTime < 0  Then (ABS(UseTime) / 30) * 2000           ');
    SQL.Add('     else 0 end as Yogum,                                        ');
    //SQL.Add('CONVERT(VARCHAR(50), (AllotmentTime))+''??'' as AllotmentTime,   ');
    //SQL.Add('CONVERT(VARCHAR(50), (UseTime))+''??'' as UseTime,  ');
    //SQL.Add('CONVERT(VARCHAR(50), (RemainTime))+''??'' as RemainTime,  ');
    SQL.Add('[UpdateTime]  ');
    SQL.Add('From CustInfo_WP ');
    if (edtdong.Text ='') or (edtho.Text ='') then
    begin

    end
    else
    begin
      SQL.Add('where dong = :N1  and ho = :N2 ');
      Parameters.ParamByName('N1').Value:= edtdong.Text;
      Parameters.ParamByName('N2').Value:= edtho.Text;
    end;
    SQL.Add('group by dong, ho, AllotmentTime, UseTime, RemainTime, UpdateTime ');
    SQL.Add('Order by dong, ho ');
    Open;

    if eof then
    begin
      ShowMessage('???????? ????????.');
      tdg2.Clear;
      btnExcel.Enabled := False;
      Exit;
    end;

    tdg2.ColCount := 8;
    tdg2.Columns[1].Header := '??';
    tdg2.Columns[2].Header := '??';
    tdg2.Columns[3].Header := '????????(??)';
    tdg2.Columns[4].Header := '????????(??)';
    tdg2.Columns[5].Header := '????????(??)';
    tdg2.Columns[6].Header := '????????';
    tdg2.Columns[7].Header := '??????';

    btnExcel.Enabled := True;
  end;
end;

procedure TFrmCustInfo_WP.getExcelData(szFileName: String; var vList: Variant;
  var nRow: Integer; nStartRow: Integer);
var
  i, j, k, nStart          : integer;
  XLRows, XLCols, StartRow : integer;
  XLApp, XLBook, XLSheet   : Variant;
begin

  VarClear(vList);
  try
    XLApp               := CreateOleObject('Excel.Application');      //# ???????????? ????????
    XLApp.DisplayAlerts := False;                                     //# ?????? ???? ????.
    XLApp.Visible       := False;                                     //# ???????????? ????
    XLBook              := XLApp.WorkBooks.Open(szFileName);          //# ???????? ????
    XLSheet             := XLBook.Sheets['Sheet1'];                   //# ???????? ????
    XLRows              := XLApp.ActiveSheet.UsedRange.Rows.Count;    //# ?? Rows ?? ????
    //# ?? Columns ?? ????

    XLCols              := XLApp.ActiveSheet.UsedRange.Columns.Count;

    nStart   := 1;
    StartRow := nStartRow;

    //# variant ???????? ????
    vList  := VarArrayCreate([0, XLRows -StartRow, 0, XLCols -nStart], varVariant);

    gnRow := XLRows -StartRow + 1; //# ????????

    for i := 0 to XLRows - StartRow do begin
      if (Trim(XLSheet.Cells[i + StartRow, 1].Value) = '') then begin
        Break;
      end;

      k := 0; //# StringGrid ?? Column ??????. ?????? ????.

      for j := nStart to XLCols do begin
        vList[i,k] := XLSheet.Cells[i + StartRow, j].Value;
        Inc(K);
      end;
      gnRow := i;
    end;

  finally

    //# ???? ???????? ?????????? ????????
    XLBook.Close;
    XLApp.Quit;
    XLApp := UnAssigned;
    Finalize(XLSheet);
    Finalize(XLBook);
    Finalize(XLApp);
  end;

end;

procedure TFrmCustInfo_WP.tdg2Click(Sender: TObject);
begin
  with qryTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select *  ');
    SQL.Add('From CustInfo_WP  ');
    SQL.Add('where dong = :N1  and ho = :N2 ');
    Parameters.ParamByName('N1').Value:= tdg2.Cells[1, tdg2.Row];
    Parameters.ParamByName('N2').Value:= tdg2.Cells[2, tdg2.Row];
    Open;

    if RecordCount > 0 then
    begin
      with tdg2 do
      begin
          edtdong.Text:= Cells[1,tdg2.row];
          edtho.Text:= Cells[2,tdg2.row];
          edtallotmenttime.Text := FieldByName('AllotmentTime').AsString;
          edtUseTime.Text       := FieldByName('UseTime').AsString;
          edtRemainTime.Text    := FieldByName('RemainTime').AsString;
      end;
    end;
  end;
end;

end.
