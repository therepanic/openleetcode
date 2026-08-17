class Solution(object):
    def maximumUniqueSubarray(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        res = 0
        cur_sum = 0
        start = 0
        k = 10001
        is_present = [False] * k

        for end in range(len(nums)):
            while is_present[nums[end]]:
                is_present[nums[start]] = False
                cur_sum -= nums[start]
                start += 1

            is_present[nums[end]] = True
            cur_sum += nums[end]

            res = max(res, cur_sum)

        return res
