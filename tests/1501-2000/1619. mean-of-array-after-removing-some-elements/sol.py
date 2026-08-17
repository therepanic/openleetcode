class Solution:
    def trimMean(self, arr: List[int]) -> float:
        n = len(arr)
        per5 = int(0.05 * n)
        arr.sort()
        arr = arr[per5 : n - per5]
        return sum(arr) / (n - per5 - per5)
