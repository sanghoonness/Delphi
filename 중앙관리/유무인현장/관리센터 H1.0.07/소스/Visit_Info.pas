unit Visit_Info;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB, Vcl.ComCtrls,
  AdvDateTimePicker;

type
  TfrmVisit_Info = class(TForm)
    dg1: TDBGrid;
    Panel2: TPanel;
    Bevel1: TBevel;
    Label3: TLabel;
    Bevel2: TBevel;
    Label1: TLabel;
    edtdong: TEdit;
    edtho: TEdit;
    Bevel3: TBevel;
    Label2: TLabel;
    edtCarNo: TEdit;
    btnSearch: TBitBtn;
    btnClose: TBitBtn;
    qryVisit_Info: TADOQuery;
    dsVisit_Info: TDataSource;
    qryVisit_Infovisitstart: TStringField;
    qryVisit_Infovisitend: TStringField;
    qryVisit_InfoCarNo: TStringField;
    qryVisit_Infodong: TStringField;
    qryVisit_Infoho: TStringField;
    Bevel4: TBevel;
    Label4: TLabel;
    edtSDate: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    Label5: TLabel;
    BtnExcel: TBitBtn;
    procedure btnSearchClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure Hyn_Visit_Info;      //현대통신 사전방문
    procedure kocom_Visit_Info;    //코콤 사전방문
    procedure Icon_Visit_Info;     //아이콘트롤스 사전방문
    procedure Gyeyoung_Visit_Info; //계영정보통신 사전방문
    procedure CVNET_Visit_Info;    //CVNET사전방문
    procedure EZ_Visit_Info;       //이지빌(자이S&D)사전방문
    procedure SmartVillage_Visit_Info; //스마트빌리지 사전방문
    procedure FormShow(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVisit_Info: TfrmVisit_Info;

implementation

uses
  Tables, Global;

{$R *.dfm}

procedure TfrmVisit_Info.btnCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmVisit_Info.BtnExcelClick(Sender: TObject);
begin
   znSave_DBGridToExcel(dg1);
end;

procedure TfrmVisit_Info.btnSearchClick(Sender: TObject);
begin
    if nHomenet_visit = 1 then
    begin
       Hyn_Visit_Info;        //현대통신
    end
    else if nHomenet_visit = 2 then
    begin
       kocom_Visit_Info;     //코콤
    end
    else if nHomenet_visit = 3 then
    begin
       Icon_Visit_Info;     //아이콘트롤스
    end
    else if nHomenet_visit = 4 then
    begin
       Gyeyoung_Visit_Info;     //계영정보통신
    end
    else if nHomenet_visit = 8 then
    begin
       CVNET_Visit_Info;     //CVNET
    end
    else if nHomenet_visit = 6 then
    begin
       EZ_Visit_Info;     //이지빌
    end
    else if nHomenet_visit = 16 then
    begin
       SmartVillage_Visit_Info;     //스마트빌리지
    end;

    BtnExcel.Enabled := True;
end;

procedure TfrmVisit_Info.CVNET_Visit_Info;
begin
   with qryVisit_Info do
   begin
     Close;
     sql.Clear;
     SQL.Add('select convert(varchar(50), CompName) as dong, convert(varchar(50), DeptName) as ho, CarNo as CarNo , ');
     SQL.Add('InDate as VisitStart, OutDate as VisitEnd  from ReserveCar ');
     SQL.Add('where InDate >= :N4 and OutDate <= :N5 ');
     Parameters.ParamByName('N4').Value:= FormatDateTime('yyyy-mm-dd', edtSDate.Date);
     Parameters.ParamByName('N5').Value:= FormatDateTime('yyyy-mm-dd', edtEDate.Date);
     if edtdong.Text <> '' then
     begin
        SQL.Add('and CompName = :N1');
        Parameters.ParamByName('N1').Value:= edtdong.Text;

     end;

     if edtho.Text <> '' then
     begin
        SQL.Add('and DeptName = :N2');
        Parameters.ParamByName('N2').Value:= edtho.Text;
     end;

     if edtCarNo.Text <> '' then
     begin
        SQL.Add('and CarNo Like :N3');
        Parameters.ParamByName('N3').Value:= '%'+edtCarNo.Text+'%';
     end;
      SQL.Add('order by InDate desc ');
     Open;
   end;
end;

procedure TfrmVisit_Info.EZ_Visit_Info;
begin
   with qryVisit_Info do
   begin
     Close;
     sql.Clear;
     SQL.Add('select convert(varchar(50), dong) as dong, convert(varchar(50), ho) as ho, CarNo as CarNo , ');
     SQL.Add('convert(CHAR(23), StartDateTime, 21) as VisitStart, convert(CHAR(23), ReCordTime ,21) as VisitEnd  from Visitinfo_EZ ');
     //SQL.Add('StartDatetime as VisitStart, ReCordTime as VisitEnd  from Visitinfo_EZ ');
     SQL.Add('where StartDatetime >= :N4 ');
     Parameters.ParamByName('N4').Value:= FormatDateTime('yyyymmdd', edtSDate.Date)+'000000';
     if edtdong.Text <> '' then
     begin
        SQL.Add('and dong = :N1');
        Parameters.ParamByName('N1').Value:= edtdong.Text;
     end;

     if edtho.Text <> '' then
     begin
        SQL.Add('and ho = :N2');
        Parameters.ParamByName('N2').Value:= edtho.Text;
     end;

     if edtCarNo.Text <> '' then
     begin
        SQL.Add('and CarNo Like :N3');
        Parameters.ParamByName('N3').Value:= '%'+edtCarNo.Text+'%';
     end;
     SQL.Add('and InOut = ''0'' ');
     SQL.Add('order by StartDatetime desc ');
     Open;
   end;
end;
procedure TfrmVisit_Info.FormShow(Sender: TObject);
begin
   edtSDate.Date := Now;
   edtEDate.Date := Now;
end;

procedure TfrmVisit_Info.Gyeyoung_Visit_Info;
begin
   with qryVisit_Info do
   begin
     Close;
     sql.Clear;
     SQL.Add('select convert(varchar(50), dong_code) as dong, convert(varchar(50), ho_code) as ho, Car_No as CarNo , ');
     SQL.Add('convert(CHAR(23), insert_date, 21) as VisitStart, convert(CHAR(23), end_date ,21) as VisitEnd  from VisitInfo_GY ');
     SQL.Add('where insert_date >= :N4 and end_date <= :N5 ');
     Parameters.ParamByName('N4').Value:= FormatDateTime('yyyy-mm-dd', edtSDate.Date);
     Parameters.ParamByName('N5').Value:= FormatDateTime('yyyy-mm-dd', edtEDate.Date);
     if edtdong.Text <> '' then
     begin
        SQL.Add('and dong_code = :N1');
        Parameters.ParamByName('N1').Value:= edtdong.Text;

     end;

     if edtho.Text <> '' then
     begin
        SQL.Add('and ho_code = :N2');
        Parameters.ParamByName('N2').Value:= edtho.Text;
     end;

     if edtCarNo.Text <> '' then
     begin
        SQL.Add('and Car_No Like :N3');
        Parameters.ParamByName('N3').Value:= '%'+edtCarNo.Text+'%';
     end;
      SQL.Add('order by insert_date desc ');
     Open;
   end;
end;

procedure TfrmVisit_Info.Hyn_Visit_Info;
begin
   with qryVisit_Info do
   begin
     Close;
     sql.Clear;
     SQL.Add('select convert(varchar(50), dong) as dong, convert(varchar(50), ho) as ho, CarNo, ');
     SQL.Add('convert(CHAR(23), StartDateTime, 21) as VisitStart, convert(CHAR(23), EndDateTime ,21) as VisitEnd  from visitinfo ');
     SQL.Add('where Substring(convert(CHAR(23), StartDateTime, 21),1,10) >= :N4 and Substring(convert(CHAR(23), EndDateTime, 21),1,10) <= :N5 ');
     Parameters.ParamByName('N4').Value:= FormatDateTime('yyyy-mm-dd', edtSDate.Date);
     Parameters.ParamByName('N5').Value:= FormatDateTime('yyyy-mm-dd', edtEDate.Date);
     if edtdong.Text <> '' then
     begin
        SQL.Add('and dong = :N1');
        Parameters.ParamByName('N1').Value:= edtdong.Text;

     end;

     if edtho.Text <> '' then
     begin
        SQL.Add('and ho = :N2');
        Parameters.ParamByName('N2').Value:= edtho.Text;
     end;

     if edtCarNo.Text <> '' then
     begin
        SQL.Add('and CarNo Like :N3');
        Parameters.ParamByName('N3').Value:= '%'+edtCarNo.Text+'%';
     end;
     SQL.Add('order by dong asc, ho asc ');
     Open;
   end;
end;

procedure TfrmVisit_Info.Icon_Visit_Info;
begin
   with qryVisit_Info do
   begin
     Close;
     {sql.Clear;
     SQL.Add('select convert(varchar(50), dong) as dong, convert(varchar(50), ho) as ho, CarNo, ');
     SQL.Add('convert(varchar(50), StartDateTime) as VisitStart, ');
     SQL.Add('iif(ISNUMERIC(period) = 1,  convert(CHAR(23), dateadd(dd, CONVERT(int, period), StartDateTime), 21), period) as VisitEnd  from VisitInfo_ICon ');
     SQL.Add('where StartDateTime >= :N4 ');}
     {sql.Clear;
     SQL.Add(' select convert(varchar(50), dong) as dong, convert(varchar(50), ho) as ho, CarNo,  ');
     SQL.Add(' substring(iif(ISNUMERIC(period) = 1,  convert(CHAR(23), dateadd(dd, CONVERT(int, period), StartDateTime), 21), period),1,19) as VisitStart, ');
		 SQL.Add(' substring(iif(ISNUMERIC(period) = 1,  convert(CHAR(23), dateadd(dd, CONVERT(int, period), StartDateTime), 21), period),21,19) as VisitEnd   ');
     SQL.Add(' from VisitInfo_ICon                           ');
     SQL.Add(' where substring(period,1,10) >= :N4 and substring(period,21,19) <= :N5  ');}
     sql.Clear;
     SQL.Add(' select convert(varchar(50), dong) as dong, convert(varchar(50), ho) as ho, CarNo,  ');
     SQL.Add(' substring((period),1,19) as VisitStart, ');
		 SQL.Add(' substring((period),21,19) as VisitEnd   ');
     SQL.Add(' from VisitInfo_ICon                           ');
     SQL.Add(' where substring(period,1,10) >= :N4 and substring(period,21,19) <= :N5 and ISNUMERIC(period) = 0   ');
     Parameters.ParamByName('N4').Value:= FormatDateTime('yyyy-mm-dd', edtSDate.Date);
     Parameters.ParamByName('N5').Value:= FormatDateTime('yyyy-mm-dd', edtEDate.Date);

     if edtdong.Text <> '' then
     begin
        SQL.Add('and dong = :N1');
        Parameters.ParamByName('N1').Value:= edtdong.Text;
     end;

     if edtho.Text <> '' then
     begin
        SQL.Add('and ho = :N2');
        Parameters.ParamByName('N2').Value:= edtho.Text;
     end;

     if edtCarNo.Text <> '' then
     begin
        SQL.Add('and CarNo Like :N3');
        Parameters.ParamByName('N2').Value:= '%'+edtCarNo.Text+'%';
     end;
     SQL.Add('order by StartDateTime desc ');
     ExceptLogging(SQL.Text);
     Open;
   end;
end;

procedure TfrmVisit_Info.kocom_Visit_Info;
begin
   with qryVisit_Info do
   begin
     Close;
     sql.Clear;
     SQL.Add('select convert(varchar(50), dong) as dong, convert(varchar(50), ho) as ho, CarNo, ');
     SQL.Add('convert(char(23), StartDateTime, 21) as VisitStart, convert(CHAR(23), EndDateTime, 21) as VisitEnd  from VisitInfo_KC ');
     SQL.Add('where StartDateTime >= :N4 and EndDateTime <= :N5 ');
     Parameters.ParamByName('N4').Value:= FormatDateTime('yyyy-mm-dd', edtSDate.Date);
     Parameters.ParamByName('N5').Value:= FormatDateTime('yyyy-mm-dd', edtEDate.Date);
     if edtdong.Text <> '' then
     begin
        SQL.Add('and dong = :N1');
        Parameters.ParamByName('N1').Value:= edtdong.Text;

     end;

     if edtho.Text <> '' then
     begin
        SQL.Add('and ho = :N2');
        Parameters.ParamByName('N2').Value:= edtho.Text;
     end;

     if edtCarNo.Text <> '' then
     begin
        SQL.Add('and CarNo Like :N3');
        Parameters.ParamByName('N2').Value:= '%'+edtCarNo.Text+'%';
     end;
     SQL.Add('order by StartDateTime desc ');
     Open;
   end;
end;

procedure TfrmVisit_Info.SmartVillage_Visit_Info;
begin
   with qryVisit_Info do
   begin
     Close;
     sql.Clear;
     SQL.Add('select convert(varchar(50), dong) as dong, convert(varchar(50), ho) as ho, vCarNo as CarNo, ');
     SQL.Add('convert(CHAR(23), vstartDt, 21) as VisitStart, convert(CHAR(23), vendDt ,21) as VisitEnd  from VisitInfo_SmartVillage ');
     SQL.Add('where substring(vstartDt,1,10) >= :N4 and substring(vendDt,21,10) <= :N5 ');
     Parameters.ParamByName('N4').Value:= FormatDateTime('yyyy-mm-dd', edtSDate.Date);
     Parameters.ParamByName('N5').Value:= FormatDateTime('yyyy-mm-dd', edtEDate.Date);
     if edtdong.Text <> '' then
     begin
        SQL.Add('and dong = :N1');
        Parameters.ParamByName('N1').Value:= edtdong.Text;
     end;

     if edtho.Text <> '' then
     begin
        SQL.Add('and ho = :N2');
        Parameters.ParamByName('N2').Value:= edtho.Text;
     end;

     if edtCarNo.Text <> '' then
     begin
        SQL.Add('and vCarNo Like :N3');
        Parameters.ParamByName('N3').Value:= '%'+edtCarNo.Text+'%';
     end;
     SQL.Add(' and vtype = ''ADDED'' ');
     SQL.Add(' order by vstartDt desc ');
     ExceptLogging(SQL.Text);
     Open;
   end;
end;

end.
