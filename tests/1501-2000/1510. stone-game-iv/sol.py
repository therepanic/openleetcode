class Solution:
    def winnerSquareGame(self, n: int) -> bool:
        @cache
        def dp(player: int, stones: int) -> int:
            sqrt = int(math.sqrt(stones))
            for i in range(sqrt, 0, -1):
                if i**2 == stones or not dp(player ^ 1, stones - i**2):
                    return True
            return False

        return dp(0, n)
