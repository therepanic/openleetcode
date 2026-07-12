# @param {String[]} strs
# @return {Integer}
def min_deletion_size(strs)
    m = strs[0].length
    dp = Array.new(m, 1)
    
    (0...m).each do |i|
        (0...i).each do |j|
            if strs.all? { |row| row[j] <= row[i] }
                dp[i] = [dp[i], dp[j] + 1].max
            end
        end
    end
    
    m - dp.max
end
