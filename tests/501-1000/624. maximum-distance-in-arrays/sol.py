class Solution:
    def maxDistance(self, arrays: List[List[int]]) -> int:
        n = len(arrays)
        smallest = arrays[0][0]
        largest = arrays[0][-1]
        ans = 0
        for i in range(1, n):
            ans = max(ans, largest - arrays[i][0], arrays[i][-1] - smallest)
            smallest = min(arrays[i][0], smallest)
            largest = max(arrays[i][-1], largest)
        return ans
