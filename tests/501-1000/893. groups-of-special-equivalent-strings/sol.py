class Solution:
    def numSpecialEquivGroups(self, words: list[str]) -> int:
        seen = set()
        for w in words:
            even = "".join(sorted(w[0::2]))
            odd = "".join(sorted(w[1::2]))
            seen.add((even, odd))
        return len(seen)
