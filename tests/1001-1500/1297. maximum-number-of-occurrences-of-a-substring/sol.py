class Solution:
    def maxFreq(self, s: str, maxLetters: int, minSize: int, maxSize: int) -> int:
        count = {}
        left = 0
        res = 0
        unique = {}
        for right in range(len(s)):
            unique[s[right]] = unique.get(s[right], 0) + 1

            while len(unique) > maxLetters or right - left + 1 > minSize:
                unique[s[left]] -= 1
                if unique[s[left]] == 0:
                    del unique[s[left]]
                left += 1

            curr = s[left : right + 1]
            if right - left + 1 == minSize and len(unique) <= maxLetters:
                count[curr] = count.get(curr, 0) + 1

                res = max(res, count[curr])

        return res
