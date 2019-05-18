{ created by: beddai boudiaf }
program EquationSolver;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  complexNumber_u in 'complexNumber_u.pas',
  EquationAbstract_u in 'EquationAbstract_u.pas',
  EquationSolver_u in 'EquationSolver_u.pas';

procedure displayRoots(roots: TrootzType);
var
  i: integer;
begin
  writeln('-------------------------------------------------');
  writeln('Display All ', length(roots), ' Roots:');
  for i := 0 to length(roots) - 1 do
    writeln('X[', i, ']=', roots[i].toString());
  writeln('-------------------------------------------------');
end;

var
  roots: TrootzType;
  EquationTest: TEquationSolverAbstract;

begin
  // ------------------------------test01 2x+4=0 -----------------------------------------
  writeln('');
  writeln('#1 Solve Equation 2x+4=0');
  EquationTest := TEquation_01.create(2, 4);
  try
    roots := EquationTest.getRoots();
    displayRoots(roots);
    roots := nil; // free

  finally
    EquationTest.Free;
  end;

  // ------------------------------test02 (1+i)x+(0+i)=0 -----------------------------------------
  writeln('');
  writeln('#2 Solve Equation (1+i)x+(0+i)=0');
  EquationTest := TEquation_01.create(Tz.create(1, 1), Tz.create(0, 1));
  try
    roots := EquationTest.getRoots();
    displayRoots(roots);
    roots := nil; // free
  finally
    EquationTest.Free;
  end;
  // ------------------------------test03 x�+3x-4=0 -----------------------------------------
  writeln('');
  writeln('#3 Solve Equation x�+3x-4=0');
  EquationTest := TEquation_02.create(1, 3, -4);
  try
    roots := EquationTest.getRoots();
    displayRoots(roots);
    roots := nil; // free

  finally
    EquationTest.Free;
  end;

  // ------------------------------test04 x�+3x+4=0 -----------------------------------------
  writeln('');
  writeln('#4 Solve Equation x�+3x+4=0');
  EquationTest := TEquation_02.create(1, 3, 4);
  try
    roots := EquationTest.getRoots();
    displayRoots(roots);
    roots := nil; // free

  finally
    EquationTest.Free;
  end;

  // ------------------------------test05 x�+1=0 -----------------------------------------
  writeln('');
  writeln('#5 Solve Equation x�+1=0');
  EquationTest := TEquation_02.create(1, 0, 1);
  try
    roots := EquationTest.getRoots();
    displayRoots(roots);
    roots := nil; // free

  finally
    EquationTest.Free;
  end;

  // ------------------------------test06 (i)x�+(2-i)x+4=0  -----------------------------------------
  writeln('');
  writeln('#6 Solve Equation (i)x�+(2-i)x+4=0 ');
  EquationTest := TEquation_02.create(Tz.create(0, 1), Tz.create(2, -1), 4);
  try
    roots := EquationTest.getRoots();
    displayRoots(roots);
    roots := nil; // free
  finally
    EquationTest.Free;
  end;

  // ------------------------------test07 0x�+2x+4=0  -----------------------------------------
  writeln('');
  writeln('#7 Solve Equation 0x�+2x+4=0 ');
  EquationTest := TEquation_02.create(0, 2, 4);
  try
    roots := EquationTest.getRoots();
    displayRoots(roots);
    roots := nil; // free
  finally
    EquationTest.Free;
  end;
  readln;

end.
