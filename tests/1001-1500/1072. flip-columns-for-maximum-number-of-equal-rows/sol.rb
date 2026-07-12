# @param {Integer[][]} matrix
# @return {Integer}
def max_equal_rows_after_flips(matrix)
    count = Hash.new(0)
    ans = 0

    matrix.each do |row|
        flip = row[0]
        key = row.map { |x| x ^ flip }
        count[key] += 1
        ans = count[key] if count[key] > ans
    end

    ans
end
