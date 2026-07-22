class Solution:
    def equalSubstring(self, s: str, t: str, maxCost: int) -> int:
        ans = cost = left = 0

        for right in range(len(s)):
            cost += abs(ord(s[right]) - ord(t[right]))

            while cost > maxCost:
                cost -= abs(ord(s[left]) - ord(t[left]))
                left += 1

            size = right - left + 1
            if size > ans:
                ans = size

        return ans
