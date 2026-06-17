# @param {Integer[]} nums
# @return {Integer[]}
def single_number(nums)
    x = 0
    nums.each { |n| x ^= n }

    bit = x & -x
    a = 0
    b = 0
    nums.each do |n|
        if (n & bit) != 0
            a ^= n
        else
            b ^= n
        end
    end

    [a, b]
end
