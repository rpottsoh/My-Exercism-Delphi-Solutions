unit uBinarySearch;

interface

type
  BinarySearch = class
  strict private
    class function SearchHelper(input: TArray<Integer>; target: integer; minIndex: integer; maxIndex: integer): integer; static;
  public
    class function Search(input: TArray<Integer>; target: integer): integer; static;
  end;

implementation

class function BinarySearch.SearchHelper(input: TArray<Integer>; target: Integer; minIndex: Integer; maxIndex: Integer): integer;
var middleIndex: integer;
begin
  if minIndex > maxIndex then
    result := -1
  else
  begin
    middleIndex := (minIndex + maxIndex) div 2;
    if (input[middleIndex] = target) then
      result := middleIndex
    else
      if input[middleIndex] > target then
        result := SearchHelper(input, target, minIndex, middleIndex - 1)
      else
        result := SearchHelper(input, target, middleIndex + 1, maxIndex);
  end;
end;

class function BinarySearch.Search(input: TArray<Integer>; target: integer): integer;
begin
  result := SearchHelper(input, target, Low(input), High(input));
end;

end.