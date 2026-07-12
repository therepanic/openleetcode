from math import ceil, log2
from typing import List


class Solution:
    def countTriplets(self, nums: List[int]) -> int:
        # brute force: nope

        # better: make a vector with the ways to make all 2**16 possible AND values,
        # in O(n**2). Then for each number, iterate through all 2**16 AND values and
        # sum up all entries where counts[a] | a&n == 0
        #   Speed up: use the brilliant "masked decrement."
        #      let y = ~n & ((1<<16)-1), i.e. 1s everywhere n has zeros. The most ones possible.
        #      then do y = (y-1) & ~n until y is 0. Each subtracts one from the LSB of ~n.
        #      It basically counts down from 11111...11_2 down to 0000...000_2, but where the 1s
        #      are where they are in ~n. It's brilliant. This cuts down on the number of combinations
        #      significantly.

        # The galaxy brain solution: a modified Walsh-Hadamard transformation.

        def transform(c: list[int], forward: bool) -> None:
            """
            Applies the linear transformation T to c in-place.

            T has the property T*(c $ d) == T*c : T*d where
               c and d are vectors of counts
               c $ d is the answer: (c$d)[a] is the number of index pairs
                   (i, j) where i is in c, j is in d, and i & j == a

            T is recursively defined:

            T_2 = [1 1]
                  [0 1]

            T_{2N} = T_N x T_2; where x is the direct product
                   = [T_N  T_N]
                     [ 0   T_N]

            @param forward: if True, applies T to c in place.
                            if False, applies inverse(T) to c in place.
            """

            # exploits the recursive definition of
            # T_{2N} = [T_N*firstN + T_N*nextN; T_N*nextN]
            # to compute it with divide-and-conquer. Conceptually it's
            # recursive, but in this case it simplifies to an
            # iterative algorithm since T_4 depends on pairs,
            # T_8 depends on groups of 4, and so on.

            h = 1  # half current group size
            sign = +1 if forward else -1
            while h < len(c):
                for s in range(0, len(c), 2 * h):  # start of each group
                    for i in range(s, s + h):
                        c[i] += sign * c[i + h]

                h *= 2

        most = max(nums)
        if most == 0:
            return len(nums) ** 3

        bits = ceil(log2(most)) + 1

        N = 1 << bits  # number of possible & results (must be a power of 2)
        ALL = N - 1  # bit mask

        c = [0] * N  # counts of each value
        for n in nums:
            c[n] += 1

        transform(c, forward=True)
        for i in range(N):
            c[i] **= 3
        transform(c, forward=False)

        return c[0]
