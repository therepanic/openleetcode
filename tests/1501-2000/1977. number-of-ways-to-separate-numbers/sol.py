class Solution:
    def numberOfCombinations(self, num: str) -> int:
        n = len(num)
        MOD = 10**9 + 7
        dp = [[0] * (n + 1) for _ in range(n)]
        for i in range(n):
            if num[i] != "0":
                for j in range(i + 1, n + 1):
                    if i == 0:
                        dp[i][j] = 1
                    else:
                        length = j - i
                        # Case 1: j-1 len number would be simply carry forward as that is a solved sub problem
                        dp[i][j] = dp[i][j - 1]
                        # Case 2: if equal len num on left of i is <= right of i
                        if i - length >= 0 and num[i - length : i] <= num[i:j]:
                            dp[i][j] += dp[i - length][i]
                        # Case 3: if 1 len smaller num of left of i > 1 len smaller num of right of i that means it wasn't considered in the previous sub problem but can be considered not as the cur number on the right side of i for which we are evaluating has more digits than on the left.
                        # You only have to check 1 digit because of Case 1
                        if (
                            i - length + 1 >= 0
                            and num[i - length + 1 : i] > num[i : j - 1]
                        ):
                            dp[i][j] += dp[i - length + 1][i]
        return sum(dp[i][n] for i in range(n)) % MOD
