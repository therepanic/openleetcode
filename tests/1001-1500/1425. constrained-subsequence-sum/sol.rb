# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def constrained_subset_sum(nums, k)
    q = []
    res = -Float::INFINITY
    nums.each_with_index do |num, i|
        total = q.empty? ? num : num + q[0][1]
        res = total if total > res
        while !q.empty? && total >= q[-1][1]
            q.pop
        end
        if total > 0
            q << [i, total]
        end
        if !q.empty? && q[0][0] == i - k
            q.shift
        end
    end
    res
end
