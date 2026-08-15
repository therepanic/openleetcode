# @param {String} s
# @param {Integer[]} indices
# @return {String}
def restore_string(s, indices)
    res = Array.new(indices.length, '')
    indices.each_with_index do |idx, i|
        res[idx] = s[i]
    end
    res.join
end
