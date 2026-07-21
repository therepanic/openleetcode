# @param {Integer[][]} points
# @return {Integer}
def min_time_to_visit_all_points(points)
  ans = 0
  (1...points.length).each do |i|
    ans += [
      (points[i][0] - points[i - 1][0]).abs,
      (points[i][1] - points[i - 1][1]).abs
    ].max
  end
  ans
end
