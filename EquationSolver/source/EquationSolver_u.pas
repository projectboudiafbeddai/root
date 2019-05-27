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

  { #--------------------------------------TEquation_03-------------------------------------- }
  TEquation_03 = class(TEquationSolverAbstract)
  private
    fa, fb, fc, fd: Tz;
  public
    constructor create(a, b, c, d: real);
    function getRoots: TrootzType; override;
  end;

implementation

uses System.Classes, System.SysUtils, Math;

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

{ #--------------------------------------TEquation_03-------------------------------------- }

{ TEquation_03 }

constructor TEquation_03.create(a, b, c, d: real);
begin
  fa := a;
  fb := b;
  fc := c;
  fd := d;

end;

function TEquation_03.getRoots: TrootzType;
// calculate negative situations Example: power(-1,1/3)
  function Root(Number: double; Exponent: integer): Extended;
  begin
    if Exponent mod 2 <> 0 then
      result := (Number / Abs(Number)) * power(Abs(Number), 1 / Exponent)
    else
      result := power(Abs(Number), 1 / Exponent);
  end;

var
  eq02: TEquation_02;
  Q, R, S, F, G: Tz;
  t: real;
begin
  if fa = 0 then
  begin
    eq02 := TEquation_02.create(fb, fc, fd);
    try
      result := eq02.getRoots();
    finally
      FreeAndNil(eq02);
    end;
  end
  else
  begin
    // init state to be like X^3+aX²+bX+c=0
    fb := fb / fa; // a
    fc := fc / fa; // b
    fd := fd / fa; // c
    fa := 1;
    Q := (fb * fb - 3 * fc) / 9;
    R := ((2 * fb * fb * fb) - (9 * fb * fc) + (27 * fd)) / 54;
    S := Q * Q * Q - R * R;
    if S.rel = 0 then
    begin
      // the equation has 2 real roots

      SetLength(result, 2);
      F := (-Root(R.rel, 3));
      result[0] := (2 * F) - (fb / 3);
      result[1] := (-F) - (fb / 3);

    end
    else if S.rel > 0 then
    begin
      // the equation has 3 real roots
      SetLength(result, 3);
      t := 1 / 3 * ArcCos(R.rel / sqrt(power(Q.rel, 3)));
      result[0] := -2 * sqrt(Q.rel) * cos(t) - fb / 3;
      result[1] := -2 * sqrt(Q.rel) * cos(t + (2 * pi / 3)) - fb / 3;
      result[2] := -2 * sqrt(Q.rel) * cos(t - (2 * pi / 3)) - fb / 3;
    end
    else
    // S.rel<0
    begin
      // the equation has 1 real root and 2 complex roots
      SetLength(result, 3);
      F := ((-R) / Abs(R.rel)) * Root(Abs(R.rel) + sqrt((-S).rel), 3);
      G := Q / F;
      result[0] := F + G - fb / 3;
      result[1] := ((-(F + G) / 2) - fb / 3) +
        Tz.create(0, (sqrt(3) * ((F - G) / 2)).rel);
      result[2] := ((-(F + G) / 2) - fb / 3) -
        Tz.create(0, (sqrt(3) * ((F - G) / 2)).rel);

    end;

  end;

end;
{ #--------------------------------------TEquation_03-------------------------------------- }

end.
