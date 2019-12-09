defmodule Day05Test do
  use ExUnit.Case

  @tag :skip
  test "works as before" do
    assert Day05.part1([1, 0, 0, 0, 99]) == [2, 0, 0, 0, 99]
    assert Day05.part1([2, 3, 0, 3, 99]) == [2, 3, 0, 6, 99]
    assert Day05.part1([2, 4, 4, 5, 99, 0]) == [2, 4, 4, 5, 99, 9801]
    assert Day05.part1([1, 1, 1, 4, 99, 5, 6, 0, 99]) == [30, 1, 1, 4, 2, 5, 6, 0, 99]

    modules =
      File.read!("lib/day02input")
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)
      |> List.replace_at(1, 12)
      |> List.replace_at(2, 2)

    assert Enum.at(Day05.part1(modules), 0) === 3_101_878
  end

  @tag :skip
  test "part2" do
    assert Day05.part1([3, 9, 8, 9, 10, 9, 4, 9, 99, -1, 8])
    assert Day05.part1([3, 9, 7, 9, 10, 9, 4, 9, 99, -1, 8])
    assert Day05.part1([3, 3, 1108, -1, 8, 3, 4, 3, 99])
    assert Day05.part1([3, 3, 1107, -1, 8, 3, 4, 3, 99])
  end

  @tag :skip
  test "jump" do
    assert Day05.part1([3, 12, 6, 12, 15, 1, 13, 14, 13, 4, 13, 99, -1, 0, 1, 9])
    assert Day05.part1([3, 3, 1105, -1, 9, 1101, 0, 0, 12, 4, 12, 99, 1])
  end

  @tag :skip
  test "program" do
    assert Day05.part1([
             3,
             21,
             1008,
             21,
             8,
             20,
             1005,
             20,
             22,
             107,
             8,
             21,
             20,
             1006,
             20,
             31,
             1106,
             0,
             36,
             98,
             0,
             0,
             1002,
             21,
             125,
             20,
             4,
             20,
             1105,
             1,
             46,
             104,
             999,
             1105,
             1,
             46,
             1101,
             1000,
             1,
             20,
             4,
             20,
             1105,
             1,
             46,
             98,
             99
           ])
  end

  @tag :skip
  test "computer" do
    program = File.read!("lib/day05input") |> String.split(",") |> Enum.map(&String.to_integer/1)
    assert Day05.part1(program)
  end
end
