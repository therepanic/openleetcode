class Solution:
    def maxValue(self, n: int, index: int, maxSum: int) -> int:
        def isValid(mid):
            left = 0
            if mid > index:
                left = (mid - index + mid - 1) * index // 2
            else:
                ones = index - (mid - 1)
                left = mid * (mid - 1) // 2 + ones

            rightCount = n - index - 1
            if mid > rightCount:
                right = (mid - 1 + mid - rightCount) * rightCount // 2
            else:
                ones = rightCount - (mid - 1)
                right = mid * (mid - 1) // 2 + ones

            return left + mid + right <= maxSum

        l, r, result = 0, maxSum, 1
        while l <= r:
            mid = (l + r) // 2
            if isValid(mid):
                result = mid
                l = mid + 1
            else:
                r = mid - 1
        return result
