require 'lib/gol.rb'

describe Grid do
  before do
    @a = [
          [0, 0, 0, 0],
          [0, 1, 0, 0],
          [0, 1, 0, 0],
          [0, 0, 1, 0],
          [0, 0, 0, 0]
         ]
    @grid = Grid.new(@a)
  end
  it 'should return the cell at the given coordinates' do
    @grid[0, 1].should == 0
    @grid[1, 1].should == 1
  end
  it 'should clip the coordinates out of the grid' do
    @grid[-1, 0].should == 0
    @grid[-3, 1].should == 1
    @grid[2, 8].should == 1
  end
  it 'should correctly evolve to the next generation' do
    a_0 = [
           [0, 0, 0, 0],
           [0, 1, 0, 0],
           [0, 1, 0, 0],
           [0, 0, 1, 0],
           [0, 0, 0, 0]
          ]
    a_1 = [
           [0, 0, 0, 0],
           [0, 0, 0, 0],
           [0, 1, 1, 0],
           [0, 0, 0, 0],
           [0, 0, 0, 0]
          ]
    a_2 = [
           [0, 0, 0, 0],
           [0, 0, 0, 0],
           [0, 0, 0, 0],
           [0, 0, 0, 0],
           [0, 0, 0, 0]
          ]
    b_0 = [
           [0, 0, 0, 0, 0, 0],
           [0, 0, 0, 0, 0, 0],
           [0, 1, 1, 1, 1, 0],
           [0, 0, 0, 0, 0, 0],
           [0, 0, 0, 0, 0, 0]
          ] 
    b_1 = [
           [0, 0, 0, 0, 0, 0],
           [0, 0, 1, 1, 0, 0],
           [0, 0, 1, 1, 0, 0],
           [0, 0, 1, 1, 0, 0],
           [0, 0, 0, 0, 0, 0]
          ]
    b_2 = [
           [0, 0, 0, 0, 0, 0],
           [0, 0, 1, 1, 0, 0],
           [0, 1, 0, 0, 1, 0],
           [0, 0, 1, 1, 0, 0],
           [0, 0, 0, 0, 0, 0]
          ]
    c_0 = [
           [0, 0, 0, 0, 0, 0],
           [0, 0, 1, 0, 0, 0],
           [0, 0, 1, 1, 1, 0],
           [0, 0, 0, 0, 0, 0],
           [0, 0, 0, 0, 0, 0]
          ]    
    c_1 = [
           [0, 0, 0, 0, 0, 0],
           [0, 0, 1, 0, 0, 0],
           [0, 0, 1, 1, 0, 0],
           [0, 0, 0, 1, 0, 0],
           [0, 0, 0, 0, 0, 0]
          ]    
    c_2 = [
           [0, 0, 0, 0, 0, 0],
           [0, 0, 1, 1, 0, 0],
           [0, 0, 1, 1, 0, 0],
           [0, 0, 1, 1, 0, 0],
           [0, 0, 0, 0, 0, 0]
          ]    
    c_3 = [
           [0, 0, 0, 0, 0, 0],
           [0, 0, 1, 1, 0, 0],
           [0, 1, 0, 0, 1, 0],
           [0, 0, 1, 1, 0, 0],
           [0, 0, 0, 0, 0, 0]
          ]    
    Grid.new(a_0).tick.cells.should == a_1
    Grid.new(a_0).tick.tick.cells.should == a_2
    Grid.new(b_0).tick.cells.should == b_1
    Grid.new(b_0).tick.tick.cells.should == b_2
    Grid.new(c_0).tick.cells.should == c_1
    Grid.new(c_0).tick.tick.cells.should == c_2
    Grid.new(c_0).tick.tick.tick.cells.should == c_3
  end
  it 'should return a string' do
    Grid.new(@a).tick.to_s.should == "    \n    \n xx \n    \n    \n"
  end
end

