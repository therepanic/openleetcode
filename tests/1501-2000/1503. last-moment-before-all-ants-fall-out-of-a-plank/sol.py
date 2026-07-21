class Solution:
    def getLastMoment(self, n: int, left: List[int], right: List[int]) -> int:
        max_val = 0

        for value in left:
            max_val = max(value, max_val)

        for value in right:
            max_val = max(n - value, max_val)

        return max_val
