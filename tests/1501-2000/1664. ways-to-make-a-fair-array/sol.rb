# @param {Integer[]} nums
# @return {Integer}
def ways_to_make_fair(nums)
    even = 0
    odd = 0
    even_left = 0
    odd_left = 0
    result = 0
    nums.each_with_index do |ele, idx|
        if idx % 2 == 0
            even += ele
        else
            odd += ele
        end
    end
    nums.each_with_index do |ele, idx|
        if idx % 2 == 0
            even -= ele
        else
            odd -= ele
        end
        if even + odd_left == odd + even_left
            result += 1
        end
        if idx % 2 == 0
            even_left += ele
        else
            odd_left += ele
        end
    end
    result
end
