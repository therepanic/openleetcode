# @param {Character[][]} matrix
# @return {Integer}
def maximal_square(matrix)
    rows = matrix.length
    cols = matrix[0].length
    max_area = 0

    (rows-1).downto(0) do |r|
        (cols-1).downto(0) do |c|
            if matrix[r][c] == "1"
                down = (r+1 < rows) ? matrix[r+1][c].to_i : 0
                right = (c+1 < cols) ? matrix[r][c+1].to_i : 0
                diag = (r+1 < rows && c+1 < cols) ? matrix[r+1][c+1].to_i : 0
                matrix[r][c] = 1 + [down, right, diag].min
            else
                matrix[r][c] = 0
            end
            max_area = [max_area, matrix[r][c]].max
        end
    end

    max_area * max_area
end
