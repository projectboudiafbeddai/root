{created by: beddai boudiaf}
unit complexNumber_u;

interface

type
  TrootMode = (rm_all, rm_first);

  Tz = record
  private

    // the real part
    frel: real;
    // the imaginary part
    fimg: real;
    procedure setimg(const Value: real);
    procedure setrel(const Value: real);
    function getconjugate(): Tz;
    function getArgZ: real;
    function getAngleDegree: real;
    function getModulus: real;
  public

    constructor create(arel, aimg: real);
    property rel: real read frel write setrel;
    property img: real read fimg write setimg;
    // z bar
    property conjugate: Tz read getconjugate;
    function toString(): string;
    // Arg(Z)
    property arg: real read getArgZ;
    property angleDegree: real read getAngleDegree;
    // Modulus (Absolute Value)
    property Modulus: real read getModulus;
    // operator

    // convert number like 10 to (10+(0)i)
    class operator Implicit(a: real): Tz;
    // add  a+b
    class operator Add(a, b: Tz): Tz;
    // Subtract a-b
    class operator Subtract(a, b: Tz): Tz;
    // Multiply a*b
    class operator Multiply(a, b: Tz): Tz;
    // Divide a/b
    class operator Divide(a, b: Tz): Tz;
    // Negative -a
    class operator Negative(a: Tz): Tz;
    // Positive +a
    class operator Positive(a: Tz): Tz;
    // Equal a=b
    class operator Equal(a, b: Tz): boolean;
    // NotEqual a<>b
    class operator NotEqual(a, b: Tz): boolean;
  end;

  TrootzType = array of Tz;

  TzHelper = record helper for Tz
  public
    function Roots(n: integer; rootMode: TrootMode): TrootzType;
  end;

implementation

{ Tz }
uses System.classes, System.SysUtils, math;

// convert number like 10 to (10+(0)i)
class operator Tz.Implicit(a: real): Tz;
begin
  result.rel := a;
  result.img := 0;
end;

// add  a+b
class operator Tz.Add(a, b: Tz): Tz;
begin
  result.rel := a.rel + b.rel;
  result.img := a.img + b.img;
end;

// Subtract a-b
class operator Tz.Subtract(a, b: Tz): Tz;
begin
  result.rel := a.rel - b.rel;
  result.img := a.img - b.img;
end;


constructor Tz.create(arel, aimg: real);
begin
  rel := arel;
  img := aimg;
end;

// Divide a/b
class operator Tz.Divide(a, b: Tz): Tz;
var
  dividVal: Tz;

begin
  // dividVal=b_bar*b;  this alawas give you real value (rel+0i);
  dividVal := b.conjugate * b;
  result := a * b.conjugate;
  result.rel := (result.rel / dividVal.rel);
  result.img := (result.img / dividVal.rel);

end;

// Multiply a*b
class operator Tz.Multiply(a, b: Tz): Tz;
begin
  result.rel := (a.rel * b.rel - a.img * b.img);
  result.img := (a.rel * b.img + a.img * b.rel);
end;

// Negative -a
class operator Tz.Negative(a: Tz): Tz;
begin
  result.rel := -a.rel;
  result.img := -a.img;
end;

// Positive +a
class operator Tz.Positive(a: Tz): Tz;
begin
  result := a;
end;

// Equal a=b
class operator Tz.Equal(a, b: Tz): boolean;
begin
  result := (a.rel = b.rel) and (a.img = b.img);
end;

// NotEqual a<>b
class operator Tz.NotEqual(a, b: Tz): boolean;
begin
  result := not(a = b);
end;

// z bar
function Tz.getAngleDegree: real;
begin
  result := (arg * 180) / pi;
end;

function Tz.getArgZ: real;
begin
  if (rel = 0) and (img > 0) then
    result := pi / 2
  else if (rel = 0) and (img < 0) then
    result := -pi / 2
  else if (rel < 0) and (img >= 0) then
    result := ArcTan(img / rel) + pi
  else if (rel < 0) and (img < 0) then
    result := ArcTan(img / rel) - pi
  else if (rel > 0) then
    result := ArcTan(img / rel)
  else if (rel = 0) and (img = 0) then
    raise Exception.create('undefined Arg (rel=0 and img=0)');

end;

function Tz.getconjugate: Tz;
begin
  result.rel := rel;
  result.img := -img;
end;

// Modulus (Absolute Value)
function Tz.getModulus: real;
begin
  result := sqrt(Sqr(rel) + Sqr(img));
end;

procedure Tz.setimg(const Value: real);
begin
  fimg := Value;
end;

procedure Tz.setrel(const Value: real);
begin
  frel := Value;
end;

function Tz.toString: string;
begin
  result := Format('%f+(%f)i', [rel, img]);
end;

{ TzHelper }

function TzHelper.Roots(n: integer; rootMode: TrootMode): TrootzType;
var
  Modulus_val: real;
  arg_angle: real;
  k: integer;
begin
  // http://mathonline.wikidot.com/nth-roots-of-complex-numbers
  if rootMode = rm_first then
    SetLength(result, 1)
  else
    SetLength(result, n);
  Modulus_val := power(Modulus, 1 / n);
  arg_angle := arg;
  for k := 0 to Length(result) - 1 do
  begin
    result[k].rel := Modulus_val * cos((arg_angle + 2 * pi * k) / n);
    result[k].img := Modulus_val * sin((arg_angle + 2 * pi * k) / n);
  end;
end;

end.
