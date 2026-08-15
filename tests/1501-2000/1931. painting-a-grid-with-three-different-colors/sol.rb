# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def color_the_grid(m, n)
    mod = 10**9+7
    total = 1
    m.times { total *= 3 }
    dp = Array.new(n+1) { Array.new(total, 0) }
    rowValid = Array.new(total) { Array.new(total, 0) }
    good = []
    pattern = Array.new(total) { [] }
    (0...total).each do |i|
        val = i
        valid = 1
        m.times do
            pattern[i] << val % 3
            val /= 3
        end
        (1...m).each do |j|
            if pattern[i][j] == pattern[i][j-1]
                valid = 0
            end
        end
        good << i if valid == 1
    end
    good.each { |i| dp[1][i] = 1 }
    good.each do |i|
        good.each do |j|
            rowValid[i][j] = 1
            (0...m).each do |k|
                if pattern[i][k] == pattern[j][k]
                    rowValid[i][j] = 0
                end
            end
        end
    end
    (2..n).each do |col|
        good.each do |i|
            total_ways = 0
            good.each do |j|
                if rowValid[i][j] == 1
                    total_ways += dp[col-1][j]
                end
            end
            dp[col][i] = total_ways % mod
        end
    end
    dp[n].sum % mod
end
