# @param {Integer[]} nums
# @param {Integer} limit
# @param {Integer} goal
# @return {Integer}
def min_elements(nums, limit, goal)
    current_sum = nums.sum
    diff = (goal - current_sum).abs
    (diff + limit - 1) / limit
end
