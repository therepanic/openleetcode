class Solution:
    def findComplement(self, num: int) -> int:
        bit = 1
        curr = num

        while curr > 0:
            num ^= bit

            bit <<= 1
            curr >>= 1

        return num
