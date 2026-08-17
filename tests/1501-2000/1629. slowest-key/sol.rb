def slowest_key(release_times, keys_pressed)
    max_time = release_times[0]
    ans = keys_pressed[0]
    (1...release_times.length).each do |i|
        curr_time = release_times[i] - release_times[i-1]
        if curr_time > max_time
            max_time = curr_time
            ans = keys_pressed[i]
        elsif curr_time == max_time
            ans = [ans, keys_pressed[i]].max
        end
    end
    ans
end
