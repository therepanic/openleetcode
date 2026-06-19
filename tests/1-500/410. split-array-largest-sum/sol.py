class Solution:
    def helper(self, nums: List[int], perK: int, k: int) -> bool:
        count = 1
        sum = 0
        for num in nums:
            if sum + num > perK:
                count += 1
                sum = num
            else:
                sum += num

        return count <= k

    def splitArray(self, nums: List[int], k: int) -> int:
        high = sum(nums)
        low = max(nums)
        soln = 0
        while low <= high:
            mid = low + (high - low) // 2
            if self.helper(nums, mid, k):
                soln = mid
                high = mid - 1
            else:
                low = mid + 1

        return soln
