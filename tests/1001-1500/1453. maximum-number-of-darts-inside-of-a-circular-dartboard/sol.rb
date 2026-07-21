# @param {Integer[][]} darts
# @param {Integer} r
# @return {Integer}
def num_points(darts, r)
  ans = 1
  radius = r.to_f
  radius_sq = radius * radius
  darts.each_with_index do |point1, i|
    ((i + 1)...darts.length).each do |j|
      point2 = darts[j]
      x1, y1 = point1
      x2, y2 = point2
      dx = x2 - x1
      dy = y2 - y1
      distance_sq = dx * dx + dy * dy
      next if distance_sq > 4.0 * radius_sq
      distance = Math.sqrt(distance_sq)
      midpoint_x = (x1 + x2) / 2.0
      midpoint_y = (y1 + y2) / 2.0
      offset = Math.sqrt([0.0, radius_sq - distance_sq / 4.0].max)
      normal_x = -dy / distance
      normal_y = dx / distance
      [-1.0, 1.0].each do |sign|
        center_x = midpoint_x + sign * offset * normal_x
        center_y = midpoint_y + sign * offset * normal_y
        count = darts.count do |x, y|
          (x - center_x) ** 2 + (y - center_y) ** 2 <= radius_sq + 1e-9
        end
        ans = count if count > ans
      end
    end
  end
  ans
end
