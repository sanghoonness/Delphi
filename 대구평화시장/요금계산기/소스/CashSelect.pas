unit CashSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvSmoothToggleButton, StdCtrls, GradientLabel;

type
  TfrmCashSelect = class(TForm)
    GradientLabel1: TGradientLabel;
    btn1: TAdvSmoothToggleButton;
    btn2: TAdvSmoothToggleButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCashSelect: TfrmCashSelect;

implementation
uses
  Global;

{$R *.dfm}

procedure TfrmCashSelect.btn1Click(Sender: TObject);
begin
  nCashType:= 1;
  Close;
end;

procedure TfrmCashSelect.btn2Click(Sender: TObject);
begin
  nCashType:= 0;
  Close;
end;

procedure TfrmCashSelect.FormShow(Sender: TObject);
begin
  btn2.SetFocus;

  if not bCreditLoad then
    btn1.Enabled:= False;
end;

end.
