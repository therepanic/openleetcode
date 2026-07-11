# @param {Integer[]} rods
# @return {Integer}
def tallest_billboard(rods)
  n = rods.length
  left = []
  right = []
  mid = (n - 1) >> 1

  gen = lambda do |idx, last, a, b, vals|
    if idx == last + 1
      vals << [a - b, b]
      return
    end
    gen.call(idx + 1, last, a, b, vals)
    gen.call(idx + 1, last, a + rods[idx], b, vals)
    gen.call(idx + 1, last, a, b + rods[idx], vals)
  end

  gen.call(0, mid, 0, 0, left)
  gen.call(mid + 1, n - 1, 0, 0, right)

  left.sort_by! { |d, b| [d, -b] }
  right.sort_by! { |d, b| [d, -b] }

  ans = 0
  right_diffs = right.map { |r| r[0] }
  right_vals = right.map { |r| r[1] }

  left.each do |d, b|
    target = -d
    idx = right_diffs.bsearch_index { |x| x >= target }
    if idx && right_diffs[idx] == target
      ans = [ans, b + right_vals[idx]].max
    end
  end
  ans
end
