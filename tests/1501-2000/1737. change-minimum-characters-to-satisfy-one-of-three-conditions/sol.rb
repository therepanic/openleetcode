# @param {String} a
# @param {String} b
# @return {Integer}
def min_characters(a, b)
    freq_a = Array.new(26, 0)
    freq_b = Array.new(26, 0)

    a.each_char { |ch| freq_a[ch.ord - 'a'.ord] += 1 }
    b.each_char { |ch| freq_b[ch.ord - 'a'.ord] += 1 }

    len_a = a.length
    len_b = b.length
    res = Float::INFINITY
    sum_a = 0
    sum_b = 0

    (0...25).each do |i|
        sum_a += freq_a[i]
        sum_b += freq_b[i]
        res = [res, len_a - sum_a + sum_b, len_b - sum_b + sum_a].min
    end

    (0...26).each do |i|
        res = [res, (len_a - freq_a[i]) + (len_b - freq_b[i])].min
    end

    res
end
