from collections import defaultdict


class Solution:
    def longestNiceSubstring(self, s):
        len_s = len(s)
        if len_s <= 1:
            return ""

        char_to_freq_map = defaultdict(int)
        for c in s:
            char_to_freq_map[c] += 1

        is_broken = False
        i = 0
        while i < len(s):
            if s[i].islower() and s[i].upper() in char_to_freq_map.keys():
                pass
            elif s[i].isupper() and s[i].lower() in char_to_freq_map.keys():
                pass
            else:
                is_broken = True
                break
            i += 1

        if not is_broken:
            return s

        longest_nice_substr_1 = self.longestNiceSubstring(s[:i])
        longest_nice_substr_2 = self.longestNiceSubstring(s[i + 1 :])

        if len(longest_nice_substr_1) >= len(longest_nice_substr_2):
            return longest_nice_substr_1
        else:
            return longest_nice_substr_2
