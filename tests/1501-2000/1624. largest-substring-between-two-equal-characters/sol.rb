def max_length_between_equal_characters(s)
    first_pos = Array.new(26, -1)
    last_pos = Array.new(26, -1)
    n = s.length
    (0...n).each do |i|
        idx = s[i].ord - 'a'.ord
        first_pos[idx] = i if first_pos[idx] == -1
    end
    (n-1).downto(0) do |i|
        idx = s[i].ord - 'a'.ord
        last_pos[idx] = i if last_pos[idx] == -1
    end
    max_len = -1
    (0...26).each do |i|
        if first_pos[i] != -1 && last_pos[i] != -1
            max_len = [max_len, last_pos[i] - first_pos[i] - 1].max
        end
    end
    max_len
end
