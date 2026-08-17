class Solution:
    def isPrefixString(self, s: str, words: List[str]) -> bool:
        res = ""
        i = 0
        while len(res) < len(s):
            if i >= len(words):
                return False
            res += words[i]
            i += 1
        return res == s
