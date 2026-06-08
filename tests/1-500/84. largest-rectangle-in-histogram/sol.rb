def largest_rectangle_area(heights)
  stack = []
  ans = 0
  (0..heights.length).each do |i|
    cur = i == heights.length ? 0 : heights[i]
    while !stack.empty? && heights[stack[-1]] > cur
      h = heights[stack.pop]
      left = stack.empty? ? -1 : stack[-1]
      ans = [ans, h * (i - left - 1)].max
    end
    stack << i
  end
  ans
end
