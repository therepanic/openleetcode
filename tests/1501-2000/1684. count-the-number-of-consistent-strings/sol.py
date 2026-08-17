class Solution:
    def countConsistentStrings(self, allowed: str, words: List[str]) -> int:
        result = 0
        allowed = set(allowed)
        for word in words:
            all_in = True
            for c in word:
                if c not in allowed:
                    all_in = False
                    break
            if all_in is True:
                result += 1
        return result
