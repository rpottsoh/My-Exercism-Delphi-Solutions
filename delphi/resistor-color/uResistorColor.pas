unit uResistorColor;

interface

type
  TColorCodes = TArray<string>;

type
  TResistor = class(TObject)
  private
    const
      ColorCodes: TColorCodes = ['black', 'brown', 'red',
      'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white'];
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
  var ColorList := TList<string>.Create;
  ColorList.AddRange(ColorCodes);
  result := ColorList.IndexOf(aColor);
end;

class function TResistor.colors: TArray<string>;
begin
  result := ColorCodes;
end;

end.
