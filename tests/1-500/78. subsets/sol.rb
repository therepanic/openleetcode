def subsets(nums)
  res = [[]]
  nums.each do |x|
    res += res.map { |cur| cur + [x] }
  end
  res
end
