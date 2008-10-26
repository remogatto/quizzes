class ScoreTable

  attr_reader :player, :frames, :final_score

  def initialize(player, pins)
    @player, @pins = player, pins
    @final_score, @frames = 0, []
    compile_frames
  end

  def print
    printf("%s\n\n", "#{@player}'s final score: #{@final_score}")
    printf("%5s %10s %10s %10s\n", 'Frame', 'Roll', 'Roll', 'Score')
    @frames.each { |frame| printf("%3s %10s %10s %10s\n", *frame) }
  end

  private

  def pin(pin)
    return '' if pin.nil?
    return '-' if pin.zero?
    pin
  end

  def frame_at(index)
    @frames[index] ||= []
  end

  def compile_frames

    @pins.each_with_index do |pin, index|
      if index >= 10
        frame_at(index) << '*' << pin(pin) << pin(@pins[index.succ]) << ''
      elsif pin == 10
        @final_score += pin + @pins[index.succ] + @pins[index.succ.succ]
        frame_at(index) << index.succ << 'X' << '' << @final_score
      elsif (pin + @pins[index.succ]) == 10
        @final_score += pin + @pins[index.succ] + @pins[index.succ.succ]
        frame_at(index) << index.succ << pin(pin) << '/' << @final_score
      else
        @final_score += pin + @pins[index.succ]
        frame_at(index) << index.succ << pin(pin) << pin(@pins[index.succ]) << @final_score
      end
      @pins.shift unless pin == 10
    end

  end

end

ScoreTable.new(ARGV[0], ARGV[1..-1].map { |arg| arg.to_i }).print if $0 == __FILE__
