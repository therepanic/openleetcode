# @param {String} s
# @return {Integer}
def max_score(s)
    total_ones = s.count('1')
    zeros_count = 0
    ones_count = 0
    best_score = -Float::INFINITY

    (0...(s.length - 1)).each do |i|
        if s[i] == '0'
            zeros_count += 1
        else
            ones_count += 1
        end

        current_score = zeros_count + (total_ones - ones_count)
        best_score = [best_score, current_score].max
    end

    best_score
end
