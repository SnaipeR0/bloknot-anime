unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sMemo, sEdit, sButton, sSkinManager, Menus, IniFiles,
  StrUtils;

type
  TForm1 = class(TForm)
    sSkinManager1: TsSkinManager;
    sButton1: TsButton;
    sEdit1: TsEdit;
    sMemo1: TsMemo;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    PopupMenu1: TPopupMenu;
    p1: TMenuItem;
    c1: TMenuItem;
    N2: TMenuItem;
    h1: TMenuItem;
    N3: TMenuItem;
    c2: TMenuItem;
    P2: TMenuItem;
    p3: TMenuItem;
    a1: TMenuItem;
    N4: TMenuItem;
    FontDialog1: TFontDialog;
    G1: TMenuItem;
    FindDialog1: TFindDialog;
    procedure sButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure p1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure sEdit1Enter(Sender: TObject);
    procedure P2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N4Click(Sender: TObject);
    procedure G1Click(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure p3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ini: TIniFile;

implementation

uses Unit2,Unit3,unit4,Unit5;

{$R *.dfm}

procedure TForm1.sButton1Click(Sender: TObject);
begin
  if sEdit1.Text = '' then
  begin
    Beep;
  ShowMessage('Ведите название аниме'); // выдается сообщение если
  Exit; // выход из сообщения
  end
  else
  if sEdit1.Text = 'Напиши свое аниме' then  // если попытатся добавить Напишите сое аниме то выведет сообщение
  begin
    Beep;   // звуковой сигнал
    ShowMessage('свое аниме');  // сообщение
    Exit;     // выход
  end;
sMemo1.Lines.Add(sEdit1.text);   // каждое новый текст добовляеется с новой строки
sMemo1.Lines.SaveToFile('C:\Note Anime\Anime.dat');  // сохронение документа по указаному пути
sEdit1.Text:=''; // ввод текста с пустой строки
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if ForceDirectories('C:\Note Anime\') then    // проверка пути
  begin
  if not FileExists('C:\Note Anime\Anime.dat') then  // проверка документа
   begin
     sMemo1.Lines.SaveToFile('C:\Note Anime\Anime.dat');  // сохранение документа
   end;
sMemo1.Lines.LoadFromFile('C:\Note Anime\Anime.dat');   // загрузка документа
sEdit1.Color:=clSilver;       // цвет текста
sEdit1.Text:='Напиши свое аниме';   // вывод изначальный текст sedit
end;
       Ini:=TiniFile.Create(extractfilepath(Application.ExeName)+'Config.ini');    // создание ini документа
   sMemo1.Font.Size:=ini.ReadInteger('Опции','Размер шрифта',FontDialog1.Font.Size);  // прописование размера шрифта в ini
   sMemo1.Font.Color:=ini.ReadInteger('Опции','Цвет',FontDialog1.Font.Color);  // прописование цвета шрифта в ini
   sMemo1.Font.Name:=ini.ReadString('Опции','Названия шрифта',FontDialog1.Font.Name); // прописование размера шрифта в ini
     SetFileAttributes('Config.ini',FILE_ATTRIBUTE_HIDDEN);  // атрибут ini на скрытый фаил
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  begin
  if ForceDirectories('C:\Note Anime\Backup\') then   // проверка пути
  begin
  if not FileExists('C:\Note Anime\Backup\Anime.dat') then  // проверка файла
   begin
     sMemo1.Lines.SaveToFile('C:\Note Anime\Backup\Anime.dat');   // сохранение файла
   end;
   end;
   end;
sMemo1.Text:='';    // пустое поле ввода
sMemo1.Lines.SaveToFile('C:\Note Anime\Anime.dat'); // сохранение файла
end;

procedure TForm1.p1Click(Sender: TObject);
begin
 begin
  if sEdit1.Text = '' then  // пустой ввод текста
  begin
  ShowMessage('Ведите название аниме');  //если попытатся добавить пустое место в smemo ты вадаст сообщение
  Exit; //выход
  end;
sMemo1.Lines.Add(sEdit1.text); // каждое добавление с поле ввода текст добавляеется на новой строчке
sMemo1.Lines.SaveToFile('C:\Note Anime\Anime.dat'); // сохраннение документа по указаному пути
sEdit1.Text:=''; // очищение поле ввода
end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
Form2.ShowModal; // открытие form2 с невозможностью посещать form1
end;

procedure TForm1.N3Click(Sender: TObject);
begin
 form3.show; // открытие form3
end;

procedure TForm1.N5Click(Sender: TObject);
begin
 sMemo1.Lines.SaveToFile('C:\Note Anime\Anime.dat');  // сохранение документа по указаному пути
end;

procedure TForm1.sEdit1Enter(Sender: TObject);
begin
sEdit1.Clear;    // очистка поле ввода
Font.Color:=clBlack; // меняет цвет текста
end;

procedure TForm1.P2Click(Sender: TObject);
begin
 begin

  if ForceDirectories('C:\Note Anime\Backup\') then  //Поиск папки если ненаходит то создает ее
  begin
    if not FileExists('C:\Note Anime\Backup\Anime.dat') then  //поиск документа по указаномму пути если его там нетту тогда смотрите ниже
    begin
    ShowMessage('Сначала создайте бэкап, он создается автоматичиски при очистки списка'); //если ненашел документ тогда выдаст сообщение
    Exit;
    end
     else
    if ForceDirectories('C:\Note Anime\Backup\') then  //поиск папки по указаной дириктории если ненаходит папку то создает её
    begin
     sMemo1.Lines.LoadFromFile('C:\Note Anime\Backup\Anime.dat'); //загрузка документа из указанного пути
     ShowMessage('Загрузка прошла успешна'); //сообщение
     sMemo1.Lines.SaveToFile('C:\Note Anime\Anime.dat'); // сохранение документа по указаномму пути
     Exit;
    end;
     end;
    end;
   end;
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ini:=TiniFile.Create(extractfilepath(Application.ExeName)+'Config.ini');  //Создание документа ... .ini
  ini.WriteInteger('Опции','Размер шрифта',FontDialog1.Font.Size);  //сохраняет изменение размеры шрифта в ini
  ini.WriteInteger('Опции','Цвет',FontDialog1.Font.Color); //Сохраняет изменения цвета шрифта в документ ini
  ini.WriteString('Опции','Названия шрифта',FontDialog1.Font.Name); // Сохраняет изменения названия шрифта в документ ini
 sMemo1.Lines.SaveToFile('C:\Note Anime\Anime.dat');  //Сохраняет весь текст с smemo в документ по указанному пути
 SetFileAttributes('Config.ini',FILE_ATTRIBUTE_HIDDEN); //Атрибут у созданного файла ini назначается скрытым
end;

procedure TForm1.N4Click(Sender: TObject);
begin
 if FontDialog1.Execute then
  sMemo1.Font:=FontDialog1.Font;  // открытие окна с шрифтами для smemo и последующее изменение шрифта там
end;

procedure TForm1.G1Click(Sender: TObject);
begin
FindDialog1.Execute; // открытие поискового окна
end;

procedure TForm1.FindDialog1Find(Sender: TObject);
function RPosex(const Substr : string; const Source : string; offset : Cardinal) : Integer;  //Функция RPosex Ищет последниее вхождение
var
  MaxLen, LLen :Integer;
  c : Char;
  pc, pc2 : PChar;
begin
 Result := 0;  //Хранит данные возвращенной функцией
 LLen := Length(Substr); //Хранение переменную в ббайтах
 MaxLen := Length(Source);  //Хранение переменную в ббайтах
 if offset < MaxLen then
 MaxLen := offset; //Если переменная ofsset меньше переменная MaxLen то переменная MaxLen обевляется offset
 if (LLen > 0) and (MaxLen > 0) and (LLen <= MaxLen) then  // Если переменная LLen Больше 0 и переменная MaxLen больше 0 то переменная LLen Меньше или ровна переменной MaxLen
 begin
 pc := @Source[MaxLen];   //Присвоенние переменной pc переменную Source с переменной MaxLen которая хранит функцию Source в ббайтах
 pc2 := @Source[LLen - 1];  //Присвоение переменной pc2 переменную Source с переменной LLen которая хранит функцию Substr в ббайтах и -1
 c := Substr[LLen]; //Пресвоенние переменной c переменную SubStr которая хранит переменную LLen в которой хранятся переменная Substr в байтах
 while  pc >= pc2 do
 begin
if (c = pc^) and
 CompareMem(@Substr[1],PChar(pc - LLen + 1), Length(SubStr)) then
 begin
 Result := PChar(pc - LLen + 1) - PChar(@Source[1]) + 1;  // Хранит данные переменной (pc - LLen + 1) - PChar(@Source[1]) + 1
 Exit;  //Выход
 end;
 Dec(pc);    //Процедура уменьшение переменной pc
end;
end;
end;

var
    ToFind, Where : string;
    Found, StartPos : Integer;
    isReverse : Boolean;
  begin
    ToFind := FindDialog1.FindText; // Присвоение переменной ToFind набор текста в FindDialog
    Where := sMemo1.text; //Присвоенние переменной Where чтение в smemo
    if not (frMatchCase in FindDialog1.Options) then
    begin
      ToFind := AnsiUpperCase(ToFind);
      Where := AnsiUpperCase(Where);
    end;
    isReverse := not (frDown in FindDialog1.Options);
    if smemo1.SelLength <> 0 then   //для повторного поиска
    begin
      StartPos := sMemo1.SelStart;
      if not isReverse then
      StartPos := StartPos + sMemo1.SelLength
      end
      else
      begin
      if isReverse then
      StartPos := Length(Where)
      else
      StartPos := 0;
    end;
    if isReverse then
    Found := RPosex(ToFind, Where, StartPos)
    else
    Found := PosEx(ToFind, Where, StartPos + 1); //Для подключение PosEx Подключите к Uses StrUtils

    if Found <> 0 then
    begin
      sMemo1.HideSelection := False;
      sMemo1.SelStart := Found - 1;
      smemo1.SelLength := Length(FindDialog1.FindText);
    end
    else
  begin
  Beep;  // Вызывает звуковой сигнал
  MessageBox(Application.Handle, 'Ваша строка не найденна!','Ошибка поиска',
  MB_OK or MB_ICONQUESTION);  //Вызывается окно об ошибке когда слово которое вы искали нету или похожих слов нету
  end;
end;

procedure TForm1.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
if Msg.CharCode = ord('D') then
 if GetKeyState(VK_LCONTROL) <0 then   // Горячия клавиша Ctrl+D Очищает список аниме (Дублирует кнопку Очистить список аниме)
 begin
   N1.Click;
   handled:=True;
 end;
 if Msg.CharCode = ord('R') then
  if GetKeyState(VK_LCONTROL) <0 then      // Горячия клавиша Ctrl+R загружает бэкап фаилов (Дублирует кнопку Загрузить Бэкап)
  begin
    P2.Click;
    handled:=True;
  end;
   if Msg.CharCode = VK_F4 then
    if GetKeyState(VK_LMENU) <0 then   // Горячия клавиша Alt+F4 Закрывает форму (Дублирует кнопку Закрыть)
   begin
     p3.Click;
     Handled:=True;
   end;
   if Msg.CharCode = Ord('P') then
    if GetKeyState(VK_LCONTROL) <0 then    // Горячия клавиша Ctrl+P Вызывает опцию (Дублирует кнопку Опции)
    begin
     N3.Click ;
     Handled:=True;
    end;
    if Msg.CharCode = VK_F1 then          // горячия клавиша F1 Вызывает справку (дублирует кнопку Опрограмме)
    begin
      N2.Click;
      handled:=True;
    end;
    if Msg.CharCode = ord('F') then
     if GetKeyState(VK_LCONTROL) <0 then       // Горячия клавиша Ctrl+F Поиск аниме  (дублирует кнопку Поиск)
     begin
       G1.Click;
       Handled:=True;
     end;
   if Msg.CharCode = Ord('S') then
    if GetKeyState(VK_LCONTROL) <0 then         // Горячия клавиша Ctrl+S Сохроняет файлы
    begin
      sMemo1.Lines.SaveToFile('C:\Note Anime\Anime.dat');
      ShowMessage('Сохранение успешно');
      Handled:=True;
    end;
     if Msg.CharCode = Ord('E') then
      if GetKeyState(VK_LCONTROL) <0 then    // горячия клавиша Ctrl+E Сохраняет и создает Бэкап
      begin
          sMemo1.Lines.SaveToFile('C:\Note Anime\Backup\Anime.dat');
          ShowMessage('Бэкап создан');
          Handled:=True;
         end;
        if Msg.CharCode = VK_MENU then
        begin
        Form3.opeM.Checked:= True;
        Form3.closM.Checked:= False;
        Handled:=True;
        end;
       end;

procedure TForm1.p3Click(Sender: TObject);
begin
Close;
end;

end.




