unit PDASearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Data.DB, Data.Win.ADODB, System.Win.ComObj, AdvProgr, Vcl.ExtCtrls,
  AdvDateTimePicker, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid;

type
  TfrmPDASearch = class(TForm)
    SaveDialog1: TSaveDialog;
    qryPDAPatrolData: TADOQuery;
    qryPDAPatrolData2: TADOQuery;
    pnProgress: TPanel;
    lbProgress: TLabel;
    ap1: TAdvProgress;
    tdg1: TDBAdvGrid;
    Panel2: TPanel;
    Bevel1: TBevel;
    Label3: TLabel;
    edtSDate: TAdvDateTimePicker;
    btnSearch: TBitBtn;
    btnExcel: TBitBtn;
    btnClose: TBitBtn;
    dsPDAata: TDataSource;
    procedure btnExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPDASearch: TfrmPDASearch;

implementation

uses
  Tables, Global;

{$R *.dfm}
//���� ����
procedure TfrmPDASearch.btnCloseClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   //Close;
end;

procedure TfrmPDASearch.btnExcelClick(Sender: TObject);
var
  k:Integer;
  xl,xlbook:variant;
  si,li_cnt:Integer; //
  sFilename:string;
  CarNo, PatrolCode, InCarNo1 : string;
begin
  Try
      xl := Createoleobject('excel.application');
      pnProgress.Visible:= True;
      Refresh;
      ap1.Position:= 0;
  Except
      MessageDlg('Excel�� ��ġ�Ǿ� ���� �ʽ��ϴ�.', MtWarning, [mbok], 0);
      Exit;
  end;

  sFilename:= 'Sheet1';
  XLBook := XL.WorkBooks.Add; // ���ο� ������ ����
  XLBook.WorkSheets[1].Name := sFilename;

   // ���� �ڷ��� ó�� ���� ĭ
  XLBook.WorkSheets[sFilename].Range['A1','A1'].Value := 'PDA ��������';
  XLBook.WorkSheets[sFilename].Range['A1','I2'].MergeCells := true;
  XLBook.WorkSheets[sFilename].Range['A1','I2'].font.bold:= true;
  XLBook.WorkSheets[sFilename].Range['A1','I2'].font.size:= 15;
  XLBook.WorkSheets[sFileName].Range['a1','i2'].HorizontalAlignment := '3' ;

  XLBook.WorkSheets[sFilename].Range['F'+IntToStr(4)].Value := '��������' ;
  XLBook.WorkSheets[sFilename].Range['G'+IntToStr(4)].Value := '���Ƚ���' ;
  XLBook.WorkSheets[sFilename].Range['H'+IntToStr(4)].Value := '��������' ;
  XLBook.WorkSheets[sFilename].Range['I'+IntToStr(4)].Value := '��������' ;
  XLBook.WorkSheets[sFilename].Range['f4','i4'].borders.lineStyle := 1 ;
  XLBook.WorkSheets[sFilename].Range['f5','f6'].MergeCells := true;
  XLBook.WorkSheets[sFilename].Range['f5','f6'].borders.lineStyle := 1 ;

  XLBook.WorkSheets[sFilename].Range['G4','G4'].borders.lineStyle := 1 ;
  XLBook.WorkSheets[sFilename].Range['G5','G6'].MergeCells := true;
  XLBook.WorkSheets[sFilename].Range['G5','G6'].borders.lineStyle := 1 ;

  XLBook.WorkSheets[sFilename].Range['H4','H4'].borders.lineStyle := 1 ;
  XLBook.WorkSheets[sFilename].Range['H5','H6'].MergeCells := true;
  XLBook.WorkSheets[sFilename].Range['H5','H6'].borders.lineStyle := 1 ;

  XLBook.WorkSheets[sFilename].Range['I4','I4'].borders.lineStyle := 1 ;
  XLBook.WorkSheets[sFilename].Range['I5','I6'].MergeCells := true;
  XLBook.WorkSheets[sFilename].Range['I5','I6'].borders.lineStyle := 1 ;


  //XLBook.WorkSheets[sFilename].Range['A'+IntToStr(8)].Value := '�������� : ' ;
  XLBook.WorkSheets[sFilename].Range['A'+IntToStr(9)].Value := '����' ;
  XLBook.WorkSheets[sFileName].Range['A'+IntToStr(9)].HorizontalAlignment := '3' ;
  XLBook.WorkSheets[sFileName].Range['B'+IntToStr(9)].Value := '������ȣ' ;
  XLBook.WorkSheets[sFileName].Range['B'+IntToStr(9)].HorizontalAlignment := '3' ;
  XLBook.WorkSheets[sFileName].Range['c'+IntToStr(9)].Value := '�����ð�' ;
  XLBook.WorkSheets[sFileName].Range['c'+IntToStr(9)].HorizontalAlignment := '3' ;
  XLBook.WorkSheets[sFileName].Range['d'+IntToStr(9)].Value := '��/ȣ' ;
  XLBook.WorkSheets[sFileName].Range['d'+IntToStr(9)].HorizontalAlignment := '3' ;
  XLBook.WorkSheets[sFileName].Range['e'+IntToStr(9)].Value := '��Ͽ���' ;
  XLBook.WorkSheets[sFileName].Range['e'+IntToStr(9)].HorizontalAlignment := '3' ;
  XLBook.WorkSheets[sFileName].Range['f'+IntToStr(9)].Value := '�湮����' ;
  XLBook.WorkSheets[sFilename].Range['f9','g9'].MergeCells := true;
  XLBook.WorkSheets[sFileName].Range['f9','g9'].HorizontalAlignment := '3' ;
  XLBook.WorkSheets[sFileName].Range['h'+IntToStr(9)].Value := '��ġ����' ;
  XLBook.WorkSheets[sFilename].Range['h9','i9'].MergeCells := true;
  XLBook.WorkSheets[sFileName].Range['h9','i9'].HorizontalAlignment := '3' ;
  XLBook.WorkSheets[sFilename].Range['A9','I9'].borders.lineStyle := 1 ;

  with qryPDAPatrolData do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select *  ');
    SQL.Add('From PDAPatrolData ');
    SQL.Add('where PatrolDate = :N1 ');
    Parameters.ParamByName('N1').Value:= FormatDateTime('yyyy-mm-dd', edtSDate.Date);
    Open;

    //if RecordCount < 0 then
    if eof then
    begin
      ShowMessage('�����Ͱ� �����ϴ�.');
      pnProgress.Visible:= False;
      Exit;
    end;

    First;
    si:= 10;
    li_CNT := 1;
    ap1.Max:= RecordCount;

    While not Eof Do begin
      CarNo := FieldByName('CarNo').AsString;
      PatrolCode := FieldByName('PatrolCode').AsString;
      ap1.Position:= li_CNT;
      with qryPDAPatrolData2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select Top 1 ProcDate, ProcTime, InCarNo1, ProcTime, Reserve1, Reserve2, Reserve3    ');
        SQL.Add('From IONData ');
        SQL.Add('where InCarNo1 = :N1  and ProcDate <= :N2 ');
        SQL.Add('Order by procDate desc');
        Parameters.ParamByName('N1').Value:= CarNo;
        Parameters.ParamByName('N2').Value:= FormatDateTime('yyyy-mm-dd', edtSDate.Date);
        Open;

        if RecordCount > 0 then
        begin
          XLBook.WorkSheets[sFilename].Range['A'+IntToStr(si)].Value :=               //����
          IntToStr(li_CNT);

          XLBook.WorkSheets[sFileName].Range['B'+IntToStr(si)].Value :=              //������ȣ
          CarNo;//FieldByName('InCarNo1').AsString;

          XLBook.WorkSheets[sFileName].Range['c'+IntToStr(si)].Value :=              //�����ð�
          qryPDAPatrolData2.FieldByName('ProcDate').AsString + ' ' + qryPDAPatrolData2.FieldByName('ProcTime').AsString;

          XLBook.WorkSheets[sFileName].Range['d'+IntToStr(si)].Value := '';             //��/ȣ

          XLBook.WorkSheets[sFileName].Range['e'+IntToStr(si)].Value :=  '�Ϲ�';          //��Ͽ���

          if qryPDAPatrolData2.FieldByName('Reserve1').AsString <> ''  then                      //�湮����
          begin
            XLBook.WorkSheets[sFileName].Range['f'+IntToStr(si)].Value :=
            qryPDAPatrolData2.FieldByName('Reserve1').AsString +', '+ qryPDAPatrolData2.FieldByName('Reserve2').AsString;
          end
          else
          begin
             XLBook.WorkSheets[sFileName].Range['f'+IntToStr(si)].Value := '';
          end;
          XLBook.WorkSheets[sFilename].Range['f'+IntToStr(si), 'g'+IntToStr(si)].MergeCells := true;

          XLBook.WorkSheets[sFileName].Range['h'+IntToStr(si)].Value :=  '';              //��ġ����
          //qryPDAPatrolData2.FieldByName('Reserve3').AsString;
          XLBook.WorkSheets[sFilename].Range['h'+IntToStr(si),'i'+IntToStr(si)].MergeCells := true;

          XLBook.WorkSheets[sFilename].Range['A'+IntToStr(si),'I'+IntToStr(si)].borders.lineStyle := 1 ;
          XLBook.WorkSheets[sFileName].Range['A'+IntToStr(si),'I'+IntToStr(si)].HorizontalAlignment := '3' ;
          XLBook.WorkSheets[sFilename].Cells.Columns.AutoFit;
        end
        else
        begin
          with qryPDAPatrolData2 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select Top 1 ProcDate, ProcTime, InCarNo1, ProcTime, CompName, DeptName    ');
            SQL.Add('From IOSData ');
            SQL.Add('where InCarNo1 = :N1 and ProcDate <= :N2 ');
            SQL.Add('Order by procDate desc');
            Parameters.ParamByName('N1').Value:= CarNo;
            Parameters.ParamByName('N2').Value:= FormatDateTime('yyyy-mm-dd', edtSDate.Date);
            Open;
          end;

          XLBook.WorkSheets[sFilename].Range['A'+IntToStr(si)].Value :=               //����
          IntToStr(li_CNT);

          XLBook.WorkSheets[sFileName].Range['B'+IntToStr(si)].Value :=              //������ȣ
          CarNo;//FieldByName('InCarNo1').AsString;

          XLBook.WorkSheets[sFileName].Range['c'+IntToStr(si)].Value :=              //�����ð�
          qryPDAPatrolData2.FieldByName('ProcDate').AsString + ' ' + qryPDAPatrolData2.FieldByName('ProcTime').AsString;

          XLBook.WorkSheets[sFileName].Range['d'+IntToStr(si)].Value :=              //��/ȣ
          qryPDAPatrolData2.FieldByName('CompName').AsString +'��'+qryPDAPatrolData2.FieldByName('DeptName').AsString+'ȣ';

          XLBook.WorkSheets[sFileName].Range['e'+IntToStr(si)].Value :=  '����';      //��Ͽ���

          XLBook.WorkSheets[sFileName].Range['f'+IntToStr(si)].Value :=  '';             //�湮����
          XLBook.WorkSheets[sFilename].Range['f'+IntToStr(si),'g'+IntToStr(si)].MergeCells := true;

          XLBook.WorkSheets[sFileName].Range['h'+IntToStr(si)].Value := '';               //��ġ����
          XLBook.WorkSheets[sFilename].Range['h'+IntToStr(si),'i'+IntToStr(si)].MergeCells := true;

          XLBook.WorkSheets[sFilename].Range['A'+IntToStr(si),'I'+IntToStr(si)].borders.lineStyle := 1 ;
          XLBook.WorkSheets[sFileName].Range['A'+IntToStr(si),'I'+IntToStr(si)].HorizontalAlignment := '3' ;
          XLBook.WorkSheets[sFilename].Cells.Columns.AutoFit;
        end;
        XLBook.WorkSheets[sFilename].Range['A'+IntToStr(si),'I'+IntToStr(si)].Font.Size := 9;
      end;
      //XLBook.WorkSheets[sFilename].Range['A'+IntToStr(si),'I'+IntToStr(si)].Select;
      //Pan_Excel.Update;
      Inc(si); // ��� ���� ���Ѵ�..
      Inc(li_CNT);
      Next;
    end;
  end;
  XLBook.WorkSheets[sFilename].Range['A'+IntToStr(8)].Value := '�������� : ' + DateToStr(edtSDate.Date) + ' ' + FormatDateTime('hh:mm', now);
  Sleep(2); // �ʹ� �������� ��ǻ�� �ڿ��� ����� �Ծ ��� ������� ^^;
  //Excel ��������
  //XLBook.WorkSheets[sFileName].Range['A1', 'e' + IntToStr(li_CNT+1)].Select;
  XL.Selection.Font.Size := '12';
  XL.Selection.Columns.AutoFit; // Excel �� ũ�� �ڵ�����
  //XLBook.WorkSheets[sFileName].Range['A1:c20'].Select;
  //XLBook.WorkSheets[sFileName].Cells(10,9) := '***********';
  //XLBook.WorkSheets[sFileName].Rows[4].Font.Size := '16';
  //XL.WorkSheets[sFileName].Rows[12].Font.Name := '�ü�';
  //������ ���̰� �Ѵ�...
  XL.Visible := False;
  pnProgress.Visible:= False;
  //���� ���� ȭ��
  SaveDialog1.Title := '���� �������� ȭ��';
  SaveDialog1.InitialDir := GetCurrentDir;
  SaveDialog1.Filter := 'Excel files (*.xlsx)|*.xlsx';
  SaveDialog1.FilterIndex := 1;
  SaveDialog1.DefaultExt := 'xlsx';

  //���� ���� ȭ��
  if SaveDialog1.Execute then
  begin
    XLBook.WorkSheets[sFilename].SaveAs(SaveDialog1.FileName, 51); // or xlOpenXMLWorkbook (51)
    MessageBoxTimeOut(Application.Handle, '�������Ϸ� ����Ϸ�!', '', 0, 0, 5000);
    //ShowMessage('�������Ϸ� ����Ϸ�!');
    XLBook.Application.Quit;
  end;
end;

procedure TfrmPDASearch.btnSearchClick(Sender: TObject);
var
 CarNo, PatrolCode, InCarNo1 : string;
 li_CNT : Integer;
begin
  //dgCustInfo.Clear;
  //dgCustInfo.ColCount := 8;
  //dgCustInfo.RowCount := 30;
  with qryPDAPatrolData do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select *  ');
    SQL.Add('From PDAPatrolData ');
    SQL.Add('where PatrolDate = :N1 ');
    Parameters.ParamByName('N1').Value:= FormatDateTime('yyyy-mm-dd', edtSDate.Date);
    Open;

    //if RecordCount < 0 then
    if eof then
    begin
      ShowMessage('�����Ͱ� �����ϴ�.');
      tdg1.Clear;
      Exit;
    end;

    First;
    li_CNT := 1;
    tdg1.Clear;
    While not Eof Do begin
      CarNo := FieldByName('CarNo').AsString;
      PatrolCode := FieldByName('PatrolCode').AsString;
      with qryPDAPatrolData2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select Top 1 ProcDate, ProcTime, InCarNo1, ProcTime, Reserve1, Reserve2  ');
        SQL.Add('From IONData ');
        SQL.Add('where InCarNo1 = :N1 and ProcDate = :N2 ');
        SQL.Add('Order by procDate desc');
        Parameters.ParamByName('N1').Value:= CarNo;
        Parameters.ParamByName('N2').Value:= FormatDateTime('yyyy-mm-dd', edtSDate.Date);
        Open;

        if RecordCount > 0 then
        begin
            with tdg1 do
            begin
                Cells[1,li_CNT] := IntToStr(li_CNT);
                Cells[2,li_CNT] := CarNo;
                Cells[3,li_CNT] := qryPDAPatrolData2.FieldByName('ProcDate').AsString + ' ' + qryPDAPatrolData2.FieldByName('ProcTime').AsString;;
                Cells[4,li_CNT] := '';
                Cells[5,li_CNT] := '�Ϲ�';
                if qryPDAPatrolData2.FieldByName('Reserve1').AsString <> ''  then                      //�湮����
                begin
                   Cells[6,li_CNT] := qryPDAPatrolData2.FieldByName('Reserve1').AsString +', '+ qryPDAPatrolData2.FieldByName('Reserve2').AsString;
                end
                else
                begin
                    Cells[6,li_CNT] := '';
                end;
                AutoSize := True;
            end;
        end
        else
        begin
          with qryPDAPatrolData2 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select Top 1 ProcDate, ProcTime, InCarNo1, ProcTime, CompName, DeptName    ');
            SQL.Add('From IOSData ');
            SQL.Add('where InCarNo1 = :N1 and ProcDate = :N2 ');
            SQL.Add('Order by procDate desc');
            Parameters.ParamByName('N1').Value:= CarNo;
            Parameters.ParamByName('N2').Value:= FormatDateTime('yyyy-mm-dd', edtSDate.Date);
            Open;

            with tdg1 do
            begin
                Cells[1,li_CNT] := IntToStr(li_CNT);
                Cells[2,li_CNT] := CarNo;
                Cells[3,li_CNT] := qryPDAPatrolData2.FieldByName('ProcDate').AsString + ' ' + qryPDAPatrolData2.FieldByName('ProcTime').AsString;;
                Cells[4,li_CNT] := qryPDAPatrolData2.FieldByName('CompName').AsString +'��'+qryPDAPatrolData2.FieldByName('DeptName').AsString+'ȣ';
                Cells[5,li_CNT] := '����';
                Cells[6,li_CNT] := '';
                AutoSize := True;
            end;
          end;
        end;
      end;
      Inc(li_CNT);
      Next;
    end;
    tdg1.ColCount := 7;
    tdg1.Columns[1].Header := '����';
    tdg1.Columns[2].Header := '������ȣ';
    tdg1.Columns[3].Header := '�����ð�';
    tdg1.Columns[4].Header := '��/ȣ';
    tdg1.Columns[5].Header := '��Ͽ���';
    tdg1.Columns[6].Header := '�湮����';

    tdg1.RowCount := li_CNT;
    tdg1.Columns[1].Width := 50;
    tdg1.Columns[4].Width := 80;
    tdg1.Columns[6].Width := 180;
    btnExcel.Enabled := True;
  end;
end;

procedure TfrmPDASearch.FormCreate(Sender: TObject);
begin
     edtSDate.Date := now;
end;

end.
