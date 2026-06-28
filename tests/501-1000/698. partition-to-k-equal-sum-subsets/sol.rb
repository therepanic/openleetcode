# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def can_partition_k_subsets(nums, k)
    total = nums.sum
    return false if total % k != 0
    target = total / k
    nums.sort!.reverse!
    return false if nums[0] > target
    n = nums.length
    memo = {}
    dfs = lambda do |used, curr|
        return true if used == (1 << n) - 1
        key = [used, curr]
        return memo[key] if memo.key?(key)
        n.times do |i|
            if (used >> i) & 1 == 0 && curr + nums[i] <= target
                new_curr = curr + nums[i]
                nxt = new_curr == target ? 0 : new_curr
                if dfs.call(used | (1 << i), nxt)
                    memo[key] = true
                    return true
                end
            end
        end
        memo[key] = false
        false
    end
    dfs.call(0, 0)
end
