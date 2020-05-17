program Sqrt32;

uses
  Forms,
  U_Main_Raiz in 'U_Main_Raiz.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Raiz quadrada';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
