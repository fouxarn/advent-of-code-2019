defmodule Day02 do
  def part1(program, index \\ 0) do
    case Enum.slice(program, index..-1) do
      [1, from1, from2, to | _] ->
        List.replace_at(program, to, Enum.at(program, from1) + Enum.at(program, from2))
        |> part1(index + 4)

      [2, from1, from2, to | _] ->
        List.replace_at(program, to, Enum.at(program, from1) * Enum.at(program, from2))
        |> part1(index + 4)

      [99 | _] ->
        program
    end
  end

  def part2(program, res) do
    [a, _, _ | tail] = program

    Enum.find_value(0..99, fn noun ->
      Enum.find_value(0..99, fn verb ->
        case part1([a, noun, verb] ++ tail) do
          [^res | tail] -> [res] ++ tail
          _ -> false
        end
      end)
    end)
  end
end
