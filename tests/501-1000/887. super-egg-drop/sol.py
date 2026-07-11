class Solution:
    def superEggDrop(self, k: int, n: int) -> int:
        memo = {}

        def solve(eggs, floors):
            if floors <= 1 or eggs == 1:
                return floors
            if (eggs, floors) in memo:
                return memo[(eggs, floors)]

            low, high = 1, floors
            ans = floors

            while low <= high:
                mid = (low + high) // 2
                break_case = solve(eggs - 1, mid - 1)
                not_break_case = solve(eggs, floors - mid)

                ans = min(ans, 1 + max(break_case, not_break_case))
                if break_case < not_break_case:
                    low = mid + 1
                else:
                    high = mid - 1

            memo[(eggs, floors)] = ans
            return ans

        return solve(k, n)
