defmodule Day04Test do
  use ExUnit.Case, async: true

  @tag :skip
  test "Filter not adjacent" do
    assert Day04.adjacentFilter(Integer.digits(122_345)) == true
    assert Day04.adjacentFilter(Integer.digits(121_345)) == false
    assert Day04.adjacentFilter(Integer.digits(111_111)) == true
  end

  @tag :skip
  test "Filter not increasing" do
    assert Day04.increasingFilter(Integer.digits(111_123)) == true
    assert Day04.increasingFilter(Integer.digits(321_111)) == false
    assert Day04.increasingFilter(Integer.digits(135_679)) == true
    assert Day04.increasingFilter(Integer.digits(976_531)) == false
    assert Day04.increasingFilter(Integer.digits(111_111)) == true
  end

  @tag :skip
  test "part1" do
    assert Day04.part1(197_487, 673_251) == 1640
  end

  @tag :skip
  test "Filter exactly 2 adjacent" do
    assert Day04.exactly2adjacentFilter(Integer.digits(112_233)) == true
    assert Day04.exactly2adjacentFilter(Integer.digits(123_444)) == false
    assert Day04.exactly2adjacentFilter(Integer.digits(111_122)) == true
    assert Day04.exactly2adjacentFilter(Integer.digits(222_222)) == false
  end

  @tag :skip
  test "part2" do
    assert Day04.part2(197_487, 673_251) == 1126
  end
end
