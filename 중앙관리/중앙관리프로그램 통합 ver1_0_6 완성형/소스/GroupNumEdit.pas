unit GroupNumEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvCombo, Data.Win.ADODB,
  ColCombo, CodeSiteLogging;

type
  TfrmGroupNumEdit = class(TForm)
    cmbGrp: TColumnComboBox;
    btnAccept: TButton;
    btnClose: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAcceptClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    grpNo: Integer;
    selectTkNo: string;
  end;

var
  frmGroupNumEdit: TfrmGroupNumEdit;
  qry: TADOQuery; //쿼리검색용

implementation

{$R *.dfm}

uses
  Global, Tables;

procedure TfrmGroupNumEdit.btnAcceptClick(Sender: TObject);
begin
//  CodeSite.Send('값:',cmbGrp.ColumnItems[cmbGrp.ItemIndex,0]);
  try
    qry.SQL.Text := 'Update CustInfo set GroupNo = :v1 Where TkNo = :v2';
    qry.Parameters.ParamByName('v1').Value := cmbGrp.ColumnItems[cmbGrp.ItemIndex,0];
    qry.Parameters.ParamByName('v2').Value := selectTkNo;
    qry.ExecSQL;
    qry.Close;
  except
    ExceptLogging('그룹번호 변경불가: '+qry.SQL.Text);
    ShowMessage('그룹번호 변경불가!');
    Exit;
  end;
end;

procedure TfrmGroupNumEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(qry);
end;

procedure TfrmGroupNumEdit.FormCreate(Sender: TObject);
begin
  qry := TADOQuery.Create(nil);
  qry.Connection := dmTables.ADODB;
end;

procedure TfrmGroupNumEdit.FormShow(Sender: TObject);
begin
  qry.SQL.Text := 'Select GroupNo, GroupName From GGroup Order by GroupNo';
  qry.Open;

  while not qry.Eof do begin
    cmbGrp.Columns.Add;
    cmbGrp.ComboItems.Add;
    cmbGrp.Columns.Items[qry.RecNo-1].Width := Round(cmbGrp.Width /2);
    cmbGrp.Columns.Items[qry.RecNo-1].Font.Name := '돋움';
    cmbGrp.Columns.Items[qry.RecNo-1].Font.Size := 9;
    cmbGrp.ComboItems[qry.RecNo-1].Strings.Add(qry.Fields[0].Value);
    cmbGrp.ComboItems[qry.RecNo-1].Strings.Add(qry.Fields[1].Value);
    qry.Next;
  end;
  qry.Close;
  cmbGrp.ItemIndex := grpNo;
end;

end.
