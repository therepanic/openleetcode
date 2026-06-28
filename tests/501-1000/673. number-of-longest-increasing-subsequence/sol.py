class Solution(object):
    def findNumberOfLIS(self, nums):
        n = len(nums)
        if n == 0:
            return 0

        lengths = [1] * n
        counts = [1] * n

        for i in range(n):
            for j in range(i):
                if nums[j] < nums[i]:
                    if lengths[j] + 1 > lengths[i]:
                        lengths[i] = lengths[j] + 1
                        counts[i] = counts[j]
                    elif lengths[j] + 1 == lengths[i]:
                        counts[i] += counts[j]

        max_length = max(lengths)
        return sum(counts[i] for i in range(n) if lengths[i] == max_length)
