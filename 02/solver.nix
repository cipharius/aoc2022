let
  # Values
  resultPt2 = builtins.foldl' builtins.add 0 roundResultsPt2;
  resultPt1 = builtins.foldl' builtins.add 0 roundResultsPt1;
  roundResultsPt2 = builtins.map (lookupScore scoreLutPt2) rounds;
  roundResultsPt1 = builtins.map (lookupScore scoreLutPt1) rounds;
  rounds = lib.splitString "\n" inputStripped;
  scoreLutPt1 = {
    "A X" = 4;
    "A Y" = 8;
    "A Z" = 3;
    "B X" = 1;
    "B Y" = 5;
    "B Z" = 9;
    "C X" = 7;
    "C Y" = 2;
    "C Z" = 6;
  };
  scoreLutPt2 = {
    "A X" = 3;
    "A Y" = 4;
    "A Z" = 8;
    "B X" = 1;
    "B Y" = 5;
    "B Z" = 9;
    "C X" = 2;
    "C Y" = 6;
    "C Z" = 7;
  };

  # Functions
  lookupScore = lib.flip builtins.getAttr;

  # Input
  inputStripped = builtins.head (builtins.match "^(.+)[\n$]+" input);
  input = builtins.readFile ./input.txt;
  lib = (import <nixpkgs> {}).lib;
in
{
  part1 = resultPt1;
  part2 = resultPt2;
}
