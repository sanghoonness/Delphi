unit Visitinfo_insert;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  AdvDateTimePicker, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB, ComObj,
  Data.Win.ADODB;

type
  TfrmVisitinfo_insert = class(TForm)
    dg1: TDBGrid;
    Panel2: TPanel;
    Bevel1: TBevel;
    Label3: TLabel;
    Bevel2: TBevel;
    Label1: TLabel;
    Bevel3: TBevel;
    Label2: TLabel;
    Bevel4: TBevel;
    Label4: TLabel;
    edtdong: TEdit;
    edtho: TEdit;
    edtStandrard: TEdit;
    btnSearch: TBitBtn;
    BtnExcel: TBitBtn;
    btnClose: TBitBtn;
    edtVisitCount: TEdit;
    btnSave: TBitBtn;
    qryVisit_Insert: TADOQuery;
    qryVisit_Insertdong: TStringField;
    qryVisit_Insertho: TStringField;
    dsVisit_Insert: TDataSource;
    qryVisit_Insertvisit_insert_standard2: TIntegerField;
    qryVisit_Insertvisit_insert_count2: TIntegerField;
    btnAllAdd: TBitBtn;
    qryVisit_Insertvisit_insert_use: TIntegerField;
    qryTemp: TADOQuery;
    btnCancel: TBitBtn;
    qryVisit_Insertvisit_insert_precount: TIntegerField;
    btnDelete: TBitBtn;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnAllAddClick(Sender: TObject);
    procedure getExcelData(szFileName: String; var vList: Variant; var nRow: Integer; nStartRow: Integer);
    procedure dg1CellClick(Column: TColumn);
    procedure btnSaveClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVisitinfo_insert: TfrmVisitinfo_insert;

implementation

uses
  Global, Tables;

{$R *.dfm}

procedure TfrmVisitinfo_insert.btnAllAddClick(Sender: TObject);
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
    OpenDialog1 := TOpenDialog.Create(Application);
    with OpenDialog1 do
    begin
      btnselect := 1;
      nTotCnt := 0;
      Title := '???????????? ???????? ????????';
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
        Refresh;
        StartProgress('??????????...', '????????????????.  ???? ????????????!', gnRow - 1);
        //#### ??????????1?? ???? ???? ???????? ???? ####//
        if gnRow > 0 then begin

          with dg1 do begin
//            for i := 0  to gnRow - 1  do begin
//               Fields[0].Text :=  VartoStr(vList[i, 0]);
//               Fields[1].Text :=  VartoStr(vList[i, 1]);
////              Cells[1, i]  :=  VartoStr(vList[i, 0]);          //# ??
////              Cells[2, i]  :=  VartoStr(vList[i, 1]);         //# ??
////              Cells[3, i]  :=  VartoStr(vList[i, 2]);         //# ??????????
////              Cells[4, i]  :=  VartoStr(vList[i, 3]);         //# ??????????
//
//              {if i > 0 then
//              begin
//                if StrToInt(VartoStr(vList[i, 2])) <> StrToInt(edtavPoint.Text) then
//                begin
//                  ShowMessage(IntToStr(i)+' ???? ???????????? ?????????? ???????? ?????? ???? ????????.');
//                  EndProgress;
//                  Exit;
//                end;
//              end; }
//            end;
            //for i := 1  to gnRow - 1 do begin
            for i := 1  to gnRow do begin
              if VartoStr(vList[i, 0]) = '' then
              begin
                  ShowMessage(IntToStr(i)+' ???? ???? ???????? ????????.');
                  EndProgress;
                  Exit;
              end;

              if StrToInt(VartoStr(vList[i, 2])) <> StrToInt(edtStandrard.Text) then
              begin
                ShowMessage(IntToStr(i)+' ???? ???????????? ?????????? ???????? ?????? ???? ????????.');
                EndProgress;
                Exit;
              end;

              //?????? ????
              with dmTables.qryTemp do
              begin
                nTotCnt:= nTotCnt + 1;

                Close;
                SQL.Clear;
                SQL.Add('Select * from Visitinfo_insert_icon where dong = :N1 and ho = :N2');
                Parameters.ParamByName('N1').Value:= VartoStr(vList[i, 0]);
                Parameters.ParamByName('N2').Value:= VartoStr(vList[i, 1]);
                Open;
                if RecordCount <= 0 then
                begin
                   Close;
                   SQL.Clear;
                   SQL.Add('Insert into Visitinfo_insert_icon (dong, ho, visit_insert_standard, visit_insert_count) ' +
                            'values(:pDong, :pHo, :pvisit_insert_standard, :pvisit_insert_count)');
                   Parameters.ParamByName('pDong').Value := VartoStr(vList[i, 0]);
                   Parameters.ParamByName('pHo').Value := VartoStr(vList[i, 1]);
                   Parameters.ParamByName('pvisit_insert_standard').Value := StrToInt(VartoStr(vList[i, 2]));
                   Parameters.ParamByName('pvisit_insert_count').Value := StrToInt(VartoStr(vList[i, 3]));
                   ExecSQL;
                   ExceptLogging(' ???????? ???? ???? ????');
                end
                else
                begin
                  Close;
                  SQL.Clear;
                  SQL.Add('Update Visitinfo_insert_icon set visit_insert_standard = :pvisit_insert_standard, visit_insert_count = :pvisit_insert_count ');
                  SQL.Add('where dong = :pDong and ho = :pHo ');
                  Parameters.ParamByName('pDong').Value := VartoStr(vList[i, 0]);
                  Parameters.ParamByName('pHo').Value := VartoStr(vList[i, 1]);
                  Parameters.ParamByName('pvisit_insert_standard').Value := StrToInt(VartoStr(vList[i, 2]));
                  Parameters.ParamByName('pvisit_insert_count').Value :=  StrToInt(VartoStr(vList[i, 3]));
                  ExecSQL;
                  ExceptLogging(' ???????? ???? ???? ????');
                end;
              end;
              SetProgress(1);
            end;
          end;
          EndProgress;
          ShowMessage('??' + IntToStr(nTotCnt) + '???? ?????? ???????? ??????????????.');
          btnSearchClick(Self);
        end
        else
        begin
          //dg1.Clear;
          ShowMessage('?????? ?????? ????????.');
        end;
      end;//# if Execute then
    end;//# with OpenDialog1 do
  except
    on E : Exception do
    begin
        EndProgress;
        ExceptLogging(' ???????? ???? ???? ???? ???? '+E.Message);
    end;
  end;
end;

procedure TfrmVisitinfo_insert.btnCancelClick(Sender: TObject);
begin
   edtdong.Text := '';
   edtho.Text   := '';
   edtVisitCount.Text := '';
end;

procedure TfrmVisitinfo_insert.btnCloseClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TfrmVisitinfo_insert.btnDeleteClick(Sender: TObject);
begin
  with dmTables.qryTemp do
  begin
    if (edtdong.Text ='') and ( edtho.Text = '') then
    begin
       ShowMessage('?? ?????? ??????????');
       Exit;
    end;

    Close;
    SQL.Clear;
    SQL.Add('delete from Visitinfo_insert_icon where dong = :N1 and ho = :N2');
    Parameters.ParamByName('N1').Value:= edtdong.Text;
    Parameters.ParamByName('N2').Value:= edtho.Text;
    ExecSQL;
    ExceptLogging(' ???????? ???? ???? ???? '+edtdong.Text+'/'+edtho.Text);
  end;
end;

procedure TfrmVisitinfo_insert.BtnExcelClick(Sender: TObject);
begin
   znSave_DBGridToExcel(dg1);
end;

procedure TfrmVisitinfo_insert.btnSaveClick(Sender: TObject);
begin
  with dmTables.qryTemp do
  begin
    if StrToInt(edtStandrard.Text) < StrToInt(edtVisitCount.Text) then
    begin
      ShowMessage('???????? ?????? ???? ???? ???? ???? ???? ????????.');
      Exit;
    end;


    Close;
    SQL.Clear;
    SQL.Add('Select * from Visitinfo_insert_icon where dong = :N1 and ho = :N2');
    Parameters.ParamByName('N1').Value:= edtdong.Text;
    Parameters.ParamByName('N2').Value:= edtho.Text;
    Open;
    if RecordCount <= 0 then
    begin
       Close;
       SQL.Clear;
       SQL.Add('Insert into Visitinfo_insert_icon (dong, ho, visit_insert_standard, visit_insert_count) ' +
                'values(:pDong, :pHo, :pvisit_insert_standard, :pvisit_insert_count)');
       Parameters.ParamByName('pDong').Value := edtdong.Text;
       Parameters.ParamByName('pHo').Value   := edtho.Text;
       Parameters.ParamByName('pvisit_insert_standard').Value := edtStandrard.Text;
       Parameters.ParamByName('pvisit_insert_count').Value    := edtVisitCount.Text;
       ExecSQL;
       ExceptLogging(' ???????? ???? ???? ???? '+edtdong.Text+'/'+edtho.Text+' ????????(????)'+edtStandrard.Text+' ????????'+edtVisitCount.Text);
    end
    else
    begin
      Close;
      SQL.Clear;
      SQL.Add('Update Visitinfo_insert_icon set visit_insert_standard = :pvisit_insert_standard, visit_insert_count = :pvisit_insert_count, visit_insert_precount = :pvisit_insert_precount ');
      SQL.Add('where  dong = :pDong and ho = :pHo ');
      Parameters.ParamByName('pDong').Value := edtdong.Text;
      Parameters.ParamByName('pHo').Value   := edtho.Text;
      Parameters.ParamByName('pvisit_insert_standard').Value := edtStandrard.Text;
      Parameters.ParamByName('pvisit_insert_count').Value    := edtVisitCount.Text;
      Parameters.ParamByName('pvisit_insert_precount').Value := dg1.Fields[4].AsString;
      ExecSQL;
      ExceptLogging(' ???????? ???? ???? ???? '+edtdong.Text+'/'+edtho.Text+' ????????(????)'+edtStandrard.Text+' ????????'+edtVisitCount.Text);
    end;
    btnSearchClick(self);
  end;
end;

procedure TfrmVisitinfo_insert.btnSearchClick(Sender: TObject);
begin
   with qryVisit_Insert do
   begin
     Close;
     sql.Clear;
     SQL.Add('select convert(varchar(50), dong) as dong, convert(varchar(50), ho) as ho, ');
     SQL.Add('visit_insert_standard, visit_insert_use, visit_insert_count, visit_insert_precount from visitinfo_insert_icon ');

     if edtdong.Text <> '' then
     begin
        SQL.Add('where dong = :N1');
        Parameters.ParamByName('N1').Value:= edtdong.Text;
     end;

     if edtho.Text <> '' then
     begin
        SQL.Add('and ho = :N2');
        Parameters.ParamByName('N2').Value:= edtho.Text;
     end;

     SQL.Add(' Order by                                                               ');
     SQL.Add(' CASE WHEN UPPER(substring (dong,1,1)) BETWEEN ''A'' AND ''Z'' THEN 1   ');
     SQL.Add('  WHEN substring(dong,1,1)         BETWEEN ''0'' AND ''9'' THEN 2       ');
     SQL.Add('end                                                                     ');
     SQL.Add(',len(dong), UPPER(dong) asc,                                          ');
     SQL.Add(' CASE WHEN UPPER(substring (ho,1,1)) BETWEEN ''A'' AND ''Z'' THEN 1   ');
     SQL.Add('  WHEN substring(ho,1,1)         BETWEEN ''0'' AND ''9'' THEN 2       ');
     SQL.Add('end                                                                   ');
     SQL.Add(',len(ho), UPPER(ho) asc                                               ');
     Open;

     if RecordCount > 0 then
     begin
        BtnExcel.Enabled := True;
     end
     else
     begin
        BtnExcel.Enabled := false;
     end;
   end;
end;

procedure TfrmVisitinfo_insert.dg1CellClick(Column: TColumn);
begin
    edtdong.Text := dg1.Fields[0].AsString;
    edtho.Text   := dg1.Fields[1].AsString;
    edtVisitCount.Text := dg1.Fields[4].AsString;
end;

procedure TfrmVisitinfo_insert.FormShow(Sender: TObject);
var
  posText: Integer;
  targetTest: string;
begin
  with qryTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select *  ');
    SQL.Add('From ParkInfo ');
    Open;

    if RecordCount > 0 then
    begin
       posText    := Pos('/',FieldByName('visitinfoInsert').AsString);
       targetTest := Copy(FieldByName('visitinfoInsert').AsString, 1, posText-1);
       edtStandrard.Text := targetTest;
    end;
  end;
end;

procedure TfrmVisitinfo_insert.getExcelData(szFileName: String;
  var vList: Variant; var nRow: Integer; nStartRow: Integer);
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

end.
