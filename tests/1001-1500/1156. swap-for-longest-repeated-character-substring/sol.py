from collections import Counter


class Solution:
    def maxRepOpt1(self, text: str) -> int:
        total = Counter(text)
        n = len(text)
        ans = 0

        for ch in total:
            left = 0
            count = 0

            for right in range(n):
                if text[right] == ch:
                    count += 1

                while (right - left + 1) - count > 1:
                    if text[left] == ch:
                        count -= 1
                    left += 1

                ans = max(ans, min(right - left + 1, total[ch]))

        return ans
