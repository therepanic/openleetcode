# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
def max_sum_after_partitioning(arr, k)
    n = arr.length
    dp = Array.new(n + 1, 0)
    (1..n).each do |i|
        curr = 0
        (1..k).each do |j|
            break if i < j
            curr = [curr, arr[i - j]].max
            dp[i] = [dp[i], dp[i - j] + curr * j].max
        end
    end
    dp[n]
end
