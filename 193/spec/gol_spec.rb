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
    Grid.new(a_0).tick!.should == a_1

    grid = Grid.new(a_0)
    grid.tick!.should == a_1
    grid.tick!.should == a_2

    grid = Grid.new(b_0)
    grid.tick!.should == b_1
    grid.tick!.should == b_2

    grid = Grid.new(c_0)
    grid.tick!.should == c_1
    grid.tick!.should == c_2
    grid.tick!.should == c_3
  end
  it 'should return a string' do
    grid = Grid.new(@a)
    grid.tick!
    grid.to_s.should == "....\n....\n.oo.\n....\n....\n"
  end
end

