# @param {String[]} pizza
# @param {Integer} k
# @return {Integer}
def ways(pizza, k)
    m, n = pizza.length, pizza[0].length
    mod = 10 ** 9 + 7
    pre_sum = Array.new(m + 1) { Array.new(n + 1, 0) }

    (m - 1).downto(0) do |r|
        (n - 1).downto(0) do |c|
            pre_sum[r][c] = pre_sum[r][c + 1] + pre_sum[r + 1][c] - pre_sum[r + 1][c + 1] + (pizza[r][c] == 'A' ? 1 : 0)
        end
    end

    dp = Array.new(k) { Array.new(m) { Array.new(n, 0) } }

    (0...m).each do |r|
        (0...n).each do |c|
            dp[0][r][c] = pre_sum[r][c] > 0 ? 1 : 0
        end
    end

    (1...k).each do |cuts|
        (0...m).each do |r|
            (0...n).each do |c|
                next if pre_sum[r][c] == 0
                ans = 0
                (r + 1...m).each do |nr|
                    if pre_sum[r][c] - pre_sum[nr][c] > 0
                        ans = (ans + dp[cuts - 1][nr][c]) % mod
                    end
                end
                (c + 1...n).each do |nc|
                    if pre_sum[r][c] - pre_sum[r][nc] > 0
                        ans = (ans + dp[cuts - 1][r][nc]) % mod
                    end
                end
                dp[cuts][r][c] = ans
            end
        end
    end

    dp[k - 1][0][0]
end
