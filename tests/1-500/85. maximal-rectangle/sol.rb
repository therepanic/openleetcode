def maximal_rectangle(matrix)
  return 0 if matrix.empty? || matrix[0].empty?
  cols = matrix[0].length
  heights = Array.new(cols, 0)
  ans = 0
  matrix.each do |row|
    cols.times do |c|
      heights[c] = row[c] == '1' ? heights[c] + 1 : 0
    end
    ans = [ans, largest_histogram(heights)].max
  end
  ans
end

def largest_histogram(heights)
  stack = []
  best = 0
  (0..heights.length).each do |i|
    cur = i == heights.length ? 0 : heights[i]
    while !stack.empty? && heights[stack[-1]] > cur
      h = heights[stack.pop]
      left = stack.empty? ? -1 : stack[-1]
      best = [best, h * (i - left - 1)].max
    end
    stack << i
  end
  best
end
