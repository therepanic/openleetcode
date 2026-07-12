# @param {Integer[]} nums
# @return {Integer}
def num_squareful_perms(nums)
    n = nums.length
    nums.sort!

    is_squareful = lambda do |curr_nums, num|
        return true if curr_nums.empty?
        prev_num = curr_nums[-1]
        pair_sum = prev_num + num
        return false if pair_sum < 0
        sqrt_n = Integer.sqrt(pair_sum)
        sqrt_n * sqrt_n == pair_sum
    end

    backtrack = lambda do |nums_mask, curr_nums|
        if nums_mask != 0 && curr_nums.length == n
            return 1
        end
        num_squareful_perms = 0
        (0...n).each do |idx|
            num = nums[idx]
            if idx > 0 && nums[idx] == nums[idx - 1] && (nums_mask & (1 << (idx - 1))) == 0
                next
            end
            if (nums_mask & (1 << idx)) == 0 && is_squareful.call(curr_nums, num)
                curr_nums.push(num)
                num_squareful_perms += backtrack.call(nums_mask | (1 << idx), curr_nums)
                curr_nums.pop
            end
        end
        num_squareful_perms
    end

    backtrack.call(0, [])
end
