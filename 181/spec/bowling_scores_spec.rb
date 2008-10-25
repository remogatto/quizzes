require 'rubygems'
require 'spec'
require 'lib/bowling_scores'

describe 'bowling score table' do

  it 'should correctly register frames' do
    pins = [6, 2, 7, 1, 10, 9, 0, 8, 2, 10, 10, 3, 5, 7, 2, 5, 5, 8]
    compile_table(pins).should == [
                                   [6, 2, 8], 
                                   [7, 1, 16], 
                                   [10, 35], 
                                   [9, 0, 44], 
                                   [8, 2, 64], 
                                   [10, 87], 
                                   [10, 105], 
                                   [3, 5, 113], 
                                   [7, 2, 122], 
                                   [5, 5, 140], 
                                   [8]
                                  ]
  end

  it 'should score 300 in case of a perfect game' do
    pins = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
    compile_table(pins).should == [
                                   [10, 30], 
                                   [10, 60], 
                                   [10, 90], 
                                   [10, 120], 
                                   [10, 150], 
                                   [10, 180], 
                                   [10, 210], 
                                   [10, 240], 
                                   [10, 270],
                                   [10, 300], 
                                   [10], 
                                   [10]
                                  ]
  end

end
