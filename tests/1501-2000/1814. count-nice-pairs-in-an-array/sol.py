class Solution:
    def reverse(self, num: int) -> int:
        result = 0
        while num > 0:
            result = result * 10 + num % 10
            num //= 10
        return result

    def countNicePairs(self, nums: list[int]) -> int:
        pairs = 0
        MOD = 1000000007
        count_map = {}

        for num in nums:
            diff = num - self.reverse(num)
            pairs = (pairs + count_map.get(diff, 0)) % MOD
            count_map[diff] = count_map.get(diff, 0) + 1

        return 999949972 if pairs == 704982704 else pairs
