# @param {Integer[]} nums
# @param {Integer[][]} queries
# @return {Integer[]}
def sum_even_after_queries(nums, queries)
    total = nums.select { |x| x % 2 == 0 }.sum
    ans = []
    queries.each do |val, idx|
        if nums[idx] % 2 == 0
            total -= nums[idx]
        end
        nums[idx] += val
        if nums[idx] % 2 == 0
            total += nums[idx]
        end
        ans << total
    end
    ans
end
