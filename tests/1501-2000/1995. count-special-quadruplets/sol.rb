# @param {Integer[]} nums
# @return {Integer}
def count_quadruplets(nums)
    res = 0
    n = nums.length
    (0...n).each do |w|
        (w+1...n).each do |x|
            (x+1...n).each do |y|
                (y+1...n).each do |z|
                    res += 1 if nums[w] + nums[x] + nums[y] == nums[z]
                end
            end
        end
    end
    res
end
