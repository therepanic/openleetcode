class Solution:
    def minimumOneBitOperations(self, n: int) -> int:
        highest = 0
        for i in range(32):
            if n & (1 << i):
                highest = i

        ans = 0
        add = True
        for i in range(highest, -1, -1):
            if n & (1 << i):
                val = (1 << (i + 1)) - 1
                if add:
                    ans += val
                else:
                    ans -= val
                add = not add

        return ans
