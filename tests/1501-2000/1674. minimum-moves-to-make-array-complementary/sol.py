class Solution:
    def minMoves(self, nums: List[int], limit: int) -> int:
        n = len(nums)

        # difference array
        diff = [0] * (2 * limit + 2)

        for i in range(n // 2):
            a = nums[i]
            b = nums[n - 1 - i]

            low = min(a, b) + 1
            high = max(a, b) + limit

            total = a + b

            # initially all sums need 2 moves
            diff[2] += 2
            diff[2 * limit + 1] -= 2

            # one move range
            diff[low] -= 1
            diff[high + 1] += 1

            # exact sum needs 0 move
            diff[total] -= 1
            diff[total + 1] += 1

        ans = float("inf")
        moves = 0

        # calculate prefix sum
        for target in range(2, 2 * limit + 1):
            moves += diff[target]
            ans = min(ans, moves)

        return ans
