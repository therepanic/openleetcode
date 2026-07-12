# @param {Integer[][]} points
# @return {Float}
def largest_triangle_area(points)
  max_area = 0.0
  n = points.length
  (0...n).each do |i|
    x1, y1 = points[i]
    (i...n).each do |j|
      x2, y2 = points[j]
      (j...n).each do |k|
        x3, y3 = points[k]
        area = (0.5 * (x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2))).abs
        max_area = area if area > max_area
      end
    end
  end
  max_area
end
