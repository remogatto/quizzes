require 'lib/gol.rb'


describe Grid do
  
end

describe Cell do
  before :all do
    @grid = [0, 0, 0, 0, 0, 0, 0, 0, 0,
             1, 0, 0, 1, 1, 1, 0, 0, 0,
             0, 1, 0, 0, 0, 1, 0, 1, 0,
             1, 1, 1, 0, 1, 0, 0, 1, 0,
             0, 0, 0, 1, 0, 0, 0, 0, 0,
             0, 0, 0, 1, 0, 1, 0, 1, 0,
             1, 1, 0, 1, 0, 1, 0, 1, 0,
             0, 0, 0, 0, 0, 0, 0, 0, 0,
             0, 0, 0, 1, 0, 1, 0, 1, 0
            ]
  end
  it 'should return its neighbours'
end
