class Solution:
    def isPowerOfFour(self, n: int) -> bool:
        return n>0 and n.bit_count()==1 and (n-1)%3==0