unit mzClientSocket;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.WinSock,
  System.SysUtils, System.Classes, System.SyncObjs, System.Win.ScktComp;

type

  TmzClientSocket = class(Tclientsocket)
  private
    FLprName: string;
    FLprCarNo: string;
    FLprDate: Ansistring;
    FLprTime: AnsiString;
    FLprNo: Integer;
    FLprSubNo: Integer;
    FLprSubDsp: string;
    FLprOutSubNo: Integer;
    FLprOutSubDsp: String;
    FTkNo: AnsiString;
    FLPRRecgNo: Integer;
//    FNListCnt: Integer;

  protected

  published
    property LprName: string read FLprName write FLprName;
    property LprCarNo: string read FLprCarNo write FLprCarNo;
    property LprDate: AnsiString read FLprDate write FLprDate;
    property LprTime: AnsiString read FLprTime write FLprTime;
    property LprNo: Integer read FLprNo write FLprNo;
    property LprSubNo: Integer read FLprSubNo write FLprSubNo;
    property LprSubDsp: string read FLprSubDsp write FLprSubDsp;
    property LprOutSubNo: Integer read FLprOutSubNo write FLprOutSubNo;
    property LprOutSubDsp: String read FLprOutSubDsp write FLprOutSubDsp;
    property TkNo: AnsiString read FTkNo write FTkNo;
    property LPRRecgNo: Integer read FLPRRecgNo write FLPRRecgNo;
//    property NListCnt: Integer read FNListCnt write FNListCnt;

  public

  end;

const
  subCsInLpr = 'subcsInLpr';
  subCsOutLpr = 'subcsOutLpr';

implementation

end.
