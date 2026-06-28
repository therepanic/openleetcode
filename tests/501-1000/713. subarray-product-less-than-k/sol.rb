# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def num_subarray_product_less_than_k(nums, k)
    return 0 if k <= 1

    left = 0
    product = 1
    ans = 0

    (0...nums.length).each do |right|
        product *= nums[right]
        while product >= k
            product /= nums[left]
            left += 1
        end
        ans += (right - left + 1)
    end

    ans
end
