import math
from typing import List


class Solution:
    def numSquarefulPerms(self, nums: List[int]) -> int:
        n = len(nums)
        nums.sort()

        def is_squareful(curr_nums, num):
            if len(curr_nums) == 0:
                return True

            prev_num = curr_nums[-1]
            pair_sum = prev_num + num
            if pair_sum < 0:
                return False

            sqrt_n = math.isqrt(pair_sum)
            return sqrt_n**2 == pair_sum

        def backtrack(nums_mask, curr_nums):
            # base case: reaching the end (used all numbers)
            if nums_mask != 0 and len(curr_nums) == n:
                return 1

            num_squareful_perms = 0
            for idx in range(n):
                num = nums[idx]
                if (
                    idx > 0
                    and nums[idx] == nums[idx - 1]
                    and (nums_mask & (1 << (idx - 1))) == 0
                ):
                    # skip duplicates
                    continue
                if (nums_mask & (1 << idx)) == 0 and is_squareful(curr_nums, num):
                    # if unused and forms a square with adj. number
                    curr_nums.append(num)
                    num_squareful_perms += backtrack(nums_mask | (1 << idx), curr_nums)
                    curr_nums.pop()

            return num_squareful_perms

        return backtrack(0, [])
