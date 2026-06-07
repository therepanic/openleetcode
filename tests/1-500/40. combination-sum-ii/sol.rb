def combination_sum2(candidates, target)
  candidates.sort!
  res = []

  backtrack = nil
  backtrack = lambda do |start, total, cur|
    if total == target
      res << cur.dup
      return
    end

    prev = nil
    (start...candidates.length).each do |i|
      next if !prev.nil? && candidates[i] == prev
      break if total + candidates[i] > target
      cur << candidates[i]
      backtrack.call(i + 1, total + candidates[i], cur)
      cur.pop
      prev = candidates[i]
    end
  end

  backtrack.call(0, 0, [])
  res
end
