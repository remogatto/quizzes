require 'rubygems'
require 'spec'
require 'lib/bowling_scores'

def capture_stdout
  s = StringIO.new
  oldstdout = $stdout
  $stdout = s
  yield
  s.string
ensure
  $stdout = oldstdout    
end

JOHN_SCORE_TABLE = <<EOS
John\'s final score: 140

Frame       Roll       Roll      Score
  1          6          2          8
  2          7          1         16
  3          X                    35
  4          9          -         44
  5          8          /         64
  6          X                    87
  7          X                   105
  8          3          5        113
  9          7          2        122
 10          5          /        140
  *          8                      
EOS

MARY_SCORE_TABLE = <<EOS
Mary\'s final score: 82

Frame       Roll       Roll      Score
  1          9          -          9
  2          3          5         17
  3          6          1         24
  4          3          6         33
  5          8          1         42
  6          5          3         50
  7          2          5         57
  8          8          -         65
  9          7          1         73
 10          8          1         82
EOS

describe ScoreTable do

  before do
    @john_pins = [6, 2, 7, 1, 10, 9, 0, 8, 2, 10, 10, 3, 5, 7, 2, 5, 5, 8]
    @mary_pins = [9, 0, 3, 5, 6, 1, 3, 6, 8, 1, 5, 3, 2, 5, 8, 0, 7, 1, 8, 1]
    @perfect_game = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
  end

  it 'should correctly register per frame scores' do
    ScoreTable.new('John', @john_pins).frames.should == [
                                                          [1, 6, 2, 8], 
                                                          [2, 7, 1, 16], 
                                                          [3, 'X', '', 35], 
                                                          [4, 9, '-', 44], 
                                                          [5, 8, '/', 64], 
                                                          [6, 'X', '', 87], 
                                                          [7, 'X', '', 105], 
                                                          [8, 3, 5, 113], 
                                                          [9, 7, 2, 122], 
                                                          [10, 5, '/', 140], 
                                                          ['*', 8]
                                                         ]
    ScoreTable.new('Mary', @mary_pins).frames.should == [
                                                         [1, 9, '-', 9], 
                                                         [2, 3, 5, 17], 
                                                         [3, 6, 1, 24], 
                                                         [4, 3, 6, 33], 
                                                         [5, 8, 1, 42], 
                                                         [6, 5, 3, 50], 
                                                         [7, 2, 5, 57], 
                                                         [8, 8, '-', 65], 
                                                         [9, 7, 1, 73], 
                                                         [10, 8, 1, 82]
                                                        ]
  end

  it 'should calculate the final score' do
    ScoreTable.new('John', @john_pins).final_score.should == 140
    ScoreTable.new('Mary', @mary_pins).final_score.should == 82
  end

  it 'should score 0 if no pins were held' do
    ScoreTable.new('John', Array.new(10, 0)).final_score.should == 0
  end

  it 'should score 300 in case of perfect game' do
    ScoreTable.new('John', @perfect_game).final_score.should == 300
  end

  it 'should display a score table' do
    capture_stdout do 
      ScoreTable.new('John', @john_pins).show_table
    end.should == JOHN_SCORE_TABLE
    capture_stdout do 
      ScoreTable.new('Mary', @mary_pins).show_table
    end.should == MARY_SCORE_TABLE    
  end

end
