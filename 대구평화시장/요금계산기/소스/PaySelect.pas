unit PaySelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GradientLabel, AdvSmoothToggleButton, AdvSmoothButton,
  AdvGlassButton;

type
  TfrmPaySelect = class(TForm)
    btn1: TAdvSmoothToggleButton;
    btn2: TAdvSmoothToggleButton;
    GradientLabel1: TGradientLabel;
    btn3: TAdvSmoothToggleButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn1Enter(Sender: TObject);
    procedure btn1Exit(Sender: TObject);
    procedure btn2Enter(Sender: TObject);
    procedure btn2Exit(Sender: TObject);
    procedure btn3Enter(Sender: TObject);
    procedure btn3Exit(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPaySelect: TfrmPaySelect;

implementation
uses
  Global;

{$R *.dfm}

procedure TfrmPaySelect.btn1Click(Sender: TObject);
begin
  nPayType:= 1;
  Close;
end;

procedure TfrmPaySelect.btn1Enter(Sender: TObject);
begin
  btn1.BorderColor:= clRed;
end;

procedure TfrmPaySelect.btn1Exit(Sender: TObject);
begin
  btn1.BorderColor:= clAqua;
end;

procedure TfrmPaySelect.btn2Click(Sender: TObject);
begin
  nPayType:= 2;
  Close;
end;

procedure TfrmPaySelect.btn2Enter(Sender: TObject);
begin
  btn2.BorderColor:= clRed;
end;

procedure TfrmPaySelect.btn2Exit(Sender: TObject);
begin
  btn2.BorderColor:= clYellow;
end;

procedure TfrmPaySelect.btn3Click(Sender: TObject);
begin
  nPayType:= 0;
  Close;
end;

procedure TfrmPaySelect.btn3Enter(Sender: TObject);
begin
  btn3.BorderColor:= clWhite;
end;

procedure TfrmPaySelect.btn3Exit(Sender: TObject);
begin
  btn3.BorderColor:= clBlack;
end;

end.
