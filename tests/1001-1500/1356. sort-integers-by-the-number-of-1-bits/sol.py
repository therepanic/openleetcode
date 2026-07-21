class Solution:
    def sortByBits(self, arr):
        return sorted(arr, key=lambda x: (x.bit_count(), x))
