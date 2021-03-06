unit Tables;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmTables = class(TDataModule)
    ADODB: TADOConnection;
    dsCustInfo: TDataSource;
    qryTemp: TADOQuery;
    qryWP: TADOQuery;
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
    qryCustInfo_D: TADOQuery;
    SmallintField1: TSmallintField;
    WordField1: TWordField;
    SmallintField2: TSmallintField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    IntegerField1: TIntegerField;
    WordField2: TWordField;
    StringField9: TStringField;
    StringField10: TStringField;
    WordField3: TWordField;
    SmallintField3: TSmallintField;
    SmallintField4: TSmallintField;
    StringField11: TStringField;
    StringField12: TStringField;
    WordField4: TWordField;
    IntegerField2: TIntegerField;
    WordField5: TWordField;
    WordField6: TWordField;
    StringField13: TStringField;
    WordField7: TWordField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    dsCustInfo_D: TDataSource;
    qryCustInfo: TADOQuery;
    qryCustInfoParkNo: TSmallintField;
    qryCustInfoTKType: TWordField;
    qryCustInfoGroupNo: TSmallintField;
    qryCustInfoTKNo: TStringField;
    qryCustInfoName: TStringField;
    qryCustInfoTelNo: TStringField;
    qryCustInfoCarNo: TStringField;
    qryCustInfoCompName: TStringField;
    qryCustInfoDeptName: TStringField;
    qryCustInfoAddress: TStringField;
    qryCustInfoIssueDate: TStringField;
    qryCustInfoIssueAmt: TIntegerField;
    qryCustInfoStatus: TWordField;
    qryCustInfoExpDateF: TStringField;
    qryCustInfoExpDateT: TStringField;
    qryCustInfoWPNo: TWordField;
    qryCustInfoLastParkNo: TSmallintField;
    qryCustInfoLastUnitNo: TSmallintField;
    qryCustInfoLastUseDate: TStringField;
    qryCustInfoLastUseTime: TStringField;
    qryCustInfoIOStatusNo: TWordField;
    qryCustInfoCurrAmt: TIntegerField;
    qryCustInfoAPB: TWordField;
    qryCustInfoCarType: TWordField;
    qryCustInfoMarkNo: TStringField;
    qryCustInfoHIType: TWordField;
    qryCustInfoHISTime: TStringField;
    qryCustInfoHIETime: TStringField;
    qryCustInfoReserve1: TStringField;
    qryCustInfoReserve2: TStringField;
    qryCustInfoReserve3: TStringField;
    qryCustInfoReserve4: TStringField;
    qryCustInfoReserve5: TStringField;
    qryCustInfoPayType: TIntegerField;
    qryParkKind: TADOQuery;
    qryParkKindUserParkNo: TIntegerField;
    qryParkKindParkName: TStringField;
    qryParkKindReserve1: TStringField;
    qryParkKindReserve2: TStringField;
    qryParkKindReserve3: TStringField;
    qryParkKindReserve4: TStringField;
    qryParkKindReserve5: TStringField;
    qryGroup1: TADOQuery;
    qryGroup1ParkNo: TSmallintField;
    qryGroup1GroupDepthNo: TAutoIncField;
    qryGroup1GroupDepth: TSmallintField;
    qryGroup1GroupName: TStringField;
    qryGroup1UseYn: TIntegerField;
    qryGroup1DelYn: TIntegerField;
    qryGroup1Reserve1: TStringField;
    qryGroup1Reserve2: TStringField;
    qryGroup1Reserve3: TStringField;
    qryGroup1Reserve4: TStringField;
    qryGroup1Reserve5: TStringField;
    qryGroup2: TADOQuery;
    qryGroup2ParkNo: TSmallintField;
    qryGroup2GroupDepthNo: TAutoIncField;
    qryGroup2GroupDepth: TSmallintField;
    qryGroup2GroupName: TStringField;
    qryGroup2UseYn: TIntegerField;
    qryGroup2DelYn: TIntegerField;
    qryGroup2Reserve1: TStringField;
    qryGroup2Reserve2: TStringField;
    qryGroup2Reserve3: TStringField;
    qryGroup2Reserve4: TStringField;
    qryGroup2Reserve5: TStringField;
    qryGroup3: TADOQuery;
    qryGroup3ParkNo: TSmallintField;
    qryGroup3GroupDepthNo: TAutoIncField;
    qryGroup3GroupDepth: TSmallintField;
    qryGroup3GroupName: TStringField;
    qryGroup3UseYn: TIntegerField;
    qryGroup3DelYn: TIntegerField;
    qryGroup3Reserve1: TStringField;
    qryGroup3Reserve2: TStringField;
    qryGroup3Reserve3: TStringField;
    qryGroup3Reserve4: TStringField;
    qryGroup3Reserve5: TStringField;
    qryGroup4: TADOQuery;
    qryGroup4ParkNo: TSmallintField;
    qryGroup4GroupDepthNo: TAutoIncField;
    qryGroup4GroupDepth: TSmallintField;
    qryGroup4GroupName: TStringField;
    qryGroup4UseYn: TIntegerField;
    qryGroup4DelYn: TIntegerField;
    qryGroup4Reserve1: TStringField;
    qryGroup4Reserve2: TStringField;
    qryGroup4Reserve3: TStringField;
    qryGroup4Reserve4: TStringField;
    qryGroup4Reserve5: TStringField;
    dsDCInfo: TDataSource;
    qryDCInfo: TADOQuery;
    qryDCInfoParkNo: TSmallintField;
    qryDCInfoDCNo: TWordField;
    qryDCInfoDCName: TStringField;
    qryDCInfoDCValue: TIntegerField;
    qryDCInfoDCValue1: TIntegerField;
    qryDCInfoDCType: TWordField;
    qryDCInfoDCUseCnt: TWordField;
    qryDCInfoVisibleCnt: TIntegerField;
    qryDCInfoRealUse: TWordField;
    qryDCInfoButtonUse: TWordField;
    qryDCInfoWebUse: TWordField;
    qryDCInfoFixedUse: TWordField;
    qryDCInfoDCTypeCode: TWordField;
    qryDCInfoReserve1: TStringField;
    qryDCInfoReserve2: TStringField;
    qryDCInfoReserve3: TStringField;
    qryDCInfoReserve4: TStringField;
    qryDCInfoReserve5: TStringField;
    qryDCInfoReserve6: TStringField;
    qryDCInfoReserve7: TStringField;
    qryDCInfoReserve8: TStringField;
    qryDCInfoReserve9: TStringField;
    qryDCInfoReserve10: TIntegerField;
    qryDCInfoPrintName: TStringField;
    qryDcFixed: TADOQuery;
    qryDcFixedParkNo: TSmallintField;
    qryDcFixedCarNo: TStringField;
    qryDcFixedDCNo: TWordField;
    qryDcFixedName: TStringField;
    qryDcFixedTelNo: TStringField;
    qryDcFixedStartYmd: TStringField;
    qryDcFixedEndYmd: TStringField;
    qryDcFixedUseWeekDay: TStringField;
    qryDcFixedUseStartTime: TStringField;
    qryDcFixedUseEndTime: TStringField;
    qryDcFixedLimitedDayCount: TIntegerField;
    qryDcFixedLimitedMonthCount: TIntegerField;
    qryDcFixedUseParkNo: TIntegerField;
    qryDcFixedRemark: TStringField;
    qryDcFixedRemark2: TStringField;
    qryDcFixedReserve1: TStringField;
    qryDcFixedReserve2: TStringField;
    qryDcFixedReserve3: TStringField;
    qryDcFixedReserve4: TStringField;
    qryDcFixedReserve5: TStringField;
    qryDcFixedMaxCount: TIntegerField;
    qryDcFixedUseYes: TIntegerField;
    qryDcFixedDCName: TStringField;
    qryDcFixedSequnce: TAutoIncField;
    procedure qryCustInfoHITypeGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure qryCustInfoPayTypeGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTables: TdmTables;

implementation

{$R *.dfm}

procedure TdmTables.qryCustInfoHITypeGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  case qryCustInfoHIType.Value of
    0: Text:= '????????';
    1: Text:= '????????';
    2: Text:= '????????';
  end;
end;

procedure TdmTables.qryCustInfoPayTypeGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  case qryCustInfoPayType.Value of
    0: Text:= '????';
    1: Text:= '????????';
    2: Text:= '????????';
  end;
end;

end.
