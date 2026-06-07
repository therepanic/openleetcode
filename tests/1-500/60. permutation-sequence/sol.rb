def get_permutation(n, k)
  nums = []
  factorial = Array.new(n + 1, 1)

  1.upto(n) do |i|
    nums << i
    factorial[i] = factorial[i - 1] * i
  end

  k -= 1
  res = +''
  n.downto(1) do |remaining|
    block = factorial[remaining - 1]
    idx = k / block
    k %= block
    res << nums[idx].to_s
    nums.delete_at(idx)
  end
  res
end
