def k_closest(points, k)
  points.sort_by { |p| p[0] * p[0] + p[1] * p[1] }[0, k]
end
