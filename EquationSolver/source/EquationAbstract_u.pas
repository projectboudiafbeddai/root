{ created by: beddai boudiaf }
unit EquationAbstract_u;

interface

uses complexNumber_u;

type
  TEquationSolverAbstract = class abstract
  public
    function getRoots(): TrootzType; virtual; abstract;
  end;

implementation

end.
