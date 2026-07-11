class Solution:
    def smallestRepunitDivByK(self, k: int) -> int:
        if k == 1:
            return 1

        # Numbers made of only 1s can never be divisible by 2 or 5
        if k % 2 == 0 or k % 5 == 0:
            return -1

        rem = 0
        for i in range(1, k + 1):
            rem = (rem * 10 + 1) % k
            if rem == 0:
                return i

        return -1
