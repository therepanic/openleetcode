class Solution:
    def countVowelPermutation(self, n: int) -> int:
        a, e, i, o, u = 1, 1, 1, 1, 1
        for _ in range(n - 1):
            na = (e + i + u) % (10**9 + 7)
            ne = (a + i) % (10**9 + 7)
            ni = (e + o) % (10**9 + 7)
            no = i % (10**9 + 7)
            nu = (i + o) % (10**9 + 7)
            a, e, i, o, u = na, ne, ni, no, nu
        return (a + e + i + o + u) % (10**9 + 7)
