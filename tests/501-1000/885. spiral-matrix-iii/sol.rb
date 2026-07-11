# @param {Integer} rows
# @param {Integer} cols
# @param {Integer} r_start
# @param {Integer} c_start
# @return {Integer[][]}
def spiral_matrix_iii(rows, cols, r_start, c_start)
  res = []
  top = bottom = r_start
  left = right = c_start
  res << [r_start, c_start]
  while res.length < rows * cols
    right += 1
    (left + 1..right).each do |i|
      if top >= 0 && top < rows && i >= 0 && i < cols
        res << [top, i]
        return res if res.length == rows * cols
      end
    end
    bottom += 1
    (top + 1..bottom).each do |i|
      if right >= 0 && right < cols && i >= 0 && i < rows
        res << [i, right]
        return res if res.length == rows * cols
      end
    end
    left -= 1
    (right - 1).downto(left) do |i|
      if i >= 0 && i < cols && bottom >= 0 && bottom < rows
        res << [bottom, i]
        return res if res.length == rows * cols
      end
    end
    top -= 1
    (bottom - 1).downto(top) do |i|
      if i >= 0 && i < rows && left >= 0 && left < cols
        res << [i, left]
        return res if res.length == rows * cols
      end
    end
  end
  res
end
