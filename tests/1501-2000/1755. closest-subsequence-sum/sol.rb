# @param {Integer[]} nums
# @param {Integer} goal
# @return {Integer}
def min_abs_difference(nums, goal)
    sums = lambda do |values|
        result = [0]
        values.each do |value|
            result += result.map { |x| x + value }
        end
        result
    end
    mid = nums.length / 2
    left = sums.call(nums[0...mid]).sort
    right = sums.call(nums[mid..-1]).sort
    answer = (goal).abs
    j = right.length - 1
    left.each do |value|
        while j > 0 && right[j - 1] >= goal - value
            j -= 1
        end
        answer = [answer, (value + right[j] - goal).abs].min
        if j > 0
            answer = [answer, (value + right[j - 1] - goal).abs].min
        end
    end
    answer
end
