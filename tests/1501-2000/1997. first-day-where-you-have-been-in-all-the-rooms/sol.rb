# @param {Integer[]} next_visit
# @return {Integer}
def first_day_been_in_all_rooms(next_visit)
    mod = 10**9 + 7
    n = next_visit.length
    dp = Array.new(n, 0)

    (1...n).each do |i|
        dp[i] = (2 * dp[i-1] - dp[next_visit[i-1]] + 2 + mod) % mod
    end
    
    dp[n-1]
end
