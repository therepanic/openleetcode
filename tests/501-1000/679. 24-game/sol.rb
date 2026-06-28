# @param {Integer[]} cards
# @return {Boolean}
def judge_point24(cards)
  eps = 1e-6

  dfs = lambda do |nums|
    return (nums[0] - 24.0).abs < eps if nums.length == 1

    (0...nums.length).each do |i|
      (0...nums.length).each do |j|
        next if i == j

        next_nums = nums.each_with_index.select { |_, idx| idx != i && idx != j }.map(&:first)
        a, b = nums[i], nums[j]

        candidates = [a + b, a - b, b - a, a * b]
        candidates << a / b if b.abs > eps
        candidates << b / a if a.abs > eps

        candidates.each do |val|
          return true if dfs.call(next_nums + [val])
        end
      end
    end
    false
  end

  dfs.call(cards.map(&:to_f))
end
