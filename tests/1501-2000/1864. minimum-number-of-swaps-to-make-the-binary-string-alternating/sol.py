class Solution(object):
    def minSwaps(self, s):
        """
        :type s: str
        :rtype: int
        """
        count0 = s.count("0")
        count1 = s.count("1")

        if abs(count0 - count1) > 1:
            return -1

        def mismatch(start_char):
            mismatches = 0
            for i, ch in enumerate(s):
                expected = (
                    start_char if i % 2 == 0 else ("1" if start_char == "0" else "0")
                )
                if ch != expected:
                    mismatches += 1
            return mismatches // 2

        if count0 == count1:
            return min(mismatch("0"), mismatch("1"))
        elif count0 > count1:
            return mismatch("0")
        else:
            return mismatch("1")
