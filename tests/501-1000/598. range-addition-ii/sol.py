class Solution:
    def maxCount(self, m: int, n: int, ops: List[List[int]]) -> int:
        if ops == []:
            return m * n

        m, n = map(min, zip(*ops))

        return m * n
