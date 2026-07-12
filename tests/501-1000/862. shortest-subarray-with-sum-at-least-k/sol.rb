# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def shortest_subarray(nums, k)
    prefix = [0]
    nums.each { |num| prefix << prefix[-1] + num }
    
    best = nums.length + 1
    dq = []
    prefix.each_with_index do |cur, i|
        while !dq.empty? && cur - prefix[dq[0]] >= k
            best = [best, i - dq.shift].min
        end
        while !dq.empty? && prefix[dq[-1]] >= cur
            dq.pop
        end
        dq << i
    end
    
    best == nums.length + 1 ? -1 : best
end
