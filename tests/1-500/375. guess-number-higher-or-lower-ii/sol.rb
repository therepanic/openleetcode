# @param {Integer} n
# @return {Integer}
def get_money_amount(n)
    dp = Array.new(n + 1) { Array.new(n + 1, 0) }
    (2..n).each do |length|
        (n - length + 1).downto(1) do |start|
            end_val = start + length - 1
            dp[start][end_val] = Float::INFINITY
            (start..end_val).each do |pivot|
                left = pivot > start ? dp[start][pivot - 1] : 0
                right = pivot < end_val ? dp[pivot + 1][end_val] : 0
                dp[start][end_val] = [dp[start][end_val], pivot + [left, right].max].min
            end
        end
    end
    dp[1][n]
end
