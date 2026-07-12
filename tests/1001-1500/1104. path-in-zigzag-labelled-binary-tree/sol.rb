def path_in_zig_zag_tree(label)
  res = []
  cur = label
  while cur > 0
    res << cur
    start = 1
    start *= 2 while start * 2 <= cur
    ending = start * 2 - 1
    cur = (start + ending - cur) / 2
  end
  res.reverse
end
