# @param {Integer[]} start_time
# @param {Integer[]} end_time
# @param {Integer[]} profit
# @return {Integer}
def job_scheduling(start_time, end_time, profit)
    n = start_time.length
    jobs = (0...n).map { |i| [start_time[i], end_time[i], profit[i]] }
    jobs.sort_by! { |j| j[0] }
    start_time = jobs.map { |j| j[0] }
    end_time = jobs.map { |j| j[1] }
    profit = jobs.map { |j| j[2] }
    
    dp = Array.new(n + 1, 0)
    (n - 1).downto(0) do |i|
        idx = start_time.bsearch_index { |s| s >= end_time[i] }
        idx = n if idx.nil?
        take = profit[i] + dp[idx]
        not_take = dp[i + 1]
        dp[i] = [take, not_take].max
    end
    dp[0]
end
