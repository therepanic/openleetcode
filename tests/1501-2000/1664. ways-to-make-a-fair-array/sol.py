class Solution:
    def waysToMakeFair(self, nums: List[int]) -> int:
        even = 0
        odd = 0
        even_left = 0
        odd_left = 0
        result = 0
        for idx, ele in enumerate(nums):
            if idx % 2 == 0:
                even += ele
            else:
                odd += ele
        for idx, ele in enumerate(nums):
            if idx % 2 == 0:
                even -= ele
            else:
                odd -= ele
            if even + odd_left == odd + even_left:
                result += 1
            if idx % 2 == 0:
                even_left += ele
            else:
                odd_left += ele
        return result
