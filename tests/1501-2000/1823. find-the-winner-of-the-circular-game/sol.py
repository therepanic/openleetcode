class Solution:
    def findTheWinner(self, n: int, k: int) -> int:
        res = 0  # this is the base case where n == 1
        for i in range(2, n + 1):
            res = (res + k) % i
        return res + 1
