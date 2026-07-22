# @param {Integer[][]} mat
# @param {Integer} k
# @return {Integer[]}
def k_weakest_rows(mat, k)
    d = {}
    mat.each_with_index do |row, i|
        d[i] = row.sum
    end
    d.keys.sort_by { |i| d[i] }.first(k)
end
