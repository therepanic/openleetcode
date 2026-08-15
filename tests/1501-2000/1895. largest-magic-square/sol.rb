def largest_magic_square(grid)
    m = grid.length
    n = grid[0].length
    res = 1

    isValid = lambda do |i, j, k|
        s = nil
        (i...(i+k)).each do |x|
            row = grid[x][j...(j+k)].sum
            if s.nil?
                s = row
            elsif s != row
                return false
            end
        end

        (j...(j+k)).each do |y|
            col = (i...(i+k)).sum { |x| grid[x][y] }
            return false if col != s
        end

        diag1 = (0...k).sum { |d| grid[i+d][j+d] }
        diag2 = (0...k).sum { |d| grid[i+d][j+k-1-d] }
        return false if diag1 != s || diag2 != s

        true
    end

    (2..[m, n].min).each do |k|
        (0..(m-k)).each do |i|
            (0..(n-k)).each do |j|
                res = k if isValid.call(i, j, k)
            end
        end
    end
    res
end
