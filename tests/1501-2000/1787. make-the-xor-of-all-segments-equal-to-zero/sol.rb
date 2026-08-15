# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def min_changes(nums, k)
    freq = Hash.new { |h, k| h[k] = Hash.new(0) }
    nums.each_with_index do |x, i|
        freq[i % k][x] += 1
    end
    
    n = 1 << 10
    dp = [0] + [-Float::INFINITY] * (n - 1)
    (0...k).each do |i|
        mx = dp.max
        tmp = Array.new(n, 0)
        (0...n).each do |x|
            c = dp[x]
            freq[i].each do |xx, cc|
                tmp[x ^ xx] = [tmp[x ^ xx], c + cc, mx].max
            end
        end
        dp = tmp
    end
    nums.length - dp[0]
end
