# @param {Integer} n
# @param {Integer} k
# @param {Integer} max_pts
# @return {Float}
def new21_game(n, k, max_pts)
    if k == 0 || n >= k - 1 + max_pts
        return 1.0
    end

    dp = [0.0] * max_pts
    dp[0] = 1.0

    window_sum = 1.0
    result = 0.0

    (1..n).each do |i|
        prob = window_sum / max_pts

        if i < k
            window_sum += prob
        else
            result += prob
        end

        if i >= max_pts
            window_sum -= dp[i % max_pts]
        end

        dp[i % max_pts] = prob
    end

    result
end
