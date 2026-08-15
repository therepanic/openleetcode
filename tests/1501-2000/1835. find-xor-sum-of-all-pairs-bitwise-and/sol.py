class Solution:
    def getXORSum(self, arr1: list[int], arr2: list[int]) -> int:
        x, y = 0, 0
        for v in arr1:
            x ^= v
        for v in arr2:
            y ^= v
        return x & y
