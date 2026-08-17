# @param {Integer[]} nums
# @return {Integer}
def min_operations(nums)
    sum_bits = 0
    max_num = 0
    nums.each do |num|
        sum_bits += num.to_s(2).count('1')
        if num > max_num
            max_num = num
        end
    end
    doubling = max_num > 0 ? max_num.bit_length - 1 : 0
    sum_bits + doubling
end
