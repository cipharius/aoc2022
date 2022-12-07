let
  # Values
  topThreeCalories = builtins.map (builtins.elemAt caloriesSorted) [0 1 2];
  caloriesSorted = builtins.sort (x: y: x > y) calories;
  calories = builtins.map sum elvesCalories;
  elvesCalories = builtins.map splitCalories chunkByElves;
  chunkByElves = lib.splitString "\n\n" inputStripped;

  # Functions
  splitCalories = elfLines: builtins.map lib.toInt (splitLines elfLines);
  sum = xs: builtins.foldl' builtins.add 0 xs;
  splitLines = lib.splitString "\n";

  # Input
  inputStripped = builtins.head (builtins.match "^(.+)[\n$]+" input);
  input = builtins.readFile ./input.txt;
  lib = (import <nixpkgs> {}).lib;
in
{
  part1 = builtins.head topThreeCalories;
  part2 = builtins.foldl' builtins.add 0 topThreeCalories;
}
