class Solution:
    def stoneGameII(self, piles):
        n = len(piles)
        suffix = [0] * (n + 1)
        for i in range(n - 1, -1, -1):
            suffix[i] = suffix[i + 1] + piles[i]
        memo = {}

        def best(i, m):
            if i >= n:
                return 0
            key = (i, m)
            if key in memo:
                return memo[key]
            answer = 0
            for x in range(1, min(2 * m, n - i) + 1):
                answer = max(answer, suffix[i] - best(i + x, max(m, x)))
            memo[key] = answer
            return answer

        return best(0, 1)
