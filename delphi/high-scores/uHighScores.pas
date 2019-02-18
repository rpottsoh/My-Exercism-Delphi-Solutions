unit uHighScores;

interface

type
  IScores = interface(IInvokable)
  ['{3D174C80-BA8D-4D92-AB1B-DA29ED0812CE}']
    function Input(AInput: TArray<integer>): ISCores;
    function Scores:  TArray<integer>;
    function Latest: integer;
    function Highest: integer;
    function personalTopThree: TArray<integer>;
    function Report: string;
  end;

function NewScores: IScores;

implementation

uses
  System.Generics.Collections, System.SysUtils;

type

  TScores = class(TInterfacedObject, IScores)
  private
    FScores: TArray<integer>;
  public
    function Input(AInput: TArray<integer>): ISCores;
    function Scores:  TArray<integer>;
    function Latest: integer;
    function Highest: integer;
    function personalTopThree: TArray<integer>;
    function Report: string;
  end;

 { TScores }

function NewScores: IScores;
begin
  result := TScores.Create;
end;

function TScores.Highest: integer;
begin
  var lScores := TList<integer>.Create;
  lScores.AddRange(FScores);
  lScores.Sort;
  Result := lScores.Last;
end;

function TScores.Input(AInput: TArray<integer>): ISCores;
begin
  FScores := AInput;
  Result := self;
end;

function TScores.Latest: integer;
begin
  Result := FScores[High(FScores)];
end;

function TScores.Report: string;
begin
  var lLatest := Latest;
  var lHighest := Highest;
  if lLatest = lHighest then
    Result := format('Your latest score was %d. That''s your personal best!',[lLatest])
  else
    Result := format('Your latest score was %d. That''s %d short of your personal best!',[lLatest, lHighest - lLatest]);
end;

function TScores.Scores: TArray<integer>;
begin
  Result := FScores;
end;

function TScores.personalTopThree: TArray<integer>;
begin
  var lScores := TList<integer>.Create;
  lScores.AddRange(FScores);
  lScores.Sort;
  lScores.Reverse;
  if lScores.Count > 3 then
    lScores.Count := 3;
  Result := lScores.ToArray;
end;

end.
