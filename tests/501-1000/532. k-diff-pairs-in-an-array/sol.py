class Solution(object):
    def findPairs(self, nums, k):
        if k < 0:
            return 0
        count = 0
        num_counts = {}
        for num in nums:
            num_counts[num] = num_counts.get(num, 0) + 1
        for num in num_counts:
            if k == 0:
                if num_counts[num] >= 2:
                    count += 1
            else:
                if num + k in num_counts:
                    count += 1
        return count
