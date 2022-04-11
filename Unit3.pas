unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sRadioButton, sSkinManager,IniFiles, sButton;

type
  TForm3 = class(TForm)
    sSkinManager1: TsSkinManager;
    sRadioButton1: TsRadioButton;
    sRadioButton2: TsRadioButton;
    sButton1: TsButton;
    closM: TsRadioButton;
    opeM: TsRadioButton;
    procedure sRadioButton1Click(Sender: TObject);
    procedure sRadioButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sButton1Click(Sender: TObject);
    procedure closMClick(Sender: TObject);
    procedure opeMClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
    ini: TIniFile;

implementation

uses Unit1,Unit2,Unit5,Unit4;

{$R *.dfm}

procedure TForm3.sButton1Click(Sender: TObject);
begin
Form5.Show;
end;

procedure TForm3.sRadioButton1Click(Sender: TObject);
begin
  Form1.sMemo1.Lines.SaveToFile('C:\Note Anime\Anime.dat');
form1.smemo1.ReadOnly:=False;
end;

procedure TForm3.sRadioButton2Click(Sender: TObject);
begin
  Form1.sMemo1.Lines.SaveToFile('C:\Note Anime\Anime.dat');
Form1.sMemo1.ReadOnly:=True;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
   ini:= Tinifile.Create(extractfilepath(paramstr(0))+'Config.ini');
   sRadioButton1.Checked:=ini.ReadBool('RadioButtons','sRadioButton1',False);
   sRadioButton2.Checked:=ini.ReadBool('RadioButtons','sRadioButton2',False);
end;

procedure TForm3.opeMClick(Sender: TObject);
begin
Form1.c2.Visible := True;
Form1.h1.Visible := True;
Form1.a1.Visible := True;
Form1.c1.Visible := True;
end;

procedure TForm3.closMClick(Sender: TObject);
begin
Form1.c2.Visible:=  False;
Form1.h1.Visible := False;
Form1.a1.Visible := False;
Form1.c1.Visible := False;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ini:=TiniFile.Create(extractfilepath(paramstr(0))+'Config.ini');
 ini.WriteBool('Кнопки','RadioButton1',sRadioButton1.Checked);
 ini.WriteBool('Кнопки','RadioButton2',sRadioButton2.Checked);
  SetFileAttributes('Config.ini',FILE_ATTRIBUTE_HIDDEN);
end;

end.

