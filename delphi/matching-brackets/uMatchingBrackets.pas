unit uMatchingBrackets;

interface

type
  TMatchingBrackets = class
    class function IsPaired(aInput: string): boolean;
  end;

implementation
uses SysUtils;

{ BracketPush }

class function TMatchingBrackets.IsPaired(aInput: string): boolean;
begin
  var fBrackets := '';
  var fPreviousLength := -1;

  for var aChar in aInput do
    if CharInSet(aChar, ['[',']','{','}','(',')']) then
      fBrackets := fBrackets + aChar;

  repeat
    if fBrackets.Length = fPreviousLength then
      exit(false);
    fPreviousLength := fBrackets.Length;
    fBrackets := fBrackets.Replace('[]', '').Replace('{}', '').Replace('()', '');
  until fBrackets.Length = 0;

  result := true;
end;

end.

