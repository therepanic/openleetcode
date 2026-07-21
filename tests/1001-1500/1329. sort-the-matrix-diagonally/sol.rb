# @param {Integer[][]} mat
# @return {Integer[][]}
def diagonal_sort(mat)
  m, n = mat.length, mat[0].length
  diagonals = Hash.new { |h, k| h[k] = [] }
  
  (0...m).each do |i|
    (0...n).each do |j|
      diagonals[i - j] << mat[i][j]
    end
  end
  
  diagonals.each_value { |v| v.sort! { |a, b| b <=> a } }
  
  (0...m).each do |i|
    (0...n).each do |j|
      mat[i][j] = diagonals[i - j].pop
    end
  end
  
  mat
end
