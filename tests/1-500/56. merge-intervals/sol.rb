def merge(intervals)
  intervals.sort!
  merged = []

  intervals.each do |interval|
    if merged.empty? || merged[-1][1] < interval[0]
      merged << interval
    else
      merged[-1][1] = [merged[-1][1], interval[1]].max
    end
  end

  merged
end
