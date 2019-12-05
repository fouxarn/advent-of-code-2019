defmodule Day05 do
  def fillInstruction(instr) do
    List.duplicate(0, 5 - length(instr)) ++ instr
  end

  def evaluateInstruction(instr) do
    {modes, op} =
      Integer.digits(instr)
      |> fillInstruction
      |> Enum.split(3)

    Enum.map(modes, fn x -> (x != 0 && :immediate) || :position end) ++ [Integer.undigits(op)]
  end

  def getValue(program, value, :immediate) do
    value
  end

  def getValue(program, pos, :position) do
    Enum.at(program, pos)
  end

  def part1(program, index \\ 0) do
    [instruction | tail] = Enum.slice(program, index..-1)

    case evaluateInstruction(instruction) do
      [_, paramMode2, paramMode1, 1] ->
        [from1, from2, to | _] = tail

        List.replace_at(
          program,
          to,
          getValue(program, from1, paramMode1) + getValue(program, from2, paramMode2)
        )
        |> part1(index + 4)

      [_, paramMode2, paramMode1, 2] ->
        [from1, from2, to | _] = tail

        List.replace_at(
          program,
          to,
          getValue(program, from1, paramMode1) * getValue(program, from2, paramMode2)
        )
        |> part1(index + 4)

      [_, _, _, 3] ->
        [to | _] = tail

        value = IO.gets("Value:") |> String.slice(0..-2) |> String.to_integer()

        List.replace_at(
          program,
          to,
          value
        )
        |> part1(index + 2)

      [_, _, _, 4] ->
        [from | _] = tail

        IO.puts(Enum.at(program, from) |> Integer.to_string())
        part1(program, index + 2)

      [_, _, _, 99] ->
        program
    end
  end
end
