# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_sum_of_three_subarrays(nums, k)
    n = nums.length
    sum1 = nums[0...k].sum
    sum2 = nums[k...2*k].sum
    sum3 = nums[2*k...3*k].sum

    max1 = sum1
    max12 = sum1 + sum2
    max123 = sum1 + sum2 + sum3

    index1 = 0
    index12_1 = 0
    index12_2 = k
    ans = [0, k, 2 * k]

    (1..n - 3 * k).each do |i|
        sum1 = sum1 - nums[i - 1] + nums[i + k - 1]
        sum2 = sum2 - nums[i + k - 1] + nums[i + 2 * k - 1]
        sum3 = sum3 - nums[i + 2 * k - 1] + nums[i + 3 * k - 1]

        if sum1 > max1
            max1 = sum1
            index1 = i
        end

        if max1 + sum2 > max12
            max12 = max1 + sum2
            index12_1 = index1
            index12_2 = i + k
        end

        if max12 + sum3 > max123
            max123 = max12 + sum3
            ans = [index12_1, index12_2, i + 2 * k]
        end
    end

    ans
end
