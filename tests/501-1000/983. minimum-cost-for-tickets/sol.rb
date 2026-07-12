# @param {Integer[]} days
# @param {Integer[]} costs
# @return {Integer}
def mincost_tickets(days, costs)
    n = days.length
    left7 = 0
    left30 = 0
    dp = Array.new(n, 0)
    
    (0...n).each do |right|
        while days[right] - days[left7] >= 7
            left7 += 1
        end
        while days[right] - days[left30] >= 30
            left30 += 1
        end
        
        cost1 = (right > 0 ? dp[right - 1] : 0) + costs[0]
        cost7 = (left7 > 0 ? dp[left7 - 1] : 0) + costs[1]
        cost30 = (left30 > 0 ? dp[left30 - 1] : 0) + costs[2]
        
        dp[right] = [cost1, cost7, cost30].min
    end
    
    dp[n - 1]
end
