unit CashOption;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, AdvEdit,
  AdvSmoothToggleButton, GradientLabel;

type
  TfrmCashOption = class(TForm)
    GradientLabel1: TGradientLabel;
    btn1: TAdvSmoothToggleButton;
    btn2: TAdvSmoothToggleButton;
    edtBarcode: TAdvEdit;
    PopupMenu1: TPopupMenu;
    g1: TMenuItem;
    N1: TMenuItem;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure g1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCashOption: TfrmCashOption;


implementation
Uses
  Global;

{$R *.dfm}

procedure TfrmCashOption.btn1Click(Sender: TObject);
begin
  sCashOption := '01';
  Close;
end;

procedure TfrmCashOption.btn2Click(Sender: TObject);
begin
  sCashOption := '02';
  Close;
end;

procedure TfrmCashOption.g1Click(Sender: TObject);
begin
  btn1.OnClick(self);
end;

procedure TfrmCashOption.N1Click(Sender: TObject);
begin
  btn2.OnClick(self);
end;

end.
