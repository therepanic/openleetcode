# @param {Integer[]} nums
# @return {Integer}
def max_value_after_reverse(nums)
    return 0 if nums.length < 2
    
    max_min = -Float::INFINITY
    min_min = Float::INFINITY
    s = 0
    boundary = -Float::INFINITY
    
    (0...nums.length-1).each do |i|
        a = nums[i]
        b = nums[i+1]
        distance = (a - b).abs
        boundary = [boundary, [(nums[-1] - a).abs, (nums[0] - b).abs].max - distance].max
        s += distance
        min_min = [[a, b].max, min_min].min
        max_min = [[a, b].min, max_min].max
    end
    
    s + [2 * (max_min - min_min), boundary].max
end
