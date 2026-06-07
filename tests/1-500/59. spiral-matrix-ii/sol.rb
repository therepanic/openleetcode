def generate_matrix(n)
  res = Array.new(n) { Array.new(n, 0) }
  top = 0
  bottom = n - 1
  left = 0
  right = n - 1
  val = 1

  while top <= bottom && left <= right
    left.upto(right) do |col|
      res[top][col] = val
      val += 1
    end
    top += 1

    top.upto(bottom) do |row|
      res[row][right] = val
      val += 1
    end
    right -= 1

    if top <= bottom
      right.downto(left) do |col|
        res[bottom][col] = val
        val += 1
      end
      bottom -= 1
    end

    if left <= right
      bottom.downto(top) do |row|
        res[row][left] = val
        val += 1
      end
      left += 1
    end
  end

  res
end
