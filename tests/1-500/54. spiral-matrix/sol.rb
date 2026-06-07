def spiral_order(matrix)
  res = []
  top = 0
  bottom = matrix.length - 1
  left = 0
  right = matrix[0].length - 1

  while top <= bottom && left <= right
    left.upto(right) { |col| res << matrix[top][col] }
    top += 1

    top.upto(bottom) { |row| res << matrix[row][right] }
    right -= 1

    if top <= bottom
      right.downto(left) { |col| res << matrix[bottom][col] }
      bottom -= 1
    end

    if left <= right
      bottom.downto(top) { |row| res << matrix[row][left] }
      left += 1
    end
  end

  res
end
