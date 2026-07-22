# @param {Integer[]} hours
# @return {Integer}
def longest_wpi(hours)
    score = 0
    longest_interval = 0
    seen_at = {0 => -1}
    
    hours.each_with_index do |h, i|
        score += h > 8 ? 1 : -1
        
        if score > 0
            longest_interval = i + 1
        elsif seen_at.key?(score - 1)
            longest_interval = [longest_interval, i - seen_at[score - 1]].max
        end
        
        seen_at[score] = i unless seen_at.key?(score)
    end
    
    longest_interval
end
