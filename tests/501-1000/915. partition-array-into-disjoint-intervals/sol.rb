# @param {Integer[]} nums
# @return {Integer}
def partition_disjoint(nums)
    n = nums.length
    prefix_max = Array.new(n, 0)
    prefix_max[0] = nums[0]
    (1...n).each do |i|
        prefix_max[i] = [prefix_max[i-1], nums[i]].max
    end
    
    suffix_min = Array.new(n, 0)
    suffix_min[-1] = nums[-1]
    (n-2).downto(0) do |i|
        suffix_min[i] = [suffix_min[i+1], nums[i]].min
    end
    
    (0...n-1).each do |i|
        if prefix_max[i] <= suffix_min[i+1]
            return i + 1
        end
    end
end
