def subsets_with_dup(nums)
  nums.sort!
  res = []
  cur = []
  dfs = nil
  dfs = lambda do |start|
    res << cur.dup
    i = start
    while i < nums.length
      if i == start || nums[i] != nums[i - 1]
        cur << nums[i]
        dfs.call(i + 1)
        cur.pop
      end
      i += 1
    end
  end
  dfs.call(0)
  res
end
