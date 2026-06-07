import collections


class Solution:
    def minWindow(self, s, t):
        if not s or not t or len(s) < len(t):
            return ""

        need = collections.Counter(t)
        missing = len(t)
        left = 0
        best_l = 0
        best_len = float("inf")

        for right, ch in enumerate(s):
            if need[ch] > 0:
                missing -= 1
            need[ch] -= 1

            while missing == 0:
                curr_len = right - left + 1
                if curr_len < best_len:
                    best_len = curr_len
                    best_l = left
                d = s[left]
                left += 1
                need[d] += 1
                if need[d] > 0:
                    missing += 1

        return "" if best_len == float("inf") else s[best_l : best_l + best_len]
