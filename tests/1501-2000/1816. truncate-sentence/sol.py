class Solution:
    def truncateSentence(self, s: str, k: int) -> str:
        s = s.split(" ")[:k]
        return " ".join(s)
