# @param {Integer[]} nums
# @return {Boolean}
def xor_game(nums)
    total_xor = 0
    nums.each do |value|
        total_xor ^= value
    end
    
    is_xor_zero = (total_xor == 0)
    has_even_length = (nums.length % 2 == 0)
    
    is_xor_zero || has_even_length
end
