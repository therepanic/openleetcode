# @param {Integer[][]} groups
# @param {Integer[]} nums
# @return {Boolean}
def can_choose(groups, nums)
    i = 0
    groups.each do |group|
        found = false
        while i + group.length <= nums.length
            if nums[i, group.length] == group
                i += group.length
                found = true
                break
            else
                i += 1
            end
        end
        return false unless found
    end
    true
end
