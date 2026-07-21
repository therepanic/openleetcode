# @param {Integer[]} houses
# @param {Integer} k
# @return {Integer}
def min_distance(houses, k)
    n = houses.length
    houses.sort!
    pref = [0]
    houses.each { |h| pref << pref[-1] + h }
    
    g = Array.new(n) { Array.new(n, 0) }
    (0...n).each do |i|
        (i...n).each do |j|
            mid = (i + j) / 2
            count_left = mid - i + 1
            count_right = j - mid
            sum_left = pref[mid + 1] - pref[i]
            sum_right = pref[j + 1] - pref[mid + 1]
            g[i][j] = (houses[mid] * count_left - sum_left) + (sum_right - houses[mid] * count_right)
        end
    end
    
    dp = Array.new(k + 1) { Array.new(n + 1, Float::INFINITY) }
    dp[0][0] = 0
    
    (1..k).each do |m|
        (1..n).each do |j|
            best = Float::INFINITY
            (0...j).each do |i|
                cand = dp[m-1][i] + g[i][j-1]
                best = cand if cand < best
            end
            dp[m][j] = best
        end
    end
    
    dp[k][n].to_i
end
