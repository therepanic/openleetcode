from typing import List


class Solution:
    def subarraysWithKDistinct(self, nums: List[int], k: int) -> int:

        def atMost(k):
            freq = dict()
            count = 0
            left = 0
            n = len(nums)

            for right in range(n):
                # Expand the window for right (dict)
                freq[nums[right]] = freq.get(nums[right], 0) + 1

                # When Condition Invalid (No. of Unique elements in subarray > k)
                # Shrink window and reduce freq
                while len(freq) > k:
                    # print(freq, nums[left], nums[right], count)
                    if freq[nums[left]] > 1:
                        freq[nums[left]] -= 1
                    else:
                        del freq[nums[left]]
                    left += 1

                # Cound the No. of Subarrays in a Valid Window
                count += right - left + 1

            return count

        # for eaxctly K answer
        # Find K and K - 1, subtract
        return atMost(k) - atMost(k - 1)
