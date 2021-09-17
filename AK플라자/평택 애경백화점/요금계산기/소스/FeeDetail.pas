unit FeeDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, AdvToolBtn;

type
  TfrmFeeDetail = class(TForm)
    Panel2: TPanel;
    btnClose: TAdvToolButton;
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFeeDetail: TfrmFeeDetail;

implementation

{$R *.dfm}

procedure TfrmFeeDetail.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
