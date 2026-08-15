# @param {String} n
# @return {Integer}
def min_partitions(n)
    n.chars.map(&:to_i).max
end
