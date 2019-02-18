unit uResistorColor;

interface

type
  TResistor = class
  private
    const colorCodes: array[0..9] of string = ('black', 'brown', 'red',
      'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white');
  public
    class function colorCode(aColor: string): integer;
    class function colors: TArray<string>;
  end;

implementation
uses
  Generics.Collections;

{ TResistor }

class function TResistor.colorCode(aColor: string): integer;
begin
  var colorList := TList<string>.Create;
  colorList.AddRange(colorCodes);
  result := colorList.IndexOf(aColor);
end;

class function TResistor.colors: TArray<string>;
begin
  var colorList := TList<string>.Create;
  colorList.AddRange(colorCodes);
  result := colorList.ToArray;
end;

end.
