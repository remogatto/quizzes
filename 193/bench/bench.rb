require 'benchmark'
require '../lib/gol.rb'

@grid_100 = Grid.generate(100, 100)
@grid_60 = Grid.generate(60, 60)

Benchmark.bm do |b|
  b.report('w: 100 h: 100 ticks: 10') { 10.times { @grid_100.tick! } }
  b.report('w: 60 h: 60 ticks: 10') { 10.times { @grid_60.tick! } }
end

