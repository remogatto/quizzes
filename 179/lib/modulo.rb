class Modulo

  include Comparable

  [:+, :-, :*].each do |meth|
    define_method(meth) { |other_n| Modulo.new(@n.send(meth, other_n.to_i), @m) }
  end

  def initialize(n, m = 26)
    @m = m
    @n = modularize(n)
  end

  def <=>(other_n)
    @n <=> other_n.to_i
  end

  def to_i
    @n
  end

  private

  def coerce(numeric)
    [@n, numeric]
  end

  def modularize(n)
    return (n > 0 ? n % @m : (n - @m) % @m) if (n - @m) >= 0 or n < 0
    n
  end

end
