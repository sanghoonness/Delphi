unit SCGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, DB, ADODB, Grids, BaseGrid, AdvGrid, DBAdvGrid,
  StdCtrls, Buttons, Mask, AdvSpin, AdvCombo, AdvEdit, AdvObj, Vcl.ComCtrls,
  AdvDateTimePicker, clisted;

type
  TfrmSCGroup = class(TForm)
    AdvPanel1: TAdvPanel;
    AdvPanel2: TAdvPanel;
    qryTemp: TADOQuery;
    qryGroup: TADOQuery;
    qryGroupParkNo: TSmallintField;
    qryGroupGroupNo: TSmallintField;
    qryGroupGroupName: TStringField;
    qryGroupAPB: TWordField;
    qryGroupStatus: TWordField;
    qryGroupRemark: TStringField;
    qryGroupGroupType: TWordField;
    qryGroupUseFeeItem: TWordField;
    qryGroupReserve1: TStringField;
    qryGroupReserve2: TStringField;
    qryGroupReserve3: TStringField;
    qryGroupReserve4: TStringField;
    qryGroupReserve5: TStringField;
    qryFeeItem: TADOQuery;
    qryFeeItemParkNo: TSmallintField;
    qryFeeItemFeeNo: TWordField;
    qryFeeItemFeeName: TStringField;
    qryFeeItemItemMax: TIntegerField;
    qryFeeItemTotMax: TIntegerField;
    qryFeeItemReserve1: TStringField;
    qryFeeItemReserve2: TStringField;
    qryFeeItemReserve3: TStringField;
    qryFeeItemReserve4: TStringField;
    qryFeeItemReserve5: TStringField;
    dsGroup: TDataSource;
    edtGroupName: TAdvEdit;
    edtRemark: TAdvEdit;
    cmbAPB: TAdvComboBox;
    cmbStatus: TAdvComboBox;
    edtGroupNo: TAdvSpinEdit;
    cmbGroupType: TAdvComboBox;
    cmbFeeItem: TAdvComboBox;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnDelete: TBitBtn;
    btnClose: TBitBtn;
    dgGroup: TDBAdvGrid;
    cmbParkNo: TAdvComboBox;
    qryGroupHIType: TWordField;
    qryGroupHISTime: TStringField;
    qryGroupHIETime: TStringField;
    cmbHIType: TAdvComboBox;
    edtHISTime: TAdvMaskEdit;
    edtHIETime: TAdvMaskEdit;
    chkDataConvert: TCheckBox;
    edtExpDateT: TAdvDateTimePicker;
    cmbFeeNo: TAdvComboBox;
    qryGroupfeename: TStringField;
    cmbAlarm: TAdvComboBox;
    qryGroupOneMonth: TIntegerField;
    qryGroupTwoMonth: TIntegerField;
    qryGroupThreeMonth: TIntegerField;
    qryGroupFourMonth: TIntegerField;
    qryGroupFiveMonth: TIntegerField;
    qryGroupSixMonth: TIntegerField;
    edt1month: TAdvSpinEdit;
    edt2month: TAdvSpinEdit;
    edt3month: TAdvSpinEdit;
    edt4month: TAdvSpinEdit;
    edt5month: TAdvSpinEdit;
    edt6month: TAdvSpinEdit;
    cmbMiddle: TAdvComboBox;
    qryGroupUseMiddle: TWordField;
    qryGroupStairUse: TIntegerField;
    qryGroupRestrictionNo: TWordField;
    chklstUnit: TCheckListEdit;
    lblBlockLPR: TLabel;
    cmbBujaeType: TAdvComboBox;
    qryGroupBujaeType2: TStringField;
    procedure qryGroupGroupTypeGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dgGroupClick(Sender: TObject);
    procedure qryGroupAPBGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryGroupStatusGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);


    procedure qryGroupFeeNameGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryGroupHITypeGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure     qryGroupUseMiddleGetText(Sender: TField; var Text: string; DisplayText: Boolean);

  private
    { Private declarations }
    procedure frmClear;
    function FieldNameToColumnIndex(FieldName: string; Grid: TDBAdvGrid): Integer;    // H1.0.01
  public
    { Public declarations }
  end;


  RECFeeItem = record
    nFeeNo  : Integer;
    sFeeName: String;
  end;

var

  frmSCGroup: TfrmSCGroup;
  nSelect: Byte = 0; //0:Add, 1:Modify
  nPrvAPB, nPrvBlock,nPrvHIType: Integer; //???????? APB, ?????? ItemIndex ????
  sPrvHISTime, sPrvHIETime : AnsiString;
  RFeeItem : Array[1..50] of RECFeeItem;
implementation
uses
  Global, Tables;

{$R *.dfm}

procedure TfrmSCGroup.frmClear;
begin
  try
    cmbParkNo   .ItemIndex:= 0;
    edtGroupNo  .Value:= 0;
    edtGroupName.Text:= '';
    cmbAPB      .ItemIndex:= 2;
    cmbStatus   .ItemIndex:= 0;
    cmbGroupType.ItemIndex:= 0;
    cmbFeeItem  .ItemIndex:= 0;
    edtRemark   .Text:= '';
    cmbHIType.ItemIndex:= 0;
    edtHISTime.Text:= '';
    edtHIETime.Text:= '';
    btnDelete.Enabled:= False;
    btnCancel.Enabled:= False;
    nSelect:= 0;
    //edtGroupNo.SetFocus;
    cmbAlarm.ItemIndex := 0;
    cmbMiddle.ItemIndex := 0;
    edtGroupNo.Enabled := True;
  except
    on E: Exception do ExceptLogging('TfrmSCGroup.frmClear: ' + aString(E.Message));
  end;
end;

procedure TfrmSCGroup.btnCancelClick(Sender: TObject);
begin
  frmClear;
end;

procedure TfrmSCGroup.btnCloseClick(Sender: TObject);
begin
  qryGroup.Close;
  qryFeeItem.Close;
  qryTemp.Close;
  ModalResult := mrCancel;
  //Close;
end;

procedure TfrmSCGroup.btnDeleteClick(Sender: TObject);
begin
  try
    if MessageDlg('?????? ?????? ???????????', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

    with qryGroup do
    begin
      try
        dmTables.ADODB.BeginTrans;
        Close;
        SQL.Clear;
        SQL.Add('Delete from GGroup where ParkNo = :N1 and GroupNo = :N2');
        Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
        Parameters.ParamByName('N2').Value:= edtGroupNo.Value;
        ExecSQL;
        dmTables.ADODB.CommitTrans;
      except
        on E: Exception do
        begin
          dmTables.ADODB.RollbackTrans;
          ExceptLogging('TfrmSCGroup.btnDeleteClick: ' + aString(E.Message));
          ShowMessage('?????? ????????! ???????? ????????????.');
        end;
      end;
      {Close;
      SQL.Clear;
      SQL.Add(' Select  ') ;
      SQL.Add(' case when UseFeeItem = 0 then ''????????''  ') ;
      SQL.Add(' else (select feename from FeeItem where FeeNo = UseFeeItem)  end  feename  ,*  ') ;
      SQL.Add(' from GGroup where ParkNo = :N1 and Reserve1 is null');
      Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
      Open;}

      Close;
      SQL.Clear;
      SQL.Add(' Select  ') ;
      SQL.Add(' case when UseFeeItem = 0 then ''????????''  ') ;
      SQL.Add(' else (select feename from FeeItem where FeeNo = UseFeeItem)  end  feename  ,*,  ') ;
      SQL.Add(' case when BujaeType = 0 then ''????????'' else ''????'' end BujaeType2 ') ;
      SQL.Add(' from GGroup where ParkNo = :N1 and Reserve1 is null');
      Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmSCGroup.btnDeleteClick: ' + aString(E.Message));
  end;
end;

procedure TfrmSCGroup.btnSaveClick(Sender: TObject);
var
  sTime: TDateTime;
  sCustConvert : AnsiString;
  i: Integer;
  sqlStr: string;
begin
  try
    if edtGroupNo.Text = '0' then
    begin
       ShowMessage('?????????? 1?????? ??????????.');
       Exit;
    end;

    if cmbHIType.ItemIndex = 1 then
    begin
      try
        sTime:= StrToTime(edtHISTime.Text);
      except
        on E: Exception do
        begin
          ShowMessage('?????????????????? ?????? ??????????????!');
          edtHISTime.SetFocus;
          edtHISTime.SelectAll;
          Exit;
        end;
      end;

      try
        sTime:= StrToTime(edtHIETime.Text);
      except
        on E: Exception do
        begin
          ShowMessage('?????????????????? ?????? ??????????????!');
          edtHIETime.SetFocus;
          edtHIETime.SelectAll;
          Exit;
        end;
      end;
    end;

    Case nSelect of
      0: begin
           with qryTemp do
           begin
             Close;
             SQL.Clear;
             SQL.Add('Select * from GGroup where ParkNo = :N1 and GroupNo = :N2');
             Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
             Parameters.ParamByName('N2').Value:= edtGroupNo.Value;
             Open;

             if RecordCount > 0 then
             begin
               ShowMessage('???? ?????? ???? ?????? ????????. ??????????????!');
               edtGroupNo.SetFocus;
               Exit;
             end;
           end;

           with qryGroup do
           begin
             try
               dmTables.ADODB.BeginTrans;
               Close;
               SQL.Clear;
               SQL.Add('Insert into GGroup ');
               SQL.Add('(ParkNo, GroupNo, GroupName, APB, Status, Remark, ');
               SQL.Add('GroupType, HIType, UseFeeItem, HISTime, HIETime, OneMonth, TwoMonth, ThreeMonth, FourMonth, FiveMonth, SixMonth, UseMiddle, BujaeType) ');
               SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N9, :pUseFeeItem, :N10, :N11, :N12, :N13 , :N14, :N15, :N16, :N17, :pUseMiddle, :pBujaeType)');
               Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
               Parameters.ParamByName('N2').Value:= edtGroupNo.Value;
               Parameters.ParamByName('N3').Value:= edtGroupName.Text;
               Parameters.ParamByName('N4').Value:= cmbAPB.ItemIndex + 1;
               Parameters.ParamByName('N5').Value:= cmbStatus.ItemIndex;
               Parameters.ParamByName('N6').Value:= edtRemark.Text;
               Parameters.ParamByName('N7').Value:= cmbGroupType.ItemIndex;
              // Parameters.ParamByName('N8').Value:= cmbFeeItem.Tag;
               if nApt = 0 then
               begin
                Parameters.ParamByName('N9').Value:= cmbAlarm.ItemIndex;
               end
               else
               begin
                Parameters.ParamByName('N9').Value:= cmbHIType.ItemIndex;
               end;
               Parameters.ParamByName('pUseFeeItem').Value:= RFeeItem[cmbFeeNo.ItemIndex + 1].nFeeNo;
               Parameters.ParamByName('N10').Value:= edtHISTime.Text;
               Parameters.ParamByName('N11').Value:= edtHIETime.Text;
               Parameters.ParamByName('N12').Value:= edt1month.Value;
               Parameters.ParamByName('N13').Value:= edt2month.Value;
               Parameters.ParamByName('N14').Value:= edt3month.Value;
               Parameters.ParamByName('N15').Value:= edt4month.Value;
               Parameters.ParamByName('N16').Value:= edt5month.Value;
               Parameters.ParamByName('N17').Value:= edt6month.Value;
               //Parameters.ParamByName('pUseMiddle').Value:= cmbMiddle.ItemIndex;
               Parameters.ParamByName('pUseMiddle').Value:= 0;
               Parameters.ParamByName('pBujaeType').Value:= 0;
               ExecSql;
               dmTables.ADODB.CommitTrans;
               ShowMessage('???? ?????? ??????????????.');
                cmbHIType.ItemIndex :=0;
                cmbAPB.ItemIndex:= 2;
                edtGroupName.Text:= '';
                cmbStatus.ItemIndex:= 0;
                edtRemark.Text:= '';
                cmbAPB.ItemIndex:=2;
                edt1month.Value := 0;
                edt2month.Value := 0;
                edt3month.Value := 0;
                edt4month.Value := 0;
                edt5month.Value := 0;
                edt6month.Value := 0;
             except
               on E: Exception do
               begin
                 dmTables.ADODB.RollbackTrans;
                 ExceptLogging('TfrmSCGroup.btnSaveClick: ' + aString(E.Message));
                 ShowMessage('?????? ????????! ???????? ????????????.');
               end;
             end;
            {Close;
            SQL.Clear;
            SQL.Add(' Select  ') ;
            SQL.Add(' case when UseFeeItem = 0 then ''????????''  ') ;
            SQL.Add(' else (select feename from FeeItem where FeeNo = UseFeeItem)  end  feename  ,*  ') ;
            SQL.Add(' from GGroup where ParkNo = :N1 and Reserve1 is null');
            Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
            Open;}

              Close;
              SQL.Clear;
              SQL.Add(' Select  ') ;
              SQL.Add(' case when UseFeeItem = 0 then ''????????''  ') ;
              SQL.Add(' else (select feename from FeeItem where FeeNo = UseFeeItem)  end  feename  ,*,  ') ;
              SQL.Add(' case when BujaeType = 0 then ''????????'' else ''????'' end BujaeType2 ') ;
              SQL.Add(' from GGroup where ParkNo = :N1 and Reserve1 is null');
              Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
              Open;
           end;
         end;

      1: begin


           with qryGroup do
           begin
             try
               dmTables.ADODB.BeginTrans;
               Close;
               SQL.Clear;
               SQL.Add('Update GGroup ');
               SQL.Add('Set GroupName = :N3, APB = :N4, Status = :N5, Remark = :N6, UseMiddle = :pUseMiddle, BujaeType = :pBujaeType, ');
               SQL.Add('GroupType = :N7, HIType = :N9, UseFeeItem = :pUseFeeItem, ');
               SQL.Add('OneMonth = :N10, TwoMonth = :N11, ThreeMonth = :N12, ');
               SQL.Add('FourMonth = :N13, FiveMonth = :N14, SixMonth = :N15 ');
               SQL.Add('Where ParkNo = :N1 and GroupNo = :N2');
               Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
               Parameters.ParamByName('N2').Value:= edtGroupNo.Value;
               Parameters.ParamByName('N3').Value:= edtGroupName.Text;
               Parameters.ParamByName('N4').Value:= cmbAPB.ItemIndex + 1;
               Parameters.ParamByName('N5').Value:= cmbStatus.ItemIndex;
               Parameters.ParamByName('N6').Value:= edtRemark.Text;
               Parameters.ParamByName('N7').Value:= cmbGroupType.ItemIndex;
              /// Parameters.ParamByName('N8').Value:= cmbFeeItem.Tag;
//               Parameters.ParamByName('N9').Value:= cmbHIType.ItemIndex;
               if nApt = 0 then
               begin
                Parameters.ParamByName('N9').Value:= cmbAlarm.ItemIndex;
               end
               else
               begin
                Parameters.ParamByName('N9').Value:= cmbHIType.ItemIndex;
               end;
               if cmbFeeNo.ItemIndex < 0 then
                Parameters.ParamByName('pUseFeeItem').Value:= 0
               else
                Parameters.ParamByName('pUseFeeItem').Value:= RFeeItem[cmbFeeNo.ItemIndex+ 1].nFeeNo;
               Parameters.ParamByName('N10').Value:= edt1month.Value;
               Parameters.ParamByName('N11').Value:= edt2month.Value;
               Parameters.ParamByName('N12').Value:= edt3month.Value;
               Parameters.ParamByName('N13').Value:= edt4month.Value;
               Parameters.ParamByName('N14').Value:= edt5month.Value;
               Parameters.ParamByName('N15').Value:= edt6month.Value;
               Parameters.ParamByName('pUseMiddle').Value:= cmbMiddle.ItemIndex;
               Parameters.ParamByName('pBujaeType').Value:= cmbBujaeType.ItemIndex;
               ExceptLogging(sql.Text);
               ExecSql;

               dmTables.ADODB.CommitTrans;
                ShowMessage('???? ?????? ??????????????.');
                cmbHIType.ItemIndex :=0;
                cmbAPB.ItemIndex:= 2;
                edtGroupName.Text:= '';
                cmbStatus.ItemIndex:= 0;
                edtRemark.Text:= '';
                cmbAPB.ItemIndex:=2;
                edt1month.Value := 0;
                edt2month.Value := 0;
                edt3month.Value := 0;
                edt4month.Value := 0;
                edt5month.Value := 0;
                edt6month.Value := 0;

               if (chkDataConvert.Checked) then
               begin
                  SQL.Clear;
                  SQL.Add('Update CUSTINFO ');
                  SQL.Add('Set expdateT= :N3  ');
                  SQL.Add('Where ParkNo = :N1 and GroupNo = :N2');
                  try
                    sCustConvert  :=FormatDateTime('YYYY-MM-DD', edtExpDateT.Date);
                    StrToDate(sCustConvert);
                  except
                    on E: Exception do
                    begin
                      ShowMessage('???????? ????????  ?????? ??????????????!');
                      edtExpDateT.SetFocus;
                      Exit;
                    end;
                  end;
                  Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
                  Parameters.ParamByName('N2').Value:= edtGroupNo.Value;
                  Parameters.ParamByName('N3').Value:= sCustConvert;
                  ExecSql;
               end;
             except
               on E: Exception do
               begin
                 dmTables.ADODB.RollbackTrans;
                 ExceptLogging('TfrmSCGroup.btnSaveClick: ' + aString(E.Message));
                 ShowMessage('?????? ????????! ???????? ????????????.');
               end;
             end;
            {Close;
            SQL.Clear;
            SQL.Add(' Select  ') ;
            SQL.Add(' case when UseFeeItem = 0 then ''????????''  ') ;
            SQL.Add(' else (select feename from FeeItem where FeeNo = UseFeeItem)  end  feename  ,*  ') ;
            SQL.Add(' from GGroup where ParkNo = :N1 and Reserve1 is null');
            Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
            Open;}
              Close;
              SQL.Clear;
              SQL.Add(' Select  ') ;
              SQL.Add(' case when UseFeeItem = 0 then ''????????''  ') ;
              SQL.Add(' else (select feename from FeeItem where FeeNo = UseFeeItem)  end  feename  ,*,  ') ;
              SQL.Add(' case when BujaeType = 0 then ''????????'' else ''????'' end BujaeType2 ') ;
              SQL.Add(' from GGroup where ParkNo = :N1 and Reserve1 is null');
              Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
              Open;
           end;

           if nPrvAPB <> cmbAPB.ItemIndex then
           begin
             with qryTemp do
             begin
               try
                 dmTables.ADODB.BeginTrans;
                 Close;
                 SQL.Clear;
                 SQL.Add('Update CustInfo ');
                 SQL.Add('Set APB = :N1 Where ParkNo = :N2 and GroupNo = :N3');
                 Parameters.ParamByName('N1').Value:= cmbAPB.ItemIndex + 1;
                 Parameters.ParamByName('N2').Value:= StrToInt(cmbParkNo.Text);
                 Parameters.ParamByName('N3').Value:= edtGroupNo.Value;
                 ExecSQL;
                 dmTables.ADODB.CommitTrans;
               except
                 on E: Exception do
                 begin
                   dmTables.ADODB.RollbackTrans;
                   ExceptLogging('TfrmSCGroup.CustInfo_APB_Update: ' + aString(E.Message));
                   ShowMessage('?????? ????????! ???????? ????????????.');
                 end;
               end;
             end;
           end;
//
//            if (nPrvHIType <> cmbHIType.ItemIndex) or (sPrvHISTime <> edtHISTime.Text) or (sPrvHIETime <> edtHIETime.Text) then
//           begin
//             with qryTemp do
//             begin
//               try
//                 dmTables.ADODB.BeginTrans;
//                 Close;
//                 SQL.Clear;
//                 SQL.Add('Update CustInfo ');
//                 SQL.Add('Set HIType = :N1, HISTime = :N4 , HIETime = :N5 Where ParkNo = :N2 and GroupNo = :N3');
//                 Parameters.ParamByName('N1').Value:= cmbHIType.ItemIndex;
//                 Parameters.ParamByName('N2').Value:= StrToInt(cmbParkNo.Text);
//                 Parameters.ParamByName('N3').Value:= edtGroupNo.Value;
//                 Parameters.ParamByName('N4').Value:= edtHISTime.Text;
//                 Parameters.ParamByName('N5').Value:= edtHIETime.Text;
//                 ExecSQL;
//                 dmTables.ADODB.CommitTrans;
//               except
//                 on E: Exception do
//                 begin
//                   dmTables.ADODB.RollbackTrans;
//                   ExceptLogging('TfrmSCGroup.CustInfo_HIType_Update: ' + aString(E.Message));
//                   ShowMessage('?????? ????????! ???????? ????????????.');
//                 end;
//               end;
//             end;
//           end;

           if nPrvBlock <> cmbStatus.ItemIndex then
           begin
             with qryTemp do
             begin
               try
                 dmTables.ADODB.BeginTrans;
                 Close;
                 SQL.Clear;
                 SQL.Add('Update CustInfo ');
                 SQL.Add('Set Status = :N1 Where ParkNo = :N2 and GroupNo = :N3');
                 Parameters.ParamByName('N1').Value:= cmbStatus.ItemIndex;
                 Parameters.ParamByName('N2').Value:= StrToInt(cmbParkNo.Text);
                 Parameters.ParamByName('N3').Value:= edtGroupNo.Value;
                 ExecSQL;
                 dmTables.ADODB.CommitTrans;
               except
                 on E: Exception do
                 begin
                   dmTables.ADODB.RollbackTrans;
                   ExceptLogging('TfrmSCGroup.CustInfo_Status_Update: ' + aString(E.Message));
                   ShowMessage('?????? ????????! ???????? ????????????.');
                 end;
               end;
             end;
           end;

           //LPR ???? ???? ????
           sqlStr := '';
           if bBlockLPRUse then begin
             with qryTemp do begin
               Close;
               SQL.Text := 'Update GGroup set BlockLPRNo = :v1 Where GroupNo = :v2';
               for i := 0 to chklstUnit.Items.Count-1 do begin
                 if chklstUnit.Checked[i] = True then begin
                   if sqlStr = '' then begin
                     sqlStr := IntToStr(Integer(chklstUnit.Items.Objects[i]));
                   end else begin
                     sqlStr := sqlStr + ',' + IntToStr(Integer(chklstUnit.Items.Objects[i]));
                   end;
                 end;
               end;
               Parameters.ParamByName('v1').Value := sqlStr;
               Parameters.ParamByName('v2').Value := edtGroupNo.Text;
               ExecSQL;
             end;
           end;

//           with qryTemp do
//           begin
//             try
//               dmTables.ADODB.BeginTrans;
//               Close;
//               SQL.Clear;
//               SQL.Add('Update CustInfo ');
//               SQL.Add('Set HIType = :N1, HISTime = :N2, HIETime = :N3 Where ParkNo = :N4 and GroupNo = :N5');
//               Parameters.ParamByName('N1').Value:= cmbHIType.ItemIndex;
//               Parameters.ParamByName('N2').Value:= edtHISTime.Text;
//               Parameters.ParamByName('N3').Value:= edtHIETime.Text;
//               Parameters.ParamByName('N4').Value:= StrToInt(cmbParkNo.Text);
//               Parameters.ParamByName('N5').Value:= edtGroupNo.Value;
//               ExecSQL;
//               dmTables.ADODB.CommitTrans;
//             except
//               on E: Exception do
//               begin
//                 dmTables.ADODB.RollbackTrans;
//                 ExceptLogging('TfrmSCGroup.CustInfo_Status_Update: ' + aString(E.Message));
//                 ShowMessage('?????? ????????! ???????? ????????????.');
//               end;
//             end;
//           end;
         end;

    end;
  except
    on E: Exception do ExceptLogging('TfrmSCGroup.btnSaveClick: ' + aString(E.Message));
  end;
end;

procedure TfrmSCGroup.dgGroupClick(Sender: TObject);
var
  unitNoStrs: TStrings;
  i: Integer;
begin
  try
    if qryGroup.RecordCount > 0 then
    begin
      with qryGroup do
      begin
        cmbParkNo.ItemIndex:= cmbParkNo.Items.IndexOf(IntToStr(FieldByName('ParkNo').AsInteger));
        edtGroupNo  .Value := FieldByName('GroupNo').AsInteger;
        edtGroupName.Text  := FieldByName('GroupName').AsString;
        cmbAPB.ItemIndex   := FieldByName('APB').AsInteger-1;
        cmbStatus.ItemIndex:= FieldByName('Status').AsInteger;
        edtRemark   .Text  := FieldByName('Remark').AsString;
        nPrvAPB            := FieldByName('APB').AsInteger-1;
        nPrvBlock          := FieldByName('Status').AsInteger;
        cmbGroupType.ItemIndex:= FieldByName('GroupType').AsInteger;
        cmbHIType.ItemIndex:= FieldByName('HIType').AsInteger;
        edtHISTime.Text:= FieldByName('HISTime').AsString;
        edtHIETime.Text:= FieldByName('HIETime').AsString;
//        nPrvHIType         := FieldByName('HIType').AsInteger;
        cmbAlarm.ItemIndex := FieldByName('HIType').AsInteger;
        sPrvHISTime        := FieldByName('HISTime').AsString;
        sPrvHIETime        := FieldByName('HIETime').AsString;
        //cmbFeeNo.Text       :=   FieldByName('feename').AsString;
        cmbFeeNo.ItemIndex:= cmbFeeNo.Items.IndexOf(FieldByName('feename').AsString);
        edt1month.Value := FieldByName('OneMonth').AsInteger;;
        edt2month.Value := FieldByName('TwoMonth').AsInteger;;
        edt3month.Value := FieldByName('ThreeMonth').AsInteger;;
        edt4month.Value := FieldByName('FourMonth').AsInteger;;
        edt5month.Value := FieldByName('FiveMonth').AsInteger;;
        edt6month.Value := FieldByName('SixMonth').AsInteger;;
        cmbMiddle.ItemIndex := FieldByName('UseMiddle').AsInteger;    // H1.0.01
        if FieldByName('BujaeType2').AsString ='????????'   then
        begin
            cmbBujaeType.ItemIndex := 0;    // H1.0.07
        end
        else if FieldByName('BujaeType2').AsString ='????'   then
        begin
            cmbBujaeType.ItemIndex := 1;    // H1.0.07
        end;
      end;

      with qryTemp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from FeeItem where ParkNo = :N1 and FeeNo = :N2');
        Parameters.ParamByName('N1' ).Value:= qryGroup.FieldByName('ParkNo').AsInteger;
        Parameters.ParamByName('N2' ).Value:= qryGroup.FieldByName('UseFeeItem').AsInteger;
        Open;

        if RecordCount > 0 then
        begin
          cmbFeeItem.ItemIndex:= cmbFeeItem.Items.IndexOf(FieldByName('FeeName').AsString);
          cmbFeeItem.Tag:= qryGroup.FieldByName('UseFeeItem').AsInteger;
        end;

        for i := 0 to chklstUnit.Items.Count-1 do begin
          chklstUnit.Checked[i] := False;
        end;
        Close;
        SQL.Text := 'Select BlockLPRNo From GGroup Where GroupNo = :v1';
        Parameters.ParamByName('v1').Value := dgGroup.Cells[2,dgGroup.Row];
        Open;
        if Fields[0].Value <> '' then begin
          unitNoStrs := TStringList.Create;
          unitNoStrs.Delimiter := ',';
          unitNoStrs.DelimitedText := Fields[0].AsString;
          for i := 0 to unitNoStrs.Count-1 do begin
            if chklstUnit.Items.IndexOfObject(TObject(StrToInt(unitNoStrs[i]))) > -1 then begin
              chklstUnit.Checked[chklstUnit.Items.IndexOfObject(TObject(StrToInt(unitNoStrs[i])))] := True;
            end;
          end;
        end;
      end;
    end
    else
    begin
      cmbBujaeType.ItemIndex := 0;    // H1.0.07
    end;
    btnCancel.Enabled:= True;
    btnDelete.Enabled:= True;
    edtGroupNo.Enabled := False;
    nSelect:= 1;
  except
    on E: Exception do ExceptLogging('TfrmSCGroup.dgGroupClick: ' + aString(E.Message));
  end;
end;

procedure TfrmSCGroup.FormShow(Sender: TObject);
var
  i : Byte;
  m :      Byte;
  procedure BlockLPR;
  var
    i: Integer;
  begin
    if bBlockLPRUse then begin
      with qryTemp do begin
        Close;
        SQL.Text := 'Select UnitNo,UnitName From UnitInfo Where UnitKind IN (8,9) ';
        Open;
        if RecordCount > 0 then begin
          First;
          while not eof do begin
            chklstUnit.Items.AddObject(Fields[1].AsString, Tobject(Fields[0].AsInteger));
            Next;
          end;
        end;
      end;
    end else begin
      chklstUnit.Visible := False;
      lblBlockLPR.Visible := False;
    end;
  end;
begin
  try
    if (sAlarmYnVip = '0') then
    begin
      cmbAlarm.Visible := False;
    end;

    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from ParkInfo');
      Open;

      if RecordCount <= 0 then
      begin
        ShowMessage('???????? ???? ??????????????!');
        Close;
        Exit;
      end
      else
      begin
        cmbParkNo.Items.Clear;

        while not Eof do
        begin
          cmbParkNo.Items.Add(IntToStr(FieldByName('ParkNo').AsInteger));
          Next;
        end;
        cmbParkNo.ItemIndex:= 0;
      end;
    end;

    cmbFeeItem.Items.Clear;
    cmbFeeItem.Items.Add('????????');
    cmbFeeItem.ItemIndex:= 0;
    cmbFeeItem.Tag:= 0;

    with qryGroup do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' Select  ') ;
      SQL.Add(' case when UseFeeItem = 0 then ''????????''  ') ;
      SQL.Add(' else (select feename from FeeItem where FeeNo = UseFeeItem)  end  feename  ,*,  ') ;
      SQL.Add(' case when BujaeType = 0 then ''????????'' else ''????'' end BujaeType2 ') ;
      SQL.Add(' from GGroup where ParkNo = :N1 and Reserve1 is null');
      Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
      Open;
    end;
    nSelect:= 0;
    edtExpDateT.Date:= StrToDate(FormatDateTime('YYYY-MM-DD', Now));
    if gGroupdateconvert = '1' then
    begin
      chkDataConvert.Visible := True;
      edtExpDateT.Visible := True;
    end;

    with qryFeeItem do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from feeitem order by feeno');
      Open;

      cmbFeeNo.Items.Add('????????');
      RFeeItem[1].nFeeNo := 0;
      RFeeItem[1].sFeeName := '????????';

      if RecordCount > 0 then
      begin

        i := 2;
        while not Eof do
        begin
          cmbFeeNo.Items.Add(FieldByName('FeeName').AsString);
          RFeeItem[i].nFeeNo := FieldByName('FeeNo').AsInteger;
          RFeeItem[i].sFeeName:= FieldByName('FeeName').AsString;
          i:= i+1;
          Next;
        end;
      end;

      if nApt = 1 then
      begin
        cmbHIType.Visible := true;
        edtHISTime.Visible := true;
        edtHIETime.Visible := true;
        cmbAlarm.Visible := False;
        //dgGroup.Columns[6].Header := '????????????';          // H1.0.01
        dgGroup.Columns[FieldNameToColumnIndex('HIType',dgGroup)].Header:=  '????????????';   // H1.0.01
      end
      else
      begin
        cmbAlarm.Visible := true;
        cmbHIType.Visible := false;
        edtHISTime.Visible := false;
        edtHIETime.Visible := false;

        dgGroup.Columns[FieldNameToColumnIndex('HIType',dgGroup)].Header:= '????????';   // H1.0.01
        //dgGroup.Columns[6].Header := '????????';       // H1.0.01

        dgGroup.ColWidths[FieldNameToColumnIndex('HISTime',dgGroup)]:= 0;   // H1.0.01
        dgGroup.ColWidths[FieldNameToColumnIndex('HIETime',dgGroup)]:= 0;   // H1.0.01
        //dgGroup.ColWidths[8] := -1;     // H1.0.01
        //dgGroup.ColWidths[9] := -1;     // H1.0.01
      end;
      if nRegMoney = 1 then
      begin
        edt1month.Visible := True;
        edt2month.Visible := True;
        edt3Month.Visible := True;
        edt4Month.Visible := True;
        edt5Month.Visible := True;
        edt6Month.Visible := True;
        edt1month.Value := 0;
        edt2month.Value := 0;
        edt3month.Value := 0;
        edt4month.Value := 0;
        edt5month.Value := 0;
        edt6month.Value := 0;
      end
      else
      begin
         dgGroup.ColWidths[FieldNameToColumnIndex('OneMonth',dgGroup)] := 0;      // H1.0.01
         dgGroup.ColWidths[FieldNameToColumnIndex('TwoMonth',dgGroup)] := 0;       // H1.0.01
         dgGroup.ColWidths[FieldNameToColumnIndex('ThreeMonth',dgGroup)] := 0;     // H1.0.01
         dgGroup.ColWidths[FieldNameToColumnIndex('FourMonth',dgGroup)] := 0;       // H1.0.01
         dgGroup.ColWidths[FieldNameToColumnIndex('FiveMonth',dgGroup)] := 0;       // H1.0.01
         dgGroup.ColWidths[FieldNameToColumnIndex('SixMonth',dgGroup)] := 0;        // H1.0.01


        //dgGroup.ColWidths[10] := -1;
        //dgGroup.ColWidths[11] := -1;
        //dgGroup.ColWidths[12] := -1;
        //dgGroup.ColWidths[13] := -1;
        //dgGroup.ColWidths[14] := -1;
        //dgGroup.ColWidths[15] := -1;
        edt1month.Value := 0;
        edt2month.Value := 0;
        edt3month.Value := 0;
        edt4month.Value := 0;
        edt5month.Value := 0;
        edt6month.Value := 0;
        edt1Month.Visible := false;
        edt2Month.Visible := false;
        edt3Month.Visible := false;
        edt4Month.Visible := false;
        edt5Month.Visible := false;
        edt6Month.Visible := false;
      end;
      if nStair = 0 then
      begin
         dgGroup.ColWidths[FieldNameToColumnIndex('UseMiddle',dgGroup)] := 0;

       cmbMiddle.Visible := False;
      end
      else
      begin

      end;
      cmbFeeNo.ItemIndex := 0;
      BlockLPR;//LPR????????
    end;
    frmClear;
    dgGroupClick(self);
  except
    on E: Exception do ExceptLogging('TfrmSCGroup.FormCreate: ' + aString(E.Message));
  end;
end;


function TfrmSCGroup.FieldNameToColumnIndex(FieldName: string; Grid: TDBAdvGrid):Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to Grid.Columns.Count - 1 do
   // if AnsiCompareText(Grid.Columns[I].Field.FieldName, FieldName) = 0 then
   if Grid.Columns[I].FieldName = FieldName then
begin
      Result := I;
      Break;
    end;
end;

procedure TfrmSCGroup.qryGroupAPBGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  case qryGroupAPB.Value of
    1: Text:= '????';
    2: Text:= '1??????';
    3: Text:= '????????';
  end;
end;

procedure TfrmSCGroup.qryGroupFeeNameGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  case qryGroupUseFeeItem.Value of
    0: Text:= '????????????';
    else
      Text:= wString(qryGroupFeeName.Value);
  end;
end;

procedure TfrmSCGroup.qryGroupGroupTypeGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  case qryGroupGroupType.Value of
    0: Text:= '????????????';
    1: Text:= '????????????';
    2: Text:= '??????????????????';
    3: Text:= '??????????????????';
  end;
end;

procedure TfrmSCGroup.qryGroupHITypeGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if nApt = 0 then
  begin
    case qryGroupHIType.Value of
      0: Text:= '????????';
      1: Text:= '????????';
    end;
  end
  else
  begin
    case qryGroupHIType.Value of
      0: Text:= '????????';
      1: Text:= '????????';
      2: Text:= '????????';
    end;
  end;



end;

procedure TfrmSCGroup.qryGroupStatusGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  case qryGroupStatus.Value of
    0: Text:= '????';
    1: Text:= '????????';
    2: Text:= '????????';
    3: Text:= '????????';
  end;
end;

procedure TfrmSCGroup.qryGroupUseMiddleGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Case qryGroupUseMiddle.Value  of
    0: Text:= '????????';
    1: Text:= '????????';
  end;
end;

end.
