defmodule Day04 do
  def adjacentFilter([_]) do
    false
  end

  def adjacentFilter([head | tail]) do
    head == hd(tail) || adjacentFilter(tail)
  end

  def increasingFilter([_]) do
    true
  end

  def increasingFilter([head | tail]) do
    head <= hd(tail) && increasingFilter(tail)
  end

  def part1(lower, upper) do
    Enum.filter(lower..upper, fn x ->
      values = Integer.digits(x)
      adjacentFilter(values) && increasingFilter(values)
    end)
    |> length
  end

  def exactly2adjacentFilter([]) do
    false
  end

  def exactly2adjacentFilter([x, x]) do
    true
  end

  def exactly2adjacentFilter([x, x | tail]) do
    x != hd(tail) || exactly2adjacentFilter(Enum.drop_while(tail, fn val -> val == x end))
  end

  def exactly2adjacentFilter([_ | tail]) do
    exactly2adjacentFilter(tail)
  end

  def part2(lower, upper) do
    Enum.filter(lower..upper, fn x ->
      values = Integer.digits(x)
      exactly2adjacentFilter(values) && increasingFilter(values)
    end)
    |> length
  end
end
