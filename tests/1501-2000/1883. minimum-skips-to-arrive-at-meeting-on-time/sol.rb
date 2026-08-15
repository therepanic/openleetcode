# @param {Integer[]} dist
# @param {Integer} speed
# @param {Integer} hours_before
# @return {Integer}
def min_skips(dist, speed, hours_before)
    inf = 10**30
    n = dist.length
    dp = [inf] * (n + 1)
    dp[0] = 0
    dist.each_with_index do |d, i|
        nxt = [inf] * (n + 1)
        (0..i+1).each do |skips|
            next if dp[skips] >= inf
            nxt[skips + 1] = [nxt[skips + 1], dp[skips] + d].min
            arrival = dp[skips] + d
            if i != n - 1
                arrival = ((arrival + speed - 1) / speed) * speed
            end
            nxt[skips] = [nxt[skips], arrival].min
        end
        dp = nxt
    end
    limit = hours_before * speed
    dp.each_with_index do |arrival, skips|
        return skips if arrival <= limit
    end
    -1
end
