unit SCGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, DB, ADODB, Grids, BaseGrid, AdvGrid, DBAdvGrid,
  StdCtrls, Buttons, Mask, AdvSpin, AdvCombo, AdvEdit, AdvObj, clisted, CodeSiteLogging;

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
    qryGroupFeeName: TStringField;
    edtGroupName: TAdvEdit;
    edtRemark: TAdvEdit;
    cmbAPB: TAdvComboBox;
    cmbStatus: TAdvComboBox;
    edtGroupNo: TAdvSpinEdit;
    cmbGroupType: TAdvComboBox;
    cmbFeeItem: TAdvComboBox;
    dgGroup: TDBAdvGrid;
    cmbParkNo: TAdvComboBox;
    qryGroupHIType: TWordField;
    qryGroupHISTime: TStringField;
    qryGroupHIETime: TStringField;
    edtHIETime: TAdvMaskEdit;
    edtHISTime: TAdvMaskEdit;
    cmbHIType: TAdvComboBox;
    chklstUnit: TCheckListEdit;
    lblBlockLPR: TLabel;
    cmbBujae: TAdvComboBox;
    qryIONDataGroupBujaeType: TWordField;
    qryIONDataGroupRF1: TWordField;
    qryIONDataGroupRF2: TWordField;
    qryIONDataGroupRF3: TWordField;
    qryIONDataGroupRF4: TWordField;
    qryIONDataGroupRF5: TWordField;
    qryIONDataGroupRF6: TWordField;
    qryIONDataGroupRF7: TWordField;
    qryIONDataGroupRF8: TWordField;
    qryIONDataGroupRF9: TWordField;
    qryIONDataGroupRF10: TWordField;
    qryIONDataGroupRF11: TWordField;
    qryIONDataGroupRF12: TWordField;
    qryIONDataGroupRF13: TWordField;
    qryIONDataGroupRF14: TWordField;
    qryIONDataGroupRF15: TWordField;
    qryIONDataGroupRF16: TWordField;
    qryIONDataGroupRF17: TWordField;
    qryIONDataGroupRF18: TWordField;
    qryIONDataGroupRF19: TWordField;
    qryIONDataGroupRF20: TWordField;
    qryBlockLPRNo: TStringField;
    qryGroupcnt: TIntegerField;
    Panel1: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnDelete: TBitBtn;
    btnClose: TBitBtn;
    edtCustInfo_WP: TAdvSpinEdit;
    qryGroupWP: TIntegerField;
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
  private
    { Private declarations }
    procedure frmClear;
  public
    { Public declarations }
  end;

var
  frmSCGroup: TfrmSCGroup;
  nSelect: Byte = 0; //0:Add, 1:Modify
  nPrvAPB, nPrvBlock,nPrvHIType: Integer; //???????? APB, ?????? ItemIndex ????
  sPrvHISTime, sPrvHIETime : AnsiString;

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
    cmbBujae    .ItemIndex:= 0;
    edtRemark   .Text:= '';
    cmbHIType.ItemIndex:= 0;
    edtHISTime.Text:= '';
    edtHIETime.Text:= '';
    btnDelete.Enabled:= False;
    btnCancel.Enabled:= False;
    nSelect:= 0;
    //edtGroupNo.SetFocus;
    edtGroupNo.Enabled := True;
    edtCustInfo_WP.Value := 1;
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
  Close;
end;

procedure TfrmSCGroup.btnDeleteClick(Sender: TObject);
begin
  try
    if MessageDlg('?????? ?????? ???????????', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

    with qryTemp do
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
    end;
    qryGroup.Close;
    qryGroup.Open;
    dgGroupClick(Sender);
  except
    on E: Exception do ExceptLogging('TfrmSCGroup.btnDeleteClick: ' + aString(E.Message));
  end;
end;

procedure TfrmSCGroup.btnSaveClick(Sender: TObject);
var
  sTime: TDateTime;
  i: Integer;
  sqlStr: string;
begin
  try
    if edtGroupNo.Text = '0' then
    begin
      ShowMessage('???????? 1?????? ??????????.');
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
           with qryTemp do begin
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

             try
               dmTables.ADODB.BeginTrans;
               Close;
               SQL.Clear;
               SQL.Add('Insert into GGroup ');
               SQL.Add('(ParkNo, GroupNo, GroupName, APB, Status, Remark, ');
               SQL.Add('GroupType, UseFeeItem, HIType, HISTime, HIETime, BujaeType, WP) ');
               SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, :N13)');
               Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
               Parameters.ParamByName('N2').Value:= edtGroupNo.Value;
               Parameters.ParamByName('N3').Value:= edtGroupName.Text;
               Parameters.ParamByName('N4').Value:= cmbAPB.ItemIndex + 1;
               Parameters.ParamByName('N5').Value:= cmbStatus.ItemIndex;
               Parameters.ParamByName('N6').Value:= edtRemark.Text;
               Parameters.ParamByName('N7').Value:= cmbGroupType.ItemIndex;
               Parameters.ParamByName('N8').Value:= cmbFeeItem.Tag;
               Parameters.ParamByName('N9').Value:= cmbHIType.ItemIndex;
               Parameters.ParamByName('N10').Value:= edtHISTime.Text;
               Parameters.ParamByName('N11').Value:= edtHIETime.Text;
               Parameters.ParamByName('N12').Value:= cmbBujae.ItemIndex;
               Parameters.ParamByName('N13').Value:= edtCustInfo_WP.value;
               ExecSql;
               dmTables.ADODB.CommitTrans;
               ShowMessage('???? ?????? ??????????????.');

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
             except
               on E: Exception do
               begin
                 dmTables.ADODB.RollbackTrans;
                 ExceptLogging('TfrmSCGroup.btnSaveClick: ' + aString(E.Message));
                 ShowMessage('?????? ????????! ???????? ????????????.');
               end;
             end;
             qryGroup.Close;
             qryGroup.Open;
           end;
         end;

      1: begin
           with qryTemp do
           begin
             try
               dmTables.ADODB.BeginTrans;
               Close;
               SQL.Clear;
               SQL.Add('Update GGroup ');
               SQL.Add('Set GroupName = :N3, APB = :N4, Status = :N5, Remark = :N6, ');
               SQL.Add('GroupType = :N7, UseFeeItem = :N8, HIType = :N9, HISTime = :N10, HIETime = :N11, BujaeType = :N12, WP = :N13 ');
               SQL.Add('Where ParkNo = :N1 and GroupNo = :N2');
               Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
               Parameters.ParamByName('N2').Value:= edtGroupNo.Value;
               Parameters.ParamByName('N3').Value:= edtGroupName.Text;
               Parameters.ParamByName('N4').Value:= cmbAPB.ItemIndex + 1;
               Parameters.ParamByName('N5').Value:= cmbStatus.ItemIndex;
               Parameters.ParamByName('N6').Value:= edtRemark.Text;
               Parameters.ParamByName('N7').Value:= cmbGroupType.ItemIndex;
               Parameters.ParamByName('N8').Value:= cmbFeeItem.Tag;
               Parameters.ParamByName('N9').Value:= cmbHIType.ItemIndex;
               Parameters.ParamByName('N10').Value:= edtHISTime.Text;
               Parameters.ParamByName('N11').Value:= edtHIETime.Text;
               Parameters.ParamByName('N12').Value:= cmbBujae.ItemIndex;
               Parameters.ParamByName('N13').Value:= edtCustInfo_WP.value;
               ExecSql;


               sqlStr := '';
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
               dmTables.ADODB.CommitTrans;
               ShowMessage('???? ?????? ??????????????.');
             except
               on E: Exception do
               begin
                 dmTables.ADODB.RollbackTrans;
                 ExceptLogging('TfrmSCGroup.btnSaveClick: ' + aString(E.Message));
                 ShowMessage('?????? ????????! ???????? ????????????.');
               end;
             end;
             qryGroup.Close;
             qryGroup.Open;
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
           if (nPrvHIType <> cmbHIType.ItemIndex) or (sPrvHISTime <> edtHISTime.Text) or (sPrvHIETime <> edtHIETime.Text) then
           begin
             with qryTemp do
             begin
               try
                 dmTables.ADODB.BeginTrans;
                 Close;
                 SQL.Clear;
                 SQL.Add('Update CustInfo ');
                 SQL.Add('Set HIType = :N1, HISTime = :N4 , HIETime = :N5 Where ParkNo = :N2 and GroupNo = :N3');
                 Parameters.ParamByName('N1').Value:= cmbHIType.ItemIndex;
                 Parameters.ParamByName('N2').Value:= StrToInt(cmbParkNo.Text);
                 Parameters.ParamByName('N3').Value:= edtGroupNo.Value;
                 Parameters.ParamByName('N4').Value:= edtHISTime.Text;
                 Parameters.ParamByName('N5').Value:= edtHIETime.Text;
                 ExecSQL;
                 dmTables.ADODB.CommitTrans;
               except
                 on E: Exception do
                 begin
                   dmTables.ADODB.RollbackTrans;
                   ExceptLogging('TfrmSCGroup.CustInfo_HIType_Update: ' + aString(E.Message));
                   ShowMessage('?????? ????????! ???????? ????????????.');
                 end;
               end;
             end;
           end;

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
         end;
    end;
    dgGroupClick(Sender);
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
        nPrvHIType         := FieldByName('HIType').AsInteger;
        sPrvHISTime        := FieldByName('HISTime').AsString;
        sPrvHIETime        := FieldByName('HIETime').AsString;
        cmbBujae.ItemIndex := FieldByName('BujaeType').AsInteger;
        edtCustInfo_WP.value := FieldByName('WP').AsInteger;
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
//      SQL.Add('Select *, count(ParkNo) as cnt from GGroup where ParkNo = :N1 and Reserve1 is null');
//      SQL.Add('select t2.*, t1.cnt from (select GroupNo ,count(GroupNo) cnt from CustInfo group by GroupNo) as t1, ggroup t2 where t1.groupno = t2.GroupNo and t2.ParkNo = :N1 and t2.Reserve1 is null');
      SQL.Add('select t2.*, t1.cnt from (select GroupNo ,count(GroupNo) cnt from CustInfo group by GroupNo) as t1 RIGHT OUTER JOIN ggroup t2 on t1.groupno = t2.GroupNo and t2.ParkNo = :N1 and t2.Reserve1 is null');
      Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
      Open;
    end;
    nSelect:= 0;
    frmClear;

    if nApt = 1 then
    begin
      cmbHIType.Visible := true;
      edtHISTime.Visible := true;
      edtHIETime.Visible := true;
    end
    else
    begin
      cmbHIType.Visible := false;
      edtHISTime.Visible := false;
      edtHIETime.Visible := false;

      dgGroup.ColWidths[7] := -1;
      dgGroup.ColWidths[8] := -1;
      dgGroup.ColWidths[9] := -1;
    end;

    if nBujaeUse = 1 then
    begin
      cmbBujae.Visible := True;
    end
    else
    begin
      cmbBujae.Visible := False;
    end;
    BlockLPR;

    dgGroup.AutoNumberCol(0);
    dgGroup.AutoSize := True;
    if qryGroup.RecordCount > 0 then begin
      dgGroupClick(sender);
    end;

    btnCancelClick(self);

  except
    on E: Exception do ExceptLogging('TfrmSCGroup.FormCreate: ' + aString(E.Message));
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
  if nApt = 1 then
  begin
    case qryGroupHIType.Value of
      0: Text:= '????????';
      1: Text:= '????????';
      2: Text:= '????????';
    end;
  end
  else
  begin
    case qryGroupHIType.Value of
      0: Text:= '????????';
      1: Text:= '????????';
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

end.
