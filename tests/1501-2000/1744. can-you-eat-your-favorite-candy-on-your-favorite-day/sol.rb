# @param {Integer[]} candies_count
# @param {Integer[][]} queries
# @return {Boolean[]}
def can_eat(candies_count, queries)
    n = candies_count.length
    m = queries.length
    ans = Array.new(m, false)
    psum = Array.new(n + 1, 0)
    for i in 1..n
        psum[i] = psum[i - 1] + candies_count[i - 1]
    end
    for i in 0...m
        t, day, cap = queries[i]
        day += 1
        min_days = psum[t] / cap + 1
        max_days = psum[t + 1]
        ans[i] = (min_days <= day && day <= max_days)
    end
    ans
end
