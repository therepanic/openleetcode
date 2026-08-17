# @param {Integer[]} nums
# @return {Integer}
def tuple_same_product(nums)
    product_count = Hash.new(0)
    ans = 0

    (0...nums.length).each do |i|
        (i+1...nums.length).each do |j|
            product = nums[i] * nums[j]
            ans += 8 * product_count[product]
            product_count[product] += 1
        end
    end

    ans
end
