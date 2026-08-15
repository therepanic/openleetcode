class Solution:
    def maxAlternatingSum(self, nums: List[int]) -> int:
        n = len(nums)
        # memo[idx][flag] stores the max sum from this point forward
        memo = [[-1] * 2 for _ in range(n + 1)]

        def solve(idx, nums, flag):
            # Base case: no more elements to process
            if idx >= n:
                return 0

            # If result already calculated, return it
            if memo[idx][flag] != -1:
                return memo[idx][flag]

            # Option 1: Skip the current number
            skip = solve(idx + 1, nums, flag)

            # Option 2: Take the current number
            val = nums[idx]
            if not flag:  # If it's an 'odd' position in subsequence, we subtract
                val = -val

            take = val + solve(idx + 1, nums, not flag)

            # Store the best result between skipping and taking
            ans = max(skip, take)
            memo[idx][flag] = ans

            return ans

        # Start at index 0, looking for a number to ADD (True)
        return solve(0, nums, True)
