class Solution:
    def maxCoins(self, piles: List[int]) -> int:
        l = 0
        r = len(piles)
        count = 0
        piles.sort()
        for i in range(len(piles) // 3):
            count += piles[r - 2]
            l += 1
            r -= 2
        return count
