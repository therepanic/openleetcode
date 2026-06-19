class Solution(object):
    def fourSumCount(self, nums1, nums2, nums3, nums4):
        from collections import Counter

        d = Counter(a + b for a in nums1 for b in nums2)
        return sum(d[-(c + d2)] for c in nums3 for d2 in nums4)
