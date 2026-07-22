from typing import List
import math


class Solution:
    def build_sieve(self, n: int):
        sieve = [True] * (n + 1)
        if n >= 0:
            sieve[0] = False
        if n >= 1:
            sieve[1] = False
        p = 2
        while p * p <= n:
            if sieve[p]:
                for multiple in range(p * p, n + 1, p):
                    sieve[multiple] = False
            p += 1
        return sieve

    def sumFourDivisors(self, nums: List[int]) -> int:
        if not nums:
            return 0
        max_num = max(nums)
        if max_num < 2:
            return 0
        sieve = self.build_sieve(max_num)

        total = 0
        for x in nums:
            # p^3 case
            p = round(x ** (1 / 3))
            if p >= 0 and p <= max_num and p**3 == x and sieve[p]:
                total += 1 + p + p * p + x
                continue

            # p * q case
            i = 2
            while i * i <= x:
                if x % i == 0:
                    j = x // i
                    if (
                        i != j
                        and i <= max_num
                        and j <= max_num
                        and sieve[i]
                        and sieve[j]
                    ):
                        total += 1 + i + j + x
                    break
                i += 1
        return total
