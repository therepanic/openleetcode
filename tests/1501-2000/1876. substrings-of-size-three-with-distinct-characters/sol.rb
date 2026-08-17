# @param {String} s
# @return {Integer}
def count_good_substrings(s)
    n = s.length
    count = 0
    (0...(n-2)).each do |i|
        count += 1 if s[i,3].chars.uniq.length == 3
    end
    count
end
