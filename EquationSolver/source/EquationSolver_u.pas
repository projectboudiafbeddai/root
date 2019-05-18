{ created by: beddai boudiaf }
unit EquationSolver_u;

interface

uses complexNumber_u, EquationAbstract_u;

type
  { #--------------------------------------TEquation_01-------------------------------------- }
  TEquation_01 = class(TEquationSolverAbstract)
  private
    fa, fb: Tz;
  public
    constructor create(a, b: Tz);
    function getRoots: TrootzType; override;
  end;

  { #--------------------------------------TEquation_02-------------------------------------- }
  TEquation_02 = class(TEquationSolverAbstract)
  private
    fa, fb, fc: Tz;
  public
    constructor create(a, b, c: Tz);
    function getRoots: TrootzType; override;
  end;

implementation

uses System.Classes, System.SysUtils;

{ #--------------------------------------TEquation_01-------------------------------------- }
{ TEquation_01 }

constructor TEquation_01.create(a, b: Tz);
begin
  fa := a;
  fb := b;
end;

function TEquation_01.getRoots: TrootzType;
begin

  if fa = 0 then
    raise Exception.create('divid by Zero');
  SetLength(result, 1);
  result[0] := -fb / fa;

end;
{ #--------------------------------------TEquation_01-------------------------------------- }

{ #--------------------------------------TEquation_02-------------------------------------- }

{ TEquation_02 }

constructor TEquation_02.create(a, b, c: Tz);
begin
  fa := a;
  fb := b;
  fc := c;
end;

function TEquation_02.getRoots: TrootzType;
var
  eq01: TEquation_01;
  delta: Tz;
begin
  if fa = 0 then
  begin
    eq01 := TEquation_01.create(fb, fc);
    try
      result := eq01.getRoots();
    finally
      FreeAndNil(eq01);
    end;
  end
  else
  begin
    SetLength(result, 2);
    delta := fb * fb - 4 * fa * fc;
    result[0] := (-fb + delta.Roots(2, rm_first)[0]) / 2 * fa;
    result[1] := (-fb - delta.Roots(2, rm_first)[0]) / 2 * fa;
  end;
end;

{ #--------------------------------------TEquation_02-------------------------------------- }

end.
