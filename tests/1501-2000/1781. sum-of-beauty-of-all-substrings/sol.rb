# @param {String} s
# @return {Integer}
def beauty_sum(s)
    n = s.length
    sum_of_beauty = 0
    (0...n).each do |i|
        freq = Array.new(26, 0)
        (i...n).each do |j|
            freq[s[j].ord - 97] += 1
            maxi = -Float::INFINITY
            mini = Float::INFINITY
            freq.each do |diff|
                if diff > 0
                    maxi = [maxi, diff].max
                    mini = [mini, diff].min
                end
            end
            sum_of_beauty += (maxi - mini)
        end
    end
    sum_of_beauty
end
