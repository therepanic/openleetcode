class Solution:
    def myPow(self, x, n):
        if x == 0:
            return 0.0
        if n == 0:
            return 1.0
        if x == 1:
            return 1.0
        if x == -1:
            return 1.0 if n % 2 == 0 else -1.0

        binForm = n
        if n < 0:
            x = 1 / x
            binForm = -binForm

        ans = 1.0
        while binForm > 0:
            if binForm % 2 == 1:
                ans *= x
            x *= x
            binForm //= 2

        return ans
