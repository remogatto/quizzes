class ScoreTable

  attr_reader :player, :frames, :final_score

  def initialize(player, pins)
    @player, @pins = player, pins
    @final_score, @frames = 0, []
    compile_frames
  end

  def show_table
    printf("%s\n\n", "#{@player}'s final score: #{@final_score}")
    printf("%5s %10s %10s %10s\n", 'Frame', 'Roll', 'Roll', 'Score')
    @frames.each_with_index do |frame, index|
      printf("%3s %10s %10s %10s\n", frame[0], frame[1], frame[2], frame[3])
    end
  end

  private

  def pin(pin)
    pin.zero? ? '-' : pin
  end

  def compile_frames

    frame_id = 0

    @pins.each_with_index do |pin, index|

      if frame_id < 10
        if pin == 10
          @final_score += pin + @pins[index.succ] + @pins[index.succ.succ]
          @frames[frame_id] ||= [] << (frame_id + 1) << 'X' << '' << @final_score
        elsif (pin + @pins[index.succ]) == 10
          @final_score += pin + @pins[index.succ] + @pins[index.succ.succ]
          @frames[frame_id] ||= [] << (frame_id + 1) << pin(pin) << '/' << @final_score
          @pins.shift
        else
          @final_score += pin + @pins[index.succ]
          @frames[frame_id] ||= [] << (frame_id + 1) << pin(pin) << pin(@pins[index.succ]) << @final_score
          @pins.shift        
        end        
      else
        @frames[frame_id] ||= [] << '*' << pin(pin)
      end
        frame_id += 1
    end

  end

end
