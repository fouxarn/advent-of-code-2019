defmodule Day02Test do
  use ExUnit.Case

  test "part1" do
    assert Day02.part1([1, 0, 0, 0, 99]) == [2, 0, 0, 0, 99]
    assert Day02.part1([2, 3, 0, 3, 99]) == [2, 3, 0, 6, 99]
    assert Day02.part1([2, 4, 4, 5, 99, 0]) == [2, 4, 4, 5, 99, 9801]
    assert Day02.part1([1, 1, 1, 4, 99, 5, 6, 0, 99]) == [30, 1, 1, 4, 2, 5, 6, 0, 99]

    modules =
      File.read!("lib/day02input")
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)
      |> List.replace_at(1, 12)
      |> List.replace_at(2, 2)

    assert Enum.at(Day02.part1(modules), 0) === 3_101_878
  end

  test "part2" do
    modules = File.read!("lib/day02input") |> String.split(",") |> Enum.map(&String.to_integer/1)
    [19_690_720, noun, verb | _] = Day02.part2(modules, 19_690_720)
    assert 100 * noun + verb === 8444
  end
end
