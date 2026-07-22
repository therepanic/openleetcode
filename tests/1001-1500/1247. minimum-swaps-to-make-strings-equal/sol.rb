# @param {String} s1
# @param {String} s2
# @return {Integer}
def minimum_swap(s1, s2)
    n = s1.length
    s1_x = 0
    s1_y = 0
    (0...n).each do |i|
        next if s1[i] == s2[i]
        if s1[i] == "x"
            s1_x += 1
        else
            s1_y += 1
        end
    end

    return -1 if s1_x % 2 != s1_y % 2

    swaps = s1_x / 2 + s1_y / 2
    s1_x % 2 == 0 ? swaps : swaps + 2
end
