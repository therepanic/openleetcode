class Solution:
    def findLeastNumOfUniqueInts(self, arr, k):
        from collections import Counter

        counts = Counter(arr)
        remaining = len(counts)
        for count in sorted(counts.values()):
            if k < count:
                break
            k -= count
            remaining -= 1
        return remaining
