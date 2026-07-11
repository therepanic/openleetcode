# @param {Integer[]} difficulty
# @param {Integer[]} profit
# @param {Integer[]} worker
# @return {Integer}
def max_profit_assignment(difficulty, profit, worker)
    jobs = difficulty.zip(profit).sort_by(&:first)
    worker.sort!
    ans = 0
    best = 0
    i = 0
    worker.each do |ability|
        while i < jobs.length && jobs[i][0] <= ability
            best = [best, jobs[i][1]].max
            i += 1
        end
        ans += best
    end
    ans
end
