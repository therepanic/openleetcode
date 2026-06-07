def insert(intervals, new_interval)
  res = []
  i = 0
  n = intervals.length

  while i < n && intervals[i][1] < new_interval[0]
    res << intervals[i]
    i += 1
  end

  while i < n && intervals[i][0] <= new_interval[1]
    new_interval[0] = [new_interval[0], intervals[i][0]].min
    new_interval[1] = [new_interval[1], intervals[i][1]].max
    i += 1
  end
  res << new_interval

  while i < n
    res << intervals[i]
    i += 1
  end

  res
end
