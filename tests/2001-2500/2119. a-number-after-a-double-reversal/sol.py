class Solution:
    def reverse(self, num: int) -> int:
        temp = num
        rem = 0
        while temp > 0:
            rem = rem * 10 + temp % 10
            temp //= 10
        return rem

    def isSameAfterReversals(self, num: int) -> bool:
        return self.reverse(self.reverse(num)) == num