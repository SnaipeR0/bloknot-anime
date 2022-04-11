unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, sEdit;

type
  TForm4 = class(TForm)
    sEdit1: TsEdit;
    sButton1: TsButton;
    procedure sButton1Click(Sender: TObject);
    procedure sEdit1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit1,Unit2,Unit3,Unit5;

{$R *.dfm}

procedure TForm4.sButton1Click(Sender: TObject);
var Find: String;
    i: Integer;
begin
 Find:=sEdit1.Text;
 for i:=0 to Form1.sMemo1.Lines.count-1 do
 if Pos(Find, Form1.sMemo1.Lines.Text)<>0
 then
 begin
   Form1.sMemo1.SetFocus();
   Form1.sMemo1.SelStart:=Pos(Find, Form1.sMemo1.Lines.Text)-1;
   Form1.sMemo1.SelLength:=Length(Find);
 end;
end;

procedure TForm4.sEdit1Enter(Sender: TObject);
begin
sEdit1.Clear;
end;

end.
