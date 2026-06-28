# @param {Integer[][]} mat
# @return {Integer[][]}
def update_matrix(mat)
    rows = mat.length
    cols = mat[0].length
    directions = [[0, 1], [0, -1], [1, 0], [-1, 0]]
    queue = []

    (0...rows).each do |i|
        (0...cols).each do |j|
            if mat[i][j] == 0
                queue << [i, j]
            else
                mat[i][j] = Float::INFINITY
            end
        end
    end

    while !queue.empty?
        row, col = queue.shift

        directions.each do |dr, dc|
            new_row = row + dr
            new_col = col + dc

            if new_row >= 0 && new_row < rows && new_col >= 0 && new_col < cols && mat[new_row][new_col] > mat[row][col] + 1
                mat[new_row][new_col] = mat[row][col] + 1
                queue << [new_row, new_col]
            end
        end
    end

    mat
end
