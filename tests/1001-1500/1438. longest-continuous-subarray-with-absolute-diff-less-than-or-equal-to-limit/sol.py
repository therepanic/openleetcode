from collections import deque
from typing import List


class Solution:
    def longestSubarray(self, nums: List[int], limit: int) -> int:
        maxq = deque()
        minq = deque()

        left = 0
        max_len = 1

        for right in range(len(nums)):
            while maxq and nums[maxq[-1]] <= nums[right]:
                # print("right", right, "nums[maxq[-1]]", nums[maxq[-1]], "nums[right]", nums[right])
                maxq.pop()
            maxq.append(right)
            # print("maxq: ",maxq)

            while minq and nums[minq[-1]] >= nums[right]:
                minq.pop()
            minq.append(right)

            while nums[maxq[0]] - nums[minq[0]] > limit:
                left += 1

                if maxq[0] < left:
                    maxq.popleft()
                if minq[0] < left:
                    minq.popleft()

            max_len = max(max_len, right - left + 1)

        return max_len

        # Will give TLE for finding max and min

        # max_len = 1
        # max_v = -1
        # min_v = float(inf)

        # left = 0

        # for right in range(len(nums)):
        #     max_v = max(nums[left:right+1])
        #     min_v = min(nums[left:right+1])

        #     while max_v-min_v > limit and left<=right:
        #         left+=1
        #         max_v = max(nums[left:right+1])
        #         min_v = min(nums[left:right+1])

        #     max_len = max(max_len, right-left+1)
        # return max_len
