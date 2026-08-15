def get_lucky(s, k)
    res = ''
    s.each_char do |c|
        res += (c.ord - 'a'.ord + 1).to_s
    end
    k.times do
        res = res.chars.map(&:to_i).sum.to_s
    end
    res.to_i
end
