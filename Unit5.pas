unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, sButton, System.IniFiles;

type
  TForm5 = class(TForm)
    root: TsButton;
    acaunt: TLabeledEdit;
    pasword: TLabeledEdit;
    procedure rootClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

Uses
Unit1,Unit2,Unit3,Unit4;

{$R *.dfm}

procedure TForm5.rootClick(Sender: TObject);
begin
if (acaunt.Text = 'root') and (pasword.Text = 'toor') then
  begin
    Beep;
    ShowMessage('Вы стали разработчиком');
    Form1.Caption:='Блокнот аниме - root права';
    form3.closM.Visible:= True;
    Form3.opeM.Visible:= True;
    Form3.sRadioButton1.Visible:= True;
    Form3.sRadioButton2.Visible:= True;
    Form5.Close;
  end
  else
  if (acaunt.Text = '') and (pasword.Text = '') then
   begin
     ShowMessage('Введите Логин и пароль');
   end
  else
  if (acaunt.Text = 'root') and (pasword.Text = '') then
  begin
    ShowMessage('Введите пароль');
  end
  else
  if (acaunt.Text = '') and (pasword.Text = 'toor') then
  begin
    ShowMessage('Введите логин');
  end
  else
  ShowMessage('Что-то введено неправильно или все неправильно');

end;

end.
