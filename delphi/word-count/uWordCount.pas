unit uWordCount;

interface
uses
  System.Generics.Collections;

type
  IWordCount = interface(IInvokable)
    function countWords: TDictionary<string, integer>;
  end;

function WordCount(aPhrase: string): IWordCount;

implementation
uses SysUtils, RegularExpressions;

type
  TWordCount = class(TInterfacedObject, IWordCount)
  private
    fPhrase: string;
  public
    constructor Create(aPhrase: string);
    function countWords: TDictionary<string, integer>;
  end;

function WordCount(aPhrase: string): IWordCount;
begin
  result := TWordCount.Create(aPhrase);
end;

constructor TWordCount.Create(aPhrase: string);
begin
  inherited Create;
  fPhrase := aPhrase;
end;

function TWordCount.countWords: TDictionary<string, integer>;
var
  counts: TDictionary<string, integer>;
  match: TMatch;
  lWord: string;
begin
  counts := TDictionary<string, integer>.Create;
  fPhrase := TRegEx.Replace(fPhrase.ToLower, '\\[a-z]', ' ');
  match := TRegEx.Match(fPhrase, '\w+''\w+|\w+');
  while match.Success do
  begin
    lWord := match.Value;
    if not counts.ContainsKey(lWord) then
      counts.Add(lWord, 0);
    counts[lWord] := counts[lWord] + 1;
    match := match.NextMatch;
  end;
  result := counts;
end;

end.

