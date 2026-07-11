class Solution:
    def strWithout3a3b(self, a: int, b: int) -> str:
        res = ""
        prev_a = prev_b = 0

        while a > 0 or b > 0:
            if prev_a == 2 and b > 0:
                res += "b"
                b -= 1
                prev_b += 1
                prev_a = 0
            elif prev_b == 2 and a > 0:
                res += "a"
                a -= 1
                prev_a += 1
                prev_b = 0
            elif a > b and a > 0:
                res += "a"
                a -= 1
                prev_a += 1
            elif b > 0:
                res += "b"
                b -= 1
                prev_b += 1
        return res
