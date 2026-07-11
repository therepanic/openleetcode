class Solution:
    def largeGroupPositions(self, s: str) -> List[List[int]]:

        left = 0
        intervals = []
        while left < len(s):
            start = left
            while left + 1 < len(s) and s[left + 1] == s[left]:
                left += 1
            if left - start >= 2:
                intervals.append([start, left])
            left += 1

        return intervals
