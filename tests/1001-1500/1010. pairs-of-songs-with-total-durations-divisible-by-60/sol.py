from typing import List


class Solution:
    def numPairsDivisibleBy60(self, time: List[int]) -> int:
        remainders = [0] * 60
        for t in time:
            remainders[t % 60] += 1

        count = 0

        # Case 1: Songs with remainder 0
        count += remainders[0] * (remainders[0] - 1) // 2

        # Case 2: Songs with remainder 30
        count += remainders[30] * (remainders[30] - 1) // 2

        # Case 3: Complementary pairs (i and 60 - i)
        for i in range(1, 30):
            count += remainders[i] * remainders[60 - i]

        return count
