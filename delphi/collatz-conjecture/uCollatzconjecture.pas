unit uCollatzconjecture;

interface
uses System.SysUtils;

type
  EIllegalNumber = class(Exception);

  function collatzSteps(aNumber: integer; aGuard: integer = 1000): integer;

implementation

function collatzSteps(aNumber: integer; aGuard: integer = 1000): integer;

  function computeCollatzValue(aValue: integer): integer;
  begin
    if odd(aValue) then
      result := aValue * 3 + 1
    else
      result := aValue div 2;
  end;

begin
  if aNumber <= 0 then
    raise EIllegalNumber.Create('error: Only positive numbers are allowed');

  result := 0;
  while (aNumber > 1) and (result < aGuard) do
  begin
    aNumber := computeCollatzValue(aNumber);
    inc(result);
  end;
end;

end.
