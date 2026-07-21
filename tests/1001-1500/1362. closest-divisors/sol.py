import math
from typing import List


class Solution:
    def closestDivisors(self, num: int) -> List[int]:
        # Start from the largest possible 'balanced' divisor
        # This is the integer square root of the largest target (num + 2)
        start = int(math.isqrt(num + 2))

        # Iterating downwards ensures the first divisor found has the
        # minimal absolute difference (Mathematical Optimization)
        for d in range(start, 0, -1):
            # Check for divisors of (num + 1)
            if (num + 1) % d == 0:
                return [d, (num + 1) // d]

            # Check for divisors of (num + 2)
            if (num + 2) % d == 0:
                return [d, (num + 2) // d]

        return []
