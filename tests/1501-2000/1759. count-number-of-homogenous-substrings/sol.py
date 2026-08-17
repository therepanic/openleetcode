class Solution:
    def countHomogenous(self, s: str) -> int:
        MOD = 1e9 + 7
        n = len(s)
        res = cnt = 1
        for i in range(1, n):
            if s[i] != s[i - 1]:
                cnt = 0
            cnt += 1
            res = (res + cnt) % MOD
        return int(res)
