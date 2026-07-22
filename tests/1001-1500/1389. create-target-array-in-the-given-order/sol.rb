# @param {Integer[]} nums
# @param {Integer[]} index
# @return {Integer[]}
def create_target_array(nums, index)
    target = []
    nums.each_with_index do |num, i|
        target.insert(index[i], num)
    end
    target
end
