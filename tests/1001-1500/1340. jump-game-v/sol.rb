# @param {Integer[]} arr
# @param {Integer} d
# @return {Integer}
def max_jumps(arr, d)
    n = arr.length
    dp = Array.new(n, -1)

    dfs = lambda do |i|
        return dp[i] if dp[i] != -1

        best = 1

        # Right scan
        (i + 1).upto([n - 1, i + d].min) do |nxt|
            break if arr[nxt] >= arr[i]
            best = [best, 1 + dfs.call(nxt)].max
        end

        # Left scan
        (i - 1).downto([0, i - d].max) do |nxt|
            break if arr[nxt] >= arr[i]
            best = [best, 1 + dfs.call(nxt)].max
        end

        dp[i] = best
        dp[i]
    end

    (0...n).map { |i| dfs.call(i) }.max
end
