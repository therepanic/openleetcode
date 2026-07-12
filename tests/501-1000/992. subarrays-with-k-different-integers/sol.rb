# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def subarrays_with_k_distinct(nums, k)
    at_most = lambda do |k|
        freq = Hash.new(0)
        count = 0
        left = 0
        n = nums.length

        (0...n).each do |right|
            freq[nums[right]] += 1

            while freq.length > k
                if freq[nums[left]] > 1
                    freq[nums[left]] -= 1
                else
                    freq.delete(nums[left])
                end
                left += 1
            end

            count += (right - left + 1)
        end

        count
    end

    at_most.call(k) - at_most.call(k - 1)
end
