# @param {Integer[]} nums
# @param {Integer} k
# @return {Float}
def largest_sum_of_averages(nums, k)
    n = nums.length
    pref = [0]
    nums.each { |x| pref << pref[-1] + x }
    dp = Array.new(n+1) { Array.new(k+1, 0.0) }
    (1..n).each { |i| dp[i][1] = pref[i].to_f / i }
    (2..k).each do |p|
        (p..n).each do |i|
            best = 0.0
            (p-1...i).each do |j|
                val = dp[j][p-1] + (pref[i] - pref[j]).to_f / (i - j)
                best = val if val > best
            end
            dp[i][p] = best
        end
    end
    dp[n][k]
end
