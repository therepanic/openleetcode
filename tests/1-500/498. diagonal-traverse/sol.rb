# @param {Integer[][]} mat
# @return {Integer[]}
def find_diagonal_order(mat)
    return [] if mat.empty? || mat[0].empty?
    
    m, n = mat.length, mat[0].length
    result = []
    row = col = 0
    
    (m * n).times do
        result << mat[row][col]
        
        if (row + col) % 2 == 0
            if col == n - 1
                row += 1
            elsif row == 0
                col += 1
            else
                row -= 1
                col += 1
            end
        else
            if row == m - 1
                col += 1
            elsif col == 0
                row += 1
            else
                row += 1
                col -= 1
            end
        end
    end
    
    result
end
