program complexNumber;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  complexNumber_u in 'complexNumber_u.pas';

var
  a, b, c: Tz;
  roots: TrootzType;
  i: integer;

begin
  a := Tz.create(1, 1);
  b := Tz.create(4, 5);
  a := a + 1;
  a := a - 1;
  a := a * 2;
  a := a / 2;
  c := a + b;
  c := a - b;
  c := a * b;
  c := b / a;
  b := -b;
  c := a * b;
  if (a = b) then
    writeln('a=b');
  if (a <> b) then
    writeln('a<>b');
  writeln('a=', a.toString);
  writeln('b=', b.toString);
  writeln('c=', c.toString);

  writeln('----------------------------------------------');
  roots := a.roots(2, rm_all);
  writeln('All Roots:', length(roots));
  for i := 0 to length(roots) - 1 do
    writeln('root', i, ': ', roots[i].toString, ', module is :', roots[i].Modulus
      :0:2, ', angle is:', roots[i].angleDegree:0:2);
  writeln('----------------------------------------------');
  readln;

end.
