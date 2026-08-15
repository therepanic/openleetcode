"""
primes - 2 3 5 7 11 13 17 19 23 29
valid prods - 6 10 14 22 26 15 21
"""

MOD = 10**9 + 7
primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]  # 10


class Solution:
    def numberOfGoodSubsets(self, nums: List[int]) -> int:
        freq = Counter(nums)
        # consider only unique elements from nums greater than 1
        arr = list(x for x in set(nums) if 1 < x)
        N = len(arr)  # N < 30

        @cache
        def rec(i, prod):
            if i == N:
                return prod != 1

            # not pick
            cnt = rec(i + 1, prod)

            # check and pick
            next_prod = prod * arr[i]
            is_distinct_prime_product = all(
                next_prod % (prime * prime) for prime in primes
            )
            if is_distinct_prime_product:
                cnt += freq[arr[i]] * rec(i + 1, next_prod)
            # print(i, prod, next_prod, is_distinct_prime_product)

            return cnt % MOD

        ans = rec(0, 1)

        # include contribution of `1`s to all the subsets
        ones = freq[1]
        ones_contribution = pow(2, ones, MOD)
        ans *= ones_contribution

        return ans % MOD
