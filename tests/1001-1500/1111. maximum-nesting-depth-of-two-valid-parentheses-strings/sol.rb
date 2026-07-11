# @param {String} seq
# @return {Integer[]}
def max_depth_after_split(seq)
    res = []
    depth = 0
    seq.each_char do |ch|
        if ch == '('
            depth += 1
            res << (depth % 2)
        else
            res << (depth % 2)
            depth -= 1
        end
    end
    res
end
