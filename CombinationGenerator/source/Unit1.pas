unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Diagnostics,
  Vcl.Samples.Spin, Vcl.ExtCtrls, combinations_generator;

type
  TForm1 = class(TForm)
    mem_result: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    sp_setNum: TSpinEdit;
    Label2: TLabel;
    sp_howMany: TSpinEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure copyToMemo(arr: TarrayStringByte);
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  arr: TarrayStringByte;
  r: TStopwatch;
begin
  if (sp_howMany.Value < sp_setNum.Value) then
  begin
    ShowMessage('please check the values and try again!');
    exit;
  end;
  r := TStopwatch.StartNew;
  arr := generate_combination(sp_howMany.Value, sp_setNum.Value);
  r.Stop;
  // show time to get all combinations
  ShowMessage(format('time:%f sec,count:%d', [r.ElapsedMilliseconds / 1000,
    length(arr)]));
  // put random choice into memo
  // or copyToMemo(arr); to put all into memo
  copyToMemo([arr[random(length(arr))]]);
  // free array 2d
  arr := nil;

end;

procedure TForm1.copyToMemo(arr: TarrayStringByte);
var
  i, j: integer;
  s: string;
begin
  mem_result.Clear;
  mem_result.Lines.BeginUpdate;
  for i := 0 to High(arr) do
  begin    
    s := '';
    for j := 0 to High(arr[i]) do
    begin
      s := s + IntToStr(arr[i][j]) + ',';
    end;
    delete(s, length(s), 1);
    mem_result.Lines.Add(s);
  end;
  mem_result.Lines.EndUpdate;
end;

end.
