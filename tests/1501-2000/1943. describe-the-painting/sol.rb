def split_painting(segments)
    events = []
    segments.each do |start, ending, color|
        events << [start, color]
        events << [ending, -color]
    end
    events.sort!
    
    prev = -1
    ans = []
    mix = 0
    events.each do |pos, val|
        if prev != -1
            if pos != prev && mix != 0
                ans << [prev, pos, mix]
            end
        end
        prev = pos
        mix += val
    end
    ans
end
