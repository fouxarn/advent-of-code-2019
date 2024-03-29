defmodule Day03 do
  def intersect(list1, list2) do
    rest = list1 -- list2
    list1 -- rest
  end

  def calcPath(from, direction) do
    {direction, distance} = String.split_at(direction, 1)
    distance = String.to_integer(distance)

    case direction do
      "U" -> Enum.map(1..distance, fn y -> %{from | :y => from.y + y} end)
      "D" -> Enum.map(1..distance, fn y -> %{from | :y => from.y - y} end)
      "R" -> Enum.map(1..distance, fn x -> %{from | :x => from.x + x} end)
      "L" -> Enum.map(1..distance, fn x -> %{from | :x => from.x - x} end)
    end
  end

  def manhattanLength(point) do
    abs(point.x) + abs(point.y)
  end

  def part1(wire1, wire2) do
    intersect(
      Enum.reduce(wire1, [%{:x => 0, :y => 0}], fn direction, acc ->
        acc ++ calcPath(List.last(acc), direction)
      end),
      Enum.reduce(wire2, [%{:x => 0, :y => 0}], fn direction, acc ->
        acc ++ calcPath(List.last(acc), direction)
      end)
    )
    |> tl
    |> Enum.map(&manhattanLength(&1))
    |> Enum.min()
  end

  def steps(point, wire1, wire2) do
    (Enum.find_index(wire1, fn x -> x == point end) +
       Enum.find_index(wire2, fn x -> x == point end))
    |> IO.inspect()
  end

  def part2(wire1, wire2) do
    path1 =
      Enum.reduce(wire1, [%{:x => 0, :y => 0}], fn direction, acc ->
        acc ++ calcPath(List.last(acc), direction)
      end)

    path2 =
      Enum.reduce(wire2, [%{:x => 0, :y => 0}], fn direction, acc ->
        acc ++ calcPath(List.last(acc), direction)
      end)

    intersect(path1, path2)
    |> tl
    |> Enum.map(&steps(&1, path1, path2))
    |> Enum.min()
  end
end
