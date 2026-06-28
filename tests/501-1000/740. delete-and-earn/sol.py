class Solution(object):
    def deleteAndEarn(self, nums):
        from collections import Counter

        count = Counter(nums)
        unique_nums = sorted(count.keys())
        prev = None
        take, skip = 0, 0

        for num in unique_nums:
            max_points = max(skip, take)
            if prev == num - 1:
                take = num * count[num] + skip
                skip = max_points
            else:
                take = num * count[num] + max_points
                skip = max_points
            prev = num

        return max(take, skip)
