unit uAcronym;

interface

function abbreviate(aPhrase: string): string;

implementation
uses SysUtils
     ,RegularExpressions
     ,System.Generics.Collections;

function abbreviate(aPhrase: string): string;

  function findWords(inputPhrase: string): TMatchCollection;
  begin
    inputPhrase := inputPhrase.Replace('''s', '');
    result := TRegex.Matches(inputPhrase,'[A-Z]+[a-z]*|[a-z]+');
  end;

  function makeListOfWords(aMatches: TMatchCollection): TList<string>;
  begin
    result := TList<string>.create;
    for var lMatch: TMatch in aMatches do
      if lMatch.Success then
        result.Add(lMatch.Value);
  end;

  function ExtractAndUpcaseFirstLetters(aWords: TList<string>): string;
  begin
    result := '';
    for var _Word in aWords do
      result := result + _Word.ToUpperInvariant[1];
  end;

begin
  result := ExtractAndUpcaseFirstLetters(
    makeListOfWords(
      findWords(aPhrase)));
end;

end.

