# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
    v = false
    for i in matrix
        for j in 0...i.length
            if i[j] == target
                v = true
            end
        end
    end
    return v
end
