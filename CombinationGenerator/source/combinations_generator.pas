{
created by : boudiaf beddai
}
unit combinations_generator;

interface

type
  TarrayStringByte = array of array of byte;
  // combination generator ((1,2),(1,3),(1,4)....)
function generate_combination(numberOfAllPossibleValues, numberOfSet: integer)
  : TarrayStringByte;

implementation

uses Winapi.Windows;

Function C(n, p: integer): Double;
var
  x, y: real;
  i: integer;
begin
  if (p > (n div 2)) then
    p := n - p;
  x := 1;
  y := 1;
  for i := n - p + 1 to n do
    x := x * i;
  for i := 2 to p do
    y := y * i;
  result := x / y;
End;

// combination generator ((1,2),(1,3),(1,4)....)
function generate_combination(numberOfAllPossibleValues, numberOfSet: integer)
  : TarrayStringByte;
var
  str: array of byte;
  rindex: integer;
  repeatTime: integer;
  i: integer;
  howMany: integer;
  j, k: integer;
  len_str: integer;
begin
  // set size if str to be numberOfAllPossibleValues to carry all values
  SetLength(str, numberOfAllPossibleValues);
  // intilizy state
  // fill with all with 0
  FillMemory(@str[0], numberOfAllPossibleValues * SizeOf(byte), 0);
  // fill just first with 1 for intiliy state
  FillMemory(@str[0], numberOfSet * SizeOf(byte), 1);
  {
    // other options for intilizy state
    //fill with all with 0
    for i := 0 to numberOfSet - 1 do
    str[i] := 1;
    //fill just first with 1 for intiliy state
    for i := numberOfSet to numberOfAllPossibleValues - 1 do
    str[i] := 0;
  }
  // first rindex set to last 1 in the str
  rindex := numberOfSet - 1;
  // calculate c(n,p) and its in the same time the size of the combinations
  repeatTime := trunc(C(numberOfAllPossibleValues, numberOfSet));
  // set size of the combinations array
  SetLength(result, repeatTime);
  // calculate len_str this used to check if rindex is in the last index or not
  len_str := numberOfAllPossibleValues - 1;
  // start genirate combinations
  for i := 0 to repeatTime - 1 do
  begin
    // set length for the array in postions i
    SetLength(result[i], numberOfAllPossibleValues);
    // compy all values in str to postion i in the array "result"
    CopyMemory(@(result[i][0]), @(str[0]), numberOfAllPossibleValues *
      SizeOf(byte));
    // shift
    // check if rindex is in last or not
    if (rindex < (len_str)) then
    begin
      // move by one to right
      str[rindex] := 0;
      inc(rindex);
      str[rindex] := 1;
    end
    else
    begin
      // calculate how many 1 you find when go back to check the pattern "10"
      howMany := 0;
      for k := rindex downto 1 do
      begin
        if (str[k] = 1) then
          inc(howMany);
        // check the pattern "10"
        if (str[k] = 0) and (str[k - 1] = 1) then
        begin
          str[k - 1] := 0;
          str[rindex] := 0;
          rindex := k + howMany;
          // move to new position to start again
          for j := k to rindex do
            str[j] := 1;
          break;
        end;
      end;

    end;
  end;
end;

end.
