# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def max_non_overlapping(nums, target)
    num_of_subarrays, temp, visited = 0, 0, {0 => true}
    nums.each do |num|
        temp += num
        prev = temp - target
        if visited.include?(prev)
            visited = {}
            num_of_subarrays += 1
        end
        visited[temp] = true
    end
    num_of_subarrays
end
