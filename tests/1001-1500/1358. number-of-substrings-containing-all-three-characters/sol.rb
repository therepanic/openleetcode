# @param {String} s
# @return {Integer}
def number_of_substrings(s)
    res = 0
    p = [50000, -1, -1, -1]
    s.each_char.with_index do |ch, i|
        p[ch.ord & 31] = i
        res += p.min + 1
    end
    res
end
