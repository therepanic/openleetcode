class Solution:
    def sumZero(self, n: int) -> List[int]:
        return [i * 2 - n + 1 for i in range(n)]
