unit uSeries;

interface

type
  TSlice = class
  private
    FSeries : string;
  public
    constructor Create(AInp : string);
    function slices(ALength : integer) : TArray<string>;
  end;
implementation

uses System.SysUtils, System.Generics.Collections;

{ TSlice }

constructor TSlice.Create(AInp: string);
begin
  FSeries := AInp;
end;

function TSlice.slices(ALength: integer): TArray<string>;
begin
  if FSeries.IsEmpty then
    raise EArgumentException.Create('series cannot be empty');

  if FSeries.Length < ALength then
    raise EArgumentOutOfRangeException.Create('slice length cannot be greater than series length');

  if ALength = 0 then
    raise EArgumentOutOfRangeException.Create('slice length cannot be zero');

  if ALength < 0 then
    raise EArgumentOutOfRangeException.Create('slice length cannot be negative');

  var L := TList<string>.Create;
  for var i := 0 to FSeries.Length - ALength do
    L.Add(FSeries.Substring(i, ALength));

  Result := L.ToArray;
  L.DisposeOf;
end;

end.
