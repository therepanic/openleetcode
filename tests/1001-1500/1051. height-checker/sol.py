class Solution:
    def heightChecker(self, heights: List[int]) -> int:
        count = 0
        s = sorted(heights)
        for i, j in zip(heights, s):
            if i != j:
                count += 1
        return count
