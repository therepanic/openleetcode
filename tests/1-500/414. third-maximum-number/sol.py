class Solution(object):
    def thirdMax(self, nums):
        first = second = third = None
        for num in nums:
            if num == first or num == second or num == third:
                continue
            if first is None or num > first:
                third = second
                second = first
                first = num
            elif second is None or num > second:
                third = second
                second = num
            elif third is None or num > third:
                third = num
        return third if third is not None else first
