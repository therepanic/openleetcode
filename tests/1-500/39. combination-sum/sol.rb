def combination_sum(candidates, target)
  candidates.sort!
  res = []

  backtrack = nil
  backtrack = lambda do |start, total, cur|
    if total == target
      res << cur.dup
      return
    end

    (start...candidates.length).each do |i|
      break if total + candidates[i] > target
      cur << candidates[i]
      backtrack.call(i, total + candidates[i], cur)
      cur.pop
    end
  end

  backtrack.call(0, 0, [])
  res
end
