class Solution:
    def minOperations(self, n: int) -> int:
        return (n * n) // 4

        """count=0
           for i in range(n):
            if n>=(2 * i) + 1:
                count+=n-((2 * i) + 1)
            else:
                break
            return count"""
