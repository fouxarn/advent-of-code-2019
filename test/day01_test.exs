defmodule Day01Test do
  use ExUnit.Case

  test "calculates fuel" do
    assert Day01.calculateFuel(12) == 2
    assert Day01.calculateFuel(14) == 2
    assert Day01.calculateFuel(1969) == 654
    assert Day01.calculateFuel(100_756) == 33583
  end

  test "calculates fuel recursive" do
    assert Day01.calculateFuelRecursive(12) == 2
    assert Day01.calculateFuelRecursive(14) == 2
    assert Day01.calculateFuelRecursive(1969) == 966
    assert Day01.calculateFuelRecursive(100_756) == 50346
  end

  test "part1" do
    modules = File.read!("lib/day01input") |> String.split("\n") |> Enum.map(&String.to_integer/1)
    assert Day01.part1(modules) == 3_256_114
  end

  test "part2" do
    modules = File.read!("lib/day01input") |> String.split("\n") |> Enum.map(&String.to_integer/1)
    assert Day01.part2(modules) == 4_881_302
  end
end
