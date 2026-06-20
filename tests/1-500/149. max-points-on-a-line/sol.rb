def max_points(points)
  return points.length if points.length <= 2

  gcd = lambda do |a, b|
    a = a.abs
    b = b.abs
    while b != 0
      a, b = b, a % b
    end
    a
  end

  best = 0
  points.length.times do |i|
    count = Hash.new(0)
    local = 0
    duplicates = 1
    x1, y1 = points[i]
    (i + 1...points.length).each do |j|
      dx = points[j][0] - x1
      dy = points[j][1] - y1
      if dx == 0 && dy == 0
        duplicates += 1
        next
      end
      g = gcd.call(dx, dy)
      dx /= g
      dy /= g
      if dx < 0
        dx = -dx
        dy = -dy
      elsif dx == 0
        dy = 1
      elsif dy == 0
        dx = 1
      end
      key = [dx, dy]
      count[key] += 1
      local = [local, count[key]].max
    end
    best = [best, local + duplicates].max
  end
  best
end
