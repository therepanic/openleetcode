# @param {Integer} n
# @param {Integer} goal
# @param {Integer} k
# @return {Integer}
def num_music_playlists(n, goal, k)
    mod = 10**9 + 7
    dp = Array.new(2) { Array.new(n + 1, 0) }
    dp[0][0] = 1

    (1..goal).each do |i|
        dp[i % 2][0] = 0
        (1..[i, n].min).each do |j|
            dp[i % 2][j] = dp[(i - 1) % 2][j - 1] * (n - (j - 1)) % mod
            if j > k
                dp[i % 2][j] = (dp[i % 2][j] + dp[(i - 1) % 2][j] * (j - k)) % mod
            end
        end
    end

    dp[goal % 2][n]
end
