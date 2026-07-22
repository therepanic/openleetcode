class Solution:
    def countCharacters(self, words: List[str], chars: str) -> int:
        ch = {}

        for c in chars:
            ch[c] = 1 + ch.get(c, 0)

        res = 0
        for word in words:
            copy = ch.copy()

            for c in word:
                if c in copy and copy[c] != 0:
                    copy[c] -= 1
                else:
                    res -= len(word)
                    break

            res += len(word)

        return res
