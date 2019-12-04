defmodule Day03Test do
  use ExUnit.Case

  @tag :skip
  test "part1" do
    assert Day03.part1(["R75", "D30", "R83", "U83", "L12", "D49", "R71", "U7", "L72"], [
             "U62",
             "R66",
             "U55",
             "R34",
             "D71",
             "R55",
             "D58",
             "R83"
           ]) == 159

    assert Day03.part1(
             ["R98", "U47", "R26", "D63", "R33", "U87", "L62", "D20", "R33", "U53", "R51"],
             ["U98", "R91", "D20", "R16", "D67", "R40", "U7", "R15", "U6", "R7"]
           ) == 135

    [wire1, wire2] = File.read!("lib/day03input") |> String.split("\n")
    assert Day03.part1(String.split(wire1, ","), String.split(wire2, ",")) == 1431
  end

  @tag :skip
  test "part2" do
    assert Day03.part2(["R75", "D30", "R83", "U83", "L12", "D49", "R71", "U7", "L72"], [
             "U62",
             "R66",
             "U55",
             "R34",
             "D71",
             "R55",
             "D58",
             "R83"
           ]) == 610

    assert Day03.part2(
             ["R98", "U47", "R26", "D63", "R33", "U87", "L62", "D20", "R33", "U53", "R51"],
             ["U98", "R91", "D20", "R16", "D67", "R40", "U7", "R15", "U6", "R7"]
           ) == 410

    [wire1, wire2] = File.read!("lib/day03input") |> String.split("\n")
    assert Day03.part2(String.split(wire1, ","), String.split(wire2, ",")) == 48012
  end
end
