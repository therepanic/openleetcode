class Solution:
    def canBeTypedWords(self, text, brokenLetters):
        broken = brokenLetters
        b = [False] * 26
        res = 0

        for c in broken:
            b[ord(c) - 97] = True

        words = text.split()
        for w in words:
            ok = True
            for c in w:
                if b[ord(c) - 97]:
                    ok = False
                    break
            if ok:
                res = res + 1

        return res
