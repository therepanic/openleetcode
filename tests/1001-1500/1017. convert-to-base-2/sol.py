class Solution:
    def baseNeg2(self, n: int) -> str:
        if n == 0:
            return "0"
        res = []
        while n != 0:
            digit = n & 1
            res.append(str(digit))
            n = (n - digit) // -2
        return "".join(reversed(res))
