# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def number_of_subarrays(nums, k)
    count = {0 => 1}
    odd = 0
    answer = 0
    nums.each do |value|
        odd += value % 2
        answer += count.fetch(odd - k, 0)
        count[odd] = count.fetch(odd, 0) + 1
    end
    answer
end
