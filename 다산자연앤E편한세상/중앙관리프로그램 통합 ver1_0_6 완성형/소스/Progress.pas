unit Progress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Gauges;

type
  TfrmProgress = class(TForm)
    Gauge1: TGauge;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProgress: TfrmProgress;

implementation

{$R *.dfm}

procedure TfrmProgress.FormShow(Sender: TObject);
begin
  frmProgress.Gauge1.Progress:= 0;
  frmProgress.Label1.Caption:= '';
end;

end.
