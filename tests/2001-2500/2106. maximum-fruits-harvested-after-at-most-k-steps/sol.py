class Solution:
    def maxTotalFruits(self, fruits, startPos: int, k: int) -> int:
        left = total = res = 0
        for right in range(len(fruits)):
            total += fruits[right][1]
            while left <= right and min(
                abs(startPos - fruits[left][0]) + fruits[right][0] - fruits[left][0],
                abs(startPos - fruits[right][0]) + fruits[right][0] - fruits[left][0]
            ) > k:
                total -= fruits[left][1]
                left += 1
            res = max(res, total)
        return res