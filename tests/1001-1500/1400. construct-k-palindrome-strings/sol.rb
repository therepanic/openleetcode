# @param {String} s
# @param {Integer} k
# @return {Boolean}
def can_construct(s, k)
    return false if s.length < k

    char_count = Hash.new(0)
    s.each_char { |c| char_count[c] += 1 }

    odd_count = char_count.values.count { |freq| freq % 2 != 0 }
    odd_count <= k
end
