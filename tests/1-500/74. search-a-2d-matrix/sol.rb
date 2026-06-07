def search_matrix(matrix, target)
  rows = matrix.length
  cols = matrix[0].length
  left = 0
  right = rows * cols - 1

  while left <= right
    mid = left + (right - left) / 2
    value = matrix[mid / cols][mid % cols]
    return true if value == target
    if value < target
      left = mid + 1
    else
      right = mid - 1
    end
  end

  false
end
