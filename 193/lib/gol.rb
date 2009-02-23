class Grid
  class Cell
    attr_reader :x, :y
    attr_reader :status
    def initialize(grid, x, y, status = 1)
      @x, @y, @status = x, y, status
      @grid = grid
    end
    def born
      Cell.new(@grid, @x, @y, 1)
    end
    def die
      Cell.new(@grid, @x, @y, 0)
    end
    def alives
      return [[-1, -1], [0, -1], [1, -1], [1, 0], [1, 1], [0, 1], [-1, 1], [-1, 0]].inject(0) do |sum, cell|
        sum += @grid[@x + cell[0], @y + cell[1]].status
      end
    end
    def to_s
      @status == 1 ? "x" : " "
    end
  end
  attr_reader :w, :h, :size
  attr_reader :cells, :next
  def self.generate(size)
    self.new(Array.new(size).collect { Array.new(size).collect { rand(2) } })
  end
  def initialize(seed)
    @seed = seed
    @w = @h = @size = seed.size
    set_cells
  end
  def [](x, y)
    @cells[clip(y) * @w + clip(x)]
  end
  def tick
    nextgen = @cells.inject([]) do |generation, cell|
      if cell.status == 1
        if cell.alives < 2 or cell.alives > 3
          generation << cell.die
        elsif cell.alives == 2 or cell.alives == 3
          generation << cell.dup
        end
      else
        if cell.alives == 3
          generation << cell.born
        else
          generation << cell.dup
        end
      end
    end
    @cells = nextgen.dup
    self
  end
  def to_s
    result = ""
    (0..@size - 1).each do |row| 
      (0..@size - 1).each do |col|
        result << @cells[row * @size + col].to_s
      end
      result << "\n"
    end
    result
  end
  private
  def clip(coord)
    coord % @size
  end
  def set_cells
    y = 0
    @cells = @seed.inject([]) do |cells, cell_row|
      x = 0
      cell_row.each do |status|
        cells << Cell.new(self, x, y, status)
        x += 1
      end
      y += 1
      cells
    end
  end
end 

if $0 == __FILE__
  grid = Grid.generate(80)  
  while 0 != 1 
    print grid.tick.to_s
    puts "-"*30
    sleep 1
  end
end
