class Solution:
    def numberOfUniqueGoodSubsequences(self, binary: str) -> int:
        a, b = 0, 0
        z = 0
        for c in binary:
            if c == "1":
                b = (a + b + 1) % (10**9 + 7)
            else:
                a = (a + b) % (10**9 + 7)
                z = 1
        return (a + b + z) % (10**9 + 7)
