unit U_Main_Raiz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    SpeedButton1: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edStart: TEdit;
    UpDown1: TUpDown;
    Label3: TLabel;
    edEnd: TEdit;
    UpDown2: TUpDown;
    procedure SpeedButton1Click(Sender: TObject);
    procedure edEndChange(Sender: TObject);
    procedure edStartChange(Sender: TObject);
    procedure UpDown2ChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: Smallint; Direction: TUpDownDirection);
    procedure UpDown1ChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: Smallint; Direction: TUpDownDirection);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CorrigeNum(ed: TEdit);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CorrigeNum(ed: TEdit);
var
  i, j: Integer;
  boMsg: Boolean;

const
  NumDig: array[0..9] of String = ('0',
                                   '1',
                                   '2',
                                   '3',
                                   '4',
                                   '5',
                                   '6',
                                   '7',
                                   '8',
                                   '9');   //Número Digitado
begin
  boMsg := True;
  for i := 0 to High(ed.GetTextLen) - 1 do
    begin
      for j := Low(NumDig) to High(NumDig) do
        begin
          if (ed.Text[i] = NumDig[j]) then
            begin
              boMsg := False;
            end;
        end;
    end;
  if boMsg then
    begin
      ShowMessage('Você colocou um valor errado.');
    end;
end;



procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  a, b: Integer;
  x, x1, y, y1: Real;
begin
  Memo1.Lines.Clear;
  a := StrToInt(edStart.Text);
  b := StrToInt(edEnd.Text);
  ProgressBar1.Min := a;
  ProgressBar1.Max := b;
  try
    while a <= b do
      begin
        x := a;
        y := sqrt(x);
        Memo1.Lines.Add(' v' + CurrToStr(x) + '  =  ' + CurrToStr(y));
        x := sqr((y / 2));
        x1 := sqr((y / 4));
        y := (2 * sqrt(x));
        y1 := (4 * sqrt(x1));
        Memo1.Lines.Add(#9 + ' 2v' + CurrToStr(x) + '  =  ' + CurrToStr(y) +
                        #9 + ' 4v' + CurrToStr(x1) + '  =  ' + CurrToStr(y1) + #13#10 +
                        '----------------------------------------------------------' +
                        '----------------------------------------------------');
        inc(a);
        ProgressBar1.Position := a;
      end;
  except
    on EMathError do ShowMessage('Math Error - Erro de Calculo');
  end;      
  ProgressBar1.Position := 0;
end;



procedure TForm1.edEndChange(Sender: TObject);
begin
  CorrigeNum(edEnd);
  if StrToInt(edEnd.Text) > 1000 then
    begin
      edEnd.Text := '1000';
    end;
  if StrToInt(edEnd.Text) < 0 then
    begin
      edEnd.Text := '0';
    end;
end;

procedure TForm1.edStartChange(Sender: TObject);
begin
//  CorrigeNum(edStart);
  if StrToInt(edStart.Text) > 1000 then
    begin
      edStart.Text := '1000';
    end;
  if StrToInt(edStart.Text) < 0 then
    begin
      edStart.Text := '0';
    end;
end;

procedure TForm1.UpDown2ChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
begin
  CorrigeNum(edEnd);
end;

procedure TForm1.UpDown1ChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
begin
  CorrigeNum(edStart);
end;

end.
