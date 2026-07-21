# @param {Integer} n
# @param {Integer} m
# @param {Integer} k
# @return {Integer}
def num_of_arrays(n, m, k)
    mod = 10**9 + 7
    dp = Array.new(n + 1) { Array.new(k + 1) { Array.new(m + 1, -1) } }

    solve = lambda do |idx, search_cost, max_value|
        if idx == n
            return search_cost == k ? 1 : 0
        end
        if search_cost > k
            return 0
        end
        if dp[idx][search_cost][max_value] != -1
            return dp[idx][search_cost][max_value]
        end

        result = 0
        (1..m).each do |i|
            if i > max_value
                result = (result + solve.call(idx + 1, search_cost + 1, i)) % mod
            else
                result = (result + solve.call(idx + 1, search_cost, max_value)) % mod
            end
        end

        dp[idx][search_cost][max_value] = result
        result
    end

    solve.call(0, 0, 0)
end
