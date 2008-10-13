require 'rubygems'
require 'spec'
require 'lib/modulo'

describe 'In modular arithmetic' do

  describe ' comparation' do

    it 'm(23) should be congruent with m(23)' do
      Modulo.new(23).should == Modulo.new(23)
    end

    it 'm(23) should be congruent with m(179)' do
      Modulo.new(23).should == Modulo.new(179)
    end

    it 'm(-23) should be congruent with m(179)' do
      Modulo.new(-23).should == Modulo.new(3)
    end

    it 'm(15) should be greter than m(30)' do
      (Modulo.new(15) <=> Modulo.new(30)).should == 1
    end

    it 'm(15) should be greter than 35' do
      (Modulo.new(15) <=> 35).should == -1
    end

  end

  describe 'addition of' do

    it 'm(15) + 0 should be equal to m(15)' do
      (Modulo.new(15) + 0).should == Modulo.new(15)
    end

    it 'm(15) + m(19) should be equal to m(8)' do
      (Modulo.new(15) + Modulo.new(19)).should == Modulo.new(8)
    end

    it 'm(15) + 21 should be equal to m(10)' do
      (Modulo.new(15) + 21).should == Modulo.new(10)
    end

  end

  describe 'multiplication of' do

    it 'm(15) * m(7) should be equal to m(1)' do
      (Modulo.new(15) * Modulo.new(7)).should == Modulo.new(1)
    end

    it 'm(15) * 11 should be equal to m(9)' do
      (Modulo.new(15) * 11).should == Modulo.new(9)
    end

    it '11 * m(15, 8) should be equal to m(9)' do
      (11 * Modulo.new(15, 8)).should == 77
    end

  end

  describe 'subtraction of' do

    it 'm(15) - m(19) should be equal to m(22)' do
      (Modulo.new(15) - Modulo.new(19)).should == Modulo.new(22)
    end

    it 'm(15) - 66 should be equal to m(1)' do
      (Modulo.new(15) - 66).should == Modulo.new(1)
    end

  end

  describe 'sort method' do

    it 'should order an array of modulo objects' do
      x = [Modulo.new(15), Modulo.new(29), Modulo.new(-6), Modulo.new(57)]
      y = [3, 5, 15, 20]
      x.sort.should == y
    end

  end
end
