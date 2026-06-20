class Solution:
    def poorPigs(self, buckets: int, minutesToDie: int, minutesToTest: int) -> int:
        base = minutesToTest // minutesToDie + 1
        ans = 0
        n = 1

        while n < buckets:
            n *= base
            ans += 1
        return ans
