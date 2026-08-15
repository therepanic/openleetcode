def largest_submatrix(matrix)
    m = matrix.length
    n = matrix[0].length
    max_area = 0
    h = Array.new(n, 0)
    (0...m).each do |i|
        (0...n).each do |j|
            if j < matrix[i].length && matrix[i][j] == 1
                h[j] += 1
            else
                h[j] = 0
            end
        end
        sh = h.sort.reverse
        (0...n).each do |j|
            break if sh[j] == 0
            max_area = [max_area, sh[j] * (j + 1)].max
        end
    end
    max_area
end
