defmodule Day01 do
  def calculateFuel(mass) do
    div(mass, 3) - 2
  end

  def calculateFuelRecursive(mass) do
    fuel = calculateFuel(mass)

    if fuel <= 0 do
      0
    else
      fuel + calculateFuelRecursive(fuel)
    end
  end

  def part1(modules) do
    Enum.reduce(modules, 0, fn mass, acc -> calculateFuel(mass) + acc end)
  end

  def part2(modules) do
    Enum.reduce(modules, 0, fn mass, acc -> calculateFuelRecursive(mass) + acc end)
  end
end
