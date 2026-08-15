class Solution:
    def countSpecialSubsequences(self, nums: list[int]) -> int:
        modulo = 1_000_000_007
        ending_in_zero = 0
        ending_in_one = 0
        ending_in_two = 0

        for value in nums:
            if value == 0:
                ending_in_zero = (ending_in_zero * 2 + 1) % modulo
            elif value == 1:
                ending_in_one = (ending_in_one * 2 + ending_in_zero) % modulo
            else:
                ending_in_two = (ending_in_two * 2 + ending_in_one) % modulo

        return ending_in_two
