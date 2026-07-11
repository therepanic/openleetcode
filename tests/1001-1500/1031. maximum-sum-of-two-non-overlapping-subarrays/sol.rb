# @param {Integer[]} nums
# @param {Integer} first_len
# @param {Integer} second_len
# @return {Integer}
def max_sum_two_no_overlap(nums, first_len, second_len)
  solve = lambda do |a, b|
    n = nums.length
    prefix = Array.new(n + 1, 0)
    (0...n).each { |i| prefix[i + 1] = prefix[i] + nums[i] }
    best_a = prefix[a]
    ans = 0
    (a + b..n).each do |end_idx|
      best_a = [best_a, prefix[end_idx - b] - prefix[end_idx - b - a]].max
      ans = [ans, best_a + prefix[end_idx] - prefix[end_idx - b]].max
    end
    ans
  end

  [solve.call(first_len, second_len), solve.call(second_len, first_len)].max
end
