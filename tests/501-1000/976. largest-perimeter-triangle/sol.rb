# @param {Integer[]} nums
# @return {Integer}
def largest_perimeter(nums)
    min_val = nums.min
    max_val = nums.max

    freq = [0] * (max_val - min_val + 1)
    nums.each do |x|
        freq[x - min_val] += 1
    end

    idx = 0
    max_val.downto(min_val) do |v|
        while freq[v - min_val] > 0
            nums[idx] = v
            idx += 1
            freq[v - min_val] -= 1
        end
    end

    (0...nums.length - 2).each do |i|
        if nums[i + 1] + nums[i + 2] > nums[i]
            return nums[i] + nums[i + 1] + nums[i + 2]
        end
    end
    return 0
end
