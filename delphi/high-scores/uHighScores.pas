unit uHighScores;

interface
uses
  System.Generics.Collections;

type
  IScores = interface(IInvokable)
  ['{3D174C80-BA8D-4D92-AB1B-DA29ED0812CE}']
    function Scores:  TList<integer>;
    function Latest: integer;
    function Highest: integer;
    function personalTopThree: TList<integer>;
    function Report: string;
  end;

function NewScores(const aScores: TArray<integer>): IScores;

implementation

uses
  System.SysUtils;

type

  TScores = class(TInterfacedObject, IScores)
  private
    FScores: TList<integer>;
  public
    constructor Create(const aScores: TArray<integer>);
    destructor Destroy; override;
    function Scores: TList<integer>;
    function Latest: integer;
    function Highest: integer;
    function personalTopThree: TList<integer>;
    function Report: string;
  end;

 { TScores }

function NewScores(const aScores: TArray<integer>): IScores;
begin
  result := TScores.Create(aScores);
end;

destructor TScores.Destroy;
begin
  FScores.DisposeOf;
  inherited;
end;

function TScores.Highest: integer;
begin
  var lScores := TList<integer>.Create;
  lScores.AddRange(FScores);
  lScores.Sort;
  Result := lScores.Last;
end;

constructor TScores.Create(const aScores: TArray<integer>);
begin
  inherited Create;
  FScores := TList<integer>.Create;
  FScores.AddRange(aScores);
end;

function TScores.Latest: integer;
begin
  Result := FScores.Last;
end;

function TScores.Report: string;
const
  cPersonalBest = 'Your latest score was %d. That''s your personal best!';
  cShortOfPersonalBest = 'Your latest score was %d. That''s %d short of your personal best!';
begin
  var lLatest := Latest;
  var lHighest := Highest;
  if lLatest = lHighest then
    Result := format(cPersonalBest,[lLatest])
  else
    Result := format(cShortOfPersonalBest,[lLatest, lHighest - lLatest]);
end;

function TScores.Scores: TList<integer>;
begin
  Result := FScores;
end;

function TScores.personalTopThree: TList<integer>;
begin
  var lScores := TList<integer>.Create;
  lScores.AddRange(FScores);
  lScores.Sort;
  lScores.Reverse;
  if lScores.Count > 3 then
    lScores.Count := 3;
  Result := lScores;
end;

end.
