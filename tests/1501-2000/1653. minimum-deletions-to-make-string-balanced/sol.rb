# @param {String} s
# @return {Integer}
def minimum_deletions(s)
    res = 0
    count = 0
    s.each_char do |ch|
        if ch == 'b'
            count += 1
        elsif count > 0
            res += 1
            count -= 1
        end
    end
    res
end
