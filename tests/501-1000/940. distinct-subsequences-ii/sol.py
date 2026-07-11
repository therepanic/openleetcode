from collections import defaultdict


class Solution:
    def distinctSubseqII(self, s: str) -> int:
        """
        distinct subsequences

        dp[i] -> count of number of subsequences using 0 to i

        now ith character has two case take or skip

        i.e  dp[i-1]*2


        so we can either take or skip the ith char

        where does the problem occur


        but the last occurence of the same character has same pos as this


        dp[mp[s[i]]-1]*2 will be done at mp[s[i]]  again same subsequence


        will occur at i at the case where

        mp[s[i]] to i-1 all are skipped  so subtract those
        """
        n = len(s)
        dp = [0] * (n)
        dp[0] = 2
        mp = defaultdict(int)
        mp[s[0]] = 0
        for i in range(1, n):
            dp[i] = 2 * dp[i - 1]
            if s[i] in mp:
                dp[i] -= dp[mp[s[i]] - 1] if mp[s[i]] > 0 else 1
            mp[s[i]] = i
            dp[i] %= 10**9 + 7
        return (dp[-1] - 1 + 10**9 + 7) % (10**9 + 7)
