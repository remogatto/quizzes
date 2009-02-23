class Grid
  class Cell
    def initialize(grid, x, y, status)
      @grid = grid
      @x, @y = x, y
      @status = status
    end
    def alive?(status)
      @status == 1
    end
    def alives
      [[-1, -1], [0, -1], [1, -1], [1, 0], [1, 1], [0, 1], [-1, 1], [-1, 0]].inject(0) do |sum, cell|
        sum += @grid[@x + cell[0], @y + cell[1]]
      end
    end
    def born
      @grid.nextgen[@x][@y] = 1
    end
    def die
      @grid.nextgen[@x][@y] = 0
    end
    def unchanged
      @grid.nextgen[@x][@y] = status
    end
  end
  attr_reader :cells, :nextgen
  def self.generate(width, height)
    self.new(Array.new(height).collect { Array.new(width).collect { rand(2) } })
  end
  def initialize(seed)
    @cells, @nextgen = seed, seed.dup
    @w, @h = seed.first.size, seed.size
  end
  def [](x, y)
    @cells[y % @h][x % @w]
  end
  def tick
    @nextgen = []
    @cells.each_with_index do |c, y|
      @nextgen[y] = [] 
      c.each_with_index do |status, x|
        cell = Cell.new(self, x, y, status)
        if cell.alive?(status)
          (cell.alives < 2 || cell.alives > 3) ? @nextgen[y] << 0 : @nextgen[y] << status
        else
          cell.alives == 3 ? @nextgen[y] << 1 : @nextgen[y] << status
        end        
      end
    end
    @cells = @nextgen
    self
  end
  def to_s
    result = ""
    @cells.each_with_index do |c, y|
      result << c.collect { |status| status == 1 ? "x" : " " }.join << "\n"
    end
    result
  end
end 

if $0 == __FILE__
  grid = Grid.generate(80, 20)  
  while 0 != 1 
    print grid.tick.to_s
    puts "-"*80
  end
end
