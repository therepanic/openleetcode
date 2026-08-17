class Solution:
    def sumBase(self, n: int, k: int) -> int:
        total = 0
        while n > 0:
            total += n % k  # get last digit
            n //= k  # remove last digit
        return total
