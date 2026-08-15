# @param {Integer[][]} mat
# @return {Integer[]}
def find_peak_grid(mat)
    n = mat.length
    m = mat[0].length

    find_max = lambda do |col|
        row = 0
        (1...n).each do |i|
            row = i if mat[i][col] > mat[row][col]
        end
        row
    end

    low = 0
    high = m - 1

    while low <= high
        mid = low + (high - low) / 2
        max_row = find_max.call(mid)

        left = mid > 0 ? mat[max_row][mid - 1] : -1
        right = mid < m - 1 ? mat[max_row][mid + 1] : -1

        if mat[max_row][mid] > left && mat[max_row][mid] > right
            return [max_row, mid]
        end

        if mat[max_row][mid] < left
            high = mid - 1
        else
            low = mid + 1
        end
    end

    [-1, -1]
end
