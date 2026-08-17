# @param {Integer} n
# @param {Integer[][]} rides
# @return {Integer}
def max_taxi_earnings(n, rides)
    rides.sort_by! { |r| r[1] }
    dp = [[0, 0]]
    
    rides.each do |start, ending, tip|
        i = dp.bsearch_index { |(end_time, _)| end_time > start } || dp.length
        i -= 1
        profit = dp[i][1] + ending - start + tip
        
        if profit > dp[-1][1]
            dp << [ending, profit]
        end
    end
    
    dp[-1][1]
end
