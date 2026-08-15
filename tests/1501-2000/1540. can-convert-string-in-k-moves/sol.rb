def can_convert_string(s, t, k)
    return false if s.length != t.length
    shift_count = Array.new(26, 0)
    (0...s.length).each do |i|
        next if s[i] == t[i]
        diff = (t[i].ord - s[i].ord) % 26
        shift_count[diff] += 1
        return false if diff + 26 * (shift_count[diff] - 1) > k
    end
    true
end
