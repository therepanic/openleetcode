# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def k_length_apart(nums, k)
    return true if k == 0
    prev = nil
    nums.each_with_index do |num, i|
        if num == 1
            if prev != nil && i - prev <= k
                return false
            end
            prev = i
        end
    end
    true
end
