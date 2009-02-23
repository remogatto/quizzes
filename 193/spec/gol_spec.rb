require 'lib/gol.rb'

describe Grid do
  before :all do
    @seed = [
             [1, 0, 0, 0, 0, 0, 0, 0, 0],
             [1, 0, 0, 1, 1, 1, 0, 0, 0],
             [0, 1, 0, 0, 0, 1, 0, 1, 0],
             [1, 1, 1, 0, 1, 0, 0, 1, 0],
             [0, 0, 0, 1, 0, 0, 0, 0, 0],
             [0, 0, 0, 1, 0, 1, 0, 1, 0],
             [1, 1, 0, 1, 0, 1, 0, 1, 0],
             [0, 0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 1, 0, 1, 0, 1, 0]
            ]
    @grid = Grid.new(@seed)
  end
  it 'should set its width and height' do
    @grid.h.should == 9
    @grid.w.should == 9
  end
  it 'should initialize the cells from the given seed' do
    x = 0
    y = 0
    size = @grid.h
    @grid.cells.each do |cell|
      cell.status.should == @seed[y][x]
      x < size - 1 ? x +=1 : (x = 0; y += 1)
    end
  end
  it 'should return the cell at the given coordinates' do
    @grid[0, 1].status.should == 1
  end
  it 'should clip the coordinates out of the grid' do
    @grid[9, 6].status.should == 1
    @grid[9, 18].status.should == 1
    @grid[3, -1].status.should == 1
  end
  it 'should evolve to the next generation' do
    seed = [
            [0, 0, 1],
            [1, 0, 0],
            [0, 1, 0]
           ]
    Grid.new(seed).tick.cells[0].status.should == 1 
    Grid.new(seed).tick.cells[1].status.should == 1 
    Grid.new(seed).tick.cells[2].status.should == 1
    Grid.new(seed).tick.cells[3].status.should == 1 
    Grid.new(seed).tick.cells[4].status.should == 1 
    Grid.new(seed).tick.cells[5].status.should == 1 
    Grid.new(seed).tick.cells[6].status.should == 1 
    Grid.new(seed).tick.cells[7].status.should == 1 
    Grid.new(seed).tick.cells[8].status.should == 1
    Grid.new(@seed).tick.cells[0].status.should == 0 
    Grid.new(@seed).tick.cells[14].status.should == 1
  end
  it 'should return a string' do
    Grid.new(@seed).tick.to_s.should == "   x xx x\nxx  xxx x\n     x   \nxxxxx x x\n x x  x x\n   x    x\n  x     x\n  x     x\n         \n"
  end
  it 'should generate a random squared seed grid' do
    Grid.generate(10).size.should == 10
  end
end

describe Grid::Cell do
  before :all do
    @seed = [
             [1, 0, 0, 0, 0, 0, 0, 0, 0],
             [1, 0, 0, 1, 1, 1, 0, 0, 0],
             [0, 1, 0, 0, 0, 1, 0, 1, 0],
             [1, 1, 1, 0, 1, 0, 0, 1, 0],
             [0, 0, 0, 1, 0, 0, 0, 0, 0],
             [0, 0, 0, 1, 0, 1, 0, 1, 0],
             [1, 1, 0, 1, 0, 1, 0, 1, 0],
             [0, 0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 1, 0, 1, 0, 1, 0]
            ]
    @grid = Grid.new(@seed)
  end
  it 'should find how much neighbours are alive' do
    @grid[3, 1].alives.should == 1
    @grid[1, 3].alives.should == 3
    @grid[8, 0].alives.should == 3
  end
end
