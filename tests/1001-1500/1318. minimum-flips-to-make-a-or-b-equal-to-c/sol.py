class Solution:
    def minFlips(self, a: int, b: int, c: int) -> int:
        count = 0
        while a != 0 or b != 0 or c != 0:
            abit = a & 1
            bbit = b & 1
            cbit = c & 1

            if cbit == 0:
                if abit == 1:
                    count += 1
                if bbit == 1:
                    count += 1
            else:
                if abit == 0 and bbit == 0:
                    count += 1

            a >>= 1
            b >>= 1
            c >>= 1

        return count
