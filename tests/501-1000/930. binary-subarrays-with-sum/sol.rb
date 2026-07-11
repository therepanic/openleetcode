# @param {Integer[]} nums
# @param {Integer} goal
# @return {Integer}
def num_subarrays_with_sum(nums, goal)
    pos_of_1s = [-1]
    count = 0
    total = 0
    n = nums.length
    
    if goal == 0
        nums.each do |num|
            if num == 0
                count += 1
                total += count
            else
                count = 0
            end
        end
        return total
    end
    
    nums.each_with_index do |num, i|
        pos_of_1s << i if num == 1
    end
    pos_of_1s << n
    
    (1...(pos_of_1s.length - goal)).each do |i|
        left_choices = pos_of_1s[i] - pos_of_1s[i - 1]
        right_choices = pos_of_1s[i + goal] - pos_of_1s[i + goal - 1]
        total += left_choices * right_choices
    end
    
    total
end
