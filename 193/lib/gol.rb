class Grid
  include Enumerable
  class Cell
    attr_reader :x, :y
    [['born', 1], ['die', 0], ['unchanged', '@status']].each do |method, status|
      module_eval(%{def #{method}; @grid[@x, @y] = #{status}; end})
    end
    def initialize(grid, x, y, status)
      @grid = grid
      @x, @y = x, y
      @status = status
    end
    def alive?
      @status == 1
    end
    def alive_neighbours
      [[-1, -1], [0, -1], [1, -1], [1, 0], [1, 1], [0, 1], [-1, 1], [-1, 0]].inject(0) do |sum, cell|
        sum += @grid[@x + cell[0], @y + cell[1]]
      end
    end
    def to_s
      alive? ? "x" : "-"
    end
  end
  def self.generate(width, height)
    self.new(Array.new(height).collect { Array.new(width).collect { rand(2) } })
  end
  def initialize(seed)
    @w, @h = seed.first.size, seed.size
    @cells = seed
  end
  def [](x, y)
    @cells[y % @h][x % @w]
  end
  def []=(x, y, value)
    @nextgen[y % @h][x % @w] = value
  end
  def each(&blk)
    @cells.each_with_index do |row, y|
      row.each_with_index { |col, x| yield Cell.new(self, x, y, self[x, y]) }
    end
  end
  def tick!
    @nextgen = Array.new(@h).map { Array.new(@w).dup }
    each do |cell|
      if cell.alive?
        (cell.alive_neighbours < 2 || cell.alive_neighbours > 3) ? cell.die : cell.unchanged
      else
        cell.alive_neighbours == 3 ? cell.born : cell.unchanged
      end
    end
    @cells = @nextgen
  end
  def to_s
    inject("") do |result, cell|
      result << cell.to_s << (cell.x == @w - 1 ? "\n" : "")
    end
  end
end 

if $0 == __FILE__
  grid = Grid.generate(80, 20)  
  while 0 != 1 
    grid.tick!
    print grid
    puts "-"*80
  end
end
