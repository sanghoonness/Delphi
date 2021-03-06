unit Tables;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmTables = class(TDataModule)
    ADODB: TADOConnection;
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
    qryCustInfoReserve1: TStringField;
    qryCustInfoReserve2: TStringField;
    qryCustInfoReserve3: TStringField;
    qryCustInfoReserve4: TStringField;
    qryCustInfoReserve5: TStringField;
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
    qryCustInfoHIType: TWordField;
    qryCustInfoHISTime: TStringField;
    qryCustInfoHIETime: TStringField;
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
    procedure qryCustInfoHITypeGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure qryCustInfoStatusGetText(Sender: TField; var Text: string;
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

procedure TdmTables.qryCustInfoStatusGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  case qryCustInfoStatus.Value of
    0: Text := '????';
    1: Text := '??????';
    2: Text := '????????';
    3: Text := '????????';
    4: Text := '????????';
    6: Text := '????????';
  end;
end;

end.
