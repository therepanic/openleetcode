# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_sliding_window(nums, k)
    res = []
    q = []
    nums.each_with_index do |num, idx|
        while !q.empty? && q.last < num
            q.pop
        end
        q.push(num)
        if idx >= k && nums[idx - k] == q.first
            q.shift
        end
        if idx >= k - 1
            res.push(q.first)
        end
    end
    res
end
