class Solution:
    def shuffle(self, nums: List[int], n: int) -> List[int]:
        ans = [0] * (2 * n)
        for i in range(2 * n):
            if i % 2 == 0:
                ans[i] = nums[i // 2]
            else:
                ans[i] = nums[n + i // 2]
        return ans
