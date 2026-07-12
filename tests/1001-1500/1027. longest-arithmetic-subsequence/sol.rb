# @param {Integer[]} nums
# @return {Integer}
def longest_arith_seq_length(nums)
  n = nums.length
  return n if n <= 2
  dp = Array.new(n) { Hash.new(0) }
  ans = 2
  (0...n).each do |i|
    (0...i).each do |j|
      d = nums[i] - nums[j]
      prev = dp[j][d]
      prev = 1 if prev == 0
      dp[i][d] = [dp[i][d], prev + 1].max
      ans = [ans, dp[i][d]].max
    end
  end
  ans
end
