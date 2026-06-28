class Solution(object):
    def findClosestElements(self, arr, k, x):
        return sorted(sorted(arr, key=lambda num: (abs(num - x), num))[:k])
