class Solution:
    def superpalindromesInRange(self, left: str, right: str) -> int:
        """

        we can build palindromes in very less time
        with very enumeration trick

        """

        """
        
        build even and odd length palindromes seperately 

        """
        pal = []
        left = int(left)
        right = int(right)
        count = 0
        for i in range(1, 10**5 + 1):
            val1 = int(str(i) + str(i)[::-1])
            val2 = int(str(i) + str(i)[-2::-1])
            sqval1 = val1 * val1
            sqval2 = val2 * val2
            if left <= sqval1 <= right:
                ssqval1 = str(sqval1)
                if ssqval1 == ssqval1[::-1]:
                    count += 1
            if left <= sqval2 <= right:
                ssqval2 = str(sqval2)
                if ssqval2 == ssqval2[::-1]:
                    count += 1
            if val2 > right:
                break
        return count
