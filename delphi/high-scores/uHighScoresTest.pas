unit uHighScoresTest;

interface
uses
  DUnitX.TestFramework, uHighScores;

const
  CanonicalVersion = '4.0.0';

type

  [TestFixture]
  THighScoresTest = class(TObject)
  private
    FScores : IScores;
    procedure CompareArrays(Array1, Array2: TArray<integer>);
  public
    [Setup]
    procedure Setup;

    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure List_of_scores;

    [Test]
//    [Ignore]
    procedure Latest_score;

    [Test]
//    [Ignore]
    procedure Personal_best;

    [Test]
//    [Ignore]
    procedure Personal_top_three_from_a_list_of_scores;

    [Test]
//    [Ignore]
    procedure Personal_top_highest_to_lowest;

    [Test]
//    [Ignore]
    procedure Personal_top_when_there_is_a_tie;

    [Test]
//    [Ignore]
    procedure Personal_top_when_there_are_less_than_3;

    [Test]
//    [Ignore]
    procedure Personal_top_when_there_is_only_one;

    [Test]
//    [Ignore('Optional Bonus')]
    procedure Message_for_new_personal_best;

    [Test]
//    [Ignore('Optional Bonus')]
    procedure Message_when_latest_score_is_not_the_highest_score;

    [Test]
//    [Ignore('Optional Bonus')]
    procedure Message_for_repeated_personal_best;
  end;

implementation

uses System.SysUtils;

procedure THighScoresTest.Setup;
begin
  FScores := NewScores;
end;

procedure THighScoresTest.CompareArrays(Array1, Array2: TArray<integer>);
var
  i: integer;
begin
  Assert.AreEqual(Length(Array1), Length(Array2), ' - Array lengths must be equal');
  for i := Low(Array1) to High(Array1) do
    Assert.AreEqual(Array1[i], Array2[i], format('Expecting element %d to = %d, Actual = %d',
      [i, Array1[i], Array2[i]]));
end;

procedure THighScoresTest.Personal_best;
begin
  Assert.AreEqual(100, FScores.Input([40, 100, 70]).Highest);
end;

procedure THighScoresTest.Latest_score;
begin
  Assert.AreEqual(30, FScores.Input([100, 0, 90, 30]).Latest);
end;

procedure THighScoresTest.List_of_scores;
begin
  CompareArrays([30, 50, 20, 70], FScores.Input([30, 50, 20, 70]).Scores);
end;

procedure THighScoresTest.Personal_top_three_from_a_list_of_scores;
begin
  CompareArrays([100, 90, 70],
    FScores.Input([10, 30, 90, 30, 100, 20, 10, 0, 30, 40, 40, 70, 70])
    .personalTopThree);
end;

procedure THighScoresTest.Personal_top_highest_to_lowest;
begin
  CompareArrays([30, 20, 10], FScores.Input([20, 10, 30]).personalTopThree);
end;

procedure THighScoresTest.Personal_top_when_there_are_less_than_3;
begin
  CompareArrays([70, 30], FScores.Input([30, 70]).personalTopThree);
end;

procedure THighScoresTest.Personal_top_when_there_is_a_tie;
begin
  CompareArrays([40, 40, 30], FScores.Input([40, 20, 40, 30]).personalTopThree);
end;

procedure THighScoresTest.Personal_top_when_there_is_only_one;
begin
  CompareArrays([40], FScores.Input([40]).personalTopThree);
end;

{$region 'Optional Bonus'}
procedure THighScoresTest.Message_for_new_personal_best;
begin
  Assert.AreEqual('Your latest score was 70. That''s 30 short of your personal best!',
    FScores.Input([20, 100, 0, 30, 70]).Report);
end;

procedure THighScoresTest.Message_when_latest_score_is_not_the_highest_score;
begin
  Assert.AreEqual('Your latest score was 70. That''s your personal best!',
    FScores.Input([20, 40, 0, 30, 70]).Report);
end;

procedure THighScoresTest.Message_for_repeated_personal_best;
begin
  Assert.AreEqual('Your latest score was 30. That''s 40 short of your personal best!',
    FScores.Input([20, 70, 50, 70, 30]).Report);
end;
{$endregion}

initialization
  TDUnitX.RegisterTestFixture(THighScoresTest);
end.
