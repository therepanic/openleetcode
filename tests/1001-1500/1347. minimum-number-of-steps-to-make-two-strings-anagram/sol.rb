# @param {String} s
# @param {String} t
# @return {Integer}
def min_steps(s, t)
    dic = Hash.new(0)
    t.each_char { |ch| dic[ch] += 1 }
    s.each_char { |ch| dic[ch] -= 1 if dic[ch] > 0 }
    dic.values.sum
end
