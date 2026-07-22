class Solution:
    def arrangeWords(self, text: str) -> str:
        s = text.split()
        s = sorted(s, key=lambda x: len(x))
        s = [i.lower() for i in s]
        s[0] = s[0][0].upper() + s[0][1:]
        return " ".join(s)
