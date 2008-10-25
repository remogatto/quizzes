def compile_table(pins)

  frame_id, score = 0, 0
  frames = []

  pins.each_with_index do |pin, index|

    if frame_id < 10
      
      if pin == 10
        score += pin + pins[index.succ] + pins[index.succ.succ]
        frames[frame_id] ||= [] << pin << score
      elsif (pin + pins[index.succ]) == 10
        score += pin + pins[index.succ] + pins[index.succ.succ]
        frames[frame_id] ||= [] << pin << pins[index.succ] << score
        pins.shift
      else
        score += pin + pins[index.succ]
        frames[frame_id] ||= [] << pin << pins[index.succ] << score
        pins.shift        
      end
      
      frame_id += 1
      
    else
      frames[frame_id] ||= [] << pin if frame_id > 9
      frame_id += 1
    end

  end

  frames

end
