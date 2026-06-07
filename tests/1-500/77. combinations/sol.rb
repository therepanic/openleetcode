def combine(n, k)
  res = []
  cur = []
  dfs = nil
  dfs = lambda do |start|
    if cur.length == k
      res << cur.dup
      return
    end
    (start..n).each do |i|
      cur << i
      dfs.call(i + 1)
      cur.pop
    end
  end
  dfs.call(1)
  res
end
