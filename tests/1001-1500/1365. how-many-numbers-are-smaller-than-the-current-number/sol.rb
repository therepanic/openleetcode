# @param {Integer[]} nums
# @return {Integer[]}
def smaller_numbers_than_current(nums)
    all_nums = Array.new(101, 0)
    res = Array.new(nums.length, 0)

    nums.each do |v|
        all_nums[v] += 1
    end

    (1..100).each do |v|
        all_nums[v] += all_nums[v - 1]
    end

    nums.each_with_index do |v, i|
        if v == 0
            res[i] = 0
        else
            res[i] = all_nums[v - 1]
        end
    end
    res
end
