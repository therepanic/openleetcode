# @param {Integer[]} nums
# @return {Integer}
def find_numbers(nums)
    count = 0
    nums.each do |i|
        msb = i.bit_length - 1
        digits = (msb * 0.30103).to_i + 1
        if i >= 10 ** digits
            digits += 1
        end
        if digits % 2 == 0
            count += 1
        end
    end
    count
end
