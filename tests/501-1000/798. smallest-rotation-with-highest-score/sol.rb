# @param {Integer[]} nums
# @return {Integer}
def best_rotation(nums)
    n = nums.length
    diffs = Array.new(n + 1, 0)
    nums.each_with_index do |num, i|
        left = (i - num + 1) % n
        right = (i + 1) % n
        diffs[left] -= 1
        diffs[right] += 1
        diffs[0] -= 1 if left > right
    end
    best = 0
    cur = n
    max_score = cur
    (1...n).each do |k|
        cur += diffs[k]
        if cur > max_score
            max_score = cur
            best = k
        end
    end
    best
end
