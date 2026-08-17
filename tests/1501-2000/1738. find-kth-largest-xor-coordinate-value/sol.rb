# @param {Integer[][]} matrix
# @param {Integer} k
# @return {Integer}
def kth_largest_value(matrix, k)
    n = matrix.length
    m = matrix[0].length
    temp = Array.new(n) { Array.new(m, 0) }
    temp[0][0] = matrix[0][0]
    (1...m).each { |j| temp[0][j] = temp[0][j-1] ^ matrix[0][j] }
    (1...n).each { |i| temp[i][0] = temp[i-1][0] ^ matrix[i][0] }
    (1...n).each do |i|
        (1...m).each do |j|
            temp[i][j] = matrix[i][j] ^ temp[i-1][j] ^ temp[i][j-1] ^ temp[i-1][j-1]
        end
    end
    arr = temp.flatten
    arr.sort! { |a,b| b <=> a }
    arr[k-1]
end
