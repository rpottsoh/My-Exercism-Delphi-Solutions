unit uRnaTranscription;

interface
uses Generics.Collections;

type
  complement = class
  private
    class var
      fDnaToRna: TDictionary<char, char>;
  public
    class function OfDna(nucleotide: string): string; static;
  end;

implementation
uses SysUtils;

class function complement.OfDna(nucleotide: string): string;
begin
  result := '';
  var lRNA := '';
  if not trim(nucleotide).IsEmpty then
  begin
    if not assigned(fDNAToRna) then
    begin
      fDnaToRna := TDictionary<char, char>.Create;
      with fDnatoRna do
      begin
        add('G','C');
        add('C','G');
        add('T','A');
        add('A','U');
      end;
    end;
    var elements := nucleotide.ToUpper.ToCharArray;
    var i := 0;
    while i <= high(elements) do
    begin
      var RNAelement: char;
      if fDnaToRna.TryGetValue(elements[i], RNAelement) then
      begin
        lRNA := lRNA + RNAelement;
        inc(i);
      end
      else
      begin
        lRNA := '';
        break;
      end;
    end;
  end;
  result := lRNA;
end;

end.