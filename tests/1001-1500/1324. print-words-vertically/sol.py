from typing import List


class Solution:
    def printVertically(self, s: str) -> List[str]:
        words = s.split()
        res = []

        # Find the length of the longest word
        max_len = max(len(word) for word in words)

        # Build each vertical word
        for i in range(max_len):
            curr_word = ""
            for word in words:
                if i < len(word):
                    curr_word += word[i]
                else:
                    curr_word += " "
            res.append(curr_word.rstrip())  # remove trailing spaces

        return res
