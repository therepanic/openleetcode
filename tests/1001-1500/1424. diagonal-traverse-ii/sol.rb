# @param {Integer[][]} nums
# @return {Integer[]}
def find_diagonal_order(nums)
    l = []
    nums.each_with_index do |row, i|
        row.each_with_index do |val, j|
            l << [i + j, i, j]
        end
    end

    h = {}
    l.each do |sum, i, j|
        h[sum] ||= []
        h[sum] << nums[i][j]
    end

    result = []
    h.keys.sort.each do |key|
        result.concat(h[key].reverse)
    end
    result
end
