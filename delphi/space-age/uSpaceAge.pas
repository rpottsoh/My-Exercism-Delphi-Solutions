unit uSpaceAge;

interface

type
  ISpaceAge = interface(IInvokable)
  ['{D2226242-6BFC-4C80-A9EB-D5A67FA406FE}']
    function OnEarth: double;
    function OnMercury: double;
    function OnVenus: double;
    function OnMars: double;
    function OnJupiter: double;
    function OnSaturn: double;
    function OnUranus: double;
    function OnNeptune: double;
  end;

  function NewSpaceAge(Seconds: Integer): ISpaceAge;

implementation
uses System.Generics.Collections, System.Math;

{ TSpaceAge }
type
  TSpaceAge = class(TInterfacedObject, ISpaceAge)
  private
    const
      cEarth_Orbit_In_Seconds = 31557600;
    type
      TPlanets = (Earth, Mercury, Venus, Mars, Jupiter, Saturn, Uranus, Neptune);
    var
      earthYearToPlanetPeriod: TDictionary<TPlanets, double>;
      fSeconds: Integer;
    function CalculateAge(periodInEarthYears: double): double;
    constructor Create(Seconds: Integer);
    destructor Destroy; override;
    function OnEarth: double;
    function OnMercury: double;
    function OnVenus: double;
    function OnMars: double;
    function OnJupiter: double;
    function OnSaturn: double;
    function OnUranus: double;
    function OnNeptune: double;
  end;

function NewSpaceAge(Seconds: Integer): ISpaceAge;
begin
  result := TSpaceAge.Create(Seconds);
end;

function TSpaceAge.CalculateAge(periodInEarthYears: double): double;
begin
  result := SimpleRoundTo(fSeconds / (cEarth_Orbit_In_Seconds * periodInEarthYears), -2);
end;

constructor TSpaceAge.Create(Seconds: Integer);
begin
  fSeconds := Seconds;
  earthYearToPlanetPeriod := TDictionary<TPlanets, double>.Create;
  with earthYearToPlanetPeriod do
  begin
    add(Earth, 1.0);
    add(Mercury, 0.2408467);
    add(Venus, 0.61519726);
    add(Mars, 1.8808158);
    add(Jupiter, 11.862615);
    add(Saturn, 29.447498);
    add(Uranus, 84.016846);
    add(Neptune, 164.79132);
  end;
end;

destructor TSpaceAge.Destroy;
begin
  earthYearToPlanetPeriod.DisposeOf;
  inherited;
end;

function TSpaceAge.OnEarth: double;
begin
  result := CalculateAge(earthYearToPlanetPeriod[Earth]);
end;

function TSpaceAge.OnJupiter: double;
begin
  result := CalculateAge(earthYearToPlanetPeriod[Jupiter]);
end;

function TSpaceAge.OnMars: double;
begin
  result := CalculateAge(earthYearToPlanetPeriod[Mars]);
end;

function TSpaceAge.OnMercury: double;
begin
  result := CalculateAge(earthYearToPlanetPeriod[Mercury]);
end;

function TSpaceAge.OnNeptune: double;
begin
  result := CalculateAge(earthYearToPlanetPeriod[Neptune]);
end;

function TSpaceAge.OnSaturn: double;
begin
  result := CalculateAge(earthYearToPlanetPeriod[Saturn]);
end;

function TSpaceAge.OnUranus: double;
begin
  result := CalculateAge(earthYearToPlanetPeriod[Uranus]);
end;

function TSpaceAge.OnVenus: double;
begin
  result := CalculateAge(earthYearToPlanetPeriod[Venus]);
end;

end.