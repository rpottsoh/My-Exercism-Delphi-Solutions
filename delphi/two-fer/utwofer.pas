unit utwofer;

interface

  function twoFer(aName: string=''): string;

implementation
uses SysUtils;

function twoFer(aName: string=''): string;
begin
  if Trim(aName).IsEmpty then
    aName := 'you';
  result := 'One for ' + aName + ', one for me.';
end;

end.