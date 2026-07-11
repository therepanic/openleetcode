# @param {Integer[]} values
# @return {Integer}
def max_score_sightseeing_pair(values)
    n = values.length
    suffix_max = [0] * n
    suffix_max[n - 1] = values[n - 1] - (n - 1)
    
    (n - 2).downto(0) do |i|
        suffix_max[i] = [suffix_max[i + 1], values[i] - i].max
    end
    
    max_score = -Float::INFINITY
    (0...n - 1).each do |i|
        max_score = [max_score, values[i] + i + suffix_max[i + 1]].max
    end
    
    max_score
end
