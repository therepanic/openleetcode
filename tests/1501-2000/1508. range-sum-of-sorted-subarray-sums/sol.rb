# @param {Integer[]} nums
# @param {Integer} n
# @param {Integer} left
# @param {Integer} right
# @return {Integer}
def range_sum(nums, n, left, right)
    sums = []
    (0...n).each do |i|
        total = 0
        nums[i..-1].each do |value|
            total += value
            sums << total
        end
    end
    sums.sort!
    sums[left - 1...right].sum % 1000000007
end
