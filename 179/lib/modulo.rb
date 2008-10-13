class Modulo

  include Comparable

  [:+, :-, :*].each do |meth|
    define_method(meth) { |other_n| Modulo.new(@n.send(meth, other_n.to_i), @m) }
  end

  def initialize(n = 0, m = 26)
    @n, @m = n % m, m
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

end
