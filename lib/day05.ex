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

  def getValue(_, value, :immediate) do
    value
  end

  def getValue(program, pos, :position) do
    Enum.at(program, pos)
  end

  def part1(program, index \\ 0) do
    [instruction | tail] = Enum.slice(program, index..-1)

    case evaluateInstruction(instruction) do
      # Addition
      [_, paramMode2, paramMode1, 1] ->
        [from1, from2, to | _] = tail

        List.replace_at(
          program,
          to,
          getValue(program, from1, paramMode1) + getValue(program, from2, paramMode2)
        )
        |> part1(index + 4)

      # Multiplication
      [_, paramMode2, paramMode1, 2] ->
        [from1, from2, to | _] = tail

        List.replace_at(
          program,
          to,
          getValue(program, from1, paramMode1) * getValue(program, from2, paramMode2)
        )
        |> part1(index + 4)

      # Input
      [_, _, _, 3] ->
        [to | _] = tail

        value = IO.gets("Value:") |> String.slice(0..-2) |> String.to_integer()

        List.replace_at(
          program,
          to,
          value
        )
        |> part1(index + 2)

      # Output
      [_, _, paramMode1, 4] ->
        [from | _] = tail

        IO.puts(getValue(program, from, paramMode1) |> Integer.to_string())
        part1(program, index + 2)

      # Jump if true
      [_, paramMode2, paramMode1, 5] ->
        [param1, param2 | _] = tail

        if getValue(program, param1, paramMode1) != 0 do
          part1(program, getValue(program, param2, paramMode2))
        else
          part1(program, index + 3)
        end

      # Jump if false
      [_, paramMode2, paramMode1, 6] ->
        [param1, param2 | _] = tail

        if getValue(program, param1, paramMode1) == 0 do
          part1(program, getValue(program, param2, paramMode2))
        else
          part1(program, index + 3)
        end

      # Is less than
      [_, paramMode2, paramMode1, 7] ->
        [param1, param2, param3 | _] = tail

        if getValue(program, param1, paramMode1) < getValue(program, param2, paramMode2) do
          List.replace_at(
            program,
            param3,
            1
          )
          |> part1(index + 4)
        else
          List.replace_at(
            program,
            param3,
            0
          )
          |> part1(index + 4)
        end

      # Is equals
      [_, paramMode2, paramMode1, 8] ->
        [param1, param2, param3 | _] = tail

        if getValue(program, param1, paramMode1) == getValue(program, param2, paramMode2) do
          List.replace_at(
            program,
            param3,
            1
          )
          |> part1(index + 4)
        else
          List.replace_at(
            program,
            param3,
            0
          )
          |> part1(index + 4)
        end

      [_, _, _, 99] ->
        program
    end
  end
end
