require 'test/unit'
require 'lib/modulo'

class TestModulo < Test::Unit::TestCase
  def test_modulo_equality
    a = Modulo.new(23)
    b = Modulo.new(23)
    c = Modulo.new(179)
    assert_equal(a, b)
    assert_equal(a, c)
  end

  def test_add_zero
    a = Modulo.new(15)
    b = Modulo.new(0)
    assert_equal(a, a + b)
  end

  def test_add
    a = Modulo.new(15)
    b = Modulo.new(19)
    c = Modulo.new(8)
    assert_equal(c, a + b)
  end

  def test_add_int
    a = Modulo.new(15)
    c = Modulo.new(10)
    assert_equal(c, a + 21)
  end

  def test_sub
    a = Modulo.new(15)
    b = Modulo.new(19)
    c = Modulo.new(22)
    assert_equal(c, a - b)
  end

  def test_sub_int
    a = Modulo.new(15)
    c = Modulo.new(1)
    assert_equal(c, a - 66)
  end

  def test_mul
    a = Modulo.new(15)
    b = Modulo.new(7)
    c = Modulo.new(1)
    assert_equal(c, a * b)
  end

  def test_mul_int
    a = Modulo.new(15)
    c = Modulo.new(9)
    assert_equal(c, a * 11)
  end

  def test_mul_int_reverse
    a = Modulo.new(15, 8)
    assert_equal(77, 11 * a)
  end

  def test_non_default_modulo
    a = Modulo.new(15, 11)
    b = Modulo.new(9, 11)

    assert_equal(2, a + b)
    assert_equal(6, a - b)
    assert_equal(3, a * b)
  end

  def test_compare
    assert_equal(1, Modulo.new(15) <=> Modulo.new(30))
  end

  def test_compare_int
    assert_equal(-1, Modulo.new(15) <=> 35)
  end

  def test_sort
    x = [Modulo.new(15), Modulo.new(29), Modulo.new(-6), Modulo.new(57)]
    y = [3, 5, 15, 20]
    assert_equal(y, x.sort)
  end
end 
