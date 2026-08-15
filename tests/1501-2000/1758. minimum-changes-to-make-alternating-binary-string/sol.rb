# @param {String} s
# @return {Integer}
def min_operations(s)
    c = 0
    j = 0
    n = s.length
    s.each_char do |ch|
        if ch.to_i == j
            c += 1
        end
        j ^= 1
    end
    [c, n - c].min
end
