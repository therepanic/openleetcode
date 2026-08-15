class Solution:
    def minSubarray(self, nums: List[int], p: int) -> int:
        total = sum(nums)
        target = total % p
        if target == 0:
            return 0

        mp = {0: -1}
        prefix = 0
        res = len(nums)

        for i, x in enumerate(nums):
            prefix = (prefix + x) % p
            need = (prefix - target + p) % p

            if need in mp:
                res = min(res, i - mp[need])

            mp[prefix] = i

        return -1 if res == len(nums) else res
