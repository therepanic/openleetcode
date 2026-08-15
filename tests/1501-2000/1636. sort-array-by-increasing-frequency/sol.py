from collections import Counter


class Solution:
    def frequencySort(self, nums):
        freq = Counter(nums)
        return sorted(nums, key=lambda x: (freq[x], -x))
