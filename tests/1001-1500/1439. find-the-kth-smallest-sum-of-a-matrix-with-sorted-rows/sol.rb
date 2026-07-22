# @param {Integer[][]} mat
# @param {Integer} k
# @return {Integer}
def kth_smallest(mat, k)
    sums = mat[0].first(k)
    mat[1..].each do |row|
        row_k = row.first(k)
        sums = sums.flat_map { |a| row_k.map { |b| a + b } }.sort.first(k)
    end
    sums[k - 1]
end
