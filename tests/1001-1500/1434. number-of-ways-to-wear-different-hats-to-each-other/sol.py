from typing import List


class Solution:
    def numberWays(self, hats: List[List[int]]) -> int:
        mod = 10**9 + 7
        n = len(hats)
        liked_by_hat = [[] for _ in range(41)]
        for person, choices in enumerate(hats):
            for hat in choices:
                liked_by_hat[hat].append(person)

        dp = [0] * (1 << n)
        dp[0] = 1
        for hat in range(1, 41):
            updated = dp[:]
            for mask, count in enumerate(dp):
                if count == 0:
                    continue
                for person in liked_by_hat[hat]:
                    person_bit = 1 << person
                    if mask & person_bit == 0:
                        target = mask | person_bit
                        updated[target] = (updated[target] + count) % mod
            dp = updated
        return dp[-1]
